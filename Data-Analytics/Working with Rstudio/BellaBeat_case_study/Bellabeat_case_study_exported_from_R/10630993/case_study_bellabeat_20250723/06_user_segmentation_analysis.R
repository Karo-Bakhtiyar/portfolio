# 📦 Load required packages
library(dplyr)
library(lubridate)
library(ggplot2)

# 🧮 Step 1: Create summary metrics per user
steps_summary <- daily_activity_clean %>%
  mutate(ActivityDate = as_date(ActivityDate)) %>%
  group_by(Id) %>%
  summarise(AvgSteps = mean(TotalSteps, na.rm = TRUE), .groups = "drop")

sleep_summary <- sleep_per_minute_clean %>%
  mutate(SleepDate = as_date(mdy_hms(date))) %>%
  group_by(Id, SleepDate) %>%
  summarise(SleepMinutes = n(), .groups = "drop") %>%
  group_by(Id) %>%
  summarise(AvgSleepHours = mean(SleepMinutes / 60, na.rm = TRUE), .groups = "drop")

activity_engagement <- daily_activity_clean %>%
  mutate(ActivityDate = as_date(ActivityDate)) %>%
  group_by(Id) %>%
  summarise(ActivityDaysLogged = n_distinct(ActivityDate), .groups = "drop")

sleep_engagement <- sleep_per_minute_clean %>%
  mutate(SleepDate = as_date(mdy_hms(date))) %>%
  group_by(Id) %>%
  summarise(SleepDaysLogged = n_distinct(SleepDate), .groups = "drop")

weight_engagement <- weight_tracking_clean %>%
  mutate(WeightDate = as_date(mdy_hms(Date))) %>%
  group_by(Id) %>%
  summarise(WeightDaysLogged = n_distinct(WeightDate), .groups = "drop")

# 🔗 Step 2: Combine all metrics
user_summary <- activity_engagement %>%
  full_join(sleep_engagement, by = "Id") %>%
  full_join(weight_engagement, by = "Id") %>%
  replace_na(list(ActivityDaysLogged = 0, SleepDaysLogged = 0, WeightDaysLogged = 0)) %>%
  left_join(steps_summary, by = "Id") %>%
  left_join(sleep_summary, by = "Id")

# 🧠 Step 3: Segment users based on behavior
user_segments <- user_summary %>%
  mutate(
    Segment = case_when(
      ActivityDaysLogged >= 20 & SleepDaysLogged >= 20 & WeightDaysLogged >= 5 ~ "Highly Engaged",
      ActivityDaysLogged >= 10 | SleepDaysLogged >= 10 | WeightDaysLogged >= 2 ~ "Moderately Engaged",
      TRUE ~ "Low Engagement"
    )
  )

# 📊 Step 4: Visualize segment distribution
ggplot(user_segments, aes(x = Segment, fill = Segment)) +
  geom_bar(width = 0.6, show.legend = FALSE) +
  scale_fill_manual(values = c("Low Engagement" = "#E74C3C", 
                               "Moderately Engaged" = "#1ABC9C", 
                               "Highly Engaged" = "#3498DB")) +
  labs(
    title = "User Engagement Segments",
    subtitle = "Distribution of users based on activity, sleep, and weight logging",
    x = "Engagement Segment",
    y = "Number of Users"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    panel.grid.major.x = element_blank()
  )

# Conclusion:
# Most users are moderately engaged, logging at least one type of data regularly.
# A small group shows low engagement, logging very little and potentially at risk of churn.
# Bellabeat should focus on re-engaging low-engaged users through onboarding nudges, 
# simplified tracking, and habit-building features, while also encouraging moderate users 
# to become highly engaged.