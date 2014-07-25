# Read in test tickers
tickers <- read.csv("~/mf_names_tickers.csv", skip = 1, stringsAsFactors = F)[,2]
sampleTickers <- tickers[sort.list(tickers)[1:10]]

library(XML)

sample #"TGVAX"  "PDIVX" "BJBHX" "JHYIX" "WPVAX" "GIGAX" "GIGCX" "GIGSX" "GIGIX" "GIRRX" "GSXAX"
limit <- length(sampleTickers)
tickerURL <- data.frame(cbind(sampleTickers, rep("", limit), as.numeric(rep(0, limit))), stringsAsFactors = F)

for (i in 1:limit){
    tickerURL[i,2] <- paste(paste("http://finance.yahoo.com/q/pi?s=", tickerURL[i,1], sep = ""),"+Purchase+Info", sep = "") 
}
head(tickerURL)

tables <- readHTMLTable(tickerURL[9,2])
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
numTables <- length(lapply(tables, function(t) dim(t)))


rm(brokers)
for (i in numTables:1){
  #i <- 19
  brokers1 <- ""
  brokers2 <- ""
  names1 <- ""
  names2 <- ""
  brokerList <- data.frame(tables[i], stringsAsFactors = FALSE)
  if(dim(brokerList)[2] == 2){
    if (length(brokerList[,1]) > 1){
      if (brokers1 == ""){
        brokers1 <- as.vector(as.matrix(brokerList))
        names1 <- as.vector(lapply(colnames(brokerList), function(s) str_replace(s, "NULL.", "")))
      }
      else if(brokers2 == ""){
        brokers2 <- as.vector(as.matrix(brokerList))
        names2 <- as.vector(lapply(colnames(brokerList), function(s) str_replace(s, "NULL.", "")))      
        i <- 1
      }
      brokers <- union(brokers1, brokers2)  
    }      
  }
}

for (i in 1:limit){
  tables <- readHTMLTable(tickerURL[i,2])
  n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
  tickerURL[i, 3] <- n.rows
}


tables <- readHTMLTable(nextURL)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
length(lapply(tables, function(t) dim(t)))

rm(platformTable)
platformTable <- as.matrix(data.frame(tables[19], stringsAsFactors = FALSE))
maxRow <- length(platformTable[,1])
platformTable[48,]
colnames(platformTable)
colnames(tables[1:21])

firstBrokers <- lapply(colnames(platformTable), function(s) str_replace(s, "NULL.", ""))
firstBrokers
brokerList <- c(firstBrokers, as.vector(platformTable))

lines <- readLines(tickerURL[9,2])
grep('Brokerage Availability',lines)
lines[180]
mypattern = '<tr><td class="yfnc_datamoddata1" width="50%">([^<]*)</td></tr><tr><td class="yfnc_datamoddata1" width="50%">'
datalines = grep(mypattern,lines[180:length(lines)],value=TRUE)

getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
gg = gregexpr(mypattern,datalines)
matches = mapply(getexpr,datalines,gg)
result = gsub(mypattern,'\\1',matches)
names(result) = NULL
result[1:10]

mypattern2 <- '<tr><td class=\"yfnc_datamoddata1\">([^<]*)</td>'
datalines2 = grep(mypattern2,lines[180:length(lines)],value=TRUE)

gg2 = gregexpr(mypattern2,datalines2)
matches2 = mapply(getexpr,datalines2,gg)
result2 = gsub(mypattern2,'\\1',matches2)
names(result2) = NULL
result2[1:10]

lines[180]

curlPage <- getURL(tickerURL[1,2])
purchase_parsed <- htmlTreeParse(curlPage)
brokerLines <- purchase_parsed[grep("Brokerage Availability",purchase_parsed)]
readHTMLList(brokerLines)

brokers1 <- gsub('            <td class="yfnc_datamoddata1" width="50%">', "", brokerLines, fixed = TRUE)
brokers2 <- gsub('            <td class="yfnc_datamoddata1">', "", brokerLines, fixed = TRUE)
brokers2

brokerScrape <- scrape(tickerURL[1,2])
if(attributes(brokerScrape)$headers["statusCode"]==200){
  page<-scrape(object="brokerScrape")
  xpathSApply(page,"//table//td/a",xmlValue)
}
else {
  cat("There was an error with the page. \n")
}
