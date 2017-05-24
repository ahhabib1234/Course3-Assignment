library(plyr)
if(!file.exists("./dataset")){dir.create("./dataset")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./dataset/wearable.zip")
unzip(zipfile="./dataset/wearable.zip",exdir="./dataset") # Unzip the file

# Read Train data
x_train <- read.table("./dataset/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./dataset/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./dataset/UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("./dataset/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./dataset/UCI HAR Dataset/test/subject_test.txt")

# Read features
features <- read.table('./dataset/UCI HAR Dataset/features.txt')

# Read activity
activity = read.table('./dataset/UCI HAR Dataset/activity_labels.txt')

# Assign column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityID"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <-"activityID"
colnames(subject_test) <- "subjectId"

colnames(activity) <- c("activityID", "activityType")

mearge_train <- cbind(subject_train, y_train, x_train)
mearge_test <- cbind(subject_test, y_test, x_test)
# 1 mearged test and train data
test_train <- rbind(mearge_train, mearge_test)

colNames  = colnames(test_train)

vector <- (grepl("activityID" , colNames) | 
               grepl("subjectId" , colNames) | 
               grepl("mean.." , colNames) | 
               grepl("std.." , colNames) )

# 2 subset from mean and std
sub_mean_std <- test_train[, vector == TRUE]

#3 use descriptive name

activityNames <- merge(sub_mean_std, activity, by='activityID', all.x=TRUE)

# 4 descriptive variable names

names(activityNames) <- gsub('Acc',"Acceleration",names(activityNames))
names(activityNames) <- gsub('GyroJerk',"AngularAcceleration",names(activityNames))
names(activityNames) <- gsub('Gyro',"AngularSpeed",names(activityNames))
names(activityNames) <- gsub('Mag',"Magnitude",names(activityNames))
names(activityNames) <- gsub('^t',"Time.",names(activityNames))
names(activityNames) <- gsub('^f',"Frequency.",names(activityNames))
names(activityNames) <- gsub('\\.mean',".Mean",names(activityNames))
names(activityNames) <- gsub('\\.std',".StandardDeviation",names(activityNames))
names(activityNames) <- gsub('Freq\\.',"Frequency.",names(activityNames))
names(activityNames) <- gsub('Freq$',"Frequency",names(activityNames))


# 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject.

secondTidyData <- aggregate(. ~subjectId + activityID, activityNames, mean)
secondTidyData <- secondTidyData[order(secondTidyData$subjectId, secondTidyData$activityID),]

write.table(secondTidyData, "secondTidyData.txt", row.name=FALSE)
