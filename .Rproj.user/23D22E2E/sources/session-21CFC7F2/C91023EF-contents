#NT 
#First creating nonNT distance file
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

#Ok, now need to create NT_distance_features



# now append 
full_NT <- 
write.table(full_NT, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/distance_NT_shuffled.txt"), row.names=F, sep='\t', quote=F)


#APH
#First creating nonAPH_distance_Features file
#Now load in new data by file
H3K36me3_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/H3K36me3_NMAPH_shuffled_closest.bed"
H3K27me3_distance_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/H3K27me3_NMAPH_shuffled_closest.bed"
H3K4me3_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/H3K4me3_NMAPH_shuffled_closest.bed"
DNaseIHSS1_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/DNaseIHSS1_NMAPH_shuffled_closest.bed"
DNaseIHSS2_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/DNaseIHSS2_NMAPH_shuffled_closest.bed"
CTCF_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/CTCF_NMAPH_shuffled_closest.bed"
Origin_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/distance_features/Origin_NMAPH_shuffled_closest.bed"

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

#Ok, now need to create APH_distance_features
APH_DSB_features_including_dist_file = "C:/R_scripts_feng/tp/Data/Random_Sample_APH/APH_DSB_features_withdist.txt"
APH_DSB_features_including_dist_file_df <- read.csv(APH_DSB_features_including_dist_file, sep = "\t")
APH_DSB_only_dist_df <- APH_DSB_features_including_dist_file_df[,-c(1:14)]   

#Add bed info 
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_APH/APH_DSB_BED_INFO.bed", sep="\t", header=0) 
bed <- bed[-c(3715:3792),] # remove Y coords
APH_DSB_only_dist_df$Chr <- bed[,1]
APH_DSB_only_dist_df$Start <- bed[,2]
APH_DSB_only_dist_df$End <- bed[,3]
APH_DSB_only_dist_df <- APH_DSB_only_dist_df[,c("Chr", "Start", "End","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")]
colnames(APH_DSB_only_dist_df) <- c("Chr", "Start", "End","Distance_to_Origin","Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_DNaseIHSS2","Distance_to_H3K4me3","Distance_to_H3K27me3","Distance_to_H3K36me3")
write.table(APH_DSB_only_dist_df, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/distance_APH_shuffled.txt"), row.names=F, sep='\t', quote=F)
         

# now append 
full_APH <- rbind(df1, APH_DSB_only_dist_df)
write.table(full_APH, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/distance_APH_shuffled.txt"), row.names=F, sep='\t', quote=F)











           
#DMSO
#First creating nonDMSO_Features file
#Now load in new data by file
H3K36me3_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/H3K36me3_NMDMSO_shuffled_closest.bed"
H3K27me3_distance_file =  "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/H3K27me3_NMDMSO_shuffled_closest.bed"
H3K4me3_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/H3K4me3_NMDMSO_shuffled_closest.bed"
DNaseIHSS1_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/DNaseIHSS1_NMDMSO_shuffled_closest.bed"
DNaseIHSS2_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/DNaseIHSS2_NMDMSO_shuffled_closest.bed"
CTCF_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/CTCF_NMDMSO_shuffled_closest.bed"
Origin_distance_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/distance_features/Origin_NMDMSO_shuffled_closest.bed"

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

#Ok, now need to create DMSO_distance_features
DMSO_DSB_features_including_dist_file = "C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/DMSO_DSB_features_withdist.txt"
DMSO_DSB_features_including_dist_file_df <- read.csv(DMSO_DSB_features_including_dist_file, sep = "\t")
DMSO_DSB_only_dist_df <- DMSO_DSB_features_including_dist_file_df[,-c(1:14)]   

#Add bed info 
bed <- read.csv("C:/R_scripts_feng/tp/Data/Random_Sample_DMSO/DMSO_DSB_BED_INFO.bed", sep="\t", header=0) 
bed <- bed[-c(2245:2276),] # remove Y coords
DMSO_DSB_only_dist_df$Chr <- bed[,1]
DMSO_DSB_only_dist_df$Start <- bed[,2]
DMSO_DSB_only_dist_df$End <- bed[,3]
DMSO_DSB_only_dist_df <- DMSO_DSB_only_dist_df[,c("Chr", "Start", "End","DistanceToOrigin","DistanceToCTCF","DistanceToDNaseIHSS1","DistanceToDNaseIHSS2","DistanceToH3K4me3","DistanceToH3K27me3","DistanceToH3K36me3")]
colnames(DMSO_DSB_only_dist_df) <- c("Chr", "Start", "End","Distance_to_Origin","Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_DNaseIHSS2","Distance_to_H3K4me3","Distance_to_H3K27me3","Distance_to_H3K36me3")
write.table(DMSO_DSB_only_dist_df, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/distance_DMSO_shuffled.txt"), row.names=F, sep='\t', quote=F)

#append
# now append 
full_DMSO <- rbind(df1, DMSO_DSB_only_dist_df)
write.table(full_DMSO, file=paste0("C:/R_scripts_feng/tp/Data/Stuff_to_send_Feng/distance_DMSO_shuffled.txt"), row.names=F, sep='\t', quote=F)






                      