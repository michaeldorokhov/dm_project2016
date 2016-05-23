rm(list=ls())
library(ggplot2)

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

missingYearsFromNordic = data.frame(c(2004,2005,2006,2007,2008,2014,2016), c(0.0,0.0,0.0,0.0,0.0,0.0,0.0))
colnames(missingYearsFromNordic) = c('Year', 'Score')
Nordic = rbind(Nordic,missingYearsFromNordic)
Nordic = Nordic[order(Nordic$Year),]


fromLatvia = subset(voting, To == "Estonia" & From == "Latvia" )
fromLithuania = subset(voting, To == "Estonia" & From == "Lithuania" )
Baltic = rbind(fromLatvia,fromLithuania)

balticVote = c()

for(i in unique(subset(voting, To == "Estonia")$Year))
{
  balticVote = c(balticVote,mean(subset(Baltic, Year == i)$Score))
}

Baltic = data.frame("Year" = unique(subset(voting, To == "Estonia")$Year), "Score" = balticVote)

missingYearsFromBaltic = data.frame(c(2004,2005,2006,2007,2008,2014,2016), c(0.0,0.0,0.0,0.0,0.0,0.0,0.0))
colnames(missingYearsFromBaltic) = c('Year', 'Score')
Baltic = rbind(Baltic,missingYearsFromBaltic)
Baltic = Baltic[order(Baltic$Year),]

plot(fromSweden$Year,fromSweden$Score, type = "l", col = "yellow")
lines(fromFinland$Year,fromFinland$Score, col = "", col = "blue2")
lines(fromNorway$Year,fromNorway$Score, col = "coral4")
lines(fromDenmark$Year,fromDenmark$Score, col = "brown1")
lines(fromIceland$Year,fromIceland$Score, col = "blue4")

plot(Nordic$Year, Nordic$Score, type = "l", col = "blue")
lines(Baltic$Year, Baltic$Score, col = "red")

allN = Nordic
allN$Group = "Nordic"
allB = Baltic
allB$Group = "Baltic"

allGroups = rbind(allN, allB)
allGroups$Year = as.factor(allGroups$Year)

cbPalette <- c("#9E28B4", "#FFE734")

ggplot(allGroups, aes(Year, Score)) + ggtitle("Baltic and Nordic countries giving points to Estonia") +   
  geom_bar(aes(fill = Group), position = "dodge", stat="identity") + scale_fill_manual(values=cbPalette)

toSweden = subset(voting, From == "Estonia" & To == "Sweden" )
toFinland = subset(voting, From == "Estonia" & To == "Finland" )
toNorway = subset(voting, From == "Estonia" & To == "Norway" )
toDenmark = subset(voting, From == "Estonia" & To == "Denmark" )
toIceland = subset(voting, From == "Estonia" & To == "Iceland" )
toNordic = rbind(toSweden,toFinland,toDenmark)

toNordicVote = c()

for(i in unique(subset(voting, From == "Estonia")$Year))
{
  toNordicVote = c(toNordicVote,mean(subset(toNordic, Year == i)$Score))
}

toNordic = data.frame("Year" = unique(subset(voting, From == "Estonia")$Year), "Score" = toNordicVote)

toLatvia = subset(voting, From == "Estonia" & To == "Latvia" )
toLithuania = subset(voting, From == "Estonia" & To == "Lithuania" )
toBaltic = rbind(toLatvia,toLithuania)

toBalticVote = c()

for(i in unique(subset(voting, From == "Estonia")$Year))
{
  toBalticVote = c(toBalticVote,mean(subset(toBaltic, Year == i)$Score))
}

toBaltic = data.frame("Year" = unique(subset(voting, From == "Estonia")$Year), "Score" = toBalticVote)


allToN = toNordic
allToN$Group = "Nordic"
allToB = toBaltic
allToB$Group = "Baltic"

allToGroups = rbind(allToN, allToB)
allToGroups$Year = as.factor(allToGroups$Year)

cbPalette <- c("#9E28B4", "#FFE734")

ggplot(allToGroups, aes(Year, Score)) + ggtitle("Estonia giving points to Baltic and Nordic countries") +   
  geom_bar(aes(fill = Group), position = "dodge", stat="identity") + scale_fill_manual(values=cbPalette)

