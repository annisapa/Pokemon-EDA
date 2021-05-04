library(tidyverse)
library(dplyr)
library(ggplot2)
library(skimr)
library(DataExplorer)

pokemon <- read_csv("E:/pokemon.csv")
pokemon
glimpse(pokemon)
summary(pokemon)
skim(pokemon)
plot_intro(pokemon)
plot_missing(pokemon)

plot_histogram(pokemon)
plot_bar(pokemon)

plot_correlation(pokemon)
plot_boxplot(pokemon, by = "type")
plot_scatterplot(pokemon, by = "total")

pokemon %>%
  ggplot() +
  geom_boxplot(aes(x = type, y = total)) +
  coord_flip()

pokemon %>%
  arrange(desc(total))

pokemon %>%
  arrange(total)

pokemon %>%
  arrange(desc(speed))


max <- pokemon %>%
  group_by(type) %>%
  summarise(total = max(total)) 

pokemon %>%
  right_join(max, by = c("type", "total"))


max <- pokemon %>%
  group_by(type) %>%
  summarise(special_attack = max(special_attack)) 

pokemon %>%
  right_join(max, by = c("type", "special_attack"))


max <- pokemon %>%
  group_by(type) %>%
  summarise(special_defense = max(special_defense))

pokemon %>%
  right_join(max, by = c("type", "special_defense"))


ggplot(pokemon, aes(x = special_attack, y = special_defense)) +
  geom_point() +
  geom_smooth()