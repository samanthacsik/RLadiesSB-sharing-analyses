# mapview UFO map

## clean data
UFO_time <- UFO_data %>% 
  clean_names() %>% 
  select(-date_posted) %>% 
  mutate(longitude = as.numeric(longitude),
         latitude = as.numeric(latitude)) %>% 
  mutate(duration_length = case_when(duration_seconds <= 60 ~ "short",
                                     duration_seconds >= 360 ~ "long",
                                     T ~ "medium")) %>% 
  filter(!is.na(longitude),
         !is.na(latitude)) %>% 
  group_by(duration_length, longitude, latitude) %>% 
  count() %>% 
  rename(number_instances = n) 

## need to convert to a spatial feature object
UFO_spatial <-  st_as_sf(UFO_time, coords = c("longitude", "latitude"), 
           crs = 4326) 

## create the map!
UFO_map_mv <- mapview(UFO_spatial, zcol = "duration_length", cex = "number_instances", alpha = 0.2)

