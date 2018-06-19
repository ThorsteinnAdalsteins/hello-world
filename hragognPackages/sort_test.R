#sorting and such

set.seed(100)
x <- letters
y <- 1:26
z <- round(runif(26, 1, 26))
class(x)
class(y)
class(z)

alist <- list(x,y,z)
alist

class(alist)
alist[[1]][[4]]

pos <- which(alist[[1]] == 'r')
alist[[1]][[pos]]

mletters <- alist[[1]]
mletters[[pos]]