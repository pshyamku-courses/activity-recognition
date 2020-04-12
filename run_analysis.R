## Load the required packages
library(dplyr)

## Check if the required data folder exists in the working directory
if (!dir.exists("./UCI HAR Dataset")){
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                method = "curl", destfile = "AccelerometerDataSet.zip")
  unzip(zipfile = "AccelerometerDataSet.zip")
  
  if (file.exists("AccelerometerDataSet.zip")) {
    #Delete the original zip folder if it exists
    file.remove("AccelerometerDataSet.zip")
  }
}

## 1. Merges the training and the test sets to create one data set.
# Read all the data sets in the test and train folders
X_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")

features <- read.table(file = "./UCI HAR Dataset/features.txt")
activity_codes <- read.table(file = "./UCI HAR Dataset/activity_labels.txt")

# Use rbind to row bind the test and train data sets
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
subject <- rbind(sub_train, sub_test)

# Use cbind to concatenate the columns to form a single data frame
data_tmp <- cbind(X,Y)
All_data <- cbind(subject,data_tmp)

# Assign reader friendly names for Subject ID and activity names
names(All_data) <- c("SubjectID",as.character(features[,2]),"ActivityNames")

## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement.

# Find all the features that include mean or sd 
feature_names_containing_mean <- features[grep("-mean\\(\\)",features[,2]),2]
feature_names_containing_sd <- features[grep("-std\\(\\)",features[,2]),2]

# subset the columns that have only the means and std features
data_sd_mean_features_only <- subset(All_data, select = c("SubjectID","ActivityNames",
                                                          as.character(feature_names_containing_mean),
                                                          as.character(feature_names_containing_sd)))

## 3. Uses descriptive activity names to name the activities in the data set  
data_sd_mean_features_only$ActivityNames <- activity_codes[data_sd_mean_features_only$ActivityNames,2]

## 4. Appropriately labels the data set with descriptive variable names.
names(data_sd_mean_features_only) <- gsub("Acc", "Accelerometer", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("Gyro", "Gyroscope", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("^t", "TimeDomain", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("^f", "FrequencyDomain", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("Mag", "Magnitude", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("-X", "-Xaxis", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("-Y", "-Yaxis", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("-Z", "-Zaxis", names(data_sd_mean_features_only))
names(data_sd_mean_features_only) <- gsub("-std", "-StandardDeviation", names(data_sd_mean_features_only))

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
All_Data_grouped <- group_by(data_sd_mean_features_only, SubjectID, ActivityNames)
tidy_data <- summarise_each(All_Data_grouped, funs = mean)
write.table(tidy_data, file = "tidy_dataset.txt", row.names = FALSE)

# clean up the workspace
rm(subject, X, Y, X_test, X_train, Y_test, Y_train,  sub_test, sub_train, 
   features, data_tmp, activity_codes, All_data, feature_names_containing_mean,
   feature_names_containing_sd)