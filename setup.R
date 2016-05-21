# Voting data merging

eurovision1998_2012 = read.csv("finals1998-2012.csv", sep = ',', header = TRUE)
colnames(eurovision1998_2012) = c("Year","From","To","Score")

eurovision2013 = read.csv("final2013.csv", sep = ',', header = TRUE)[,-1]

eurovision2014 = read.csv("final2014.csv", sep = ',', header = TRUE)[,c(1,2,11)]
eurovision2014$Points[is.na(eurovision2014$Points)] = 0
eurovision2014$Year = 2014
eurovision2014 = data.frame("Year" = eurovision2014$Year, "From" = eurovision2014$From.country, "To" = eurovision2014$To.country, "Score" = eurovision2014$Points)

eurovision2015 = read.csv("final2015.csv", sep = ',', header = TRUE)[,c(1,2,11)]
eurovision2015$Points[is.na(eurovision2015$Points)] = 0
eurovision2015$Year = 2015
eurovision2015 = data.frame("Year" = eurovision2015$Year, "From" = eurovision2015$From.country, "To" = eurovision2015$To.country, "Score" = eurovision2015$Points)

eurovision2016 = read.csv("final2016.csv", sep = ',', header = TRUE)[,c(1,2,10,11)]
eurovision2016$Year = 2016
eurovision2016$Jury.Points[is.na(eurovision2016$Jury.Points)] = 0
eurovision2016$Televote.Points[is.na(eurovision2016$Televote.Points)] = 0
eurovision2016$Points = (eurovision2016$Jury.Points + eurovision2016$Televote.Points)/2
eurovision2016 = eurovision2016[,-c(3,4)]
eurovision2016 = data.frame("Year" = eurovision2016$Year, "From" = eurovision2016$From.country, "To" = eurovision2016$To.country, "Score" = eurovision2016$Points)

eurovision_voting = rbind(eurovision1998_2012,eurovision2013,eurovision2014,eurovision2015,eurovision2016)
eurovision_voting = eurovision_voting[order(eurovision_voting$Year),]

write.csv(eurovision_voting, "voting.csv")

# Results data merging

results1998_2009 = read.csv("results1998-2009.csv",sep = ",", header = TRUE)[,c(1,2,10,11)]
results2010_2016 = read.csv("results2010-2016.csv", sep = ",", header = TRUE)

eurovision_result = rbind(results1998_2009,results2010_2016)
eurovision_result = eurovision_result[order(eurovision_result$Year),]

write.csv(eurovision_result, "results.csv")