## This script just generates the RMD code for the final slidy pres.
## There is probably a better way of doing this.

library(tidyverse)
races <- read_csv("./data/races.csv")

races %>%
  filter(year == 2020) %>%
  arrange(date) %>%
  select(name) -> race_names

make <- function(x) {

  cat("## ",
      x,
      "\n\n```{r ", gsub(pattern = " ", replacement = "_", x), ", echo=FALSE}",
      "\nplot_lap_times('", x, "')\n",
      "```\n\n", sep = "")
  
}

sink("rmd_string.txt")
for (i in race_names$name) {
  make(i)
}
sink()
