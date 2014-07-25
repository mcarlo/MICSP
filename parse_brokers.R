# This script reads a file listing mutual funds' brokerage platforms and creates
# a data-base like file, appropriate for querying or using in an Excel pivot
# table

oldwd <- getwd()
setwd("~/GSpending/platform_tickers")

# read MStar file. Column names are tickers. Row 1 cells are fund names.
# all other rows are Broker names carrying that fund
funds_platforms <- read.csv("~/GSpending/platform_tickers/funds_platforms.csv")

tickers <- colnames(funds_platforms)
funds <- t(funds_platforms[1, ])
fundTable <- cbind(tickers, funds)
numFunds <- length(tickers)

# Replace slash characters with dashes
reformatted <- unlist(lapply(funds_platforms[-1, ], function(x) gsub("/", "-", x)))

# Begin "transposing" matrix, with brokers as row names and tickers for columns
numRows <- length(funds_platforms[,1]) - 1
platforms <- matrix(reformatted, nrow = numRows, 
                    ncol = numFunds)

system.time(brokers <- unique(as.vector(platforms)))
brokerList <- sort(unique(brokers))          # find all unique broker names
brokerList <- brokerList[2:length(brokerList)] # remove blank
numBrokers <- length(brokerList)

# set up matrix for cross referencing brokers and funds
brokerMatrix <- matrix(rep(0, numFunds * numBrokers), nrow = numBrokers, 
                       ncol = numFunds)
rownames(brokerMatrix) <- brokerList
colnames(brokerMatrix) <- tickers

# Turn 0s into 1s whereever a ticker is on that broker's platform
for (j in 1:numFunds){
  ticker <- tickers[j]
  brokerMatrix[ , j] <- 1 * (rownames(brokerMatrix) %in% platforms[, j])
}

write_tickers <- function(broker){
  # select only tickers on that broker's platform (cell == 1)
  tickerList <- colnames(brokerMatrix)[brokerMatrix[broker,] == 1]
  
  fundList <- as.vector(fundTable[fundTable[, 1] %in% tickerList, 2])
  numTickers <- length(tickerList)

  # want to write a "list file," consisting of "Name"[tab]"Ticker"
  unsortedList <- matrix(cbind(fundList, tickerList), nrow = numTickers, 
                         ncol = 2)
  listFile <- matrix(unsortedList[order(unsortedList[,2]), ], nrow = numTickers,
                     ncol = 2)
  # name the output file "<broker>_list.txt"
  nextFile <- paste(broker, "_list.txt", sep = "")
  write.table(listFile, file = nextFile, sep = "\t", row.names = F, col.names=F, 
              quote = F)
}

fileSeq <- 1:numBrokers

genFiles <- function(){
  for (i in fileSeq){
    nextBroker <- brokerList[i]
    write_tickers(nextBroker)
  }
}

system.time(genFiles()) # takes under a second
setwd(oldwd)

#brokerMatrix[16:20, 1:10] # Citi #19
#brokerMatrix[150:153,1] # SunAmerica #153
#rownames(brokerMatrix)[154:180] # WFA 176:179
#trickyRows <- c(19, 153, 176:179)
#rownames(brokerMatrix)[trickyRows]

