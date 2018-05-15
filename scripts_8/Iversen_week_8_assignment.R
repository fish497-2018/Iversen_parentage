#Mini project week 8

library(tidyverse)
library(dplyr)

parentage_data <- read.csv("data_8/parentage_with_phenotypes_CSV.csv")

#Removing blanks and NAs from the data frame: 
parentage_data_no_NAs <- parentage_data[!(is.na(parentage_data) | parentage_data== ""), ]
View(parentage_data_no_NAs)

#Bleh, I can't get this to work yet...