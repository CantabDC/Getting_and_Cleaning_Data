## 1. Load dplyr

library(dplyr)

## 2. Read in data

  ## The following files identify the subject associated with each row of measurements
  subject_train <-read.table("subject_train.txt", header=FALSE, sep="") 
  subject_test <-read.table("subject_test.txt", header=FALSE, sep="")         

  ## The following files identify the activity associated with each row of measurements
  y_train <- read.table("y_train.txt", header=FALSE, sep="")
  y_test <- read.table("y_test.txt", header=FALSE, sep="")
  
    ## This file contains the labels for the activities
    activity_labels <- read.table("activity_labels.txt", header=FALSE, sep="") 

  ## The following files contain the measurements taken for each subject & activity
  x_train <- read.table("x_train.txt", header=FALSE, sep="")
  x_test <- read.table("x_test.txt", header=FALSE, sep="")   
  
    ## This file contains the labels for the measurements
    features <- read.table("features.txt", header=FALSE, sep ="")       

## 3. Combine data sets and add descriptive activity labels
  
  ## Combine subject data
  subject <- rbind(subject_train, subject_test)

  ## Combine activity data
  y_merged <- rbind(y_train, y_test)

    ## Apply descriptive labels ("sitting, e.g.) to activity data
    activity <- cut(y_merged$V1, 6, labels = activity_labels$V2)

  ## Combine measurement data
  x_merged <- rbind(x_train, x_test)

  ## Combine subject, activity, and measurement data
  data <- cbind(subject, activity, x_merged)
  
## 4. Label the variables
  
  ## Create vector of column names
  names <- as.character(features[,2])
  names1 <- append(names, c("subject", "activity"), after=0)

  ## Add column names to combined data
  colnames(data) <- names1

  ## Pass data to new data frame to amend col names such that there are no duplicates & convert to data frame tbl
  data1 <- tbl_df(data[,])
  
## 5. Extract measurements on the mean and standard deviation for each measurement

  data2 <- select(data1, subject, activity, contains("mean()"), contains("std()"))

## 6. Clean up variable names: remove parentheses, change "BodyBody" to "Body', replace dashes with underscores

  clean <-function(x){
  x1 <- sub("BodyBody","Body",x)
  x2 <- sub("\\()","",x1)
  gsub("-","_", x2)
  }
  new_names <- as.character(lapply(names(data2), clean))
  names(data2) <-new_names

##  7. Calculate the mean for each variable by subject & activity
  
  grouped_data <- group_by(data2, subject, activity)
  means_data <- summarise_each(grouped_data, funs(mean))
  
## 8. Save data in a text file
  
  write.table(means_data, "means.txt", row.name=FALSE)
  