#Mini project week 8

library(tidyverse)
library(dplyr)

parentage_data <- read.csv("data_8/parentage_with_phenotypes_CSV.csv")

#Filtering out NAs and blanks by selecting sex columns only with m or f 
filtered_parentage_data <- parentage_data %>%
  select(sex, length, depth, sex.1, length.1, depth.1, sex.2, length.2, depth.2) %>%
  filter(sex == "m" | sex== "f") %>% 
  filter(sex.1 == "m" | sex.1 =="f") %>% 
  filter(sex.2 =="m" | sex.2 == "f")

head(filtered_parentage_data)#Bleh, I can't get this to work yet...
View(filtered_parentage_data)
