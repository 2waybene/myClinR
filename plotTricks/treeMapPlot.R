# load plotly & dplyr
library(plotly)

library(dplyr)


dfA <- read.csv("https://raw.githubusercontent.com/plotly/datasets/718417069ead87650b90472464c7565dc8c2cb1c/sunburst-coffee-flavors-complete.csv")

dfB <- read.csv("https://raw.githubusercontent.com/plotly/datasets/718417069ead87650b90472464c7565dc8c2cb1c/coffee-flavors.csv")


fig <- plot_ly(
  type = "treemap",
  ids = dfA$ids,
  labels = dfA$labels,
  parents = dfA$parents,
  domain = list(column = 0)
)

fig <- fig |> add_trace(
  type = "treemap",
  ids = dfB$ids,
  labels = dfB$labels,
  parents = dfB$parents,
  maxdepth = 1,
  domain = list(column = 1)
)

fig <- fig |> layout(grid = list(columns = 2,rows = 1))

fig
