# Multi-Dimensional Customer Segmentation Analysis
**Exam Session A - January 23, 2026**
**Student:** [YOUR NAME]

## 1. Project Overview
This repository contains the source code and documentation for a customer segmentation analysis utilizing the `Mall_Customers` dataset. The objective of this project is to implement a multi-dimensional clustering approach to identify distinct customer profiles based on Age, Annual Income, and Spending Score.

Unlike traditional two-dimensional analyses, this project employs a 3D clustering methodology to uncover nuanced behavioral patterns, specifically examining the impact of age on spending habits within income brackets.

**Methodology:**
* **Data Preprocessing:** Feature selection and Z-score normalization.
* **Hierarchical Clustering:** Dendrogram analysis using Ward's linkage to determine optimal cluster count.
* **K-Means Algorithm:** Partitioning data into *k* distinct clusters ($k=6$).
* **Validation:** Silhouette Coefficient analysis to quantitatively assess cluster quality.
* **Visualization:** Interactive 3D rendering using the R `plotly` library.

## 2. Repository Structure
The repository is organized as follows:

* `analysis_script.R` : The primary R script containing data loading, preprocessing, clustering logic, and visualization code.
* `Mall_Customers.csv` : The dataset used for this analysis.
* `Project_Report.pdf` : The formal academic report detailing the methodology, mathematical background, and findings.
* `README.md` : Project documentation and execution instructions.

## 3. Usage Instructions

### Option A: Google Colab (Cloud Execution)
The analysis can be executed in a cloud environment via Google Colab.
**[Link to Google Colab Notebook]**

*Note: The `Mall_Customers.csv` file must be uploaded to the Colab session storage before executing the script.*

### Option B: Local Execution (RStudio)
1.  Clone this repository to your local machine.
2.  Open `analysis_script.R` in RStudio.
3.  Ensure the following R packages are installed:
    ```r
    install.packages(c("ggplot2", "cluster", "plotly", "factoextra"))
    ```
4.  Run the script. The code is configured to open a file selection dialog; navigate to and select `Mall_Customers.csv` when prompted.

## 4. Key Results
The analysis successfully identified six distinct customer segments. A significant finding from the 3D visualization is the segmentation of the "Average Income/Spending" group into two distinct sub-clusters based on age:
* **Cluster 5:** Younger demographic (approx. 20-35 years).
* **Cluster 6:** Older demographic (approx. 40-70 years).

This distinction validates the necessity of multi-dimensional clustering, as a standard 2D analysis would have merged these two distinct behavioral groups.

## 5. Data Source
* **Dataset:** Mall Customer Segmentation Data
* **Source:** Kaggle Machine Learning Repository
* **Attributes:** CustomerID, Gender, Age, Annual Income (k$), Spending Score (1-100)
