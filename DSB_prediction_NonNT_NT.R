NT_Random_pred <- function(){
  
library(pROC)
library(ROCR)
library(glmnet)
library(randomForest)
library(Matrix)
library(caret)
library(plyr)
library(PRROC)
library(ggplot2)
library(dplyr)
library(gridExtra)

pdf(file="Results/nonNT_NT/NTplots.pdf", 
    width = 10, 
    height = 7)

#Computed ChIP-seq Signals of Genomic Features using BigWigAverageOverBed
computed_signals_file = "Data/signalANDdistance_NT_TrueAndShuffled_SumDistOnly.txt"

dataDSB = as.data.frame(read.csv(computed_signals_file,sep="\t", header=1))

dataDSB = dataDSB[,-c(1:3)]
dataDSB = dataDSB[,-c(2)]
#Create training and test sets
data_set_size = floor(nrow(dataDSB)*0.50) # 50% training, 50% test
index = sample(1:nrow(dataDSB), size = data_set_size) #random sampling  
training <- dataDSB[index,]
testing <- dataDSB[-index,]

#Remove Sum values 
training <- training[-c(2:7)]
testing <- testing[-c(2:7)]

# converting target variable to categorical type
dataDSB$DSBType = as.factor(dataDSB$DSBType) 
training$DSBType = as.factor(training$DSBType)
testing$DSBType = as.factor(testing$DSBType)

#Create training/testing datasets for neural network 
#Y_train <- training$DSBType
#X_train <- training[,-c(1)]
#Y_test <- testing$DSBType 
#X_test <- testing[,-c(1)]


#write.table(X_train, file=paste0("C:/R_scripts_feng/tp/Data/Neural_Net_nonNT_NT/X_train.txt"), row.names=F, sep='\t', quote=F)
#write.table(Y_train, file=paste0("C:/R_scripts_feng/tp/Data/Neural_Net_nonNT_NT/Y_train.txt"), row.names=F, sep='\t', quote=F)
#write.table(X_test, file=paste0("C:/R_scripts_feng/tp/Data/Neural_Net_nonNT_NT/X_test.txt"), row.names=F, sep='\t', quote=F)
#write.table(Y_test, file=paste0("C:/R_scripts_feng/tp/Data/Neural_Net_nonNT_NT/Y_test.txt"), row.names=F, sep='\t', quote=F)


#Random Forest  
set.seed(123)
rf <- randomForest(DSBType ~., data=training, ntree=700, importance=TRUE)
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
     main= "NT ROC Curve")
plot(roc,
     lty=3,
     col="grey78",
     add=TRUE)
auc <- performance(pred, "auc")
auc <- unlist(slot(auc, "y.values"))
auc <- round(auc, 4)
legend(.85,.23,auc, title="AUROC", cex =1.2)
abline(a=0, b=1)

#Precision Recall Curve 
pr <- performance(pred, "prec", "rec")
AUPRC <- performance(pred, "aucpr")
AUPRC <- unlist(slot(AUPRC, "y.values"))
AUPRC <- round(AUPRC, 4)
plot(pr, avg= "threshold",
     ylim=c(0.2,1),
     lwd= 3,
     main= "NT PR Curve")
plot(pr,
     lty=3,
     col="grey78",
     add=TRUE)


abline(h=(length(which(testing$DSBType==1)))/(length(which(testing$DSBType==1))+length(which(testing$DSBType==1))), col="red", lwd=3, lty=2) # for baseline


legend(.85,.33,AUPRC, title="AUPRC", cex =1.2)

# Variable Importance 
varImpPlot(rf, main="NT Variable Importance Plot")


# Confusion Matrix
table <- data.frame(confusionMatrix(pred_response, testing$DSBType)$table)

plotTable <- table %>%
  mutate(CorrectvsIncorrect = ifelse(table$Prediction == table$Reference, "Correct", "Incorrect")) %>%
  group_by(Reference) %>%
  mutate(prop = Freq/sum(Freq))

ggplot(data = plotTable, mapping = aes(x = Reference, y = Prediction, fill = CorrectvsIncorrect, alpha = prop)) +
  geom_tile() +
  geom_text(aes(label = Freq), vjust = .5, fontface  = "bold", alpha = 1) +
  scale_fill_manual(values = c(Correct = "green", Incorrect = "red")) +
  theme_bw() +
  xlim(rev(levels(table$Reference)))



table <- importance(rf)
grid.newpage()
grid.table(table)

dev.off()
}


