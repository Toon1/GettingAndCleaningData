CodeBook for Getting and Cleaning data Course Project
=====================================================

1. The data
===========
Using its embedded accelerometer and gyroscope of the subjects smartphone, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  For each record it is provided :
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


2. The variables
================

Part of the exercise is to select the measurements on the mean and standard deviation for each measurement and filter the needed columns from the merged data set.  These columns are dynamically selected with the grep function (and not manually via column numbers).
The names are transformed (with 'gsub' commands) take make them 'human readable'
Here you can find a list of these selected variables :

OLD NAME                      | TRANSFORMED NAME
--------                      | ----------------
tBodyAcc.mean.X               | timeBodyAccelerometer.mean.X
BodyAcc.mean.Y                | timeBodyAccelerometer.mean.Y
tBodyAcc.mean.Z               | timeBodyAccelerometer.mean.Z
tBodyAcc.std.X                | timeBodyAccelerometer.std.X
tBodyAcc.std.Y                | timeBodyAccelerometer.std.Y
tBodyAcc.std.Z                | timeBodyAccelerometer.std.Z
tGravityAcc.mean.X            | timeGravityAccelerometer.mean.X
tGravityAcc.mean.Y            | timeGravityAccelerometer.mean.Y
tGravityAcc.mean.Z            | timeGravityAccelerometer.mean.Z
tGravityAcc.std.X             | timeGravityAccelerometer.std.X
tGravityAcc.std.Y             | timeGravityAccelerometer.std.Y
tGravityAcc.std.Z             | timeGravityAccelerometer.std.Z
tBodyAccJerk.mean.X           | timeBodyAccelerometerJerk.mean.X
tBodyAccJerk.mean.Y           | timeBodyAccelerometerJerk.mean.Y
tBodyAccJerk.mean.Z           | timeBodyAccelerometerJerk.mean.Z
tBodyAccJerk.std.X            | timeBodyAccelerometerJerk.std.X
tBodyAccJerk.std.Y            | timeBodyAccelerometerJerk.std.Y
tBodyAccJerk.std.Z            | timeBodyAccelerometerJerk.std.Z
tBodyGyro.mean.X              | timeBodyGyroscope.mean.X
tBodyGyro.mean.Y              | timeBodyGyroscope.mean.Y
tBodyGyro.mean.Z              | timeBodyGyroscope.mean.Z
tBodyGyro.std.X               | timeBodyGyroscope.std.X
tBodyGyro.std.Y               | timeBodyGyroscope.std.Y
tBodyGyro.std.Z               | timeBodyGyroscope.std.Z
tBodyGyroJerk.mean.X          | timeBodyGyroscopeJerk.mean.X
tBodyGyroJerk.mean.Y          | timeBodyGyroscopeJerk.mean.Y
tBodyGyroJerk.mean.Z          | timeBodyGyroscopeJerk.mean.Z
tBodyGyroJerk.std.X           | timeBodyGyroscopeJerk.std.X 
tBodyGyroJerk.std.Y           | timeBodyGyroscopeJerk.std.Y
tBodyGyroJerk.std.Z           | timeBodyGyroscopeJerk.std.Z
tBodyAccMag.mean              | timeBodyAccelerometerMagnitude.mean
tBodyAccMag.std               | timeBodyAccelerometerMagnitude.std
tGravityAccMag.mean           | timeGravityAccelerometerMagnitude.mean
tGravityAccMag.std            | timeGravityAccelerometerMagnitude.std
tBodyAccJerkMag.mean          | timeBodyAccelerometerJerkMagnitude.mean
tBodyAccJerkMag.std           | timeBodyAccelerometerJerkMagnitude.std
tBodyGyroMag.mean             | timeBodyGyroscopeMagnitude.mean
tBodyGyroMag.std              | timeBodyGyroscopeMagnitude.std
tBodyGyroJerkMag.mean         | timeBodyGyroscopeJerkMagnitude.mean
tBodyGyroJerkMag.std          | timeBodyGyroscopeJerkMagnitude.std
fBodyAcc.mean.X               | frequencyBodyAccelerometer.mean.X
fBodyAcc.mean.Y               | frequencyBodyAccelerometer.mean.Y
fBodyAcc.mean.Z               | frequencyBodyAccelerometer.mean.Z
fBodyAcc.std.X                | frequencyBodyAccelerometer.std.X
fBodyAcc.std.Y                | frequencyBodyAccelerometer.std.Y
fBodyAcc.std.Z                | frequencyBodyAccelerometer.std.Z
fBodyAcc.meanFreq.X           | frequencyBodyAccelerometer.meanFreq.X
fBodyAcc.meanFreq.Y           | frequencyBodyAccelerometer.meanFreq.Y
fBodyAcc.meanFreq.Z           | frequencyBodyAccelerometer.meanFreq.Z
fBodyAccJerk.mean.X           | frequencyBodyAccelerometerJerk.mean.X
fBodyAccJerk.mean.Y           | frequencyBodyAccelerometerJerk.mean.Y
fBodyAccJerk.mean.Z           | frequencyBodyAccelerometerJerk.mean.Z
fBodyAccJerk.std.X            | frequencyBodyAccelerometerJerk.std.X
fBodyAccJerk.std.Y            | frequencyBodyAccelerometerJerk.std.Y
fBodyAccJerk.std.Z            | frequencyBodyAccelerometerJerk.std.Z
fBodyAccJerk.meanFreq.X       | frequencyBodyAccelerometerJerk.meanFreq.X
fBodyAccJerk.meanFreq.Y       | frequencyBodyAccelerometerJerk.meanFreq.Y
fBodyAccJerk.meanFreq.Z       | frequencyBodyAccelerometerJerk.meanFreq.Z
fBodyGyro.mean.X              | frequencyBodyGyroscope.mean.X
fBodyGyro.mean.Y              | frequencyBodyGyroscope.mean.Y
fBodyGyro.mean.Z              | frequencyBodyGyroscope.mean.Z
fBodyGyro.std.X               | frequencyBodyGyroscope.std.X
fBodyGyro.std.Y               | frequencyBodyGyroscope.std.Y
fBodyGyro.std.Z               | frequencyBodyGyroscope.std.Z
fBodyGyro.meanFreq.X          | frequencyBodyGyroscope.meanFreq.X
fBodyGyro.meanFreq.Y          | frequencyBodyGyroscope.meanFreq.Y
fBodyGyro.meanFreq.Z          | frequencyBodyGyroscope.meanFreq.Z
fBodyAccMag.mean              | frequencyBodyAccelerometerMagnitude.mean
fBodyAccMag.std               | frequencyBodyAccelerometerMagnitude.std
fBodyAccMag.meanFreq          | frequencyBodyAccelerometerMagnitude.meanFreq
fBodyBodyAccJerkMag.mean      | frequencyBodyAccelerometerMagnitude.mean
fBodyBodyAccJerkMag.std       | frequencyBodyAccelerometerMagnitude.std
fBodyBodyAccJerkMag.meanFreq  | frequencyBodyAccelerometerJerkMagnitude.meanFreq
fBodyBodyGyroMag.mean         | frequencyBodyGyroscopeMagnitude.mean
fBodyBodyGyroMag.std          | frequencyBodyGyroscopeMagnitude.std
fBodyBodyGyroMag.meanFreq     | frequencyBodyGyroscopeMagnitude.meanFreq
fBodyBodyGyroJerkMag.mean     | fBodyBodyGyroJerkMag.mean
fBodyBodyGyroJerkMag.std      | fBodyBodyGyroJerkMag.std
fBodyBodyGyroJerkMag.meanFreq | fBodyBodyGyroJerkMag.meanFreq

Explanation of the variables :
 - The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
 - Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the    of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
 - Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
 - These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 
 - mean(): Mean value
 - std(): Standard deviation
 - meanFreq(): Weighted average of the frequency components to obtain a mean frequency
 
 
