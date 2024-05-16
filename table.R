## “Hiking Trails” + “Woods” in “Feature_Desc” column = wilderness

library("tidyverse")
library("dplyr")

hiking_data <- Seattle_Parks_and_Recreation_Parks_Features_20240515 %>%
  filter(grepl("58", Feature_ID)) 

woods_data <- Seattle_Parks_and_Recreation_Parks_Features_20240515 %>%
  filter(grepl("37", Feature_ID))

wilderness_data <- union(hiking_data, woods_data)


## There are 26 Parks with both woods and hiking trails


final_data <- wilderness_data %>%
  group_by(Name, `Location 1`) %>%
  summarize(Feature_Desc = paste(Feature_Desc, collapse = ", "), .groups = 'drop')
print(final_data)