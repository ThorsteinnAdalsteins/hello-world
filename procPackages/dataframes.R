#dataframes

set.seed(100)
a <- c(1:17, NA)
b <- c('a','b','c','d', NA, 'f', 'a', 'b',
       'c', 'd', NA,'f', 'a', 'b', 'c', 'd', NA, 'f')
c <- factor(sample(c('red', 'blue', 'green'), 18, replace = T))

df1 <- data.frame(v1 = a, v2 = b, v3 = c)

#df1
# common dimension checkers
dim(df1)
nrow(df1)
ncol(df1)

#re-assigning names
colnames(df1)
rownames(df1)

colnames(df1) <- c('A','B','C')
head(df1, 3)
tail(df1, 3)

#View(df1)
# transposing dataframes creates matrices
mat <- t(df1)
mat

#summarizing the data
summary(df1)
str(df1)

#characters are by default factors
options(stringsAsFactors = F) 
df2 <- data.frame('A'=a, 'B'= b, 'C'= c)
df2
str(df2)

options(stringsAsFactors = T) 
#an alternative is to use as.character
df1$B <- as.character(df1$B)
str(df1)


#subseting 

df1[c(1:4), c(1,2)]

df1[c(1:4), c('A', 'B')]

mrows <- which(df1$A > 3 & df1$A < 7)
mrows
df1[mrows,]


#subset function
subset(df1, select=c('A','B'), subset = A > 5)

#removing missing valus
df3 <- na.omit(df1)
df3
#alternative
takes <- !is.na(df1$B)
takes

df1[takes,]

rm(list = ls())
#merging dataframes 
# need two dataframes with one column in common
set.seed(100)
df1 = data.frame(FruitId = c(1:10),
                 Subject = sample(c('Apple', 'Banana', 'Mango'), 10, replace = T))

df2 = data.frame(FruitNum = c(2,4,6,12), 
                 Cuisine = sample(c('Chinese', 'Italian', 'Mexican'), 4, replace = T))
df1
df2

#doing inner join
df_inner <- merge(df1, df2, by.x = "FruitId", by.y="FruitNum")
df_inner

#doing outer join
df_outer <- merge(df1, df2, by.x = "FruitId", by.y="FruitNum", all = T) ## ath all = true
df_outer

#doing left join
df_left <- merge(df1, df2, by.x = "FruitId", by.y= "FruitNum", all.x = T)
df_left 

#doing right join
df_right <- merge(df1, df2, by.x = "FruitId", by.y= "FruitNum", all.x = T)
df_right 

#can I merge three data frames?


