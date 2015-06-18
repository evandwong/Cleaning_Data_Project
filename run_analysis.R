
library(plyr)

##############################
##### Variable Selection & Naming

## 4. Appropriately labels the data set with descriptive variable names. 
## Reads "features.txt" to retrieve descriptive variable names
## Cleans these names by replacing R-prohibited characters
## Also replaces incorrect instances of "BodyBody" in variable names with "Body"

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## Creates a logical vector indicating whether each variable will be included in our "tidy" output data set.


variable_names <- read.table("UCI HAR Dataset/features.txt")

variable_names$inc1 <- grepl("mean()|std()", variable_names$V2)
variable_names$inc2 <- !grepl("angle|meanFreq()", variable_names$V2)
variable_names$include <- variable_names$inc1 & variable_names$inc2

variable_names$rname <- gsub("\\(", ".", variable_names$V2)
variable_names$rname <- gsub("BodyBody", "Body", variable_names$rname)
variable_names$rname <- gsub("\\)", ".", variable_names$rname)
variable_names$rname <- gsub(",", ".", variable_names$rname)
variable_names$rname <- gsub("-", "_", variable_names$rname)


## Simplified output for later use.
features <- variable_names[,c("rname", "include")]


#####-------------------------



##############################
##### Main Data Input

## Reads in variable measurements from training & testing files.
## Applies descriptive variable names from previous step.

data_test <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(data_test) <- features$rname
data_test <- data_test[,features$include]

data_train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(data_train) <- features$rname
data_train <- data_train[,features$include]
#####-------------------------


##############################
##### Combining Data

## 1. Merges the training and the test sets to create one data set.

## Reads Subject IDs & Activity Labels, then combines everything we've processed so far into a full data set.

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subject_test) <- "Subject_ID"
colnames(subject_train) <- "Subject_ID"

activity_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
activity_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
colnames(activity_test) <- "Activity_Label"
colnames(activity_train) <- "Activity_Label"

data_test2 <- cbind(subject_test, activity_test, data_test)
data_train2 <- cbind(subject_train, activity_train, data_train)


data_full <- rbind(data_test2, data_train2)

#####-------------------------


##############################
##### Applies descriptive activity names.

##  3. Uses descriptive activity names to name the activities in the data set

## Reads descriptive activity names, applies them to data using Activity Labels as a matching key.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("Activity_Label", "Activity_Name")

data_full2 <- join(activities, data_full, type="right", by = "Activity_Label")
data_full2$Activity_Label <- NULL
#####-------------------------


## Note: at this point, steps 1. through 4. are complete and their result can be found in data_full2


##############################
##### Records averages by subject and activity.

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


summary <- ddply(data_full2,
                 c("Activity_Name", "Subject_ID"),
                 numcolwise(mean)
                 )

#####-------------------------



##############################
##### Records averages by subject and activity.

write.table(summary, file="Project_Tidy_Data.txt", row.name=FALSE)

#####-------------------------