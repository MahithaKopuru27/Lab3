# Student Clustering Analysis

## Overview
This R script conducts a clustering analysis on simulated student data to identify groups of students with similar patterns of engagement and performance. It utilizes dimensionality reduction with Principal Component Analysis (PCA) and clustering with Partitioning Around Medoids (PAM) to achieve this.

## Dependencies
Ensure you have the following R libraries installed:
- tidyverse
- cluster
- factoextra
- ggfortify

You can install these libraries using the following commands:
```R
install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")
install.packages("ggfortify")
```

## Usage
1. **Simulation**: Simulate student data using the `simulate_student_features` function. You can adjust the number of students (`n`) and the mean and standard deviation of engagement and performance.
2. **Dimensionality Reduction (PCA)**: Perform PCA on the simulated student data to reduce its dimensionality.
3. **Silhouette Analysis**: Determine the optimal number of clusters using the silhouette method.
4. **Clustering (PAM)**: Cluster the data using PAM with the optimal number of clusters identified in the silhouette analysis.
5. **Visualization**: Visualize the clusters by plotting student engagement against student performance, with each cluster represented by a different color.

## Files
- `student_clustering_analysis.R`: R script for conducting the clustering analysis.
- `README.md`: This README file providing an overview of the analysis and usage instructions.
