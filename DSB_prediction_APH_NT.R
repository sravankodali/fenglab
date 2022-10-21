APH_NT_pred <- function() { 
library(pROC)
library(ROCR)
library(glmnet)
library(randomForest)
library(Matrix)
library(caret)
library(plyr)
library(DMwR)
library(PRROC)
library(gridExtra)

pdf(file="Results/APH_NT/APH_NTplots.pdf", 
    width = 10, 
    height = 7)

#Computed ChIP-seq Signals of Genomic Features using BigWigAverageOverBed

computed_signals_file = "Data/breaks_APH_NT/NM_AN_features_includingdist.txt"

dataDSB = subset(as.data.frame(read.table(computed_signals_file)))

dataDSB = dataDSB[-c(1,2,3717),] # remove the header

#Rename columns 
colnames(dataDSB) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")
#No need to replace DSBType with binary because it is already done for the DA file 
#Create training and test sets
data_set_size = floor(nrow(dataDSB)*0.50) # 50% training, 50% test
index = sample(1:nrow(dataDSB), size = data_set_size) #random sampling  
training <- dataDSB[index,]
testing <- dataDSB[-index,]  

# remove size, sum & mean values  

training <- training[-c(2:14)]
testing <- testing[-c(2:14)] 

# converting target variable to categorical type
dataDSB$DSBType = as.factor(dataDSB$DSBType) 
training$DSBType = as.factor(training$DSBType)
testing$DSBType = as.factor(testing$DSBType)

#Random Forest  
rf <- randomForest(DSBType ~., data=training, ntree=300, importance=TRUE)
print(rf)
plot(rf)

#ROC Curve
pred_response <- predict(rf, testing, type="Response")
pred <- predict(rf, testing, type="Prob")[,2]
pred <- prediction(pred, testing$DSBType)
roc <- performance(pred, "tpr", "fpr")
auc = performance(pred, measure = "auc")
print(auc@y.values)
plot(roc, avg= "threshold",
     lwd= 3,
     main= "ROC Curve")
plot(roc,
     lty=3,
     col="grey78",
     add=TRUE)
auc <- performance(pred, "auc")
auc <- unlist(slot(auc, "y.values"))
auc <- round(auc, 4)
legend(.85,.23,auc, title="AUC", cex =1.2)
abline(a=0, b=1)

#Precision Recall Curve 
pr <- performance(pred, "prec", "rec")
plot(pr, avg= "threshold",
     ylim=c(0.2,1),
     lwd= 3,
     main= "PR Curve")
plot(pr,
     lty=3,
     col="grey78",
     add=TRUE)

# Variable Importance 
varImpPlot(rf, main="Variable Importance Plot")

dev.off()

}


