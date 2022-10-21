
computed_signals_DMSO0_APH1 = "C:/R_scripts_feng/tp/Data/breaks_DMSO_APH/NM_DA_features_includingdist.txt"
computed_signals_DMSO1_NT0 = "C:/R_scripts_feng/tp/Data/breaks_DMSO_NT/NM_DN_features_includingdist.txt"

dataDSB_DMSO0_APH1 = subset(as.data.frame(read.table(computed_signals_DMSO0_APH1)))
dataDSB_APH1 = dataDSB_DMSO0_APH1[dataDSB_DMSO0_APH1$V1 != 0,]
dataDSB_DMSO1_NT0 = subset(as.data.frame(read.table(computed_signals_DMSO1_NT0)))
dataDSB_NT0 = dataDSB_DMSO1_NT0[dataDSB_DMSO1_NT0$V1 != 1,]


dataDSB_full = rbind(dataDSB_APH1, dataDSB_NT0)
dataDSB_full = dataDSB_full[-c(1,11000),]

colnames(dataDSB_full) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")

data_set_size = floor(nrow(dataDSB_full)*0.50) # 50% training, 50% test
index = sample(1:nrow(dataDSB_full), size = data_set_size) #random sampling  
training <- dataDSB_full[index,]
testing <- dataDSB_full[-index,]

X_train <- training[,-1]
Y_train <- training[,1]
X_test <- testing[,-1]
Y_test <- testing[,1]

write.table(training[,-1], file=paste0("C:/R_scripts_feng/tp/Data/breaks_APH_NT/X_train.txt"), row.names=F,sep='\t',quote=F)
write.table(training[,1], file=paste0("C:/R_scripts_feng/tp/Data/breaks_APH_NT/Y_train.txt"), row.names=F,sep='\t',quote=F)
write.table(testing[,-1], file=paste0("C:/R_scripts_feng/tp/Data/breaks_APH_NT/X_test.txt"), row.names=F,sep='\t',quote=F)
write.table(testing[,1], file=paste0("C:/R_scripts_feng/tp/Data/breaks_APH_NT/Y_test.txt"), row.names=F,sep='\t',quote=F)


#Create APH DSB features file (w/ distance features), where APH = 1 (Non APH DSBs will be 0)
dataDSB_APH1 = dataDSB_APH1[-c(1),]
colnames(dataDSB_APH1) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")
write.table(dataDSB_APH1, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_APH/APH_DSB_features_withdist.txt"), row.names=F, sep='\t', quote=F)

#Create APH DSB features file, where APH = 1 (Non APH DSBs will be 0)
dataDSB_APH1 = dataDSB_APH1[, -c(15:21)]  # drop distance features (not available in non APH DSBs)
colnames(dataDSB_APH1) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")
write.table(dataDSB_APH1, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_APH/APH_DSB_features.txt"), row.names=F, sep='\t', quote=F)

#Create DMSO DSB features file (w/ distance features), where DMSO = 1 (Non DMSO DSBs will be 0)
dataDSB_DMSO1 = dataDSB_DMSO1_NT0[dataDSB_DMSO1_NT0$V1 != 0,]
dataDSB_DMSO1 = dataDSB_DMSO1[-c(1),]
colnames(dataDSB_DMSO1) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")
write.table(dataDSB_DMSO1, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/DMSO_DSB_features_withdist.txt"), row.names=F, sep='\t', quote=F)

#Create DMSO DSB features file, where DMSO = 1 (Non DMSO DSBs will be 0)
dataDSB_DMSO1 = dataDSB_DMSO1_NT0[dataDSB_DMSO1_NT0$V1 != 0,]
dataDSB_DMSO1 = dataDSB_DMSO1[,-c(15:21)]  # drop distance features (not available in non DMSO DSBs)
colnames(dataDSB_DMSO1) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")
write.table(dataDSB_DMSO1, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/DMSO_DSB_features.txt"), row.names=F, sep='\t', quote=F)


#Create NT DSB features file (w/ distance features), where NT = 1 (Non NT DSBs will be 0) 
dataDSB_NT0 = dataDSB_NT0[-c(1),]
colnames(dataDSB_NT0) <-c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")
dataDSB_NT0$DSBType = c(1)
write.table(dataDSB_NT0, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_NT/NT_DSB_features_withdist.txt"), row.names=F, sep='\t', quote=F)


#Create NT DSB features file, where NT = 1 (Non NT DSBs will be 0) 
dataDSB_NT0 = dataDSB_NT0[, -c(15:21)] # drop distance features (not available in non NT DSBs)
colnames(dataDSB_NT0) <- c("DSBType","Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")
dataDSB_NT0$DSBType = c(1)
write.table(dataDSB_NT0, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_NT/NT_DSB_features.txt"), row.names=F, sep='\t', quote=F)


