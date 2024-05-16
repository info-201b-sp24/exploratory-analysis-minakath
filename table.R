## “Hiking Trails” + “Woods” in “Feature_Desc” column = wilderness

library("tidyverse")

hiking_data <- Seattle_Parks_and_Recreation_Parks_Features_20240515 %>%
  filter(grepl("58", Feature_ID)) 

woods_data <- Seattle_Parks_and_Recreation_Parks_Features_20240515 %>%
  filter(grepl("37", Feature_ID))

wilderness_data <- union(hiking_data, woods_data)


