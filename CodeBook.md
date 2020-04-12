# Process of derivation of features from the UCI activity recognition dataset (the input dataset)
The features selected for the UCI database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

# Transformation applied to tidy the data
All features from the original UCI datset that were either mean or standard deviations were extracted from the features dataset along with the corresponding activity name and subject ID. (Please note - the "meanFreq" measures were excluded)

## Transformation to Labels
 [1] "SubjectID" - ID number associated with the subject on whom the measurements were made (Units - integer from 1 to 30)                                              
 [2] "ActivityNames" - Activity associated with the measured data (Units - factor with 6 levels - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 The original dataset has these values coded as integers. A transformation to convert these integers to factors indicating descriptive activities was performed.

## Transformations to feature names
The following abbreviations are expanded to make the features more reader friendly
"Acc" is expanded to "Accelerometer"
"Gyro" is expanded to "Gyroscope"
"t" is expanded to "TimeDomain"
"f" is expanded to "FrequencyDomain"
"Mag" is expanded to "Magnitude"
"-X" is expanded to "-Xaxis"
"-Y" is expanded to "-Yaxis"
"-Z" is expanded to "-Zaxis"
"-std" is expanded to "-StandardDeviation""

## Transformations to form groups
After the feature name changes were applied, the data was grouped based on subject ID and then activity. The grouped data was summarized to generate the "tidy_dataset.txt"

The following is a list of all features obtained after these transformations
 [3] "TimeDomainBodyAccelerometer-mean()-Xaxis"                             
 [4] "TimeDomainBodyAccelerometer-mean()-Yaxis"                             
 [5] "TimeDomainBodyAccelerometer-mean()-Zaxis"                             
 [6] "TimeDomainGravityAccelerometer-mean()-Xaxis"                          
 [7] "TimeDomainGravityAccelerometer-mean()-Yaxis"                          
 [8] "TimeDomainGravityAccelerometer-mean()-Zaxis"                          
 [9] "TimeDomainBodyAccelerometerJerk-mean()-Xaxis"                         
[10] "TimeDomainBodyAccelerometerJerk-mean()-Yaxis"                         
[11] "TimeDomainBodyAccelerometerJerk-mean()-Zaxis"                         
[12] "TimeDomainBodyGyroscope-mean()-Xaxis"                                 
[13] "TimeDomainBodyGyroscope-mean()-Yaxis"                                 
[14] "TimeDomainBodyGyroscope-mean()-Zaxis"                                 
[15] "TimeDomainBodyGyroscopeJerk-mean()-Xaxis"                             
[16] "TimeDomainBodyGyroscopeJerk-mean()-Yaxis"                             
[17] "TimeDomainBodyGyroscopeJerk-mean()-Zaxis"                             
[18] "TimeDomainBodyAccelerometerMagnitude-mean()"                          
[19] "TimeDomainGravityAccelerometerMagnitude-mean()"                       
[20] "TimeDomainBodyAccelerometerJerkMagnitude-mean()"                      
[21] "TimeDomainBodyGyroscopeMagnitude-mean()"                              
[22] "TimeDomainBodyGyroscopeJerkMagnitude-mean()"                          
[23] "FrequencyDomainBodyAccelerometer-mean()-Xaxis"                        
[24] "FrequencyDomainBodyAccelerometer-mean()-Yaxis"                        
[25] "FrequencyDomainBodyAccelerometer-mean()-Zaxis"                        
[26] "FrequencyDomainBodyAccelerometerJerk-mean()-Xaxis"                    
[27] "FrequencyDomainBodyAccelerometerJerk-mean()-Yaxis"                    
[28] "FrequencyDomainBodyAccelerometerJerk-mean()-Zaxis"                    
[29] "FrequencyDomainBodyGyroscope-mean()-Xaxis"                            
[30] "FrequencyDomainBodyGyroscope-mean()-Yaxis"                            
[31] "FrequencyDomainBodyGyroscope-mean()-Zaxis"                            
[32] "FrequencyDomainBodyAccelerometerMagnitude-mean()"                     
[33] "FrequencyDomainBodyBodyAccelerometerJerkMagnitude-mean()"             
[34] "FrequencyDomainBodyBodyGyroscopeMagnitude-mean()"                     
[35] "FrequencyDomainBodyBodyGyroscopeJerkMagnitude-mean()"                 
[36] "TimeDomainBodyAccelerometer-StandardDeviation()-Xaxis"                
[37] "TimeDomainBodyAccelerometer-StandardDeviation()-Yaxis"                
[38] "TimeDomainBodyAccelerometer-StandardDeviation()-Zaxis"                
[39] "TimeDomainGravityAccelerometer-StandardDeviation()-Xaxis"             
[40] "TimeDomainGravityAccelerometer-StandardDeviation()-Yaxis"             
[41] "TimeDomainGravityAccelerometer-StandardDeviation()-Zaxis"             
[42] "TimeDomainBodyAccelerometerJerk-StandardDeviation()-Xaxis"            
[43] "TimeDomainBodyAccelerometerJerk-StandardDeviation()-Yaxis"            
[44] "TimeDomainBodyAccelerometerJerk-StandardDeviation()-Zaxis"            
[45] "TimeDomainBodyGyroscope-StandardDeviation()-Xaxis"                    
[46] "TimeDomainBodyGyroscope-StandardDeviation()-Yaxis"                    
[47] "TimeDomainBodyGyroscope-StandardDeviation()-Zaxis"                    
[48] "TimeDomainBodyGyroscopeJerk-StandardDeviation()-Xaxis"                
[49] "TimeDomainBodyGyroscopeJerk-StandardDeviation()-Yaxis"                
[50] "TimeDomainBodyGyroscopeJerk-StandardDeviation()-Zaxis"                
[51] "TimeDomainBodyAccelerometerMagnitude-StandardDeviation()"             
[52] "TimeDomainGravityAccelerometerMagnitude-StandardDeviation()"          
[53] "TimeDomainBodyAccelerometerJerkMagnitude-StandardDeviation()"         
[54] "TimeDomainBodyGyroscopeMagnitude-StandardDeviation()"                 
[55] "TimeDomainBodyGyroscopeJerkMagnitude-StandardDeviation()"             
[56] "FrequencyDomainBodyAccelerometer-StandardDeviation()-Xaxis"           
[57] "FrequencyDomainBodyAccelerometer-StandardDeviation()-Yaxis"           
[58] "FrequencyDomainBodyAccelerometer-StandardDeviation()-Zaxis"           
[59] "FrequencyDomainBodyAccelerometerJerk-StandardDeviation()-Xaxis"       
[60] "FrequencyDomainBodyAccelerometerJerk-StandardDeviation()-Yaxis"       
[61] "FrequencyDomainBodyAccelerometerJerk-StandardDeviation()-Zaxis"       
[62] "FrequencyDomainBodyGyroscope-StandardDeviation()-Xaxis"               
[63] "FrequencyDomainBodyGyroscope-StandardDeviation()-Yaxis"               
[64] "FrequencyDomainBodyGyroscope-StandardDeviation()-Zaxis"               
[65] "FrequencyDomainBodyAccelerometerMagnitude-StandardDeviation()"        
[66] "FrequencyDomainBodyBodyAccelerometerJerkMagnitude-StandardDeviation()"
[67] "FrequencyDomainBodyBodyGyroscopeMagnitude-StandardDeviation()"        
[68] "FrequencyDomainBodyBodyGyroscopeJerkMagnitude-StandardDeviation()"