## Load the required packages
library(dplyr)

## Check if the required data folder exists in the working directory
if (!file.exists("UCI HAR Dataset/")){
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                method = "curl", destfile = "AccelerometerDataSet.zip")
  unzip(zipfile = "AccelerometerDataSet.zip")
  
  if (file.exists("AccelerometerDataSet.zip")) {
    #Delete the original zip folder if it exists
    file.remove("AccelerometerDataSet.zip")
  }
}
