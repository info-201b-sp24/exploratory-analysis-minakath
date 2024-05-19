library(dplyr)
library(tidyr)
library(ggplot2)
Seattle_Park_data <- read.csv("Seattle_Parks_and_Recreation_Parks_Features_20240515.csv")
feature_counts <- Seattle_Park_data %>%
  separate_rows (Feature_Desc, sep =",, ") %>%
  group_by(Feature_Desc) %>%
  summarise(Count = n()) %>%
  filter(Count >= 25 | Count <= 3) %>%
  arrange(desc(Count))
feature_counts

feature_chart <- ggplot(feature_counts, aes(x = reorder(Feature_Desc, -Count), y = Count)) +
  geom_col(fill ="steelblue") +
  labs(x = "Feature", y ="Count", title = "Ranking of Features and Amenities by Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1,size = 6))

print(feature_chart)

