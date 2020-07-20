# This script downloads global daily time-series data from JHU repo and create
# a plot of cumulative COVID-19 DEATHS for V4 countries

setwd("/home/fabian/projects/2020/linechart")
library(tidyverse)
library(extrafont)
# download and read csv file
uri <- c("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
uri
df <- read_csv(uri)

# some data wrangling - cf. my previous post
df <- df %>% select(-c("Province/State", "Lat", "Long"))
df <- df %>% rename(c("country" = "Country/Region"))
df <- pivot_longer(df, cols = ends_with("20"),
    names_to = "date", values_to = "deaths")
df <- df %>% filter(country == c("Hungary", "Slovakia", "Poland", "Czechia"))
df$date <- as.Date(df$date, "%m/%d/%y")
df <- arrange(df, date, country)
head(df)

# create the plot
mycolors <- c("#FF9700", "black", "red", "blue") # define 4 colours for the countries 
p1 <- ggplot(df, aes(date, deaths, group = country))
p1 <- p1 + geom_line(aes(color = country, linetype = country), size = 2)
p1 <- p1 + geom_point(aes(shape = country, color = country), size = 4)
p1 <- p1 + scale_color_manual(values = mycolors)
p1 <- p1 + scale_linetype_manual(values =
     c("solid", "twodash", "solid", "longdash")) # custom linetype
p1 <- p1 + theme(legend.position = "top", legend.title = element_blank()) # move legend to top
p1 <- p1 + theme(text = element_text(family = "Ubuntu Mono", size = 12)) # custom TTF font with extrafonts pkg
p1 <- p1 + labs(title = "Number of COVID deaths in V4 countries",
              subtitle = "Cumulative numbers",
              caption = "Data source: JHU")
p1 <- p1 + xlim(x = c(Sys.Date() - 60, NA)) # x scale range: previous 60 days 
p1
ggsave("basic_plot_deaths.png", p1)


