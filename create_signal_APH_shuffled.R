#Create signal_APH_shuffled 


#First we need to pair the true APH DSB signal features with the NM.APH.peaks.bed file 
H3K36me3_file = "C:/R_scripts_feng/tp/Data/true_DSB_APH/signal_features/ENCFF324YFT.over.NM.APH.txt"
H3K27me3_file =  "C:/R_scripts_feng/tp/Data/true_DSB_APH/signal_features/ENCFF533NLA.over.NM.APH.txt"
H3K4me3_file = "C:/R_scripts_feng/tp/Data/true_DSB_APH/signal_features/ENCFF965GIX.over.NM.APH.txt"
DNaseIHSS1_file = "C:/R_scripts_feng/tp/Data/true_DSB_APH/signal_features/ENCFF529JFV.over.APH.txt"
DNaseIHSS2_file = "C:/R_scripts_feng/tp/Data/true_DSB_APH/signal_features/ENCFF709PEX.over.APH.txt"
CTCF_file = "C:/R_scripts_feng/tp/Data/true_DSB_APH/signal_features/CTCFbw.over.NM.APH.txt"

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

#Input Size column from H3K36me3 (all are the same) and append DSBType 1 for all (APH DSB)
df2 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1$Size <- df2[,2] 
df1$DSBType <- c(1)

#Append bed files (chr, start bp, end bp) for sorting later on to df1 [This is to APH DSB]
bed <- read.csv("C:/R_scripts_feng/tp/Data/true_DSB_APH/NM.APH.peaks.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/true_DSB_APH/APH_DSB_signal_features_with_bed.txt"),row.names=F,sep='\t',quote=F)



# Now we need to pair the non DSB APH regions' signal features with the NM.APH.shuffled.bed 

#First creating nonAPH signal Features file

#Now load in new data by file
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

#Input Size column from H3K36me3 (all are the same) and append DSBType 0 for all (Non-APH DSB)
df2 <- read.csv(H3K36me3_file, sep="\t", header=0)
df1$Size <- df2[,2] 
df1$DSBType <- c(0)

#Append bed files (chr, start bp, end bp) for sorting later on to df1 [This is to Non_APH_DSB]
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_APH/NM.APH.shuffled.bed", sep="\t", header=0)  
df1$Chr <- bed[,1]
df1$Start <- bed[,2]
df1$End <- bed[,3]

#Reorganize columns 
df1 <- df1[,c("Chr","Start", "End", "DSBType", "Size", "Sum_H3K36me3","Mean_H3K36me3","Sum_H3K27me3","Mean_H3K27me3","Sum_H3K4me3","Mean_H3K4me3","Sum_CTCF","Mean_CTCF","Sum_DNaseIHSS1","Mean_DNaseIHSS1","Sum_DNaseIHSS2","Mean_DNaseIHSS2")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_APH/Non_APH_DSB_signal_features_with_bed.txt"),row.names=F,sep='\t',quote=F)


# Finally, append these two files
Non_APH_DSB_signal_features <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_APH/Non_APH_DSB_signal_features_with_bed.txt", sep="\t", header=1)
True_APH_DSB_signal_features <- read.csv("C:/R_scripts_feng/tp/Data/true_DSB_APH/APH_DSB_signal_features_with_bed.txt", sep="\t", header=1)

full_signal_APH <- rbind(Non_APH_DSB_signal_features, True_APH_DSB_signal_features)
write.table(full_APH,file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/signal_APH_shuffled.txt"),row.names=F,sep='\t',quote=F)