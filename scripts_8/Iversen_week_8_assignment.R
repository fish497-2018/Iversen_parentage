#Mini project week 8

library(tidyverse)
library(dplyr)

parentage_data <- read.csv("data_8/parentage_with_phenotypes_CSV.csv")

#Filtering out NAs and blanks by selecting sex columns only with m or f 
filtered_parentage_data <- parentage_data %>%
  select(sex, length, depth, sex.1, length.1, depth.1, sex.2, length.2, depth.2) %>%
  filter(sex == "m" | sex== "f") %>% 
  filter(sex.1 == "m" | sex.1 =="f") %>% 
  filter(sex.2 =="m" | sex.2 == "f") %>% 
  mutate(LD_ratio = length/depth) %>%      #creating length:depth ratio columns for offspring and parents
  mutate(LD.1_ratio = length.1/depth.1) %>% 
  mutate(LD.2_ratio = length.2/depth.2)

head(filtered_parentage_data)
View(filtered_parentage_data)


##Calculating z-scores for parents and offspring
  #standard deviations
sd_dad <- sd(filtered_parentage_data$LD.1_ratio)
sd_mom <- sd(filtered_parentage_data$LD.2_ratio)
sd_offspring <- sd(filtered_parentage_data$LD_ratio)  
