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

#Input Size column from H3K36me3 (all are the same) and append DSBType 0 for all (Non-NT DSB)
df2 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1$Size <- df2[,2] 
df1$DSBType <- c(0)

#Append bed files (chr, start bp, end bp) for sorting later on to df1 [This is to Non_NT_DSB]
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/NM.DMSO.shuffled.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/Non_DMSO_DSB_features.txt"),row.names=F,sep='\t',quote=F)


# Append non-DMSO DSB features with DMSO DSB features into features file that can be used in Random Forest 
DMSO_DSB_features_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/DMSO_DSB_features.txt"
Non_DMSO_DSB_features_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/Non_DMSO_DSB_features.txt"

DMSO_DSB_features_df <- read.csv(DMSO_DSB_features_file, sep="\t")
DMSO_DSB_features_df <- DMSO_DSB_features_df[-c(1),]
Non_DMSO_DSB_features_df <- read.csv(Non_DMSO_DSB_features_file, sep="\t")

bed_DMSO_DSB <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/DMSO_DSB_BED_INFO.bed", sep = '\t', header=0) # add bed info to DMSO_DSBs in order to merge correctly with Non_DMSO_DSBs
bed_DMSO_DSB <- bed_DMSO_DSB[,-c(4,5)]   
bed_DMSO_DSB <- bed_DMSO_DSB[-c(2245:2276),] # remove Y chromosome info
DMSO_DSB_features_df$Chr <- bed_DMSO_DSB[,1]
DMSO_DSB_features_df$Start <- bed_DMSO_DSB[,2]
DMSO_DSB_features_df$End <- bed_DMSO_DSB[,3] 
DMSO_DSB_features_df <- DMSO_DSB_features_df[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]

# In order to run correctly for Random Forest you must remove bed info after sorting & combining...
NonDMSO_DMSO_DSB_features <- rbind(DMSO_DSB_features_df, Non_DMSO_DSB_features_df)
write.table(NonDMSO_DMSO_DSB_features, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/NonDMSO_DMSO_DSB_features.txt"), row.names=F, sep='\t', quote=F)
write.table(NonDMSO_DMSO_DSB_features, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/signal_DMSO_shuffled.txt"), row.names=F, sep='\t', quote=F)

# need to include distance features in this still...