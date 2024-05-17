library(dplyr)
library(tidyverse)

parks_data = read.csv("Seattle_Parks_and_Recreation_Parks_Features_20240515.csv")

summary_info <- list()

frequency_count <- table(parks_data$Feature_Desc)

maximum <- max(frequency_count)
most_frequent_values <- names(frequency_count)[frequency_count == maximum]
summary_info$most_frequent_feature <- maximum

minimum <- min(frequency_count)
least_frequent_values <- names(frequency_count)[frequency_count == minimum]
summary_info$least_frequent_feature <- minimum

twenty_four_hours <- length(which(parks_data$hours == "24 Hours"))
summary_info$twenty_four_hour_parks <- twenty_four_hours

gym <- length(which(parks_data$Feature_Desc == "Adult Fitness Equipment"))
baseball <- length(which(parks_data$Feature_Desc == "Baseball/Softball" | "T-Ball"))
basketball <- length(which(parks_data$Feature_Desc == "Basketball (Full)" | "Basketball (Half)"))
cricket <- length(which(parks_data$Feature_Desc == "Cricket"))
football <- length(which(parks_data$Feature_Desc == "Flag Football" | "Football"))
lacrosse <- length(which(parks_data$Feature_Desc == "Lacrosse"))
rugby <- length(which(parks_data$Feature_Desc == "Rugby"))
soccer <- length(which(parks_data$Feature_Desc == "Soccer" | "U-8 Soccer"))
tennis <- length(which(parks_data$Feature_Desc == "Tennis Backboard (Outdoor)" | "Tennis Court (Outdoor)"))
running <- length(which(parks_data$Feature_Desc == "Track"))
sports_facilities <- gym + baseball + basketball + cricket + football + lacrosse + rugby + soccer + tennis + running
num_val_in_col <- length(parks_data$Feature_Desc)
sports_proportion <- sports_facilities / num_val_in_col
summary_info$sports_facilities_proportion <- sports_proportion

noncompliant_play_area <- sum(parks_data$Feature_Desc == "Play Area")
compliant_play_area <- sum(parks_data$Feature_Desc == "Play Area (ADA Compliant)")
total_play_area <- noncompliant_play_area + compliant_play_area
compliant_play_area_proportion <- compliant_play_area / total_play_area
summary_info$compliant_play_areas <- compliant_play_area_proportion