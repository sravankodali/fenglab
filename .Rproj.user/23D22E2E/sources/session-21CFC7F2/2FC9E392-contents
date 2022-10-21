#Create signal_DMSO_shuffled 


#First we need to pair the true DMSO DSB signal features with the NM.DMSO.peaks.bed file 
H3K36me3_file = "C:/R_scripts_feng/tp/Data/true_DSB_DMSO/signal_features/ENCFF324YFT.over.NM.DMSO.txt"
H3K27me3_file =  "C:/R_scripts_feng/tp/Data/true_DSB_DMSO/signal_features/ENCFF533NLA.over.NM.DMSO.txt"
H3K4me3_file = "C:/R_scripts_feng/tp/Data/true_DSB_DMSO/signal_features/ENCFF965GIX.over.NM.DMSO.txt"
DNaseIHSS1_file = "C:/R_scripts_feng/tp/Data/true_DSB_DMSO/signal_features/ENCFF529JFV.over.DMSO.txt"
DNaseIHSS2_file = "C:/R_scripts_feng/tp/Data/true_DSB_DMSO/signal_features/ENCFF709PEX.over.DMSO.txt"
CTCF_file = "C:/R_scripts_feng/tp/Data/true_DSB_DMSO/signal_features/CTCFbw.over.NM.DMSO.txt"

#Input last three columns into main dataframe (sum, mean0, mean), drop mean0

#H3K36me3, initialize df1 (main dataframe)
df1 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1 <- df1[,-c(1:3)]
df1 <- df1[,-c(2)]
colnames(df1) <- c("Sum_H3K36me3", "Mean_H3K36me3")

#H3K27me3
df2 <- read.csv(H3K27me3_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_H3K27me3 <- df2[,1]
df1$Mean_H3K27me3 <- df2[,2]

#H3K4me3
df2 <- read.csv(H3K4me3_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_H3K4me3 <- df2[,1]
df1$Mean_H3K4me3 <- df2[,2]
#DNase1HSS1
df2 <- read.csv(DNaseIHSS1_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_DNaseIHSS1 <- df2[,1]
df1$Mean_DNaseIHSS1 <- df2[,2]
#DNase1HSS2
df2 <- read.csv(DNaseIHSS2_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_DNaseIHSS2 <- df2[,1]
df1$Mean_DNaseIHSS2 <- df2[,2]
#CTCF
df2 <- read.csv(CTCF_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df1[,-c(2)]
df1$Sum_CTCF <- df2[,1]
df1$Mean_CTCF <- df2[,2]

#Input Size column from H3K36me3 (all are the same) and append DSBType 1 for all (DMSO DSB)
df2 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1$Size <- df2[,2] 
df1$DSBType <- c(1)

#Append bed files (chr, start bp, end bp) for sorting later on to df1 [This is to DMSO DSB]
bed <- read.csv("C:/R_scripts_feng/tp/Data/true_DSB_DMSO/NM.DMSO.peaks.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/true_DSB_DMSO/DMSO_DSB_signal_features_with_bed.txt"),row.names=F,sep='\t',quote=F)



# Now we need to pair the non DSB DMSO regions' signal features with the NM.DMSO.shuffled.bed 

#First creating nonDMSO signal Features file

#Now load in new data by file
H3K36me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/ENCFF324YFT.over.DMSO.shuffled.txt"
H3K27me3_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/ENCFF533NLA.over.DMSO.shuffled.txt"
H3K4me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/ENCFF965GIX.over.DMSO.shuffled.txt"
DNaseIHSS1_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/ENCFF529JFV.over.DMSO.shuffled.txt"
DNaseIHSS2_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/ENCFF709PEX.over.DMSO.shuffled.txt"
CTCF_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/CTCFbw.over.NM.DMSO.shuffled.txt"

#Input last three columns into main dataframe (sum, mean0, mean), drop mean0

#H3K36me3, initialize df1 (main dataframe)
df1 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1 <- df1[,-c(1:3)]
df1 <- df1[,-c(2)]
colnames(df1) <- c("Sum_H3K36me3", "Mean_H3K36me3")

#H3K27me3
df2 <- read.csv(H3K27me3_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_H3K27me3 <- df2[,1]
df1$Mean_H3K27me3 <- df2[,2]

#H3K4me3
df2 <- read.csv(H3K4me3_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_H3K4me3 <- df2[,1]
df1$Mean_H3K4me3 <- df2[,2]
#DNase1HSS1
df2 <- read.csv(DNaseIHSS1_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_DNaseIHSS1 <- df2[,1]
df1$Mean_DNaseIHSS1 <- df2[,2]
#DNase1HSS2
df2 <- read.csv(DNaseIHSS2_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df2[,-c(2)]
df1$Sum_DNaseIHSS2 <- df2[,1]
df1$Mean_DNaseIHSS2 <- df2[,2]
#CTCF
df2 <- read.csv(CTCF_file, sep="\t", header=0)
df2 <- df2[,-c(1:3)]
df2 <- df1[,-c(2)]
df1$Sum_CTCF <- df2[,1]
df1$Mean_CTCF <- df2[,2]

#Input Size column from H3K36me3 (all are the same) and append DSBType 0 for all (Non-DMSO DSB)
df2 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1$Size <- df2[,2] 
df1$DSBType <- c(0)

#Append bed files (chr, start bp, end bp) for sorting later on to df1 [This is to Non_DMSO_DSB]
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/NM.DMSO.shuffled.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/Non_DMSO_DSB_signal_features_with_bed.txt"),row.names=F,sep='\t',quote=F)


# Finally, append these two files
Non_DMSO_DSB_signal_features <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/Non_DMSO_DSB_signal_features_with_bed.txt", sep="\t", header=1)
True_DMSO_DSB_signal_features <- read.csv("C:/R_scripts_feng/tp/Data/true_DSB_DMSO/DMSO_DSB_signal_features_with_bed.txt", sep="\t", header=1)

full_signal_DMSO <- rbind(Non_DMSO_DSB_signal_features, True_DMSO_DSB_signal_features)
write.table(full_DMSO,file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/signal_DMSO_shuffled.txt"),row.names=F,sep='\t',quote=F)