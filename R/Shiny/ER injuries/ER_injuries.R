setwd("D:/liu/Skill-Tree/R/Shiny/ER injuries/")
rm(list=ls())
library(shiny)
library(vroom)
library(tidyverse)

injuries <- vroom("neiss/injuries.tsv.gz")
products <- vroom("neiss/products.tsv")
population <- vroom("neiss/population.tsv")

