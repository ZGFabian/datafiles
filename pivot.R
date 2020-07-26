# Data wrangling with dplyr
setwd("/home/fabian/projects/2020/pivot")
library(tidyverse)
# reading a wide data from the net (JHU COVID death ts data).
uri <- c("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
uri
# read.csv creates a data.frame with Xs in column names.
df0 <- read.csv(uri)
str(df0)
# read_csv creates a tibble and does not include Xs in column names.
# (It could make our job more difficult to convert them to date format.)
df <- read_csv(uri)
df
# df has 266 rows and 184 columns.
# we want to keep only date columns and country
df <- df %>% select(-c("Province/State", "Lat", "Long"))
colnames(df[1])
# dplyr rename <old value> = <new value>
# fix column name
df <- df %>% rename(c("country" = "Country/Region"))
# filter V4 countries
# note: that the database is on "state-level",
# but V4 countries are one-state countries.
v4 <- c("Hungary", "Slovakia", "Poland", "Czechia")
df <- df %>% filter(country %in% v4)
df %>% count(country)

# switch to long format, so each date column parsed to one column
df <- pivot_longer(df, cols = ends_with("20"),
    names_to = "date", values_to = "deaths")
df
# converting character to date
df$date <- as.Date(df$date, "%m/%d/%y")
df
tail(df)
# sort df on date column than country.
df <- arrange(df, date, country)
tail(df)
# filter last 30 days
df %>% filter(date >= "2020-06-14")

# convert back to wide format
dfw <- df %>% pivot_wider(names_from = date, values_from = deaths)
dim(dfw) # now we have 4 rows (countries) and 181 columns (180 date variables)

# keep only first and last 31 columns
# select can extract columns by their position.
dfw <- dfw %>% select(1, 121:181)
dfw

saveRDS(df, file = "v4_c19_d_200720.RDS")
