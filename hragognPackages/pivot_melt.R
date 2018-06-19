#pivots, deaggregate, melt package

#install.packages(c("reshape2", ("ggplot2))))

library(reshape2)
library(ggplot2)

#melted is a row-pivot of the data
head(economics)
melted <- melt(economics, id = "date")
head(melted)

#excel type pivot
head(french_fries)
a <- dcast(french_fries, # dataframe
           treatment ~ subject, # what becomes the rows and columns (row~col)
           value.var = "potato", # what is taken into the evaluation
           fun.aggregate = mean # what is used to aggregate the values
           )
a
b <- dcast(french_fries, 
           subject ~ treatment,
           value.var = "potato", 
           fun.aggregate = function(x){mean(x, na.rm = T )})
b

#challenge: find median rating = "rancid"

c <- dcast(french_fries,
           treatment ~ subject, 
           value.var = "rancid",
           fun.aggregate = function(x){median(x, na.rm = T)})
c
