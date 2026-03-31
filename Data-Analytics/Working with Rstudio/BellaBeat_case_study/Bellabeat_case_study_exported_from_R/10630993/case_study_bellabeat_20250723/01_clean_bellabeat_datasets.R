# Cleaning phase:
# - Removed duplicate rows from all datasets
# - Parsed date columns using lubridate
# - Standardized column names for consistency
# - Checked for missing values
# - Saved cleaned datasets for analysis


#  Load required packages
library(readr)
library(dplyr)
library(lubridate)

#  Import datasets
daily_activity     <- read_csv("case_study_bellabeat_20250723/daily_activity_merged.csv")
sleep_per_minute   <- read_csv("case_study_bellabeat_20250723/minuteSleep_merged.csv")
weight_tracking    <- read_csv("case_study_bellabeat_20250723/weightLogInfo_merged.csv")

#  Clean daily_activity
daily_activity_clean <- daily_activity %>%
  distinct() %>%  # Remove duplicates
  mutate(ActivityDate = mdy(ActivityDate)) %>%  # Convert to Date format
  rename_with(make.names)  # Standardize column names

#  Clean sleep_per_minute
sleep_per_minute_clean <- sleep_per_minute %>%
  distinct() %>%  # Remove duplicates
  rename_with(make.names)  # Standardize column names

# If there's a timestamp column, convert it (update name if needed)
# Example: sleep_per_minute_clean <- sleep_per_minute_clean %>% mutate(LogTime = ymd_hms(LogTime))

#  Clean weight_tracking
weight_tracking_clean <- weight_tracking %>%
  distinct() %>%  # Remove duplicates
  rename_with(make.names)  # Standardize column names

# If there's a timestamp column, convert it (update name if needed)
# Example: weight_tracking_clean <- weight_tracking_clean %>% mutate(Date = ymd_hms(Date))

#  Check for missing values
cat("Missing values in daily_activity:\n")
print(colSums(is.na(daily_activity_clean)))

cat("\nMissing values in sleep_per_minute:\n")
print(colSums(is.na(sleep_per_minute_clean)))

cat("\nMissing values in weight_tracking:\n")
print(colSums(is.na(weight_tracking_clean)))

# Save cleaned datasets
write_csv(daily_activity_clean, "cleaned_daily_activity.csv")
write_csv(sleep_per_minute_clean, "cleaned_sleep_per_minute.csv")
write_csv(weight_tracking_clean, "cleaned_weight_tracking.csv")