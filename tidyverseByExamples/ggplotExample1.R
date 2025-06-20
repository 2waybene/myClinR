## credit: https://www.youtube.com/watch?v=rfR9Nrpfnyg
library(tidyverse)
library(gapminder)
library(ggplot2)
View(gapminder)

gapminder %>%
  filter(continent %in% c("Africa", "Europe")) %>%
  filter(gdpPercap < 3000) %>% 
  ggplot(aes(x=gdpPercap,
             y=lifeExp,
             size=pop,
             color=year))+
  geom_point()+
  facet_wrap(~continent)+
  labs(title= "Life expectancy explained by GDP",
       x="GDP per capica",
       y="Life expecation")

