
rm(list=ls())
#interactively set the working directory to the folder where the dataset is stored:
setwd(choose.dir())

Survey <-read.table("Chapter5RAWSurvey.txt",header=T,sep="\t")

names(Survey)

#pasted names from datafile read
#"sex"       "jbstatus"  "age"       "tenure"    "ethnicity" "ManMot1"   "ManMot2"   "ManMot3"   "ManMot4"   "ocb1"     
#[11] "ocb2"      "ocb3"      "ocb4"      "aut1"      "aut2"      "aut3"      "Justice1"  "Justice2"  "Justice3"  "JobSat1"  
#[21] "JobSat2"   "Quit1"     "Quit2"     "Quit3"     "Man1"      "Man2"      "Man3"      "Eng1"      "Eng2"      "Eng3"     
#[31] "Eng4"      "pos1"      "pos2"      "pos3"  


#make the dataset live
attach(Survey)


#Here install/use various packages that one might need with reliability and factor analyses
  
#install.packages("psych") - if not already installed
library(psych)
#install.packages("GPArotation") - if not already installed
library(GPArotation)
#install.packages("cfa") - if not already installed
library(cfa)
#install.packages("sem") - if not already installed
library(sem)
#install.packages("lavaan") - if not already installed
library(lavaan)

#select variables for reliability dataframe
dATAFORRel <-subset(Survey, select = c(Var_2, Var_3, Var_4, Var_5, Var_6, Var_7, Var_8, Var_9, Var_10))

#clear NAs
v <- na.omit(dATAFORRel)

#Key reliability stats produced in Figure 5.13 

alpha(v, keys=NULL,cumulative=FALSE, title=NULL, max=10,na.rm = TRUE,
check.keys=FALSE,n.iter=1,delete=TRUE,use="pairwise",warnings=TRUE,n.obs=NULL)

