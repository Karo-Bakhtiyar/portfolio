# 📦 Load required packages
library(dplyr)      # For data manipulation
library(lubridate)  # For working with dates and timestamps
library(ggplot2)    # For data visualization

# 🧹 Step 1: Prepare sleep data — aggregate total minutes asleep per day
sleep_summary <- sleep_per_minute_clean %>%
  mutate(SleepDay = as_date(mdy_hms(date))) %>%  # Convert timestamp to Date
  group_by(Id, SleepDay) %>%
  summarise(TotalMinutesAsleep = sum(value == 1, na.rm = TRUE), .groups = "drop")  # Count minutes asleep

# 🧹 Step 2: Prepare activity data — ensure ActivityDate is in Date format
activity_summary <- daily_activity_clean %>%
  mutate(ActivityDate = as_date(ActivityDate))  # Convert to Date format

# 🔗 Step 3: Merge sleep and activity data by Id and Date
sleep_activity <- inner_join(
  sleep_summary,
  activity_summary,
  by = c("Id" = "Id", "SleepDay" = "ActivityDate")
)

# 📈 Step 4: Calculate correlation between steps and sleep duration
correlation_sleep_steps <- cor(sleep_activity$TotalSteps, sleep_activity$TotalMinutesAsleep)
print(paste("Correlation between Total Steps and Minutes Asleep:", round(correlation_sleep_steps, 3)))

# 🧠 Interpretation:
# A correlation value of around -0.4 (example) suggests a moderate negative relationship:
# → As users take more steps, they tend to sleep slightly less.
# → This could reflect lifestyle patterns, late workouts, or other factors.
# → Bellabeat could explore whether intense activity affects sleep quality or duration.

# 📊 Step 5: Visualize the relationship
ggplot(sleep_activity, aes(x = TotalSteps, y = TotalMinutesAsleep)) +
  geom_point(alpha = 0.5, color = "purple") +  # Each point represents one user's day
  geom_smooth(method = "lm", se = FALSE, color = "darkblue") +  # Trend line shows overall pattern
  labs(
    title = "Relationship Between Daily Steps and Sleep Duration",
    x = "Total Steps",
    y = "Total Minutes Asleep"
  )

# 📌 Conclusion:
# The scatterplot shows a slight downward trend, indicating that higher step counts are associated with shorter sleep durations.
# While the relationship isn't strong, it suggests that more active users may sleep less — possibly due to lifestyle trade-offs or timing of activity.
# Bellabeat could use this insight to offer personalized guidance on balancing activity and recovery.