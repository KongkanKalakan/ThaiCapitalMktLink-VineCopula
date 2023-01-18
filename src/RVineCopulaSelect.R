library(readxl)
library(network)
library(VineCopula)
source("config.R")


uniformiseRandomVariate<- function(data, index_col = "Date", dropna = FALSE){
    
  if (dropna==TRUE){
      data <- data[complete.cases(data), ]
  }
    
  index_data <- data[index_col]
  uData <- data[ , !(names(data) %in% c(index_col))]
  uData <- data.frame(apply(uData, 2, function(c) ecdf(c)(c)))
  uniformData <- cbind(index_data, uData)
  uniformData
}
                            
                            
RVine <- function(dfx, matrix_structure = c(), structure_select = FALSE, output_name = "RVineCopula"){
    
    if (structure_select==FALSE){
        n <- sqrt(length(matrix_structure))
        matrix_structure <- matrix(matrix_structure, n, n, byrow = TRUE)
    
        RVM <- RVineCopSelect(dfx, Matrix = matrix_structure)
    } else {
        RVM <- RVineStructureSelect(dfx)
    }
    
    capture.output(summary(RVM), file=sprintf("%s_summary.txt", output_name), append=TRUE)
    
    rvine_mat_df <- data.frame(colnames(dfx), RVM$Matrix)
    colnames(rvine_mat_df) <- c('var', rvine_mat_df$colnames.dfx.)
    write.csv(rvine_mat_df, sprintf("%s_matrix.csv", output_name))
    
    png(filename=sprintf("%s_contour.png", output_name))
    contour(RVM)
    dev.off()
    
    RVM    
}


# Main
df <- read.csv(INPUT_PATH)
colnames(df) <- COLUMNS_NAME

dfx <- uniformiseRandomVariate(df, index_col=index_col, dropna = TRUE)
dfx <- dfx[ , !(names(dfx) %in% c(index_col))]

RVM <- RVine(dfx, matrix_structure=MATRIX_STRUCTURE, structure_select=STRUCTURE_SELECT)

set.seed(123)
sim_df <- data.frame(RVineSim(NUM_DAYS_GEBERATE, RVM = RVM))
write.csv(sim_df, OUTPUT_SIM_PATH)

if (PLOT_BRANCHES==TRUE){
    par(cex = 0.5)
    plot(RVM, type = 2)
    dev.off() 
}