# 📌 Step 6: Compare Behavior Across Segments (Faceted View)
# 🎯 Goal: Show average behavior metrics for each user segment in a clear, organized layout.
# 📈 Purpose: Make it easy to compare how low, moderate, and highly engaged users differ in steps, sleep, and logging habits.
# 💡 Why It Matters: Understanding these differences helps Bellabeat design features that reinforce healthy habits
# and guide less engaged users toward more consistent tracking.

# 📦 Required packages
library(dplyr)
library(ggplot2)
library(tidyr)

# 🧮 Prepare summary data
segment_means <- user_segments %>%
  group_by(Segment) %>%
  summarise(
    AvgSteps = mean(AvgSteps, na.rm = TRUE),
    AvgSleepHours = mean(AvgSleepHours, na.rm = TRUE),
    ActivityDaysLogged = mean(ActivityDaysLogged, na.rm = TRUE),
    SleepDaysLogged = mean(SleepDaysLogged, na.rm = TRUE),
    WeightDaysLogged = mean(WeightDaysLogged, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  pivot_longer(cols = -Segment, names_to = "Metric", values_to = "Value") %>%
  mutate(Value = replace_na(Value, 0))  # Ensure all metrics show

# 🧊 Clean metric labels
segment_means$Metric <- recode(segment_means$Metric,
                               AvgSteps = "Average Steps",
                               AvgSleepHours = "Average Sleep Hours",
                               ActivityDaysLogged = "Activity Logging Days",
                               SleepDaysLogged = "Sleep Logging Days",
                               WeightDaysLogged = "Weight Logging Days"
)

# 📊 Faceted bar chart
ggplot(segment_means, aes(x = Segment, y = Value, fill = Segment)) +
  geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
  facet_wrap(~ Metric, scales = "free_y") +
  scale_fill_manual(values = c("Low Engagement" = "#E74C3C", 
                               "Moderately Engaged" = "#1ABC9C", 
                               "Highly Engaged" = "#3498DB")) +
  labs(
    title = "Average Behavior Metrics by User Segment",
    x = "User Segment",
    y = "Average Value"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    panel.grid.major.x = element_blank()
  )

# 📌 Insight & Conclusion:
# The comparison reveals that moderately engaged users consistently outperform low-engaged users across all tracked behaviors.
# They walk significantly more, sleep longer, and log data more frequently. 
# This suggests that engagement in Bellabeat is not isolated to one feature — users who are active tend to be consistent across multiple dimensions.
# Bellabeat should re-engage low users with simplified tracking and habit nudges,
# while helping moderate users build consistency through feedback loops and goal reinforcement.