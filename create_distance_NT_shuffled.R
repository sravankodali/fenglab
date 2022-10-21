#First creating NT distance file
#Now load in new data by file
H3K36me3_distance_file = "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/H3K36me3_NMnt_closest.bed"
H3K27me3_distance_file =  "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/H3K27me3_NMnt_closest.bed"
H3K4me3_distance_file = "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/H3K4me3_NMnt_closest.bed"
DNaseIHSS1_distance_file = "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/DNaseIHSS1_NMnt_closest.bed"
DNaseIHSS2_distance_file = "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/DNaseIHSS2_NMnt_closest.bed"
CTCF_distance_file = "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/CTCF_NMnt_closest.bed"
Origin_distance_file = "C:/R_scripts_feng/tp/Data/true_DSB_NT/distance_features/Origin_NMnt_closest.bed"

#Input last three columns into main dataframe (sum, mean0, mean), drop mean0

#H3K36me3, initialize df1 (main dataframe)
df1 <- read.csv(H3K36me3_distance_file, sep="\t", header=0)
df1 <- df1[,-c(4:15)] # get rid of every column except bed info + actual value  
colnames(df1) <- c("Chr", "Start", "End", "Distance_to_H3K36me3")

#H3K27me3
df2 <- read.csv(H3K27me3_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_H3K27me3 <- c(df2)

#H3K4me3
df2 <- read.csv(H3K4me3_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_H3K4me3 <- c(df2)

#DNase1HSS1
df2 <- read.csv(DNaseIHSS1_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_DNaseIHSS1 <- c(df2)

#DNase1HSS2
df2 <- read.csv(DNaseIHSS2_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_DNaseIHSS2 <- c(df2)

#CTCF
df2 <- read.csv(CTCF_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_CTCF <- c(df2)

#Origin
df2 <- read.csv(Origin_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:8)] # get rid of every column except actual value
df1$Distance_to_Origin <- c(df2)
colnames(df1) <- c("Chr", "Start", "End","Distance_to_Origin","Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_DNaseIHSS2","Distance_to_H3K4me3","Distance_to_H3K27me3","Distance_to_H3K36me3")

#create df
df1 <- df1[,c("Chr", "Start", "End","Distance_to_Origin","Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_DNaseIHSS2","Distance_to_H3K4me3","Distance_to_H3K27me3","Distance_to_H3K36me3")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/true_DSB_NT/NT_DSB_distance_features_with_bed.txt"),row.names=F,sep='\t',quote=F)


#Ok, now need to create non_NT_distance_features
H3K36me3_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/H3K36me3_NMnt_shuffled_closest.bed"
H3K27me3_distance_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/H3K27me3_NMnt_shuffled_closest.bed"
H3K4me3_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/H3K4me3_NMnt_shuffled_closest.bed"
DNaseIHSS1_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/DNaseIHSS1_NMnt_shuffled_closest.bed"
DNaseIHSS2_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/DNaseIHSS2_NMnt_shuffled_closest.bed"
CTCF_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/CTCF_NMnt_shuffled_closest.bed"
Origin_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_NT/distance_features/Origin_NMnt_shuffled_closest.bed"

#Input last three columns into main dataframe (sum, mean0, mean), drop mean0

#H3K36me3, initialize df1 (main dataframe)
df1 <- read.csv(H3K36me3_distance_file, sep="\t", header=0)
df1 <- df1[,-c(4:15)] # get rid of every column except bed info + actual value  
colnames(df1) <- c("Chr", "Start", "End", "Distance_to_H3K36me3")

#H3K27me3
df2 <- read.csv(H3K27me3_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_H3K27me3 <- c(df2)

#H3K4me3
df2 <- read.csv(H3K4me3_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_H3K4me3 <- c(df2)

#DNase1HSS1
df2 <- read.csv(DNaseIHSS1_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_DNaseIHSS1 <- c(df2)

#DNase1HSS2
df2 <- read.csv(DNaseIHSS2_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_DNaseIHSS2 <- c(df2)

#CTCF
df2 <- read.csv(CTCF_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:15)] # get rid of every column except actual value
df1$Distance_to_CTCF <- c(df2)

#Origin
df2 <- read.csv(Origin_distance_file, sep="\t", header=0)
df2 <- df2[,-c(1:8)] # get rid of every column except actual value
df1$Distance_to_Origin <- c(df2)
colnames(df1) <- c("Chr", "Start", "End","Distance_to_Origin","Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_DNaseIHSS2","Distance_to_H3K4me3","Distance_to_H3K27me3","Distance_to_H3K36me3")

#create df
df1 <- df1[,c("Chr", "Start", "End","Distance_to_Origin","Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_DNaseIHSS2","Distance_to_H3K4me3","Distance_to_H3K27me3","Distance_to_H3K36me3")]
write.table(df1,file=paste0("C:/R_scripts_feng/tp/Data/Random_Sample_NT/Non_NT_DSB_distance_features_with_bed.txt"),row.names=F,sep='\t',quote=F)

# Finally, append these two files
Non_NT_DSB_distance_features <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_NT/Non_NT_DSB_distance_features_with_bed.txt", sep="\t", header=1)
True_NT_DSB_distance_features <- read.csv("C:/R_scripts_feng/tp/Data/true_DSB_NT/NT_DSB_distance_features_with_bed.txt", sep="\t", header=1)

full_distance_NT <- rbind(Non_NT_DSB_distance_features, True_NT_DSB_distance_features)
write.table(full_distance_NT,file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/distance_NT_shuffled.txt"),row.names=F,sep='\t',quote=F)

