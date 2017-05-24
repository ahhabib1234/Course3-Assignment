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
