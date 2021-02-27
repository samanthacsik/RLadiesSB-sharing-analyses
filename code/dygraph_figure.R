## Dygraph

library(here)
library(dygraphs)
library(xts)  
source(here("code/palettes.R"))
colors <- alien_palette("galaxy_quest", 8, "discrete")

# create time series object

UFO_dygraph <- UFO_data %>% 
  clean_names() %>% 
  select(-date_posted) %>% 
  separate(datetime, c("month", "second", "third"), sep = "/") %>% 
  separate(third, c("year", "time"), sep = " ") %>% 
  group_by(year) %>%
  count() %>% 
  rename(number_instances = n) %>% 
  filter(!is.na(year)) %>% 
  mutate(date_seen = paste("01/01/", year, sep = "")) %>% 
  mutate(date_seen = as.character(date_seen),
         date_seen = as.Date(date_seen, format = "%m/%d/%Y"))
         
ufo_timeseries <- xts(x = UFO_dygraph$number_instances,
                              order.by = UFO_dygraph$date_seen)

# Finally the plot
dy_plot <- dygraph(ufo_timeseries, main = "Aliens from Earth")%>%
  dyRangeSelector() %>% 
  dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, drawGrid = FALSE, colors= colors[1]) %>%
  dyCrosshair(direction = "vertical") %>% 
  dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2, hideOnMouseOut = FALSE) %>% 
  dyRoller(rollPeriod = 1) %>% 
  dyAxis("y", label = "Number of sightings, abductions, etc")

