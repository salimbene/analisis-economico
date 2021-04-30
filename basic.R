#var types
a <- "h" #character
x <- 2 #integer
y <- 2.5 #double
r <- 2 + 2i #comlpex
z <- T #logical

message <- paste(greeting,name,collapse="-")
1:3
#logical operators
4 < 5
10 < 100
4 == 5
5 != 5
!5
5 | 6
isTRUE(5)

r <- 4 < 5
typeof(r)

r2 <- !(5 > 1)
r | r2
r & r2

#4

while(FALSE){
  print("Hello")
}


c <- 1
while (c < 12){
  print(c)
  c <- c + 1
}

#5

c <- 1
while (c < 12){
  print(c)
  c <- c + 1
}

for(i in 1:5){
  print("Hello R")
}


x <- rnorm(1)
if(x > 1){
  answer <- "Mayor a 1"
} else if (x >= -1){
  answer <- "Entre -1 y 1"
} else{
  answer <- "Menor a -1"
  
}
#vectors



v <- c(3, 4, 5, 6)
v

?c

is.numeric(v)
is.integer(v)
is.double(v)

v2 <- c(3L, 4L, 5L)
is.numeric(v2)
is.integer(v2)
is.double(v2)

v3 <- c("la","la","La", 7)
v3
is.character(v3)
is.numeric(v3)

seq(1,15)
1:15

z <- seq(1,15,2)
z

a <- rep(1,15)
a

rep("A",5)

x <- c(80,20)
rep(x,10)


q <- c(1,123,543,13,4)
w <- seq(201,250,11)
e <- rep("hi!",3)

w <- c("a","b","c","d","e")
w

w[1]
w[3]
w[-1]
w[-3]

w[1:3]
w[3:5]

w[c(1,3,5)]
w[c(-2,-4)]

w[-3:-5]
w[1:2]

1:5 + 1:12


x <- rnorm(5)
x

for(i in x){
  print(i)
}


install.packages("ggplot2")

library(ggplot2)

?paste()


1:10 > 2

?rbind()

a <- 2

#matrices


Salary
Games
MinutesPlayed

#Matrix()

?matrix
my.data <- 1:20
A <- matrix(my.data, 4,5)
A
A[2,3]

B <- matrix(my.data,4,5,byrow=T)
B[2,5]
B
#rbind
r1 <- c("I","am","happy")
r2 <- c("What","a","day")
r3 <- c(1,2,3)
C  <- rbind(r1,r2,r3)
C

#cbind
c1 <- 1:5
c2 <- -1:-5
C <- cbind(c1,c2)
C

#name vectors

Charlie <- 1:5
Charlie

names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
names(Charlie)

#naming matrices

temp.vec <- rep(c("a","b","zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("How","are","you?")
Bravo

colnames(Bravo) <- c("X","Y","Z")
Bravo

Bravo["are","Y"] <- 0
Bravo

Games
rownames(Games)
colnames(Games)

Games["LeBronJames","2012"]

FieldGoals

round(FieldGoals / Games,1)

round(MinutesPlayed / Games)

?matplot #graph by columns

t(FieldGoals) #traspose

matplot(FieldGoals/Games, type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft",inset=0.01,legend=Players,col=c(1:4,6), pch=15:18, horiz=F)

matplot(FieldGoals/FieldGoalAttempts, type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft",inset=0.01,legend=Players,col=c(1:4,6), pch=15:18, horiz=F)



x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]

Games
Games[1:3,6:10]

Games[c(1,10),]
Games[,c("2008","2009")]

Games[1,,drop=F]
Games[1,5,drop=F]

is.matrix(Games[1,,drop=F])
is.vector(Games[1,])

myplot <- function(data, rows){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  #legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Salary,1:2)


#Salary
myplot(Salary / FieldGoals)

myplot(Points)

myplot(FieldGoalAttempts/Games)

myplot(MinutesPlayed/Games)
myplot(Games)

myplot(FieldGoals/MinutesPlayed)

myplot(Points/FieldGoals)

1:3 * 5





