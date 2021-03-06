rm(list=ls())
install.packages("rworldmap")

library(rworldmap)
library(fields)

setwd("C:/Users/Vladimir/Desktop/DMP/dm_project2016")
eurovision1998_2015 = read.csv("voting.csv", sep = ',', header = TRUE)
estonia1998_2015 = subset(eurovision1998_2015, To == "Estonia")

### Estonia results by year
estonia1998 = subset(estonia1998_2015, Year == "1998")
estonia1999 = subset(estonia1998_2015, Year == "1999")
estonia2000 = subset(estonia1998_2015, Year == "2000")
estonia2001 = subset(estonia1998_2015, Year == "2001")
estonia2002 = subset(estonia1998_2015, Year == "2002")
estonia2003 = subset(estonia1998_2015, Year == "2003")
estonia2004 = subset(estonia1998_2015, Year == "2004")
estonia2005 = subset(estonia1998_2015, Year == "2005")
estonia2006 = subset(estonia1998_2015, Year == "2006")
estonia2007 = subset(estonia1998_2015, Year == "2007")
estonia2008 = subset(estonia1998_2015, Year == "2008")
estonia2009 = subset(estonia1998_2015, Year == "2009")
estonia2010 = subset(estonia1998_2015, Year == "2010")
estonia2011 = subset(estonia1998_2015, Year == "2011")
estonia2012 = subset(estonia1998_2015, Year == "2012")
estonia2013 = subset(estonia1998_2015, Year == "2013")
estonia2014 = subset(estonia1998_2015, Year == "2014")
estonia2015 = subset(estonia1998_2015, Year == "2015")
estonia2016 = subset(estonia1998_2015, Year == "2016")

colourPalette = two.colors(start=rgb(250/255, 200/255, 255/255), middle=rgb(235/255, 125/255, 250/255), end=rgb(159/255,40/255,180/255), alpha=1.0)

### Estonia 1998-2001
estonia1998_1999 = merge(estonia1998, estonia1999, by = c("Year", "From", "To", "Score"), all=T)
estonia1998_2000 = merge(estonia1998_1999, estonia2000, by = c("Year", "From", "To", "Score"), all=T)
#estonia1998_2001 = merge(estonia1998_2000, estonia2001, by = c("Year", "From", "To", "Score"), all=T)
estonia1998_2002 = merge(estonia1998_2000, estonia2002, by = c("Year", "From", "To", "Score"), all=T)
estonia1998_2002 = aggregate(estonia1998_2002['Score'], by=estonia1998_2002['From'], mean)

estonia1998_2002_map <- joinCountryData2Map(estonia1998_2002, joinCode="NAME", nameJoinColumn="From", mapResolution = 'high')
mapCountryData(estonia1998_2002_map, nameColumnToPlot="Score", colourPalette = colourPalette, mapTitle="Voting for Estonia 1998-2002", mapRegion="Europe", catMethod=c(0,2,4,6,8,10,12))


### Estonia 2011-2015
estonia2011_2012 = merge(estonia2011, estonia2012, by = c("Year", "From", "To", "Score"), all=T)
estonia2011_2013 = merge(estonia2011_2012, estonia2013, by = c("Year", "From", "To", "Score"), all=T)
estonia2011_2015 = merge(estonia2011_2013, estonia2015, by = c("Year", "From", "To", "Score"), all=T)
estonia2011_2015 = aggregate(estonia2011_2015['Score'], by=estonia2011_2015['From'], mean)

estonia2011_2015_map <- joinCountryData2Map(estonia2011_2015, joinCode="NAME", nameJoinColumn="From", mapResolution = 'high')
mapCountryData(estonia2011_2015_map, nameColumnToPlot="Score", colourPalette = colourPalette, mapTitle="Voting for Estonia 2011-2015", mapRegion="Europe", catMethod=c(0,2,4,6,8,10,12))


### Estonia 2001

estonia2001_map <- joinCountryData2Map(estonia2001, joinCode="NAME", nameJoinColumn="From", mapResolution = 'high')
mapCountryData(estonia2001_map, nameColumnToPlot="Score", colourPalette = colourPalette, mapTitle="Voting for Estonia 2001 (winning year)", mapRegion="Europe", catMethod=c(0,2,4,6,8,10,12))

