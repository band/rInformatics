d3 = read.table(file="tst1.txt", header=TRUE)
d3
write.table(data.frame(b=d3$a, h=d3$g*5, y=d3$x), file="tst2.txt", row.names=FALSE)
