rm(list=ls())

votes = read.csv("voting.csv", sep = ',', header = TRUE)

votes = votes[-which(votes$From == "Australia" | votes$From == "Serbia and Montenegro" | votes$To == "Australia" | votes$To == "Serbia and Montenegro"),]

data = aggregate(votes$Score, by = list(From = votes$From, To = votes$To), FUN = mean)
data[,c(1,2)] = sapply(data[,c(1,2)], as.character)

performers = unique(data$To) # 45 countries
voters = unique(data$From) # 49 countries

countries = intersect(voters,performers)

#countries_rel = data.frame("From" = c(), "To" = c(), "x" = c())
countries_rel_m = matrix(0, nrow=length(countries), ncol=length(countries), dimnames = list(countries,countries)) 

for(i in 1:length(countries)){
  fromCountry = countries[i]
  for(j in 1:length(countries)){
    toCountry = countries[j]
    if(toCountry == fromCountry) next
    
    from_to_index = which(data$From == toCountry & data$To == fromCountry)
    to_from_index = which(data$From == fromCountry & data$To == toCountry)
    
    if(length(from_to_index) == 0) next
    if(length(to_from_index) == 0) next
    
    x1 = data[from_to_index,]$x
    x2 = data[to_from_index,]$x
    
    # Matrix
    countries_rel_m[fromCountry, toCountry] = (-1)*(x1*x2)
    
    # Dataframe
    #countries_rel = rbind(countries_rel, data.frame("From" = fromCountry, "To" = toCountry, "x" = x1*x2))
  }
}

# Dendrogramm
hclust_result = hclust(as.dist(countries_rel_m), method = "complete", members = NULL) # chosen
hclust_result = hclust(as.dist(countries_rel_m), method = "mcquitty", members = NULL)
hclust_result = hclust(as.dist(countries_rel_m), method = "median", members = NULL)
hclust_result = hclust(as.dist(countries_rel_m), method = "ward.D2", members = NULL)
hclust_result = hclust(as.dist(countries_rel_m), method = "average", members = NULL)

plot(hclust_result, axes = FALSE)