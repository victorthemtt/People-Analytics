
rm(list = ls())
#interactively set the working directory to the folder where the dataset is stored:
setwd(choose.dir())

Survey <-read.csv("engagement_10items.csv")

names(Survey)

#"sex"       "jbstatus"  "age"       "tenure"    "ethnicity" "ManMot1"   "ManMot2"   "ManMot3"   "ManMot4"   "ocb1"     
#[11] "ocb2"      "ocb3"      "ocb4"      "aut1"      "aut2"      "aut3"      "Justice1"  "Justice2"  "Justice3"  "JobSat1"  
#[21] "JobSat2"   "Quit1"     "Quit2"     "Quit3"     "Man1"      "Man2"      "Man3"      "Eng1"      "Eng2"      "Eng3"     
#[31] "Eng4"      "pos1"      "pos2"      "pos3"  

#make the dataset live
attach(Survey)

#install.packages("psych") - if not already installed
library(psych)
#install.packages("GPArotation") - if not already installed
library(GPArotation)
#install.packages("mvtnorm") - if not already installed
library(mvtnorm)
#install.packages("nFactors") - if not already installed
library(nFactors)

#select subset of variables for EFA
FORefa <-subset(Survey, select = c(Var_2, Var_3, Var_4, Var_5, Var_6, Var_7, Var_8, Var_9, Var_10))
#omit cases with missing data
v <- na.omit(FORefa)

# get eigenvalues of factors in selected EFA variables Figure 5.7
ev <- eigen(cor(v)) 
ev

# note here the number of eigen values that are greater than 1= optimal number of factors
#THUS we can then ask for the loadings in this case there are 2 eigen values > 1

#for other additional fit statistics / results 
ap <- parallel(subject=nrow(v),var=ncol(v),
  rep=100,cent=.05)
ap
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)
#this produces a scree plot with 2 factors with eigen values > 1

#so ask for loadings with 2 factors (Figure 5.8)

Loadings2f <- principal(v,nfactors=2,rotate="varimax")
Loadings2f
