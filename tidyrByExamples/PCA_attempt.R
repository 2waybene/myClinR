install.packages("factoextra")               # Install & load factoextra
library("factoextra")

data(iris)                                   # Load data
head(iris)                                   # Print first rows of data

iris_num <- iris[ , 1:4]                     # Remove categorical variable
head(iris_num)                               # Print first rows of final data

my_pca <- prcomp(iris_num,                   # Perform PCA
                 scale = TRUE)
summary(my_pca)                              # Summary of explained variance

my_pca_data <-data.frame(my_pca$x[ , 1:2])  # Extract PC1 and PC2
head(my_pca_data)                            # Print first rows of PCA data

fviz_nbclust(my_pca_data,                    # Determine number of clusters
             FUNcluster = kmeans,
             method = "wss")

set.seed(123)                                # Set seed for reproducibility
my_kmeans <- kmeans(my_pca_data,             # Perform k-means clustering
                    centers = 3)

fviz_pca_ind(my_pca,                         # Visualize clusters
             habillage = my_kmeans$cluster,
             label = "none",
             addEllipses = TRUE)
