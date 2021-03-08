## {gt} table
## Juliette Verstaen
## 2/27/21

library(lubridate)
library(here)

## get shape count
UFO_shape_count <- UFO_data %>% 
  clean_names() %>% 
  select(-date_posted) %>% 
  mutate(longitude = as.numeric(longitude),
         latitude = as.numeric(latitude)) %>% 
  group_by(shape) %>% 
  count() %>% 
  rename(number_instances = n) %>% 
  filter(!is.na(shape)) ## There are 28 unique shapes

## get total time by shape
UFO_shape_times <- UFO_data %>% 
  clean_names() %>% 
  select(-date_posted) %>% 
  mutate(longitude = as.numeric(longitude),
         latitude = as.numeric(latitude)) %>% 
  group_by(shape) %>% 
  dplyr::summarise(total_seconds = sum(duration_seconds, na.rm = TRUE)) %>% 
  filter(!is.na(shape))

## combine

UFO_shape <- left_join(UFO_shape_count, UFO_shape_times) %>% 
  mutate(shape_rate_seconds = total_seconds/number_instances) %>% 
  mutate(Hours = hour(seconds_to_period(shape_rate_seconds)),
         Minutes = minute(seconds_to_period(shape_rate_seconds)),
         Seconds = round(second(seconds_to_period(shape_rate_seconds)), digits = 0)) %>% 
  unite(shape_rate, c("Hours", "Minutes", "Seconds"), sep = ":") %>% 
  ungroup()


## read in the pallette

source(here("code/palettes.R"))

colors <- alien_palette("galaxy_quest", 8, "discrete")

## make the table
UFO_shape %>% 
  dplyr::arrange(desc(shape_rate_seconds)) %>% 
  select(-shape_rate_seconds) %>% 
  gt() %>% 
  tab_header(title = "Alien Spaceship Shapes & Time in the Air") %>% 
  cols_label(shape = "Shape", 
             number_instances = "Number Sightings",
             total_seconds = "Total Seconds Observed",
             shape_rate = "Time per each Sighting")  %>% 
  cols_align("center") %>%
  
  tab_options(
    table.background.color = colors[1],
    table.font.color = colors[6]) %>% ## idk why the color isn't working here for the font
  
  tab_style(
    style = list(
      cell_fill(color = colors[6]),
      cell_text(weight = "bold", color = colors[1])
    ),
    locations = cells_title(groups = "title")
  )








