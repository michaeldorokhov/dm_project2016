

library(RColorBrewer)
library(rworldmap)

setwd("C:/Users/Vladimir/Desktop/DMP/dm_project2016")
country_groups = read.csv("countries.csv", sep = ';', header = TRUE)

colourPalette <- brewer.pal(10,'RdYlGn')
country_groups_map <- joinCountryData2Map(country_groups, joinCode="NAME", nameJoinColumn="Country", mapResolution = 'high')
mapCountryData(country_groups_map, nameColumnToPlot="groupID", addLegend=FALSE, catMethod=c(0,1,2,3,4,5,6,7,8,9,10), mapTitle="Country groups", mapRegion="Europe", colourPalette = c(rgb(185/255,122/255,89/255), rgb(210/255,157/255,1/255), rgb(237/255,27/255,36/255), rgb(255/255,255/255,131/255), rgb(40/255,176/255,74/255), rgb(163/255,73/255,163/255), rgb(113/255,147/255,192/255), rgb(155/255,216/255,234/255), rgb(239/255,228/255,176/255), rgb(127/255,128/255,0)))
