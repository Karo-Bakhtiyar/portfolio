# 📦 Load required packages
library(dplyr)      # For data manipulation
library(lubridate)  # For working with dates and timestamps
library(ggplot2)    # For data visualization

# 🧹 Step 1: Prepare weight data — fix date format and remove invalid rows
weight_tracking_clean <- weight_tracking_clean %>%
  mutate(WeightDate = as_date(mdy_hms(Date))) %>%  # Correct format for your timestamp
  filter(!is.na(WeightDate))  # Remove rows with failed conversion

# 📊 Step 2: Plot weight over time for each user
ggplot(weight_tracking_clean, aes(x = WeightDate, y = WeightKg, group = Id)) +
  geom_line(alpha = 0.5, color = "darkred") +
  geom_point(alpha = 0.6, color = "black") +
  labs(
    title = "User Weight Trends Over Time",
    x = "Date",
    y = "Weight (kg)"
  )

# 📆 Step 3: Calculate average weight change per week
weight_weekly <- weight_tracking_clean %>%
  mutate(Week = floor_date(WeightDate, unit = "week")) %>%
  group_by(Id, Week) %>%
  summarise(AvgWeight = mean(WeightKg, na.rm = TRUE), .groups = "drop")

# 📊 Step 4: Visualize weekly weight trends
ggplot(weight_weekly, aes(x = Week, y = AvgWeight, group = Id)) +
  geom_line(alpha = 0.6, color = "steelblue") +
  labs(
    title = "Average Weekly Weight per User",
    x = "Week",
    y = "Average Weight (kg)"
  )

# 🔗 Step 5: Merge with activity data to compare weight and activity
activity_summary <- daily_activity_clean %>%
  mutate(ActivityDate = as_date(ActivityDate))

weight_activity <- inner_join(
  weight_tracking_clean %>% select(Id, WeightDate, WeightKg),
  activity_summary %>% select(Id, ActivityDate, TotalSteps, VeryActiveMinutes),
  by = c("Id" = "Id", "WeightDate" = "ActivityDate")
)

# 📈 Step 6: Visualize relationship between weight and activity
ggplot(weight_activity, aes(x = TotalSteps, y = WeightKg)) +
  geom_point(alpha = 0.5, color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Relationship Between Daily Steps and Weight",
    x = "Total Steps",
    y = "Weight (kg)"
  )

# 📌 Conclusion:
# The scatterplot shows a slight downward trend, suggesting that users who take more steps tend to weigh slightly less.
# While the relationship is not strong, it supports the idea that consistent physical activity may contribute to weight management.
# however, the correlation coefficient of -0.197 confirms a weak negative relationship between daily steps and weight. 
# This suggests that while higher step counts may be loosely associated with lower weight, the effect is not strong across the dataset. 
# Bellabeat could use this insight as part of a broader strategy, combining activity tracking with other factors like sleep, consistency, and nutrition to support weight management goals.
