# core programming 

rm(list = ls())

# dates
# lubridate package

# -date
# -POSIXct
# -POSIXlt

library(lubridate)

Sys.time()
class(Sys.time())

d1 <- "2014-11-28"
d2 <- "2-19-11"
d3 <- "04 April 2016"
d4 <- "October 19th 2016"
d5 <- "2016-06-25 04:30:00"

d1s <- ymd(d1, tz = 'GMT')
class(d1s)
d2s <- mdy(d2, tz = 'UTC')
class(d2s)
d3s <- dmy(d3, tz = 'UTC')
d4s <- mdy(d4, tz = 'UTC')
d5s <- ymd_hms(d5, tz = 'UTC')

day(d1s)
month(d1s)
months(d1s)
week(d1s)
weekdays(d1s)
quarter(d1s)

#get the days in the year etch
d <- d1s - d2s
dd <- as.difftime(3, units = 'days') + as.difftime(24, units = 'secs')
dd
?difftime
class(d)
d
d1s+dd
as.numeric(d)

tst <- myd('04/1981/20', tz = 'utc')
weekdays(tst)


# strings
  # stringR
  # stingMR

paste('txt','txt2', sep = '')
paste(c('a','b'), c('c','d'), sep = '/', collapse = '-')

w <- " The quick brown fox
jumped over the lazy dog's ear"
w

w2<- "@r_programming"
library(stringr)
str_count(w)
str_count(w2)

str_to_upper(w)
str_to_lower(w)
str_to_title(w)

str_split(w, ' ')
unlist(str_split(unlist(str_split(trimws(w), ' ')), '\n'))

substr(w2, 2, 14)
word(w, c(2,4,6))

str_detect(w, "[:punct:]")
str_detect(w, "@")

str_replace_all(w, 't', 'LL')
str_replace_all(w,'[a-c]|[g-k]', '0')
str_trim(w)

# writing functions


hyp <- function(side1 = NULL, side2 = NULL){
  if(any(is.null(side1), is.null(side2))){
    stop("one argument is missing")
  }
  return(sqrt(side1^2+side2^2))
}
hyp(10,15)


hyp <- function(side1 = NULL, side2 = NULL, round = F, ...){
  if(any(is.null(side1), is.null(side2))){
    stop("one argument is missing")
  }
  if(round){
    return(round(sqrt(side1^2+side2^2), ...))
  }else{
    return(sqrt(side1^2+side2^2))
  }

}

hyp(side1=10, side2=15, round = T, digits=2)

# symbol functions
`%mix%` <- function(x,y){
  return(min(x,y))
}

3%mix%15


#debuging 

traceback(hyp(10))


#apply == fast wayt to do loops


# apply$
mtcars

output <- numeric(nrow(mtcars))

for(i in 1:nrow(mtcars)){
  output[i] <- (mtcars[i, 1])^2 + (mtcars[i,2])^2 + (mtcar[i,3])^2
}

output

apply(mtcars, # pick dataframe
      1, #pick dimension to loop through
         #1 for rows, 2 for columns
      FUN = sm# define the function
      )

sm <- function(x){
  return(x[1]^2 + x[2]^2 +x[3]^2)
}

# ss must be a function that takes only one argument
ss <- function(x){
  print(x)
}


#sapply, lapply, vapply
# apply itterates through dataframes
# itterate lapply = list apply, returns a list
# vapply
# sapply returns a matrix

x <- list(a = 1:10, a2 = 100:105, a3 = 10:29)
x
lapply_x <- lapply(x, FUN = mean)
class(lapply_x)
sapply_x <- sapply(x, FUN = mean)
sapply_x
class(sapply_x)
vapply_x <- vapply( mtcars[, 1:4], mean, FUN.VALUE = numeric(1))
vapply_x
