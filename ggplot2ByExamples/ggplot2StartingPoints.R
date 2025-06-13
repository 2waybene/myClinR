## credit: https://statisticsglobe.com/ggplot2-r-package

library(ggplot2)
data <- data.frame(x = 1:9,                # Create simple example data
                   y = c(3, 1, 4,
                         3, 5, 2,
                         1, 2, 3),
                   group = rep(LETTERS[1:3], each = 3))
data                                       # Print example data


ggplot(data,                               # Draw basic ggplot2 scatterplot
       aes(x = x, 
           y = y)) +
  geom_point()


ggplot(data,                               # Increase point size
       aes(x = x, 
           y = y)) +
  geom_point(size = 3)

ggplot(data,                               # Set colors by groups
       aes(x = x, 
           y = y,
           col = group)) +
  geom_point(size = 3)

ggp_simple <- ggplot(data,                 # Store ggplot2 plot in data object
                     aes(x = x, 
                         y = y,
                         col = group)) +
  geom_point(size = 3)

ggp_simple +                               # Change x-axis limits
  scale_x_continuous(limits = c(- 3, 15))

ggp_simple +                               # Change colors by groups
  scale_color_manual(breaks = c("A", "B", "C"),
                     values = c("#1b98e0", "#353436", "#e32f08"))

ggp_simple +                               # Add multiple scale layers
  scale_x_continuous(limits = c(- 3, 15)) +
  scale_color_manual(breaks = c("A", "B", "C"),
                     values = c("#1b98e0", "#353436", "#e32f08"))


ggp_simple +                               # Create subplots using facet_wrap()
  scale_x_continuous(limits = c(- 3, 15)) +
  scale_color_manual(breaks = c("A", "B", "C"),
                     values = c("#1b98e0", "#353436", "#e32f08")) +
  facet_wrap(group ~ .)

ggp_simple +                               # Change ggplot2 theme
  scale_x_continuous(limits = c(- 3, 15)) +
  scale_color_manual(breaks = c("A", "B", "C"),
                     values = c("#1b98e0", "#353436", "#e32f08")) +
  facet_wrap(group ~ .) +
  theme_bw()

ggp_simple +                               # Remove legend from plot
  scale_x_continuous(limits = c(- 3, 15)) +
  scale_color_manual(breaks = c("A", "B", "C"),
                     values = c("#1b98e0", "#353436", "#e32f08")) +
  facet_wrap(group ~ .) +
  theme_bw() +
  theme(legend.position = "none")

ggp_simple +                               # Remove axis information
  scale_x_continuous(limits = c(- 3, 15)) +
  scale_color_manual(breaks = c("A", "B", "C"),
                     values = c("#1b98e0", "#353436", "#e32f08")) +
  facet_wrap(group ~ .) +
  theme_bw() +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank())

##====================
# real data
##====================

data(diamonds)                             # Load diamonds data set
head(diamonds) 

ggplot(diamonds,                           # Draw ggplot2 scatterplot
       aes(x = price,
           y = carat)) +
  geom_point()

ggplot(diamonds,                           # Change color by groups
       aes(x = price,
           y = carat,
           col = clarity)) +
  geom_point()

ggplot(diamonds,                           # Show data in subplots by groups
       aes(x = price,
           y = carat)) +
  geom_point() +
  facet_wrap(clarity ~ .)

ggplot(diamonds,                           # Add regression line to each subplot
       aes(x = price,
           y = carat)) +
  geom_point() +
  facet_wrap(clarity ~ .) +
  geom_smooth(method = "lm",
              formula = y ~ x)

##  density plot

ggplot(diamonds,                           # Draw ggplot2 density plot
       aes(x = depth)) +
  geom_density()

ggplot(diamonds,                           # Draw density plots by group
       aes(x = depth,
           fill = cut)) +
  geom_density()

ggplot(diamonds,                           # Make densities transparent
       aes(x = depth,
           fill = cut)) +
  geom_density(alpha = 0.3)

diamonds_m_cl <- aggregate(diamonds,       # Calculate mean by groups
                           price ~ clarity,
                           mean)
diamonds_m_cl

ggplot(diamonds_m_cl,                      # Draw barplot with mean by groups
       aes(x = clarity,
           y = price)) +
  geom_bar(stat = "identity")

diamonds_m_cl_co <- aggregate(diamonds,    # Calculate mean by subgroups
                              price ~ clarity + color,
                              mean)
head(diamonds_m_cl_co)


ggplot(diamonds_m_cl_co,                   # Draw grouped barplot
       aes(x = clarity,
           y = price,
           fill = color)) +
  geom_bar(stat = "identity",
           position = "dodge")

ggplot(diamonds,                           # Draw grouped boxplot
       aes(x = clarity,
           y = price,
           fill = color)) +
  geom_boxplot()

diamonds_D <- diamonds[diamonds$clarity == "IF" & # Extract subsample
                         diamonds$color == "D", ]
head(diamonds_D)

ggplot(diamonds_D,                         # Draw density plot of subsample
       aes(x = price)) +
  geom_density()

ggplot(diamonds_D,                         # Draw subsample by groups
       aes(x = price,
           fill = carat > 1)) +
  geom_density(alpha = 0.5)

