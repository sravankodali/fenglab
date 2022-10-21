#First creating nonNT signal Features file

#Now load in new data by file
H3K36me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF324YFT.over.NT.shuffled.txt"
H3K27me3_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF533NLA.over.NT.shuffled.txt"
H3K4me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF965GIX.over.NT.shuffled.txt"
DNaseIHSS1_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF529JFV.over.NT.shuffled.txt"
DNaseIHSS2_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF709PEX.over.NT.shuffled.txt"
CTCF_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/CTCFbw.over.NM.NT.shuffled.txt"

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
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_NT/NM.NT.shuffled.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_NT/Non_NT_DSB_features.txt"),row.names=F,sep='\t',quote=F)

#Now creating NT signal Features file 

#Now load in new data by file
H3K36me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF324YFT.over.NT.shuffled.txt"
H3K27me3_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF533NLA.over.NT.shuffled.txt"
H3K4me3_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF965GIX.over.NT.shuffled.txt"
DNaseIHSS1_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF529JFV.over.NT.shuffled.txt"
DNaseIHSS2_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/ENCFF709PEX.over.NT.shuffled.txt"
CTCF_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/CTCFbw.over.NM.NT.shuffled.txt"

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
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_NT/NM.NT.shuffled.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_NT/Non_NT_DSB_features.txt"),row.names=F,sep='\t',quote=F)


# Append non-NT DSB features with NT DSB features into features file that can be used in Random Forest 
NT_DSB_features_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/NT_DSB_features.txt"
Non_NT_DSB_features_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/Non_NT_DSB_features.txt"

NT_DSB_features_df <- read.csv(NT_DSB_features_file, sep="\t") 
Non_NT_DSB_features_df <- read.csv(Non_NT_DSB_features_file, sep="\t")

bed_NT_DSB <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_NT/NT_DSB_BED_INFO.bed", sep = '\t', header=0) # add bed info to NT_DSBs in order to merge correctly with Non_NT_DSBs
bed_NT_DSB <- bed_NT_DSB[,-c(4,5)]   
bed_NT_DSB <- bed_NT_DSB[-c(456,457,458),] # remove Y chromosome info
NT_DSB_features_df$Chr <- bed_NT_DSB[,1]
NT_DSB_features_df$Start <- bed_NT_DSB[,2]
NT_DSB_features_df$End <- bed_NT_DSB[,3] 
NT_DSB_features_df <- NT_DSB_features_df[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]

# In order to run correctly for Random Forest you must remove bed info after sorting & combining...
NonNT_NT_DSB_features <- rbind(NT_DSB_features_df, Non_NT_DSB_features_df)
write.table(NonNT_NT_DSB_features, file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_NT/NonNT_NT_DSB_features.txt"), row.names=F, sep='\t', quote=F)
write.table(NonNT_NT_DSB_features, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/signal_NT_shuffled.txt"), row.names=F, sep='\t', quote=F)
# need to include distance features in this still...


