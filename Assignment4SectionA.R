# Load the necessary libraries
library(readr)
library(ggplot2)
library(psych)


# Load the dataset
help_miss <- read_csv("HELPmiss.csv")

# Calculate total count of observations
varTotalN <- nrow(help_miss)

# Calculate the percentage of the total count
varTotalNPercent <- 100

# Calculate female count and percentage
varFemaleN <- sum(help_miss$female == 1, na.rm = TRUE)
varFemaleNPercent <- (varFemaleN / varTotalN) * 100

# Calculate male count and percentage
varMaleN <- sum(help_miss$female == 0, na.rm = TRUE)
varMaleNPercent <- (varMaleN / varTotalN) * 100

# Calculate and assign variables for the total section
varTotalAgeMean <- mean(help_miss$age, na.rm = TRUE)
varTotalAgeMedian <- median(help_miss$age, na.rm = TRUE)

# Calculate and assign variables for the Race group
varTotalBlackN <- sum(help_miss$racegrp == "black", na.rm = TRUE)
varTotalHispanicN <- sum(help_miss$racegrp == "hispanic", na.rm = TRUE)
varTotalOtherN <- sum(help_miss$racegrp == "other", na.rm = TRUE)
varTotalWhiteN <- sum(help_miss$racegrp == "white", na.rm = TRUE)

varTotalBlackNPercent <- (varTotalBlackN / nrow(help_miss)) * 100
varTotalHispanicNPercent <- (varTotalHispanicN / nrow(help_miss)) * 100
varTotalOtherNPercent <- (varTotalOtherN / nrow(help_miss)) * 100
varTotalWhiteNPercent <- (varTotalWhiteN / nrow(help_miss)) * 100

# Calculate and assign variables for the Homeless section
varTotalHomelessN <- sum(help_miss$homeless == "homeless", na.rm = TRUE)
varTotalHomelessNPercent <- (varTotalHomelessN / nrow(help_miss)) * 100

# Calculate and assign variables for the Number of hospitalizations section
varTotalHospitalizationsMean <- mean(help_miss$d1, na.rm = TRUE)
varTotalHospitalizationsMedian <- median(help_miss$d1, na.rm = TRUE)

# Calculate and assign variables for the Number of times entered a detox programme section
varTotalDetoxTimesMean <- mean(help_miss$e2b, na.rm = TRUE)
varTotalDetoxTimesMedian <- median(help_miss$e2b, na.rm = TRUE)

# Calculate and assign variables for the Average number of drinks consumed per day section
varTotalDrinksPerDayMean <- mean(help_miss$i1, na.rm = TRUE)
varTotalDrinksPerDayMedian <- median(help_miss$i1, na.rm = TRUE)

# Calculate and assign variables for the Alcohol section
varTotalAlcoholN <- sum(help_miss$substance == "alcohol", na.rm = TRUE)
varTotalAlcoholNPercent <- (varTotalAlcoholN / nrow(help_miss)) * 100

# Calculate and assign variables for the Cocaine section
varTotalCocaineN <- sum(help_miss$substance == "cocaine", na.rm = TRUE)
varTotalCocaineNPercent <- (varTotalCocaineN / nrow(help_miss)) * 100

# Calculate and assign variables for the Heroin section
varTotalHeroinN <- sum(help_miss$substance == "heroin", na.rm = TRUE)
varTotalHeroinNPercent <- (varTotalHeroinN / nrow(help_miss)) * 100

# Calculate and assign variables for the Any substance abuse post-detox section
varTotalSubstanceAbuse <- sum(help_miss$anysub == "yes", na.rm = TRUE)
varTotalSubstanceAbusePercent <- (varTotalSubstanceAbuse / nrow(help_miss)) * 100

# Calculate and assign variables for the Time to first substance abuse post-detox section
varTotalTimeToSubstanceAbuseMean <- mean(help_miss$daysanysub, na.rm = TRUE)
varTotalTimeToSubstanceAbuseMedian <- median(help_miss$daysanysub, na.rm = TRUE)

# Print the calculated variables for the total section
cat("Total section:\n")
cat("Age, years - Mean:", varTotalAgeMean, " Median:", varTotalAgeMedian, "\n")
cat("Race group - Black N:", varTotalBlackN, " (", varTotalBlackNPercent, "%), Hispanic N:", varTotalHispanicN, " (", varTotalHispanicNPercent, "%), Other N:", varTotalOtherN, " (", varTotalOtherNPercent, "%), White N:", varTotalWhiteN, " (", varTotalWhiteNPercent, "%)\n")
cat("Homeless - Homeless N:", varTotalHomelessN, " (", varTotalHomelessNPercent, "%)\n")
cat("Number of hospitalizations for medical problems in their lifetime - Mean:", varTotalHospitalizationsMean, " Median:", varTotalHospitalizationsMedian, "\n")
cat("Number of times entered a detox programme in the past 6 months - Mean:", varTotalDetoxTimesMean, " Median:", varTotalDetoxTimesMedian, "\n")
cat("Average number of drinks consumed per day in the past 30 days - Mean:", varTotalDrinksPerDayMean, " Median:", varTotalDrinksPerDayMedian, "\n")
cat("Alcohol N:", varTotalAlcoholN, " (", varTotalAlcoholNPercent, "%)\n")
cat("Cocaine N:", varTotalCocaineN, " (", varTotalCocaineNPercent, "%)\n")
cat("Heroin N:", varTotalHeroinN, " (", varTotalHeroinNPercent, "%)\n")
cat("Any substance abuse post-detox - N:", varTotalSubstanceAbuse, " (", varTotalSubstanceAbusePercent, "%)\n")
cat("Time to first substance abuse post-detox, days - Mean:", varTotalTimeToSubstanceAbuseMean, " Median:", varTotalTimeToSubstanceAbuseMedian, "\n")

# Calculate and assign variables for the female section
varFemaleAgeMean <- mean(help_miss$age[help_miss$female == 1], na.rm = TRUE)
varFemaleAgeMedian <- median(help_miss$age[help_miss$female == 1], na.rm = TRUE)

# Calculate and assign variables for the Race group - Female
varTotalBlackN_female <- sum(help_miss$racegrp[help_miss$female == 1] == "black", na.rm = TRUE)
varTotalHispanicN_female <- sum(help_miss$racegrp[help_miss$female == 1] == "hispanic", na.rm = TRUE)
varTotalOtherN_female <- sum(help_miss$racegrp[help_miss$female == 1] == "other", na.rm = TRUE)
varTotalWhiteN_female <- sum(help_miss$racegrp[help_miss$female == 1] == "white", na.rm = TRUE)

varTotalBlackNPercent_female <- (varTotalBlackN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100
varTotalHispanicNPercent_female <- (varTotalHispanicN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100
varTotalOtherNPercent_female <- (varTotalOtherN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100
varTotalWhiteNPercent_female <- (varTotalWhiteN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100

# Calculate and assign variables for the Homeless - Female
varTotalHomelessN_female <- sum(help_miss$homeless[help_miss$female == 1] == "homeless", na.rm = TRUE)
varTotalHomelessNPercent_female <- (varTotalHomelessN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100

# Calculate and assign variables for the Number of hospitalizations - Female
varTotalHospitalizationsMean_female <- mean(help_miss$d1[help_miss$female == 1], na.rm = TRUE)
varTotalHospitalizationsMedian_female <- median(help_miss$d1[help_miss$female == 1], na.rm = TRUE)

# Calculate and assign variables for the Number of times entered a detox programme - Female
varTotalDetoxTimesMean_female <- mean(help_miss$e2b[help_miss$female == 1], na.rm = TRUE)
varTotalDetoxTimesMedian_female <- median(help_miss$e2b[help_miss$female == 1], na.rm = TRUE)

# Calculate and assign variables for the Average number of drinks consumed per day - Female
varTotalDrinksPerDayMean_female <- mean(help_miss$i1[help_miss$female == 1], na.rm = TRUE)
varTotalDrinksPerDayMedian_female <- median(help_miss$i1[help_miss$female == 1], na.rm = TRUE)

# Calculate and assign variables for the Alcohol - Female
varTotalAlcoholN_female <- sum(help_miss$substance[help_miss$female == 1] == "alcohol", na.rm = TRUE)
varTotalAlcoholNPercent_female <- (varTotalAlcoholN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100

# Calculate and assign variables for the Cocaine - Female
varTotalCocaineN_female <- sum(help_miss$substance[help_miss$female == 1] == "cocaine", na.rm = TRUE)
varTotalCocaineNPercent_female <- (varTotalCocaineN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100

# Calculate and assign variables for the Heroin - Female
varTotalHeroinN_female <- sum(help_miss$substance[help_miss$female == 1] == "heroin", na.rm = TRUE)
varTotalHeroinNPercent_female <- (varTotalHeroinN_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100

# Calculate and assign variables for the Any substance abuse post-detox - Female
varTotalSubstanceAbuse_female <- sum(help_miss$anysub[help_miss$female == 1] == "yes", na.rm = TRUE)
varTotalSubstanceAbusePercent_female <- (varTotalSubstanceAbuse_female / sum(help_miss$female == 1, na.rm = TRUE)) * 100

# Calculate and assign variables for the Time to first substance abuse post-detox - Female
varTotalTimeToSubstanceAbuseMean_female <- mean(help_miss$daysanysub[help_miss$female == 1], na.rm = TRUE)
varTotalTimeToSubstanceAbuseMedian_female <- median(help_miss$daysanysub[help_miss$female == 1], na.rm = TRUE)

# Print the calculated variables for the female section
cat("\nFemale section:\n")
cat("Age, years - Mean:", varFemaleAgeMean, " Median:", varFemaleAgeMedian, "\n")
cat("Race group - Black N:", varTotalBlackN_female, " (", varTotalBlackNPercent_female, "%), Hispanic N:", varTotalHispanicN_female, " (", varTotalHispanicNPercent_female, "%), Other N:", varTotalOtherN_female, " (", varTotalOtherNPercent_female, "%), White N:", varTotalWhiteN_female, " (", varTotalWhiteNPercent_female, "%)\n")
cat("Homeless - Homeless N:", varTotalHomelessN_female, " (", varTotalHomelessNPercent_female, "%)\n")
cat("Number of hospitalizations for medical problems in their lifetime - Mean:", varTotalHospitalizationsMean_female, " Median:", varTotalHospitalizationsMedian_female, "\n")
cat("Number of times entered a detox programme in the past 6 months - Mean:", varTotalDetoxTimesMean_female, " Median:", varTotalDetoxTimesMedian_female, "\n")
cat("Average number of drinks consumed per day in the past 30 days - Mean:", varTotalDrinksPerDayMean_female, " Median:", varTotalDrinksPerDayMedian_female, "\n")
cat("Alcohol N:", varTotalAlcoholN_female, " (", varTotalAlcoholNPercent_female, "%)\n")
cat("Cocaine N:", varTotalCocaineN_female, " (", varTotalCocaineNPercent_female, "%)\n")
cat("Heroin N:", varTotalHeroinN_female, " (", varTotalHeroinNPercent_female, "%)\n")
cat("Any substance abuse post-detox - N:", varTotalSubstanceAbuse_female, " (", varTotalSubstanceAbusePercent_female, "%)\n")
cat("Time to first substance abuse post-detox, days - Mean:", varTotalTimeToSubstanceAbuseMean_female, " Median:", varTotalTimeToSubstanceAbuseMedian_female, "\n")

# Calculate and assign variables for the male section
varMaleAgeMean <- mean(help_miss$age[help_miss$female == 0], na.rm = TRUE)
varMaleAgeMedian <- median(help_miss$age[help_miss$female == 0], na.rm = TRUE)

# Calculate and assign variables for the Race group - Male
varTotalBlackN_male <- sum(help_miss$racegrp[help_miss$female == 0] == "black", na.rm = TRUE)
varTotalHispanicN_male <- sum(help_miss$racegrp[help_miss$female == 0] == "hispanic", na.rm = TRUE)
varTotalOtherN_male <- sum(help_miss$racegrp[help_miss$female == 0] == "other", na.rm = TRUE)
varTotalWhiteN_male <- sum(help_miss$racegrp[help_miss$female == 0] == "white", na.rm = TRUE)

varTotalBlackNPercent_male <- (varTotalBlackN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100
varTotalHispanicNPercent_male <- (varTotalHispanicN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100
varTotalOtherNPercent_male <- (varTotalOtherN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100
varTotalWhiteNPercent_male <- (varTotalWhiteN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100

# Calculate and assign variables for the Homeless - Male
varTotalHomelessN_male <- sum(help_miss$homeless[help_miss$female == 0] == "homeless", na.rm = TRUE)
varTotalHomelessNPercent_male <- (varTotalHomelessN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100

# Calculate and assign variables for the Number of hospitalizations - Male
varTotalHospitalizationsMean_male <- mean(help_miss$d1[help_miss$female == 0], na.rm = TRUE)
varTotalHospitalizationsMedian_male <- median(help_miss$d1[help_miss$female == 0], na.rm = TRUE)

# Calculate and assign variables for the Number of times entered a detox programme - Male
varTotalDetoxTimesMean_male <- mean(help_miss$e2b[help_miss$female == 0], na.rm = TRUE)
varTotalDetoxTimesMedian_male <- median(help_miss$e2b[help_miss$female == 0], na.rm = TRUE)

# Calculate and assign variables for the Average number of drinks consumed per day - Male
varTotalDrinksPerDayMean_male <- mean(help_miss$i1[help_miss$female == 0], na.rm = TRUE)
varTotalDrinksPerDayMedian_male <- median(help_miss$i1[help_miss$female == 0], na.rm = TRUE)

# Calculate and assign variables for the Alcohol - Male
varTotalAlcoholN_male <- sum(help_miss$substance[help_miss$female == 0] == "alcohol", na.rm = TRUE)
varTotalAlcoholNPercent_male <- (varTotalAlcoholN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100

# Calculate and assign variables for the Cocaine - Male
varTotalCocaineN_male <- sum(help_miss$substance[help_miss$female == 0] == "cocaine", na.rm = TRUE)
varTotalCocaineNPercent_male <- (varTotalCocaineN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100

# Calculate and assign variables for the Heroin - Male
varTotalHeroinN_male <- sum(help_miss$substance[help_miss$female == 0] == "heroin", na.rm = TRUE)
varTotalHeroinNPercent_male <- (varTotalHeroinN_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100

# Calculate and assign variables for the Any substance abuse post-detox - Male
varTotalSubstanceAbuse_male <- sum(help_miss$anysub[help_miss$female == 0] == "yes", na.rm = TRUE)
varTotalSubstanceAbusePercent_male <- (varTotalSubstanceAbuse_male / sum(help_miss$female == 0, na.rm = TRUE)) * 100

# Calculate and assign variables for the Time to first substance abuse post-detox - Male
varTotalTimeToSubstanceAbuseMean_male <- mean(help_miss$daysanysub[help_miss$female == 0], na.rm = TRUE)
varTotalTimeToSubstanceAbuseMedian_male <- median(help_miss$daysanysub[help_miss$female == 0], na.rm = TRUE)

# Print the calculated variables for the male section
cat("\nMale section:\n")
cat("Age, years - Mean:", varMaleAgeMean, " Median:", varMaleAgeMedian, "\n")
cat("Race group - Black N:", varTotalBlackN_male, " (", varTotalBlackNPercent_male, "%), Hispanic N:", varTotalHispanicN_male, " (", varTotalHispanicNPercent_male, "%), Other N:", varTotalOtherN_male, " (", varTotalOtherNPercent_male, "%), White N:", varTotalWhiteN_male, " (", varTotalWhiteNPercent_male, "%)\n")
cat("Homeless - Homeless N:", varTotalHomelessN_male, " (", varTotalHomelessNPercent_male, "%)\n")
cat("Number of hospitalizations for medical problems in their lifetime - Mean:", varTotalHospitalizationsMean_male, " Median:", varTotalHospitalizationsMedian_male, "\n")
cat("Number of times entered a detox programme in the past 6 months - Mean:", varTotalDetoxTimesMean_male, " Median:", varTotalDetoxTimesMedian_male, "\n")
cat("Average number of drinks consumed per day in the past 30 days - Mean:", varTotalDrinksPerDayMean_male, " Median:", varTotalDrinksPerDayMedian_male, "\n")
cat("Alcohol N:", varTotalAlcoholN_male, " (", varTotalAlcoholNPercent_male, "%)\n")
cat("Cocaine N:", varTotalCocaineN_male, " (", varTotalCocaineNPercent_male, "%)\n")
cat("Heroin N:", varTotalHeroinN_male, " (", varTotalHeroinNPercent_male, "%)\n")
cat("Any substance abuse post-detox - N:", varTotalSubstanceAbuse_male, " (", varTotalSubstanceAbusePercent_male, "%)\n")
cat("Time to first substance abuse post-detox, days - Mean:", varTotalTimeToSubstanceAbuseMean_male, " Median:", varTotalTimeToSubstanceAbuseMedian_male, "\n")

# Create the table as a data frame
table_df <- data.frame(
  Cohort_Characteristics = c(
    "n value", "\"Age, years\"", "Race group", "Homeless",
    "Number of hospitalisations for medical problems in their lifetime",
    "Number of times entered a detox programme in the past 6 months",
    "Average number of drinks consumed per day in the past 30 days",
    "Alcohol", "Cocaine", "Heroin", "Any substance abuse post-detox",
    "\"Time to first substance abuse post-detox, days\""
  ),
  `Total mean (SD)` = c(
    NA, varTotalAgeMean, NA, NA,
    varTotalHospitalizationsMean, varTotalDetoxTimesMean, varTotalDrinksPerDayMean,
    NA, NA, NA, NA,
    varTotalTimeToSubstanceAbuseMean
  ),
  `Total median (IQR)` = c(
    NA, varTotalAgeMedian, NA, NA,
    varTotalHospitalizationsMedian, varTotalDetoxTimesMedian, varTotalDrinksPerDayMedian,
    NA, NA, NA, NA,
    varTotalTimeToSubstanceAbuseMedian
  ),
  `Total n` = c(
    varTotalN, NA, NA, varTotalHomelessN,
    NA, NA, NA,
    varTotalAlcoholN, varTotalCocaineN, varTotalHeroinN, varTotalSubstanceAbuse,
    NA
  ),
  `Total n (%)` = c(
    varTotalNPercent, NA, NA, varTotalHomelessNPercent,
    NA, NA, NA,
    varTotalAlcoholNPercent, varTotalCocaineNPercent, varTotalHeroinNPercent, varTotalSubstanceAbusePercent,
    NA
  ),
  `Female mean (SD)` = c(
    NA, varFemaleAgeMean, NA, NA,
    varTotalHospitalizationsMean_female, varTotalDetoxTimesMean_female, varTotalDrinksPerDayMean_female,
    NA, NA, NA, NA,
    varTotalTimeToSubstanceAbuseMean_female
  ),
  `Female median (IQR)` = c(
    NA, varFemaleAgeMedian, NA, NA,
    varTotalHospitalizationsMedian_female, varTotalDetoxTimesMedian_female, varTotalDrinksPerDayMedian_female,
    NA, NA, NA, NA,
    varTotalTimeToSubstanceAbuseMedian_female
  ),
  `Female n` = c(
    varFemaleN, NA, NA, varTotalHomelessN_female,
    NA, NA, NA,
    varTotalAlcoholN_female, varTotalCocaineN_female, varTotalHeroinN_female, varTotalSubstanceAbuse_female,
    NA
  ),
  `Female n (%)` = c(
    varFemaleNPercent, NA, NA, varTotalHomelessNPercent_female,
    NA, NA, NA,
    varTotalAlcoholNPercent_female, varTotalCocaineNPercent_female, varTotalHeroinNPercent_female, varTotalSubstanceAbusePercent_female,
    NA
  ),
  `Male mean (SD)` = c(
    NA, varMaleAgeMean, NA, NA,
    varTotalHospitalizationsMean_male, varTotalDetoxTimesMean_male, varTotalDrinksPerDayMean_male,
    NA, NA, NA, NA,
    varTotalTimeToSubstanceAbuseMean_male
  ),
  `Male median (IQR)` = c(
    NA, varMaleAgeMedian, NA, NA,
    varTotalHospitalizationsMedian_male, varTotalDetoxTimesMedian_male, varTotalDrinksPerDayMedian_male,
    NA, NA, NA, NA,
    varTotalTimeToSubstanceAbuseMedian_male
  ),
  `Male n` = c(
    varMaleN, NA, NA, varTotalHomelessN_male,
    NA, NA, NA,
    varTotalAlcoholN_male, varTotalCocaineN_male, varTotalHeroinN_male, varTotalSubstanceAbuse_male,
    NA
  ),
  `Male n (%)` = c(
    varMaleNPercent, NA, NA, varTotalHomelessNPercent_male,
    NA, NA, NA,
    varTotalAlcoholNPercent_male, varTotalCocaineNPercent_male, varTotalHeroinNPercent_male, varTotalSubstanceAbusePercent_male,
    NA
  )
)

# Write the data frame to a CSV file
write.csv(table_df, "output_table.csv", row.names = FALSE)

# Create the table as a data frame
table_df_substance <- data.frame(
  Cohort_Characteristics = c(
    "n value", "\"Age, years\"", "Alcohol", "Cocaine", "Heroin"
  ),
  `Total mean (SD)` = c(
    NA, mean(help_miss$age), NA, NA, NA
  ),
  `Total median (IQR)` = c(
    NA, median(help_miss$age), NA, NA, NA
  ),
  `Total n` = c(
    varTotalN, NA, sum(help_miss$substance == "alcohol"), sum(help_miss$substance == "cocaine"), sum(help_miss$substance == "heroin")
  ),
  `Total n (%)` = c(
    varTotalNPercent, NA, (sum(help_miss$substance == "alcohol") / nrow(help_miss)) * 100, (sum(help_miss$substance == "cocaine") / nrow(help_miss)) * 100, (sum(help_miss$substance == "heroin") / nrow(help_miss)) * 100
  ),
  `Female mean (SD)` = c(
    NA, mean(help_miss$age[help_miss$sex == "female"]), NA, NA, NA
  ),
  `Female median (IQR)` = c(
    NA, median(help_miss$age[help_miss$sex == "female"]), NA, NA, NA
  ),
  `Female n` = c(
    varFemaleN, NA, sum(help_miss$substance == "alcohol" & help_miss$sex == "female"), sum(help_miss$substance == "cocaine" & help_miss$sex == "female"), sum(help_miss$substance == "heroin" & help_miss$sex == "female")
  ),
  `Female n (%)` = c(
    varFemaleNPercent, NA, (sum(help_miss$substance == "alcohol" & help_miss$sex == "female") / sum(help_miss$sex == "female")) * 100, (sum(help_miss$substance == "cocaine" & help_miss$sex == "female") / sum(help_miss$sex == "female")) * 100, (sum(help_miss$substance == "heroin" & help_miss$sex == "female") / sum(help_miss$sex == "female")) * 100
  ),
  `Male mean (SD)` = c(
    NA, mean(help_miss$age[help_miss$sex == "male"]), NA, NA, NA
  ),
  `Male median (IQR)` = c(
    NA, median(help_miss$age[help_miss$sex == "male"]), NA, NA, NA
  ),
  `Male n` = c(
    varMaleN, NA, sum(help_miss$substance == "alcohol" & help_miss$sex == "male"), sum(help_miss$substance == "cocaine" & help_miss$sex == "male"), sum(help_miss$substance == "heroin" & help_miss$sex == "male")
  ),
  `Male n (%)` = c(
    varMaleNPercent, NA, (sum(help_miss$substance == "alcohol" & help_miss$sex == "male") / sum(help_miss$sex == "male")) * 100, (sum(help_miss$substance == "cocaine" & help_miss$sex == "male") / sum(help_miss$sex == "male")) * 100, (sum(help_miss$substance == "heroin" & help_miss$sex == "male") / sum(help_miss$sex == "male")) * 100
  )
)

# Write the data frame to a CSV file
write.csv(table_df_substance, "substance_abuse_post_detox_table.csv", row.names = FALSE)
print(table_df_substance)

# Create data frames for male and female individuals
female_data <- subset(help_miss, female == 1)
male_data <- subset(help_miss, female == 0)

# Create box plots for age by sex
p <- ggplot(help_miss, aes(x = factor(female, labels = c("Male", "Female")), y = age)) +
  geom_boxplot() +
  labs(x = "Sex", y = "Age") +
  theme_minimal()

# Print the plot
print(p)

# Perform a t-test to compare mean ages by sex
t_test_result <- t.test(age ~ female, data = help_miss)

# Print the t-test result
print("t_test_result")
print(t_test_result)


# Filter out NA values for the variable of interest
hospitalizations_data <- na.omit(help_miss$d1)

# Create a histogram
histogram_plot <- ggplot(data = NULL, aes(x = hospitalizations_data)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(x = "Lifetime Number of Hospitalizations", y = "Frequency") +
  ggtitle("Histogram of Lifetime Number of Hospitalizations") +
  theme_minimal()

# Print the histogram
print(histogram_plot)
# Get a detailed description of the distribution
detailed_summary <- describe(hospitalizations_data)
print('detailed_summary')
print(detailed_summary)

# Create a boxplot using ggplot2
boxplot_plot <- ggplot(data = help_miss, aes(x = substance, y = i1)) +
  geom_boxplot() +
  labs(
    x = "Primary Substance of Abuse",
    y = "Maximum Drinks Consumed per Day"
  ) +
  ggtitle("Boxplots of Maximum Drinks Consumed per Day by Primary Substance of Abuse") +
  theme_minimal()

# Print the plot
print(boxplot_plot)

# Create a detailed summary of the boxplot using base R
boxplot_summary <- boxplot.stats(help_miss$i1, coef = 0.1)

# Print the summary
print('boxplot_summary')
print(boxplot_summary)

# Find the row with the outlier value of 142 in the 'i1' variable
outlier_row <- which(help_miss$i1 == 142)

# Extract the primary substance of abuse for this individual
substance_of_abuse <- help_miss$substance[outlier_row]

# Print the result
cat("Primary Substance of Abuse for the person who drank the highest number of drinks:",
    substance_of_abuse, "\n")
