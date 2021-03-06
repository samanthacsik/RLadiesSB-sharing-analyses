# leaflet

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