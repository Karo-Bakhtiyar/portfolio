# 📦 Load required packages
library(dplyr)
library(lubridate)

# activity logging days
activity_engagement <- daily_activity_clean %>%
  mutate(ActivityDate = as_date(ActivityDate)) %>%
  group_by(Id) %>%
  summarise(ActivityDaysLogged = n_distinct(ActivityDate), .groups = "drop")

# sleep logging days
sleep_engagement <- sleep_per_minute_clean %>%
  mutate(SleepDate = as_date(mdy_hms(date))) %>%
  group_by(Id) %>%
  summarise(SleepDaysLogged = n_distinct(SleepDate), .groups = "drop")

# Weight logging days
weight_engagement <- weight_tracking_clean %>%
  mutate(WeightDate = as_date(mdy_hms(Date))) %>%
  group_by(Id) %>%
  summarise(WeightDaysLogged = n_distinct(WeightDate), .groups = "drop")

---
  
library(ggplot2)

# Activity logging plot
ggplot(activity_engagement, aes(x = reorder(Id, -ActivityDaysLogged), y = ActivityDaysLogged)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Activity Logging Days per User", x = "User ID", y = "Days Logged") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# The chart shows that most users log activity infrequently, while only a few are consistent.
# This suggests that Bellabeat should focus on less engaged users by offering personalized nudges, habit-building tools, or simplified tracking features.
# Improving engagement in this group could significantly enhance user retention and the overall effectiveness of the app.

---

# Sleep logging plot
ggplot(sleep_engagement, aes(x = reorder(Id, -SleepDaysLogged), y = SleepDaysLogged)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(title = "Sleep Logging Days per User", x = "User ID", y = "Days Logged") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# conclusion
# Sleep logging is more consistent than weight tracking, with several users logging sleep for over 30 days.
# However, engagement still varies widely, indicating that not all users maintain regular sleep tracking. 
# Bellabeat could enhance sleep log consistency by introducing reminders, visual progress feedback, or habit-forming features to support sustained engagement.

---

# Weight logging plot
ggplot(weight_engagement, aes(x = reorder(Id, -WeightDaysLogged), y = WeightDaysLogged)) +
  geom_bar(stat = "identity", fill = "darkred") +
  labs(title = "Weight Logging Days per User", x = "User ID", y = "Days Logged") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#conclusion
# Weight logging is infrequent and concentrated among a small number of users.
# Most users only log their weight once, suggesting low engagement with this feature.
# Bellabeat could explore ways to encourage more consistent weight tracking, such as reminders, goal-setting tools, or progress visualizations to boost motivation.
---