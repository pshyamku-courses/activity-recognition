# Objectives and Scope of Activity Recognition Project
Create tidy dataset from activity data from UCI dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## The following actions are performed by the run_analysis.R script
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. (as described below in renaming of the features)
  * "Acc" is expanded to "Accelerometer"
  * "Gyro" is expanded to "Gyroscope"
  * "t" is expanded to "TimeDomain"
  * "f" is expanded to "FrequencyDomain"
  * "Mag" is expanded to "Magnitude"
  * "-X" is expanded to "-Xaxis"
  * "-Y" is expanded to "-Yaxis"
  * "-Z" is expanded to "-Zaxis"
  * "-std" is expanded to "-StandardDeviation"
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Inputs (UCI activity recognition dataset)
The run_analysis.R script will check for a folder containing the UCI data set in the current working directory. If the data folder does not exist, the script will download the zipped file, extract it and then delete the zipped folder.
The folder name for the dataset is "UCI HAR Dataset". 
Note - This folder is included in gitignore so changes made to it will not be tracked in this project.

## Outputs created by the run_analysis.R script
* In the workspace
  * data_sd_mean_features_only - This data frame is a collection of all observations from test and train data set, but only includes the Activity names, subject ids and features that include means and standard deviations.
  * All_Data_grouped - This data frame is a grouped version of the data_sd_mean_features_only data frame, grouped by subject id and then by activity
  * tidy_data - This data frame is the data frame written to 

* Files created in the working directory
  * "tidy_dataset.txt" is the tidy and summarized version of the original data set. The included features are subject id, activity name and summary means of all the features that include mean or standard deviation of the observations.

