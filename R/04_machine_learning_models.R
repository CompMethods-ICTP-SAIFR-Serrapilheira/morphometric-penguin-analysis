library(caret)
penguins <- read.csv("data/processed/02_penguins.csv")
metric_cols <- names(penguins)[3:6]

# Only bill length, bill depth, flipper length and body mass 
# will initally be used to make the predictions
penguins_metric <- penguins[,c(1,3:6)]
head(penguins_metric)

# A seed is chosen to have reproducible result
set.seed(101)

# The datase is separated into a training set and a test set
# Around 70% of the rows will be used to train the machine learning models
# Around 30% of the rows will be used to asses the quality of the models
index <- index <- createDataPartition(penguins_metric$species, p = 0.7, list = FALSE)
train_data <- penguins_metric[index,]
test_data <- penguins_metric[-index,]


# K-Nearest Neighbors Model ----------------------------------------------------
knn <- train(species ~ .,
             data = train_data, 
             method = "knn", 
             metric = "Accuracy")

knn_prediction <- predict(knn, newdata = test_data)

# Sucess rate of KNN
mean((knn_prediction == test_data$species))

# Decision Tree Model ----------------------------------------------------------
decision_tree <- train(species ~ .,
                       data = train_data,
                       method = "rpart")

par(mfrow=(c(1,1)))
plot(decision_tree$finalModel, uniform=TRUE,
     main="Classification Tree")
text(decision_tree$finalModel, use.n = TRUE, all = TRUE, cex=0.9)

decision_tree_prediction <- predict(decision_tree, newdata=test_data)
# Sucess rate of Decision Tree
mean((decision_tree_prediction == test_data$species))

# Random Forest ----------------------------------------------------------------

random_forest <- train(species ~ .,
                       data = train_data,
                       method = "rf")

random_forest_prediction <- predict(random_forest, newdata = test_data)

# Sucess rate of Random Forest
mean((random_forest_prediction == test_data$species))

# Suport Vector Machine --------------------------------------------------------

svm <- train(species ~.,
             data = train_data,
             method = "svmRadial")

svm_prediction <- predict(svm, newdata = test_data)

# Sucess rate of SVM
mean((svm_prediction == test_data$species))
