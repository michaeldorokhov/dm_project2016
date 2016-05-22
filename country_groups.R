

library(RColorBrewer)
library(rworldmap)

setwd("C:/Users/Vladimir/Desktop/DMP/dm_project2016")
country_groups = read.csv("countries.csv", sep = ';', header = TRUE)

colourPalette <- brewer.pal(10,'RdYlGn')
country_groups_map <- joinCountryData2Map(country_groups, joinCode="NAME", nameJoinColumn="Country")
mapCountryData(country_groups_map, nameColumnToPlot="groupID", addLegend=FALSE, catMethod=c(0,1,2,3,4,5,6,7,8,9,10), mapTitle="Country groups", mapRegion="Europe", colourPalette = c('lightgoldenrod4', 'darkolivegreen1', 'brown', 'khaki1', 'seagreen', 'firebrick1', 'dodgerblue2', 'orange', 'purple', 'hotpink4'))
