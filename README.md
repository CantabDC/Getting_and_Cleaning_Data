# SUMMARY OF run_Analysis.R

## 1: Load dplyr

## 2: Read in data

The data come from the Human Activity Recognition Using Smartphones Data Set. They consist of 8 tables. Two tables (x_train and x_test) contain data based on measurements collected by the embedded accelerometer and gyroscope in Samsung smart phones worn by volunteers engaged in a variety of activities (sitting, standing, etc.). The remaining tables provide information about the volunteer & activity associated with each set of measurements and labels for the activities and variables.

More information on the data set is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones The version of the data used in this script can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## 3: Combine data sets and add descriptive activity labels

The script combines 7 of the 8 tables to create a data set of 10299 observations of 563 variables. The first column of the data set identifies the volunteer from which measurements were collected. The second column identifies the activity in which the volunteer was engaged when the measurements were collected. This column replaces the integers (1-6) originally used to identify the activities with descriptive labels (e.g, "sitting, "standing"). 

The remaining columns contain data on variables calculated from the accelerometer and gyroscope data collected from the subjects. (More information on the collected measurements and the variables derived from them is available in the features_info.txt file included with the data.)  

##4: Label the variables

The script uses the remaining table to generate a vector of variable names, which is added to the data set. Variable names are amended to ensure that there are no duplicates.

##5: Extract measurements on the mean and standard deviation for each measurement

Based on the information provided by the experimenters in features_info.txt, the script extracts from the data set all columns with variable names containing mean() or std(), plus the subject and activity columns. The resulting data set includes 10299 observations of 68 variables.

##6: Clean up the variable names

To create syntactically valid names, the script creates a fuction ("clean") that corrects "BodyBody" to "Body, removes parentheses, and replaces hyphens with underscores. It retains capital letters for greater readability. This function is passed across all columns in the data set by using lapply.

##7: Calculate the mean for each variable by subject & activity

The script groups the data by subject and activity and then calculates the mean of each variable for each subject/activity pair.

##8: Save the data in a text file

The script savs the new data set, consisting of means for the 66 mean and standard deviation measurements for each subject/activity pair, as "means.txt."