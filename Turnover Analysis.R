library(dplyr)

turnover <- read.csv("turnover_data.csv")

library(survival)
library(ggplot2)

time <- turnover$YearsAtCompany
event <- ifelse(turnover$Attrition=='Yes', 1, 0)

surv <- Surv(time, event)

plot(surv)

formula <- Surv(time, event) ~ 1

fit <- survfit(formula, turnover, 1, na.action, individual=F, conf.int=.95, se.fit=T, 
        type=c("kaplan-meier","fleming-harrington", "fh2"),
        error=c("greenwood","tsiatis"),
        conf.type=c("log","log-log","plain","none"),
        conf.lower=c("usual", "peto", "modified"))
basehaz(fit,centered=TRUE)
