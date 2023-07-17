# https://mastering-shiny.org/basic-case-study.html

setwd("D:/liu/Skill-Tree/R/Shiny/ER injuries/")
rm(list=ls())
library(shiny)
library(vroom)
library(tidyverse)

injuries <- vroom("neiss/injuries.tsv.gz")
products <- vroom("neiss/products.tsv")
population <- vroom("neiss/population.tsv")

selected <- injuries %>% filter(prod_code==649)
nrow(selected)

selected %>% count(location,wt = weight,sort = TRUE)
selected %>% count(body_part,wt = weight,sort = TRUE)
selected %>% count(diag,wt = weight,sort = TRUE)

summary <- selected %>%
  count(age,sex,wt = weight)
summary

summary %>%
  ggplot(aes(age,n,color=sex))+
  geom_line()+
  labs(y="Estimated number of injuries")

summary <- selected %>%
  count(age,sex,wt = weight) %>%
  left_join(population,by=c("age","sex")) %>%
  mutate(rate = n/population*1e4)
summary

summary %>%
  ggplot(aes(age,rate,color=sex))+
  geom_line(na.rm=TRUE)+
  labs(y="Injuries per 10,000 people")

selected %>%
  sample_n(10) %>%
  pull(narrative)
