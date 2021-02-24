# UFO data table using DT package (interactive)

library(tidyverse)
library(DT)

UFO_data <- read_csv(here::here("data", "UFO_complete.csv")) %>% 
  select(datetime, `date posted`, latitude, longitude, country, city, state, `duration (seconds)`, shape, comments)

datatable(UFO_data,
          class = 'cell-border stripe',
          colnames = c("Date/Time (of encounter)", "Date Reported", "Latitude", "Longitude", "Country", "State", "City", "Duration of Encounter (sec)", "Shape of UFO", "Comments"),
          caption = htmltools::tags$caption(
            style = 'caption-side: top; text-align: left;', 
            htmltools::em('Table 1: Globally reported UFO and extraterrestrial encounters')),
          filter = 'top', options = list(pageLength = 5, autoWidth = TRUE))
