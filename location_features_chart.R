parks_data = read.csv("Seattle_Parks_and_Recreation_Parks_Features_20240515.csv")

# Function to calculate distance of park from Seattle city center
calculate_distance <- function(lat1, lon1, lat2, lon2) {
  earth_radius <- 6371
  dLat <- deg2rad(lat2 - lat1)
  dLon <- deg2rad(lon2 - lon1)
  a <- sin(dLat/2) * sin(dLat/2) + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon/2) * sin(dLon/2)
  c <- 2 * atan2(sqrt(a), sqrt(1-a))
  distance_km <- earth_radius * c
  return(distance_km)
}

# Function to convert degrees to radians
deg2rad <- function(deg) {
  return(deg * pi / 180)
}

# Seattle city center coordinates
city_center_lat <- 47.608013
city_center_lon <- -122.335167

# Calculate distance from Seattle city center for each park
parks_data$distance_from_center <- calculate_distance(city_center_lat, city_center_lon, parks$yPos, parks$xPos)

# Make new column of how many features parks have by counting amount of times they appear in name column
parks_data$feature_count <- parks$Name %>% str_count()

# Make scatterplot matrix
distance_scatterplot <- ggplot(parks, aes(x = feature_count, y = distance_from_center)) +
  geom_point() +
  labs(x = "Number of Features", y = "Distance from City Center (km)") +
  ggtitle("Scatterplot of Park Features and Distance from City Center")

# Print scatterplot matrix
print(distance_scatterplot)
