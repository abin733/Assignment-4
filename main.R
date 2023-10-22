# Load the necessary libraries
library(readr)
library(ggplot2)
library(psych)
library(officer)
library(flextable)
library(dplyr)

# Load the CSV file into RStudio
data <- read.csv("urineanalysis.csv")

# Create a new Word document
doc <- read_docx()

# Add a title to the document
doc <- doc %>%
  body_add("Urine Analysis Report", style = "heading 1")

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

# Insert the plots into the document with specified width and height
doc <- doc %>%
  body_add_img("plot1.png", width = 6, height = 4) %>%
  body_add_img("plot2.png", width = 6, height = 4) %>%
  body_add_img("plot3.png", width = 6, height = 4)

# Generate a detailed summary of the dataset
data_summary <- describe(data)

# Convert the summary to a flextable
table_summary <- flextable::qflextable(data_summary)

# Insert the summary table into the document
doc <- doc %>%
  body_add_flextable(table_summary)

# Calculate the correlation coefficient between urea and specific gravity
correlation_coefficient <- cor(data$urea, data$gravity)

# Create a table for the correlation coefficient
correlation_table <- flextable(data = data.frame("Correlation Coefficient" = correlation_coefficient))

# Insert the correlation table into the document
doc <- doc %>%
  body_add_flextable(correlation_table)

# Filter the dataset to include only people with urea < 100 mmol/L
filtered_data <- data[data$urea < 100, ]

# Count the number of people left in the filtered data
num_people_left <- nrow(filtered_data)

# Calculate the median pH in this subset
median_pH <- median(filtered_data$ph, na.rm = TRUE)

# Create a table for the number of people and median pH
results_table <- flextable(data = data.frame(
  "Number of people with urea < 100 mmol/L" = num_people_left,
  "Median pH in this subset" = median_pH
))

# Insert the results table into the document
doc <- doc %>%
  body_add_flextable(results_table)

# Save the document as a .docx file
print(doc, target = "urine_analysis_report.docx")

