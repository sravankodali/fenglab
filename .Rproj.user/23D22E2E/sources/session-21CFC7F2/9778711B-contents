#Now load in new data by file
#NonAPH first
H3K36me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/ENCFF324YFT.over.APH.shuffled.txt"
H3K27me3_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_APH/ENCFF533NLA.over.APH.shuffled.txt"
H3K4me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/ENCFF965GIX.over.APH.shuffled.txt"
DNaseIHSS1_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/ENCFF529JFV.over.APH.shuffled.txt"
DNaseIHSS2_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/ENCFF709PEX.over.APH.shuffled.txt"
CTCF_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/CTCFbw.over.NM.APH.shuffled.txt"

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
# 7,002 for the nonAPH region 
#Append bed files (chr, start bp, end bp) for sorting later on to df1 [This is to Non_NT_DSB]
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_APH/NM.APH.shuffled.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_APH/Non_APH_DSB_features.txt"),row.names=F,sep='\t',quote=F)


# Append non-APH DSB features with APH DSB features into features file that can be used in Random Forest 
APH_DSB_features_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/APH_DSB_features.txt"
Non_APH_DSB_features_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/Non_APH_DSB_features.txt"

APH_DSB_features_df <- read.csv(APH_DSB_features_file, sep="\t") 
Non_APH_DSB_features_df <- read.csv(Non_APH_DSB_features_file, sep="\t")

bed_APH_DSB <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_APH/APH_DSB_BED_INFO.bed", sep = '\t', header=0) # add bed info to APH_DSBs in order to merge correctly with Non_APH_DSBs
bed_APH_DSB <- bed_APH_DSB[,-c(4,5)]   
bed_APH_DSB <- bed_APH_DSB[-c(3715:3792),] # remove Y chromosome info
APH_DSB_features_df$Chr <- bed_APH_DSB[,1]
APH_DSB_features_df$Start <- bed_APH_DSB[,2]
APH_DSB_features_df$End <- bed_APH_DSB[,3] 
APH_DSB_features_df <- APH_DSB_features_df[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]

# In order to run correctly for Random Forest you must remove bed info after sorting & combining...
NonAPH_APH_DSB_features <- rbind(APH_DSB_features_df, Non_APH_DSB_features_df)
write.table(NonAPH_APH_DSB_features, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_APH/NonAPH_APH_DSB_features.txt"), row.names=F, sep='\t', quote=F)
write.table(NonAPH_APH_DSB_features, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/signal_APH_shuffled.txt"), row.names=F, sep='\t', quote=F)

# need to include distance features in this still...
