# Load the necessary libraries
library(readr)
library(ggplot2)
library(psych)

#To load the CSV file into RStudio,
data <- read.csv("urineanalysis.csv")

# Plot urea against the specific gravity of urine
# Change symbol to diamonds and point size to 1
p1 <- ggplot(data, aes(x = gravity, y = urea)) +
  geom_point(shape = 18, size = 1) +
  labs(y = "Urea")

# Add a linear trend line colored orange
p2 <- p1 + geom_smooth(method = "lm", color = "orange")

# Change the y-axis title to 'Urea, mmol/L'
p3 <- p2 + labs(y = "Urea, mmol/L")

# Output the plots to files
ggsave("plot1.png", p1, width = 6, height = 4)
ggsave("plot2.png", p2, width = 6, height = 4)
ggsave("plot3.png", p3, width = 6, height = 4)

# Generate a detailed summary of the dataset
data_summary <- describe(data)

# Print the summary
print(data_summary)

# Calculate the correlation coefficient between urea and specific gravity
correlation_coefficient <- cor(data$urea, data$gravity)

# Print the correlation coefficient
cat("Correlation Coefficient:", correlation_coefficient, "\n")

# Filter the dataset to include only people with urea < 100 mmol/L
filtered_data <- data[data$urea < 100, ]

# Count the number of people left in the filtered data
num_people_left <- nrow(filtered_data)

# Calculate the median pH in this subset
median_pH <- median(filtered_data$ph, na.rm = TRUE)

# Print the number of people and median pH
cat("Number of people with urea < 100 mmol/L:", num_people_left, "\n")
cat("Median pH in this subset:", median_pH, "\n")

