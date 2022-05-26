#' Trains a simple deep NN on the MNIST dataset.
#'
#' Gets to 98.40% test accuracy after 20 epochs (there is *a lot* of margin for
#' parameter tuning).
#'

library(keras)

# Hyperparameter flags ---------------------------------------------------

FLAGS <- flags(
  flag_numeric("dropout1", 0.4), flag_integer('dense_units1', 13 )
)

# Data Preparation ---------------------------------------------------

# The data, shuffled and split between train and test sets




# Define Model --------------------------------------------------------------

model <- keras_model_sequential()
model %>%
  layer_dense(units = 17^2, activation = 'relu', input_shape = c(17)) %>%

  layer_dense(units = 20, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'relu') %>%
  
  
  layer_dense(units = 5, activation = 'softmax')


model %>% compile(loss = 'sparse_categorical_crossentropy',
                  optimizer = 'adam', 
                  metrics = 'accuracy') 


# Training & Evaluation ----------------------------------------------------

history <- model %>% fit(
  training, trainingtarget,
  batch_size = 128,
  epochs = 20,
  verbose = 1,
  validation_split = 0.2
)

plot(history)

score <- model %>% 
  evaluate(test, testtarget,verbose = 0)

score