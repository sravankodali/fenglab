##Shell script for calculating signals from ChIP-seq data over shuffled DSB
##regions using bigWigAverageOverBed

cd ~/archive/FrontierGenetics2022/ENCODE_GM06990_DataTracks

###Shuffle DSBs
bedtools shuffle -i NM.NT.peaks.bed -g ~/archive/Reference_Genomes/hg19genomefile.bed -chrom > ../bedtoolAnalysis/NM.NT.shuffled.bed

bedtools shuffle -i NM.DMSO.peaks.bed -g ~/archive/Reference_Genomes/hg19genomefile.bed -chrom > ../bedtoolAnalysis/NM.DMSO.shuffled.bed

bedtools shuffle -i NM.NT.peaks.bed -g ~/archive/Reference_Genomes/hg19genomefile.bed -chrom > ../bedtoolAnalysis/NM.APH.shuffled.bed

###for NM.NT.shuffled DSBs
bigWigAverageOverBed CTCF_ChIPseq_ENCSR000DQW/wgEncodeUwTfbsGm06990CtcfStdAln_2Reps.norm5.rawsignal.bw ../bedtoolAnalysis/NM.NT.shuffled.bed  CTCF_ChIPseq_ENCSR000DQW/CTCFbw.over.NM.NT.shuffled.txt

bigWigAverageOverBed DNaseIHSS/ENCFF529JFV.bigWig ../bedtoolAnalysis/NM.NT.shuffled.bed DNaseIHSS/ENCFF529JFV.over.NT.shuffled.txt

bigWigAverageOverBed DNaseIHSS/ENCFF709PEX.bigWig ../bedtoolAnalysis/NM.NT.shuffled.bed DNaseIHSS/ENCFF709PEX.over.NT.shuffled.txt

bigWigAverageOverBed H3K4me3_ChIPseq_ENCFF965GIX/ENCFF965GIX.bigWig ../bedtoolAnalysis/NM.NT.shuffled.bed H3K4me3_ChIPseq_ENCFF965GIX/ENCFF965GIX.over.NT.shuffled.txt

bigWigAverageOverBed H3K27me3_ChIPseq_ENCFF533NLA/ENCFF533NLA.bigWig ../bedtoolAnalysis/NM.NT.shuffled.bed H3K27me3_ChIPseq_ENCFF533NLA/ENCFF533NLA.over.NT.shuffled.txt

bigWigAverageOverBed H3K36me3_ChIPseq_ENCFF324YFT/ENCFF324YFT.bigWig ../bedtoolAnalysis/NM.NT.shuffled.bed H3K36me3_ChIPseq_ENCFF324YFT/ENCFF324YFT.over.NT.shuffled.txt

###for NM.DMSO.shuffled DSBs
bigWigAverageOverBed CTCF_ChIPseq_ENCSR000DQW/wgEncodeUwTfbsGm06990CtcfStdAln_2Reps.norm5.rawsignal.bw ../bedtoolAnalysis/NM.DMSO.shuffled.bed  CTCF_ChIPseq_ENCSR000DQW/CTCFbw.over.NM.DMSO.shuffled.txt

bigWigAverageOverBed DNaseIHSS/ENCFF529JFV.bigWig ../bedtoolAnalysis/NM.DMSO.shuffled.bed DNaseIHSS/ENCFF529JFV.over.DMSO.shuffled.txt

bigWigAverageOverBed DNaseIHSS/ENCFF709PEX.bigWig ../bedtoolAnalysis/NM.DMSO.shuffled.bed DNaseIHSS/ENCFF709PEX.over.DMSO.shuffled.txt

bigWigAverageOverBed H3K4me3_ChIPseq_ENCFF965GIX/ENCFF965GIX.bigWig ../bedtoolAnalysis/NM.DMSO.shuffled.bed H3K4me3_ChIPseq_ENCFF965GIX/ENCFF965GIX.over.DMSO.shuffled.txt

bigWigAverageOverBed H3K27me3_ChIPseq_ENCFF533NLA/ENCFF533NLA.bigWig ../bedtoolAnalysis/NM.DMSO.shuffled.bed H3K27me3_ChIPseq_ENCFF533NLA/ENCFF533NLA.over.DMSO.shuffled.txt

bigWigAverageOverBed H3K36me3_ChIPseq_ENCFF324YFT/ENCFF324YFT.bigWig ../bedtoolAnalysis/NM.DMSO.shuffled.bed H3K36me3_ChIPseq_ENCFF324YFT/ENCFF324YFT.over.DMSO.shuffled.txt

###for NM.APH.shuffled DSBs
bigWigAverageOverBed CTCF_ChIPseq_ENCSR000DQW/wgEncodeUwTfbsGm06990CtcfStdAln_2Reps.norm5.rawsignal.bw ../bedtoolAnalysis/NM.APH.shuffled.bed  CTCF_ChIPseq_ENCSR000DQW/CTCFbw.over.NM.APH.shuffled.txt

bigWigAverageOverBed DNaseIHSS/ENCFF529JFV.bigWig ../bedtoolAnalysis/NM.APH.shuffled.bed DNaseIHSS/ENCFF529JFV.over.APH.shuffled.txt

bigWigAverageOverBed DNaseIHSS/ENCFF709PEX.bigWig ../bedtoolAnalysis/NM.APH.shuffled.bed DNaseIHSS/ENCFF709PEX.over.APH.shuffled.txt

bigWigAverageOverBed H3K4me3_ChIPseq_ENCFF965GIX/ENCFF965GIX.bigWig ../bedtoolAnalysis/NM.APH.shuffled.bed H3K4me3_ChIPseq_ENCFF965GIX/ENCFF965GIX.over.APH.shuffled.txt

bigWigAverageOverBed H3K27me3_ChIPseq_ENCFF533NLA/ENCFF533NLA.bigWig ../bedtoolAnalysis/NM.APH.shuffled.bed H3K27me3_ChIPseq_ENCFF533NLA/ENCFF533NLA.over.APH.shuffled.txt

bigWigAverageOverBed H3K36me3_ChIPseq_ENCFF324YFT/ENCFF324YFT.bigWig ../bedtoolAnalysis/NM.APH.shuffled.bed H3K36me3_ChIPseq_ENCFF324YFT/ENCFF324YFT.over.APH.shuffled.txt

