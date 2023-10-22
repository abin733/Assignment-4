# Open a text file for writing
sink("ResultSectionC.txt")

# Load the necessary libraries
library(readr)
library(ggplot2)
library(psych)

# Load the dataset
data <- read.csv("pbc.csv")

# Calculate the median of bilirubin (bili)
medianAllBili <- median(data$bili, na.rm = TRUE)

# Create a new variable 'bilirubin_group' based on the median
data$bilirubin_group <- ifelse(data$bili <= medianAllBili, "Group A", "Group B")

# Calculate the median bilirubin for each group
medianGroupA <- median(data$bili[data$bilirubin_group == "Group A"], na.rm = TRUE)
medianGroupB <- median(data$bili[data$bilirubin_group == "Group B"], na.rm = TRUE)

# Print the median bilirubin for each group
cat("Median for Group A (<= medianAllBili):", medianGroupA, "\n")
cat("Median for Group B (> medianAllBili):", medianGroupB, "\n")

# Convert treatment (trt) to a categorical variable
data$treatment_category <- factor(data$trt, levels = c(1, 2),
                                  labels = c("D-penicillamine", "Placebo"),
                                  exclude = NA)

# Convert outcome status (status) to a categorical variable
data$outcome_category <- factor(data$status, levels = c(0, 1, 2),
                                labels = c("Censored", "Transplant", "Dead"),
                                exclude = NA)

# Create a table of treatment categories
table_treatment <- table(data$treatment_category)

# Create a table of outcome categories
table_outcome <- table(data$outcome_category)

# Print the tables
cat("Table for Treatment Category:\n")
print(table_treatment)

cat("\nTable for Outcome Category:\n")
print(table_outcome)

# Number of people who died (excluding missing values)
total_deaths <- sum(data$status == 2, na.rm = TRUE)

# Number of deaths in the placebo group (excluding missing values)
deaths_in_placebo <- sum(data$status[data$treatment_category == "Placebo"] == 2, na.rm = TRUE)

# Calculate the percentage (exclude missing values)
percentage_in_placebo <- (deaths_in_placebo / total_deaths) * 100

# Print the results
cat("Total number of people who died:", total_deaths, "\n")
cat("Percentage of those who died in the placebo group:", percentage_in_placebo, "%\n")

# Number of people in the treatment group (D-penicillamine) excluding missing values
total_treatment_group <- sum(data$treatment_category == "D-penicillamine", na.rm = TRUE)

# Number of people in the treatment group who received a transplant excluding missing values
transplants_in_treatment_group <- sum(data$status[data$treatment_category == "D-penicillamine"] == 1, na.rm = TRUE)

# Calculate the percentage (exclude missing values)
percentage_transplants_in_treatment_group <- (transplants_in_treatment_group / total_treatment_group) * 100

# Print the results
cat("Percentage of the treatment group (D-penicillamine) that received a transplant:", percentage_transplants_in_treatment_group, "%\n")

# Create the 'outcome.binary' variable
data$outcome.binary <- ifelse(data$status == 0, 0, 1)

# Create a contingency table
contingency_table <- table(data$treatment_category, data$outcome.binary)

# Calculate the risk ratio
risk_ratio <- contingency_table[2, 2] / contingency_table[1, 2]

# Print the risk ratio
cat("Risk Ratio of having a transplant or dying in the treatment group compared to the placebo group:", risk_ratio, "\n")

# Create a 2x2 contingency table
contingency_table <- table(data$treatment_category, data$outcome.binary)

# Calculate the odds ratio
odds_ratio <- (contingency_table[2, 2] * contingency_table[1, 1]) /
  (contingency_table[2, 1] * contingency_table[1, 2])

# Print the odds ratio
cat("Odds Ratio of having a transplant or dying in the treatment group compared to the placebo group:", odds_ratio, "\n")

# Convert 'stage' to a categorical variable
data$stage_category <- factor(data$stage)

# Create a table to count the number of people in each stage
stage_counts <- table(data$stage_category)

# Find the stage with the most people
most_people_stage <- names(stage_counts)[which.max(stage_counts)]

# Print the stage with the most people
cat("The stage with the most people is:", most_people_stage, "\n")

# Calculate the mean and standard deviation of age for each stage
stage_summary <- aggregate(data$age, by=list(Stage=data$stage_category), FUN=function(x) c(Mean_Age=mean(x, na.rm=TRUE), SD_Age=sd(x, na.rm=TRUE)))

# Print the summary with renamed headers
cat("stage_summary\n")
print(stage_summary)

# Perform ANOVA
anova_result <- aov(age ~ stage_category, data=data)

# Summarize ANOVA results
cat('summary(anova_result)\n')
print(summary(anova_result))

# Perform Tukey-Kramer post-hoc test
posthoc_test <- TukeyHSD(anova_result)

# Summarize the post-hoc test results
cat('posthoc_test\n')
print(posthoc_test)
cat('summary(posthoc_test)\n')
print(summary(posthoc_test))

# Close the text file
sink()
