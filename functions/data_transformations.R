# Problem 2
# function called transform_metadata_to_df 
# (should complete the transformation of stations_metadata to a data frame)

transform_metadata_to_df <- function(a){
  stations_data <- 
    stations_metadata[[1]] %>% 
    map(as_tibble) %>% 
    list_rbind() %>% 
    mutate(
      latestData = map_chr(
        latestData, 1, .default=NA_character_)) %>% 
    mutate(latestData = as_datetime(latestData, tz = "UTC")) %>% # change time zone
    unnest_wider(location) %>% 
    unnest_wider(latLon) # seperate location in lat and lon
}


# Problem 4a
# create function to_iso8601
# two arguments: a date time variable & an offset measured in days
# return the date time variable in ISO8601 format, with the offset added. 
# There should be a letter "Z" appended to the end of the date string, 
# to indicate the the time zone is UTC

to_iso8601 <- function(date_time, offset){
  date <- date_time - days(offset)
  cat(paste0(iso8601(date), "Z"))
}

to_iso8601(as_datetime("2016-09-01 10:11:12"), 4)


# Problem 5
# function transform_volumes

transform_volumes <- function(data){
  data[[1]] %>% 
    map(as_tibble) %>% 
    list_rbind()
}



