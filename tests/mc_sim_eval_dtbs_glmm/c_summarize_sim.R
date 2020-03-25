#library(tidyverse)

subfolders<-list.files()
filename<-list.files(subfolders, recursive = T, full.names = T)
dat <- do.call(rbind,lapply(filename,read.csv))
tab<-dat%>%mutate(b1=rep(100,nrow(dat)),b2=rep(100,nrow(dat)), 
                  beta=rep(1,nrow(dat)),n_0=rep(100,nrow(dat)),
                  num_seeds=rep(5,nrow(dat)), beta_inside=ifelse((ll <= beta)&(ul >= beta),1,0))
write.csv(tab[,-1], file="combine.csv",row.names = F)

result<-read.csv("combine.csv",header=T)

mean_length = mean(result$length_int)
p= mean(result$beta_inside)
