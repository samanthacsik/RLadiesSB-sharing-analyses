# mapview UFO map

# other type of map


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
 # mutate(duration_length = factor(duration_length), levels = c("short", "medium", "long"))

UFO_test <-  st_as_sf(UFO_time, coords = c("longitude", "latitude"), 
           crs = 4326) 


mapview(UFO_test, zcol = "duration_length", cex = "number_instances", alpha = 0.2)

