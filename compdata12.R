y <- vector()
if(x>3) {
	y <- 10
	} else {
		y <-0
	}
}
x <- 5
y

for (i in 1:10) {
	print(i)
}

x <- c("a", "b", "c", "d")
for (i in 1:4) {
	print(x[i])
}

for(letter in x) {
	print(letter)
}

ls()

x <- matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print (x[i,j])
  }
}

count <-0
while (count < 10) {
    print(count)
    count <- count + 1
}

rwalk <- function(z) {
z <- 5
while (z >=3 && z <= 10) {
  print(z)
  coin <- rbinom(1,1,0.5)
    if(coin==1) { ## random walk
        z <- z+1
    } else {
        z <- z-1
    }
}
}
rwalk()

?rbinom
?computeEstimate()
?abs
?function

## 'repeat' keeps running until 'break'
## 'next' used to skip iteration(s) in loop
## ' return' exits the function and return a value






