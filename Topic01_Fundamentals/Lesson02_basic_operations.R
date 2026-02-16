##Etornam Godwin Dodor
##02/15/2026


##Checking the current working directory
getwd()

##setting the working directory
mypath <- setwd('C:/Users/edodor/Desktop/BaseR/base-r-learning-journey/Topic01_Fundamentals')
getwd()


##ARITHMETIC OPERATIONS
a <-100
b <- 5

#Addition
a + b

#Subtraction
a - b

#Multiplication
a * b

#Division
a / b

#Exponentiation
a ^ b
a ** b #This is an alternative to exponentiation

#Finding the remainder( this is called modulus)
a %% b

#Integer division
a %/% b


##COMPARISON OPERATORS
c <- 10
d <- 20
e <- 30
f <- 15
g <- 10

#Equal to
c == d

#Not equal to
c != d

#Greater than
e > d

#Greater than or equal to
e >= f

#less than
f < d

#less than or equal to
c <= g


##LOGICAL OPERATORS
#and (&) this is a vectorized 'and' which returns false when one of the conditions is false
(c>d) & (d>f)
c(T,F) & c(F,T)

#&& this is also 'and' but it checks just the first values and mainly used in if statements


#or  (|) this returns true when one of the conditions is true
(g>=c) | (d<=f)

# || this is also 'or' but it only compares the first element and mainly used in if statements

# not (!) this is used to negate a statement
!(g == c)
