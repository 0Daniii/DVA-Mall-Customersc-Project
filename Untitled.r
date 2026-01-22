# =========================================================
# ADVANCED PROJECT: MULTI-DIMENSIONAL CUSTOMER SEGMENTATION
# =========================================================

# 1. LIBRARIES
if(!require(plotly)) install.packages("plotly")
if(!require(factoextra)) install.packages("factoextra")
library(ggplot2)
library(cluster)
library(plotly)
library(factoextra)

# 2. DATA LOADING & PREPROCESSING
# ---------------------------------------------------------
# FIXED: We use file.choose() to open a pop-up window.
dataset <- read.csv(file.choose())
# ---------------------------------------------------------

# Safety Check: Verify data loaded
if(is.null(dataset)){
  stop("Dataset not loaded. Please restart and select the file.")
}

# *** THE FIX: RENAME COLUMNS TO REMOVE SPACES ***
# R automatically converts "Annual Income (k$)" to "Annual.Income..k.."
# We rename them to simple names to prevent errors in the 3D plot.
colnames(dataset)[4] <- "Income"
colnames(dataset)[5] <- "Score"

# We select 3 features: Age (Col 3), Income (Col 4), Score (Col 5)
X <- dataset[, c("Age", "Income", "Score")]

# Scaling is crucial when combining Age (0-70) with Income (15-137)
X_scaled <- scale(X)

# 3. ADVANCED METHODOLOGY: HIERARCHICAL CLUSTERING
dendrogram <- hclust(dist(X_scaled, method = 'euclidean'), method = 'ward.D')

# Plot Dendrogram
par(mar=c(5,5,2,2)) 
plot(dendrogram,
     main = "Dendrogram for Customer Segmentation",
     xlab = "Customers", ylab = "Euclidean Distances",
     sub = "", cex = 0.6)
rect.hclust(dendrogram, k = 6, border = 2:5) 

# 4. K-MEANS ALGORITHM WITH SILHOUETTE VALIDATION
fviz_nbclust(X_scaled, kmeans, method = "silhouette") +
  ggtitle("Silhouette Analysis for Optimal K")

# Based on Silhouette analysis, let's use k=6
set.seed(123)
kmeans_model <- kmeans(X_scaled, centers = 6, nstart = 25)

# Add clusters to original data
dataset$Cluster <- as.factor(kmeans_model$cluster)

# 5. CLUSTER PROFILING (Statistical Summary)
print("Cluster Averages:")
print(aggregate(dataset[, c("Age", "Income", "Score")], list(dataset$Cluster), mean))

# 6. INTERACTIVE 3D VISUALIZATION
# *** UPDATED: NOW USES THE CORRECT COLUMN NAMES ***
plot_ly(dataset, x = ~Age, y = ~Income, z = ~Score,
        color = ~Cluster, colors = c('#BF382A', '#0C4B8E', '#2ca02c', '#d62728', '#9467bd', '#8c564b')) %>%
  add_markers(size = 5) %>%
  layout(scene = list(xaxis = list(title = 'Age'),
                      yaxis = list(title = 'Income'),
                      zaxis = list(title = 'Score')),
         title = "3D Customer Segments")