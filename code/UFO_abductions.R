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

###########################
# create interactive abduction map
###########################

# make icon
UFO_icon <- makeIcon(
  iconUrl = "media/ufo.png",
  iconWidth = 35, iconHeight = 45
)

# make map
abduction_map <- leaflet(abduction_data) %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% 
  addMarkers(lng = ~longitude, lat = ~latitude, icon = UFO_icon, popup = ~ comments) %>% 
  addMiniMap(tiles = providers$CartoDB.Positron,
             toggleDisplay = TRUE)



