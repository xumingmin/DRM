################################################################################
#' @description: convert Gene Expression Matrix to Rank Matrix denoted by R 
#' with element r_is, which represents the rank of gene g_i in cell s
#' @param: X, Expression matrix data of samples (comprises of m genes and n cells)
#' @return: Rank Matrix (m*n)
################################################################################
rank.matrix <- function(x){
  rankmatrix = apply(x, 2, rank)
  colnames(rankmatrix) = colnames(x)
  row.names(rankmatrix) = row.names(x)
  return(rankmatrix)
}

###############################################################################
#' @description: Caculate the Delta Rank Matrix for all cells based on a background network and #' the rank matrix
#' @param:  net, the backgound network with l edges (two column genes connected in the
#' background network)
#' @param: rank.data, Rank Matrix (m*n dimension, m genes and n cells)
#' @return: the Delta Rank Matrix, l*n dimension, l edges and n cells
###############################################################################
delta.rank <- function(rank.data, net){
  deltarank <- rank.data[net[,1],]-rank.data[net[,2],]
  rownames <- paste(net[,1],net[,2],sep="|")
  row.names(deltarank) <- rownames
  colnames(deltarank) <- colnames(rank.data)
  return(deltarank)
}

################################################################################
#' @description: construction of cell-specific network 
#' @param: deltarank, normalized Delta Rank Matrix 
#' @param: alpha: Significant level (eg. 0.001, 0.01, 0.05 ...), larger alpha leads to more edges, Default = 0.05
#' @return: CSN, cell-specific network, 0-1 matrix (if an edge exists in a cell, the value is 1; ortherwise, 0. 
#################################################################################
cutoff <- c()
for (i in 1:1000){
  cutoff <- rbind(cutoff, quantile(deltarank[sample(1:nrow(deltarank)*ncol(deltarank), 10000)], probs = c(alpha, 1-alpha)))
}
cutoff <- apply(cutoff, 2, mean) 
index <- c(which(deltarank > cutoff[2]), which(deltarank < cutoff[1]))
CSN <-  matrix(data=NA, nrow = nrow(deltarank), ncol = ncol(deltarank), byrow = FALSE) 
CSN[index] <- 1
CSN[-index] <- 0
rownames(CSN) <- rownames(deltarank)
colnames(CSN) <- colnames(deltarank)
