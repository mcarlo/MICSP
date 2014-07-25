# This script reads a file listing mutual funds' brokerage platforms and creates
# a data-base like file, appropriate for querying or using in an Excel pivot
# table

platforms <- read.csv("~/mutual_fund_platforms2.csv", stringsAsFactors = FALSE)
numFunds <- dim(platforms)[2]

brokers <- as.vector(as.matrix(platforms))
brokerList <- sort(unique(brokers))
brokerList <- brokerList[2:length(brokerList)]
numBrokers <- length(brokerList)

brokerMatrix <- matrix(rep(0, numFunds * numBrokers), nrow = numBrokers, ncol = numFunds)
rownames(brokerMatrix) <- brokerList
colnames(brokerMatrix) <- colnames(platforms)

for (j in 1:numFunds){
  ticker <- colnames(platforms[,j])
  brokerMatrix[ , j] <- 1 * (rownames(brokerMatrix) %in% platforms[, j])
}

sort(apply(brokerMatrix, 1, sum), decreasing = TRUE)[1:10]


