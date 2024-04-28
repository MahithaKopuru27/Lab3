# Load necessary libraries
library(tidyverse)
library(cluster)
library(factoextra)
library(ggfortify)

# Function to simulate student data
simulate_student_features <- function(n = 100) {
  set.seed(123)
  student_engagement <- rnorm(n, mean = 50, sd = 10)
  student_performance <- rnorm(n, mean = 50, sd = 10)
  
  # Combine into a data frame
  data.frame(student_engagement = student_engagement, student_performance = student_performance)
}

# Simulate the data
student_features <- simulate_student_features(n = 100)

# Perform dimensionality reduction on the data using PCA
pca_result <- prcomp(student_features, scale. = TRUE)

# Plot the PCA results without specifying color
autoplot(pca_result, data = student_features, alpha = 0.7)

# Determine the optimal number of clusters using the silhouette method
sil_width <- c(NA)
for (i in 2:15) {
  diss <- dist(student_features)
  pam_fit <- pam(diss, k = i)
  sil_width[i] <- pam_fit$silinfo$avg.width
}

# Plot the silhouette method result
plot(1:15, sil_width, type = "b", xlab = "Number of Clusters", ylab = "Average Silhouette Width",
     main = "Silhouette Method for Optimal Number of Clusters")

# Here, let's assume the optimal number of clusters is 3

# Cluster the data using pam (Partitioning Around Medoids)
diss <- dist(student_features)
pam_fit <- pam(diss, k = 3)

# Add the cluster results to the data frame
student_features$cluster <- as.factor(pam_fit$clustering)

# Plot the clusters
ggplot(student_features, aes(student_engagement, student_performance, color = cluster)) +
  geom_point() +
  labs(title = "Clusters of Students",
       x = "Student Engagement",
       y = "Student Performance")


