# 📦 Load required packages
library(readr)     # For reading CSV files
library(dplyr)     # For data manipulation
library(lubridate) # For working with dates
library(ggplot2)   # For data visualization

# 📥 Import cleaned dataset
daily_activity_clean <- read_csv("cleaned_daily_activity.csv")

# 📈 Analyze the relationship between Total Steps and Calories Burned

# Calculate the Pearson correlation coefficient
correlation <- cor(daily_activity_clean$TotalSteps, daily_activity_clean$Calories)

# Print the result
print(paste("Correlation between Total Steps and Calories Burned:", round(correlation, 3)))

# 🧠 Interpretation:
# A value around 0.581 suggests a moderate positive relationship:
# → As users take more steps, they tend to burn more calories.
# → Other factors (like intensity or duration) may also influence calorie burn.

# 📊 Visualize the relationship using a scatter plot with a trend line
ggplot(daily_activity_clean, aes(x = TotalSteps, y = Calories)) +
  geom_point(alpha = 0.5, color = "darkgreen") +  # Scatter plot of steps vs calories
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add linear trend line
  labs(
    title = "Relationship Between Total Steps and Calories Burned",
    x = "Total Steps",
    y = "Calories Burned"
  )

# In this case, a value around 0.581 suggests a moderate positive relationship:
# → As users take more steps, they tend to burn more calories.