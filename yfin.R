covers <- readLines("http://www.covers.com/odds/football/nfl-spreads.aspx")
length(covers)
covers[201:280]
which(covers == "team_away")

purchInfo <- readLines("http://finance.yahoo.com/q/pi?s=TGVAX+Purchase+Info")
which(purchInfo == "Brokerage Availability")

library(XML)
purchInfo <- "http://finance.yahoo.com/q/pi?s=TGVAX+Purchase+Info"
tables <- readHTMLTable(purchInfo)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
tables
