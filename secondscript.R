x1 = rnorm(100)
x2 = rnorm(100)
x3 = rnorm(100)

df1 = data.frame(a=x1, b=x1+x2, c=x1+x2+x3)

plot(df1)

plot(df1$a, type="l", ylim=range(df1), lwd=3, col=rgb(1,0,0,0.3))
lines(df1$b, type="s", lwd=2, col=rgb(0.3,0.4,0.3,0.9))
points(df1$c, pch=20, cex=4, col=rgb(0,0,1,0.3))
