#' Trains a simple deep NN on the MNIST dataset.
#'
#' Gets to 98.40% test accuracy after 20 epochs (there is *a lot* of margin for
#' parameter tuning).
#'
#' Run at the command line with `guild run mnist_mlp.R` or
#' at the R console with `guildai::guild_run("mnist_mlp.R")`

library(keras)

# Hyperparameter flags ---------------------------------------------------

#| description: the first dropout
#| min: .1
#| max: .9
dropout1 <- .4

#| description: the second dropout
#| max: .9
dropout2 <- .3


# Data Preparation ---------------------------------------------------

# The data, shuffled and split between train and test sets
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y

# Reshape
dim(x_train) <- c(nrow(x_train), 784)
dim(x_test) <- c(nrow(x_test), 784)

# Transform RGB values into [0,1] range
x_train <- x_train / 255
x_test <- x_test / 255

# Convert class vectors to binary class matrices
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

# Define Model --------------------------------------------------------------

model <- keras_model_sequential()
model %>%
  layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = dropout1) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dropout(rate = dropout2) %>%
  layer_dense(units = 10, activation = 'softmax')

model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = optimizer_rmsprop(learning_rate = 0.001),
  metrics = c('accuracy')
)

# Training & Evaluation ----------------------------------------------------

history <- model %>% fit(
  x_train, y_train,
  batch_size = 128,
  epochs = 20,
  verbose = 1,
  validation_split = 0.2
)

plot(history)

score <- model %>% evaluate(
  x_test, y_test,
  verbose = 0
) %>% as.list()


cat('Test loss:', score$loss, '\n')
cat('Test accuracy:', score$acc, '\n')

names(score) %<>% paste0("test_", .)

library(guildai) # yaml support
print(yaml(!!!score))
print(as_yaml(score))
