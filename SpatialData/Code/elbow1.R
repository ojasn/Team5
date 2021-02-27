austinnd<-data.frame(Austin_data[,c(125:237)],row.names = Austin_data$otu_id)
bac1<-austinnd[1,]
options(warn=-1)
library(changepoint)
##create cpt fn
cptfn <- function(data, pen) {
  ans <- cpt.mean(data, test.stat="Normal", method = "PELT", penalty = "Manual", pen.value = pen) 
  length(cpts(ans)) +1
}
#evaluate and plot results:
plot.new()
par(mar=c(1,1,1,1))
frame()
par(mfcol=c(2,2))
# run cptfn for the signal 
pen.vals <- seq(0,24,.2)
elbowplotData <- unlist(lapply(pen.vals, function(p) 
  cptfn(data = as.numeric(bac1), pen = p)))
plot.ts(as.numeric(bac1),type='l',col='red',
        xlab = "time",
        ylab = "Y(t)",
        main = " (constant mean)")
plot(pen.vals,elbowplotData, 
     xlab = "PELT penalty parameter",
     ylab = " ",
     main = " ")
options(warn=-1)
library(changepoint)

penalty.val <- 2 # this value is determined from elbow plots

cptm_austin_nd <- cpt.mean(as.numeric(bac1),    penalty='Manual',pen.value=penalty.val,method='PELT') 
cpts_austin_nd <- cpts(cptm_austin_nd) # change point time points

plot.new()
frame()
par(mfcol=c(1,2))
plot(cptm_austin_nd,
     xlab = "time",
     ylab = " Y(t)",
     main = "Change in mean signal")
plot.new()
frame()
par(mfcol=c(1,2))
acf(as.numeric(bac1),lag.max = length(as.numeric(bac1)),
    xlab = "lag #", ylab = 'ACF', main=' ')

