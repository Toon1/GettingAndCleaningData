

# Read general data
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

# Read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

# Read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)



# Column names
features$V2 <- gsub("\\(\\)", "", features$V2)  # removes "()"
features$V2 <- gsub("\\-",".", features$V2)     # replace "-" by "."

# Transform column names take make them 'human readable'
features$V2 <- gsub("tBodyAcc.","timeBodyAccelerometer.",features$V2,fixed=TRUE)
features$V2 <- gsub("tGravityAcc.","timeGravityAccelerometer.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyAccJerk.","timeBodyAccelerometerJerk.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyGyro.","timeBodyGyroscope.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyGyroJerk.","timeBodyGyroscopeJerk.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyAccMag.","timeBodyAccelerometerMagnitude.",features$V2,fixed=TRUE)
features$V2 <- gsub("tGravityAccMag.","timeGravityAccelerometerMagnitude.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyAccJerkMag.","timeBodyAccelerometerJerkMagnitude.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyGyroMag.","timeBodyGyroscopeMagnitude.",features$V2,fixed=TRUE)
features$V2 <- gsub("tBodyGyroJerkMag.","timeBodyGyroscopeJerkMagnitude.",features$V2,fixed=TRUE)

features$V2 <- gsub("fBodyAcc.","frequencyBodyAccelerometer.",features$V2,fixed=TRUE)
features$V2 <- gsub("fBodyAccJerk.","frequencyBodyAccelerometerJerk.",features$V2,fixed=TRUE)
features$V2 <- gsub("fBodyGyro.","frequencyBodyGyroscope.",features$V2,fixed=TRUE)
features$V2 <- gsub("fBodyAccMag.","frequencyBodyAccelerometerMagnitude.",features$V2,fixed=TRUE)
features$V2 <- gsub("fBodyBodyAccJerkMag.","frequencyBodyAccelerometerJerkMagnitude.",features$V2,fixed=TRUE)  # solve 'BodyBody' error
features$V2 <- gsub("fBodyBodyGyroMag.","frequencyBodyGyroscopeMagnitude.",features$V2,fixed=TRUE)  # solve 'BodyBody' error
features$V2 <- gsub("fBodyBodyGyroJerkMag.","frequencyBodyGyroscopeJerkMagnitude.",features$V2,fixed=TRUE)  # solve 'BodyBody' error


# Take the column names from features dataframe
colnames(X_test) <- features[,2]    
colnames(X_train) <- features[,2]

# Other colnames
colnames(Y_test) <- "activity"
colnames(subject_test) <-"subject"
colnames(Y_train) <- "activity"
colnames(subject_train) <-"subject"



# Create 1 testset
test_set <- cbind(subject_test,Y_test,X_test)

# Create 1 train set
train_set <- cbind(subject_train,Y_train,X_train)

# Combine 2 datasets (rbind) + check!
data_set <- rbind(test_set,train_set)
nrow(data_set) - (nrow(test_set) + nrow(train_set))   # must be zero
ncol(data_set) ; ncol(test_set) ; ncol(train_set)     # number of columns must be the same

# Merge Activity descriptions with our data_set
merged_data_set <- merge(data_set,activity_labels,by.x="activity",by.y="V1",all=TRUE)
colnames(merged_data_set)[564] <- "ActivityLabel"

# Extracts only the measurements on the mean and standard deviation for each measurement. Search is done on name with grep function.
# Find the columns with mean (includes meanfreq) and std
requestedVariables <- features[grep("mean|std",features$V2),]


# Filter the needed columns from the merged data set
tidy_data_set <- subset(merged_data_set,select=c("subject","ActivityLabel",requestedVariables$V2))


# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
# install reshape2 package for melt function
install.packages("reshape2")
library(reshape2)
melted_set <- melt(tidy_data_set,id=c("subject","ActivityLabel"))
tidy_set <- dcast(melted_set,subject + ActivityLabel ~ variable,fun.aggregate = mean)

# Create dataset file
write.table(tidy_set, file = "tidydata.txt")