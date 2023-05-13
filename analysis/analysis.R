#install.packages("revealjs", type = "source", repos = "http://cran.us.r-project.org")
#install.packages("tidymodels", type = "source", repos = "http://cran.us.r-project.org")
#install.packages("cli")
library(cli)
library(tidytext)
library(dplyr)
library(tidymodels)
library(tm)
library(stringr)
library(topicmodels)
library(gutenbergr)
library(textdata)
library(tidyverse)
library(data.table)
library(lubridate)
library(broom) 
library(GGally) 
library(corrplot)
library(revealjs)
library(plotly)
library(shiny)
library("PerformanceAnalytics")




senators <- read.csv('/Users/kailen/INFO-696/Final_Project/FINAL/only_ran.csv')

subset <- senators %>%
  select(votes, anti_abortion, pro_abortion_rights, candidate_committees, 
         republican_candidate_committees, republican_leadership_pac, 
         gun_rights, gun_control, democratic, republican, democratic_candidate_committees,
         democratic_leadership_pac, leadership_pacs, foreign_defense_policy)

lm_3s <- lm(votes ~ ., data=subset)
lm_3s
summary(lm_3s)

cor_matrix1<-cor(subset) 
head(round(cor_matrix1,2))

colnames(cor_matrix1) <- c("Votes", "Anti-Abortion Policy, Pro-Abortion Rights, 
                           Candidate Committees, Republican Candidate Committees,
                           ")

corrplot(cor_matrix1, order = 'AOE', col = COL2('RdBu', 10), tl.cex = 1, tl.col = black, bg_none())
