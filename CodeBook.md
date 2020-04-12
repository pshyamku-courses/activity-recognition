# Process of derivation of features from the UCI activity recognition dataset (the input dataset)
The features selected for the UCI database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

# Transformation applied to tidy the data
All features from the original UCI datset that were either mean or standard deviations were extracted from the features dataset along with the corresponding activity name and subject ID. (Please note - the "meanFreq" measures were excluded)

## Transformation to Labels
1. "SubjectID" - ID number associated with the subject on whom the measurements were made (Units - integer from 1 to 30)                                              
1. "ActivityNames" - Activity associated with the measured data (Units - factor with 6 levels - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 The original dataset has these values coded as integers. A transformation to convert these integers to factors indicating descriptive activities was performed.

## Transformations to feature names
The following abbreviations are expanded to make the features more reader friendly
* "Acc" is expanded to "Accelerometer"
* "Gyro" is expanded to "Gyroscope"
* "t" is expanded to "TimeDomain"
* "f" is expanded to "FrequencyDomain"
* "Mag" is expanded to "Magnitude"
* "-X" is expanded to "-Xaxis"
* "-Y" is expanded to "-Yaxis"
* "-Z" is expanded to "-Zaxis"
* "-std" is expanded to "-StandardDeviation""

## Transformations to form groups
After the feature name changes were applied, the data was grouped based on subject ID and then activity. The grouped data was summarized to generate the "tidy_dataset.txt"

The following is a list of all features obtained after these transformations
1. "TimeDomainBodyAccelerometer-mean()-Xaxis"                             
1. "TimeDomainBodyAccelerometer-mean()-Yaxis"                             
1. "TimeDomainBodyAccelerometer-mean()-Zaxis"                             
1. "TimeDomainGravityAccelerometer-mean()-Xaxis"                          
1. "TimeDomainGravityAccelerometer-mean()-Yaxis"                          
1. "TimeDomainGravityAccelerometer-mean()-Zaxis"                          
1. "TimeDomainBodyAccelerometerJerk-mean()-Xaxis"                         
1. "TimeDomainBodyAccelerometerJerk-mean()-Yaxis"                         
1. "TimeDomainBodyAccelerometerJerk-mean()-Zaxis"                         
1. "TimeDomainBodyGyroscope-mean()-Xaxis"                                 
1. "TimeDomainBodyGyroscope-mean()-Yaxis"                                 
1. "TimeDomainBodyGyroscope-mean()-Zaxis"                                 
1. "TimeDomainBodyGyroscopeJerk-mean()-Xaxis"                             
1. "TimeDomainBodyGyroscopeJerk-mean()-Yaxis"                             
1. "TimeDomainBodyGyroscopeJerk-mean()-Zaxis"                             
1. "TimeDomainBodyAccelerometerMagnitude-mean()"                          
1. "TimeDomainGravityAccelerometerMagnitude-mean()"                       
1. "TimeDomainBodyAccelerometerJerkMagnitude-mean()"                      
1. "TimeDomainBodyGyroscopeMagnitude-mean()"                              
1. "TimeDomainBodyGyroscopeJerkMagnitude-mean()"                          
1. "FrequencyDomainBodyAccelerometer-mean()-Xaxis"                        
1. "FrequencyDomainBodyAccelerometer-mean()-Yaxis"                        
1. "FrequencyDomainBodyAccelerometer-mean()-Zaxis"                        
1. "FrequencyDomainBodyAccelerometerJerk-mean()-Xaxis"                    
1. "FrequencyDomainBodyAccelerometerJerk-mean()-Yaxis"                    
1. "FrequencyDomainBodyAccelerometerJerk-mean()-Zaxis"                    
1. "FrequencyDomainBodyGyroscope-mean()-Xaxis"                            
1. "FrequencyDomainBodyGyroscope-mean()-Yaxis"                            
1. "FrequencyDomainBodyGyroscope-mean()-Zaxis"                            
1. "FrequencyDomainBodyAccelerometerMagnitude-mean()"                     
1. "FrequencyDomainBodyBodyAccelerometerJerkMagnitude-mean()"             
1. "FrequencyDomainBodyBodyGyroscopeMagnitude-mean()"                     
1. "FrequencyDomainBodyBodyGyroscopeJerkMagnitude-mean()"                 
1. "TimeDomainBodyAccelerometer-StandardDeviation()-Xaxis"                
1. "TimeDomainBodyAccelerometer-StandardDeviation()-Yaxis"                
1. "TimeDomainBodyAccelerometer-StandardDeviation()-Zaxis"                
1. "TimeDomainGravityAccelerometer-StandardDeviation()-Xaxis"             
1. "TimeDomainGravityAccelerometer-StandardDeviation()-Yaxis"             
1. "TimeDomainGravityAccelerometer-StandardDeviation()-Zaxis"             
1. "TimeDomainBodyAccelerometerJerk-StandardDeviation()-Xaxis"            
1. "TimeDomainBodyAccelerometerJerk-StandardDeviation()-Yaxis"            
1. "TimeDomainBodyAccelerometerJerk-StandardDeviation()-Zaxis"            
1. "TimeDomainBodyGyroscope-StandardDeviation()-Xaxis"                    
1. "TimeDomainBodyGyroscope-StandardDeviation()-Yaxis"                    
1. "TimeDomainBodyGyroscope-StandardDeviation()-Zaxis"                    
1. "TimeDomainBodyGyroscopeJerk-StandardDeviation()-Xaxis"                
1. "TimeDomainBodyGyroscopeJerk-StandardDeviation()-Yaxis"                
1. "TimeDomainBodyGyroscopeJerk-StandardDeviation()-Zaxis"                
1. "TimeDomainBodyAccelerometerMagnitude-StandardDeviation()"             
1. "TimeDomainGravityAccelerometerMagnitude-StandardDeviation()"          
1. "TimeDomainBodyAccelerometerJerkMagnitude-StandardDeviation()"         
1. "TimeDomainBodyGyroscopeMagnitude-StandardDeviation()"                 
1. "TimeDomainBodyGyroscopeJerkMagnitude-StandardDeviation()"             
1. "FrequencyDomainBodyAccelerometer-StandardDeviation()-Xaxis"           
1. "FrequencyDomainBodyAccelerometer-StandardDeviation()-Yaxis"           
1. "FrequencyDomainBodyAccelerometer-StandardDeviation()-Zaxis"           
1. "FrequencyDomainBodyAccelerometerJerk-StandardDeviation()-Xaxis"       
1. "FrequencyDomainBodyAccelerometerJerk-StandardDeviation()-Yaxis"       
1. "FrequencyDomainBodyAccelerometerJerk-StandardDeviation()-Zaxis"       
1. "FrequencyDomainBodyGyroscope-StandardDeviation()-Xaxis"               
1. "FrequencyDomainBodyGyroscope-StandardDeviation()-Yaxis"               
1. "FrequencyDomainBodyGyroscope-StandardDeviation()-Zaxis"               
1. "FrequencyDomainBodyAccelerometerMagnitude-StandardDeviation()"        
1. "FrequencyDomainBodyBodyAccelerometerJerkMagnitude-StandardDeviation()"
1. "FrequencyDomainBodyBodyGyroscopeMagnitude-StandardDeviation()"        
1. "FrequencyDomainBodyBodyGyroscopeJerkMagnitude-StandardDeviation()"
