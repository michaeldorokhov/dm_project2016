rm(list=ls())

voting = read.csv("voting.csv", sep = ',', header = TRUE)
# results = read.csv("results.csv", sep = ',', header = TRUE)

nordicScores$year = 1998:2016

fromSweden = subset(voting, To == "Estonia" & From == "Sweden" )
fromFinland = subset(voting, To == "Estonia" & From == "Finland" )
fromNorway = subset(voting, To == "Estonia" & From == "Norway" )
fromDenmark = subset(voting, To == "Estonia" & From == "Denmark" )
fromIceland = subset(voting, To == "Estonia" & From == "Iceland" )
#Nordic = rbind(fromSweden,fromFinland,fromNorway,fromDenmark,fromIceland)
Nordic = rbind(fromSweden,fromFinland,fromDenmark)

nordicVote = c()

for(i in unique(subset(voting, To == "Estonia")$Year))
{
  nordicVote = c(nordicVote,mean(subset(Nordic, Year == i)$Score))
}

Nordic = data.frame("Year" = unique(subset(voting, To == "Estonia")$Year), "Score" = nordicVote)

fromLatvia = subset(voting, To == "Estonia" & From == "Latvia" )
fromLithuania = subset(voting, To == "Estonia" & From == "Lithuania" )
Baltic = rbind(fromLatvia,fromLithuania)

balticVote = c()

for(i in unique(subset(voting, To == "Estonia")$Year))
{
  balticVote = c(balticVote,mean(subset(Baltic, Year == i)$Score))
}

Baltic = data.frame("Year" = unique(subset(voting, To == "Estonia")$Year), "Score" = balticVote)

plot(fromSweden$Year,fromSweden$Score, type = "l", col = "yellow")
lines(fromFinland$Year,fromFinland$Score, col = "", col = "blue2")
lines(fromNorway$Year,fromNorway$Score, col = "coral4")
lines(fromDenmark$Year,fromDenmark$Score, col = "brown1")
lines(fromIceland$Year,fromIceland$Score, col = "blue4")

plot(Nordic$Year, Nordic$Score, type = "l", col = "blue")
lines(Baltic$Year, Baltic$Score, col = "red")