# UFO data exploration
# data source: https://www.kaggle.com/NUFORC/ufo-sightings 

###########################
# import required packages
###########################

source(here::here("code", "libraries.R"))

###########################
# import data
###########################

UFO_data <- read_csv(here::here("data", "UFO_complete.csv"))

###########################
# wrangle data - keep only sightings that mention 'abduction'
###########################

abduction_data <- UFO_data %>% 
  clean_names() %>% 
  mutate(date = mdy(date_posted),
         latitude = as.numeric(latitude),
         longitude = as.numeric(longitude)) %>% 
  filter(str_detect(comments, "(?i)abduction"))







