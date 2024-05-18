library(ggplot2)

parks_data = read.csv("Seattle_Parks_and_Recreation_Parks_Features_20240515.csv")

# Function to calculate distance of park from Seattle city center
calculate_distance <- function(lat1, lon1, lat2, lon2) {
  earth_radius <- 6371
  deg_lat <- deg2rad(lat2 - lat1)
  deg_lon <- deg2rad(lon2 - lon1)
  # Haversine formula
  a <- sin(deg_lat/2) * sin(deg_lat/2) + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(deg_lon/2) * sin(deg_lon/2)
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

# Calculate distance from Seattle city center for each park and make new column
parks_data$distance_from_center <- calculate_distance(city_center_lat, city_center_lon, parks_data$yPos, parks_data$xPos)

# Count how many features each park has and make new column
parks_data$feature_count <- parks_data$Name %>% str_count()

# Make scatterplot
distance_scatterplot <- ggplot(parks_data, aes(x = feature_count, y = distance_from_center)) +
  geom_point() +
  labs(x = "Number of Features", y = "Distance from City Center (km)") +
  ggtitle("Scatterplot of Park Features and Distance from City Center")

# Print scatterplot
print(distance_scatterplot)
