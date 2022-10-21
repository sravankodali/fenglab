DMSO_NT_pred <- function(){
library(pROC)
library(ROCR)
library(glmnet)
library(randomForest)
library(Matrix)
library(caret)
library(plyr)
library(PRROC)


pdf(file="Results/DMSO_NT/DMSO_NTplots.pdf", 
    width = 10, 
    height = 7)

#Computed ChIP-seq Signals of Genomic Features using BigWigAverageOverBed

computed_signals_file = "Data/breaks_DMSO_NT/NM_DN_features_includingdist.txt"

dataDSB = as.data.frame(read.table(computed_signals_file))
dataDSB = subset(dataDSB, select=-c(4,6,8,10,12,14))
dataDSB = dataDSB[-c(1),] # remove the header

#Rename columns 
colnames(dataDSB) <- c("DSBType","Size", "Sum_H3K36me3","Sum_H3K27me3","Sum_H3K4me3","Sum_CTCF","Sum_DNaseIHSS1","Sum_DNaseIHSS2","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")
#Replace DSB_type with binary class (1 means DSB unique to DMSO, 0 means DSB unique to NT)
dataDSB = data.frame(lapply(dataDSB, function(x){
  gsub("DNuniqueD", 1, x)
}))
dataDSB = data.frame(lapply(dataDSB, function(x){
  gsub("DNuniqueN", 0, x)
})) 



#Create training and test sets
data_set_size = floor(nrow(dataDSB)*0.50) # 50% training, 50% test
index = sample(1:nrow(dataDSB), size = data_set_size) #random sampling  
training <- dataDSB[index,]
testing <- dataDSB[-index,]  

# remove size, sum values 

training <- training[-c(2:8)]
testing <- testing[-c(2:8)]


# converting target variable to categorical type
dataDSB$DSBType = as.factor(dataDSB$DSBType) 
training$DSBType = as.factor(training$DSBType)
testing$DSBType = as.factor(testing$DSBType)


#Random Forest  
rf <- randomForest(DSBType ~., data=training, ntree=300, importance=TRUE, mtry=1, proximity=TRUE)
print(rf)
plot(rf)

pred <- predict(rf, testing, type="Prob")[,2]
pred <- prediction(pred, testing$DSBType)
roc <- performance(pred, "tpr", "fpr")
auc = performance(pred, measure = "auc")
print(auc@y.values)
plot(roc, main="ROC Curve")
auc <- performance(pred, "auc")
auc <- unlist(slot(auc, "y.values"))
auc <- round(auc, 4)
legend(.85,.23,auc, title="AUC", cex =1.2)
abline(a=0, b=1)

#Lasso Logistic Regression 
CVLasso = cv.glmnet(data.matrix(training[,-1]), training[,1],family="binomial",parallel=F)
lambda=CVLasso$lambda.min 
CVLassoError=CVLasso$cvm[which(CVLasso$lambda==lambda)]
coefLasso=CVLasso$glmnet.fit$beta[,which(CVLasso$lambda==lambda)]
coefLassoMat=data.frame(Variable=names(coefLasso),Coefficient=round(coefLasso,5))
write.table(coefLassoMat,file=paste0("C:/R_scripts_feng/tp/Results/DMSO_NT/coef.csv"),row.names=F,sep='\t',quote=F)

p=ggplot(data=coefLassoMat, mapping=aes(x=coefLassoMat[,1], y=coefLassoMat[,2])) + geom_bar(stat="identity")+coord_flip()+scale_y_continuous(name="Lasso Coefficient")+scale_x_discrete(name="Genomic Feature")
plot(p)
rocLasso=roc(testing$DSBType,as.vector(predict(CVLasso, data.matrix(testing[,-1]))))
aucLasso=pROC::auc(rocLasso)
plot(rocLasso,main=paste0("AUC: ", round(aucLasso,4)))

# Variable Importance 
varImpPlot(rf, main="Variable Importance Plot")

dev.off()
}
