computed_signals_file = "C:/R_scripts_feng/tp/Data/data.csv" 

dataDSB = as.data.frame(read.csv(computed_signals_file, header=1))
dataDSB = dataDSB[,-c(1)]

dataDSB = dataDSB[,-c(13:31)]
colnames(dataDSB) = c("DSBType", "Sum_H3K36me3","Sum_H3K27me3","Sum_H3K4me3","Sum_CTCF","Sum_DNaseIHSS1", "Distance_to_Origin", "Distance_to_CTCF","Distance_to_DNaseIHSS1","Distance_to_H3K27me3","Distance_to_H3K36me3", "Distance_to_H3K4me3")
dataDSB = dataDSB[,-c(13)]
write.table(dataDSB, file=paste0("C:/R_scripts_feng/tp/Data/finesse44.csv"), row.names=F, sep='\t', quote=F)