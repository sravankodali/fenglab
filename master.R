library(Biobase)
inputNumber <- function(prompt) {
  
  
  while(TRUE) {
    num = suppressWarnings(as.numeric(readline(prompt)))
    if(!is.na(num)) {
      break
    }
  }
  choice <- num
  return(choice)
}

displayMenu <- function(options) {
  
  for(i in 1:length(options)) {
    cat(sprintf("%d. %s\n", i, options[i]))
  }
  
  choice <- 0 
  
  choice <- inputNumber("Please choose a prediction ")
  
  return(choice)
}

menuItems <- c("APH_NT", "DMSO_APH", "DMSO_NT", "APH_Random", "DMSO_Random", "NT_Random")

choice <- displayMenu(menuItems)
  
if(choice ==1) {
  print("You selected APH vs. NT")
  source("DSB_prediction_APH_NT.R")
  APH_NT_pred()
  
  openPDF(normalizePath("Results/APH_NT/APH_NTplots.pdf"))
}else if(choice==2){
  print("You selected DMSO vs. APH")
  source("DSB_prediction_DMSO_APH.R")
  DMSO_APH_pred()
  
  openPDF(normalizePath("Results/DMSO_APH/DMSO_APHplots.pdf"))
}else if(choice==3){
  print("You selected DMSO vs. NT")
  source("DSB_prediction_DMSO_NT.R")
  DMSO_NT_pred()
  
  openPDF(normalizePath("Results/DMSO_NT/DMSO_NTplots.pdf"))
}else if(choice==4){
  print("You selected APH vs. Random")
  source("DSB_prediction_NonAPH_APH.R")
  APH_Random_pred()
  
  openPDF(normalizePath("Results/NonAPH_APH/NonAPH_APHplots.pdf"))
}else if(choice==5){
  print("You selected DMSO vs. Random")
  source("DSB_prediction_NonDMSO_DMSO.R")
  DMSO_Random_pred()
  
  openPDF(normalizePath("Results/NonDMSO_DMSO/NonDMSO_DMSOplots.pdf"))
}else if(choice==6){
  print("You selected NT vs. Random")
  source("DSB_prediction_NonNT_NT.R")
  NT_Random_pred()
  
  openPDF(normalizePath("Results/NonNT_NT/NonNT_NTplots.pdf"))
}
