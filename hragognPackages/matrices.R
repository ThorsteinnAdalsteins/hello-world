# matrices

#matrices are smaller than dataframes
#matrices need to have all colums of the same type

object.size(mtcars)
str(mtcars)
mtcars_mat <- as.matrix(mtcars)
object.size(mtcars_mat)
str(mtcars_mat)

#making matrices from scratch
rm(list = ls())
m1 <- matrix(1:100, nrow = 10, byrow = T)
m1

#subsetting
m1[c(1,4),c(1,4)]


#key operations
diag(m1) #extract diagonal
rowSums(m1)
colSums(m1)
rowMeans(m1)
cumsum(m1)

#frequency table

table(m1)
table(mtcars$cyl)


#extracting table
tb <- table(mtcars$cyl, mtcars$vs)
tb
# converting table into a frame changes the form
tbf <- as.data.frame(tb)
#as.table(tbf)
#converting table into a matrix also changes the form
tbm <- as.matrix(tb)
tbm
#the trick is to convert the frame into matrix
tbx <- as.data.frame.matrix(tb)
tbx

# challenge
# how many car types have four gears and six cylinders
an <- table(mtcars$cyl, mtcars$gear)
as.data.frame(an)


