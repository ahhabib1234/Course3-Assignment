# Course3-Assignment

Getting and Cleaning Data Course Projectless 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

1) a tidy data set as described below, 
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names.
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity   and each subject.
2) a link to a Github repository with run_analysis.R to perform the analysis, and 
3) a CodeBook.md file describing the variables, the data and transformation 

More information on the data set used to do the analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The run_analysis.R script description

# Download file and unzip it


# Read Train data in x-train, y_train, subject_train


# Read test data in x_test, y_test, subject_test


# Read features from features.txt

# Read activity from activity_label.txt

# Assign column names activityID, subjectId, for train and test data

#Assign labels for activity to merge the tables

#merge all train and all test data
mearge_train <- cbind(subject_train, y_train, x_train)
mearge_test <- cbind(subject_test, y_test, x_test)

# 1 mearged test and train data


# 2 subset from mean and std

#3 use descriptive name by mearging with activity and store the data in activityNames


# 4 assign descriptive variable names


# 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject. The data is stored in secondTidyData


# 5 write the Tidy data to secondTidyData.txt file.


Contact GitHub API Training Shop Blog About
