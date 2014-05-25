ReadMe for Getting and Cleaning data Course Project
===================================================

For this analysis, I use the "Human Activity Recognition Using Smartphones Dataset".

Below you can find a general description about the experiments that generated this data: 
 - The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

 - The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Subjects performed the activities. You can find the subject data in the following files : 
 - 'subject_train.txt': Subject data for train.  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
 - 'subject_test.txt' : Subject data for test. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

Features describe the measurements that subjects performed.  You can find more information in the following files :
 - 'features_info.txt': Shows information about the variables used on the feature vector.
 - 'features.txt': List of all features.

The (measurement) data that is generated with the subjects devices can be found in the following files :
 - 'X_train.txt': Training set.
 - 'X_test.txt': Test set.
 
Subjects performed the tests during the activities. You can find the activity data in the following files :
 - 'y_train.txt': Training labels.
 - 'y_test.txt': Testing labels.
 - 'activity_labels.txt': Links the labels with their activity name.

Create tidy daat set with run_analysis.R file
=============================================

With run_analysis.R file a tidy dataset can be created.  The following steps are executed in this file :
 - Read the data (general data, test data , train data)
 - Reshape and name all the column names : removes "()", replace "-" by "."
 - Transform the column names (with gsub function) to make them 'human readable'
 - Add the right column names to the test and train set and add a 'subject' column name to subjects and add a 'activity' column name to the Y_test and Y_train datasets
 - Create 1 test set, 1 train set and merge them together to 1 data_set
 - Merge Activity descriptions with our data_set
 - Extracts only the measurements on the mean and standard deviation for each measurement and filter the needed columns from the merged data set. Search for the right measurements columns is done on name ("mean|std") with the grep function (and not manually via column numbers).
 - Filter the needed columns (with mean and std) from the merged data set
 - Create a second, independent tidy data set with the average of each variable for each activity and each subject. I used the 'melt' function to melt the dataset and dcast to calculate the means. The "second_tidy_set" object is the second tidy dataset. The "second_tidy_set" object will be written to the "tidydata.txt" file.
 - Create dataset file "tidydata.txt"
