##  map visualization
install.packages("leaflet")
library(ggplot2)
library(leaflet)
library(dplyr)

# separating ADA data

ada_data <- Seattle_Parks_and_Recreation_Parks_Features_20240515 %>%
  filter(grepl("ADA", Feature_Desc))

  final_ada_data <- ada_data %>%
  group_by(Name, xPos, yPos) %>%
  summarize(Feature_Desc = paste(Feature_Desc, collapse = ", "), .groups = 'drop')
print(final_ada_data)

# cleaning data 

final_ada_data <- na.omit(final_ada_data)

# finalize

write.csv(final_ada_data, "final_ada_data.csv", row.names = TRUE)


