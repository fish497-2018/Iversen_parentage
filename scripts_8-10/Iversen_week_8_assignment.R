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
  
#Creating length:depth ratio columns for offspring and each parent  
  mutate(LD_ratio = length/depth) %>%     
  mutate(LD.1_ratio = length.1/depth.1) %>% 
  mutate(LD.2_ratio = length.2/depth.2) %>% 
  na.omit() #ensuring all NAs are removed


head(filtered_parentage_data)
View(filtered_parentage_data)


##Calculating z-scores for parents and offspring
  #standard deviations
sd_dad <- sd(filtered_parentage_data$LD.1_ratio)
sd_mom <- sd(filtered_parentage_data$LD.2_ratio)
sd_offspring <- sd(filtered_parentage_data$LD_ratio)  

  #means
mean_dad <- mean(filtered_parentage_data$LD.1_ratio)
mean_mom <- mean(filtered_parentage_data$LD.2_ratio)
mean_offspring <- mean(filtered_parentage_data$LD_ratio)


  #z-scores
    #dad
for (i in seq(1, length(filtered_parentage_data$LD.1_ratio))) {
  z_score_dad <- (filtered_parentage_data$LD.1_ratio[i] - mean_dad)/ sd_dad
  filtered_parentage_data$z_score_dad[i] <- as.numeric(z_score_dad)
  
}

    #double check that it worked properly:
head(filtered_parentage_data$z_score_dad)
(filtered_parentage_data$LD.1_ratio[1] - mean_dad)/sd_dad 


    #mom
for (i in seq(1, length(filtered_parentage_data$LD.2_ratio))) {
  z_score_mom <- (filtered_parentage_data$LD.2_ratio[i] - mean_mom)/ sd_mom 
  filtered_parentage_data$z_score_mom[i] <- as.numeric(z_score_mom)
  
}
head(filtered_parentage_data$z_score_mom)


    #offspring
for (i in seq(1, length(filtered_parentage_data$LD_ratio))) {
  z_score_offspring <- (filtered_parentage_data$LD_ratio[i] - mean_offspring)/ sd_offspring
  filtered_parentage_data$z_score_offspring[i] <- as.numeric(z_score_offspring)
  
}
head(filtered_parentage_data$z_score_offspring)

##graphing z-scores to compare between offspring and each parent
    #mom and offspring
ggplot(data = filtered_parentage_data) +
  geom_point(mapping = aes(x = filtered_parentage_data$z_score_mom, y = filtered_parentage_data$z_score_offspring, color = sex, alpha = 0.5))+
  labs(x = "mom z-score", y = "offspring z-score") 

  #dad and offspring
ggplot(data = filtered_parentage_data) +
  geom_point(mapping = aes(x = filtered_parentage_data$z_score_dad, y = filtered_parentage_data$z_score_offspring, color = sex, alpha = 0.5))+
  labs(x = "dad z-score", y = "offspring z-score")
  
#We can see that there's one obvious outlier in both plots throwing off the scale and obscuring any trends that may be there. Let's fix that:
  
  #mom and offspring - outlier and legend removed
  ggplot(data = filtered_parentage_data) +
    geom_point(mapping = aes(x = filtered_parentage_data$z_score_mom, y = filtered_parentage_data$z_score_offspring, color = sex, alpha = 0.5))+
    labs(x = "mom z-score", y = "offspring z-score") +
    ylim(-1, 2) +
    guides(alpha = FALSE)

  #dad and offspring - outler and legend removed
  ggplot(data = filtered_parentage_data) +
    geom_point(mapping = aes(x = filtered_parentage_data$z_score_dad, y = filtered_parentage_data$z_score_offspring, color = sex, alpha = 0.5))+
    labs(x = "dad z-score", y = "offspring z-score")+
    ylim(-1, 2) +
    guides(alpha = FALSE)
  
  install.packages("tinytex")
  