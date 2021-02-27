austin_pf<-data.frame(Austin_data[,c(7,12:124)])
bac_pf<-austin_pf[1,]
options(warn=-1)
library(changepoint)
##create cpt fn
cptfn <- function(data, pen) {
  ans <- cpt.mean(data, test.stat="Normal", method = "PELT", penalty = "Manual", pen.value = pen) 
  length(cpts(ans)) +1
}

#evaluate and plot results:
plot.new()
par(mar=c(0,0,0,0))
frame()
par(mfcol=c(2,2))
# run cptfn for the signal 
pen.vals <- seq(0,24,.2)
elbowplotData <- unlist(lapply(pen.vals, function(p) 
  cptfn(data = as.numeric(bac_pf), pen = p)))
plot.ts(as.numeric(bac_pf),type='l',col='red',
        xlab = "time",
        ylab = "Y(t)",
        main = " (constant mean)")
plot(pen.vals,elbowplotData, 
     xlab = "PELT penalty parameter",
     ylab = " ",
     main = " ")
