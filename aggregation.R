# aggregation of a dataframe
rm(list = ls())

head(ChickWeight)
str(ChickWeight)

mean_weights <- aggregate(data = ChickWeight, weight ~ Diet, FUN = mean)
head(mean_weights)
str(mean_weights)
head(mean_weights$Diet)

m1 <- merge(x = ChickWeight, y=mean_weights, by.x = "Diet", by.y = "Diet")
head(m1)

# aggregating by more than one factor
# use weight ~ Diet + Chick
cw_mean <- aggregate(data = ChickWeight, weight ~ Diet + Chick, FUN = mean)
names(cw_mean) <- c('Diet','Chick', 'meanWt')
head(cw_mean)

cw_count <- aggregate(data = ChickWeight, weight ~ Diet + Chick, FUN = length)
names(cw_count) <- c('Diet','Chick', 'count')
head(cw_count)

# merging based on two columns:
mc <- merge(x = cw_mean, y = cw_count, by.x = c('Diet','Chick'), by.y = c('Diet', 'Chick'))
head(mc)
