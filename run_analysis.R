### downloading data

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "./UCI HAR Dataset.zip")
unzip("./UCI HAR Dataset.zip")
setwd("./UCI HAR Dataset")

### preparing data for train group of subjects

train_subject_number <- read.csv("./train/subject_train.txt", header=FALSE)
colnames(train_subject_number) <- "subject_number"

train_features_561 <- read.fwf("./train/X_train.txt", widths=rep(16,561), strip.white=TRUE)
colnames(train_features_561) <- read.table("./features.txt", header=FALSE)[,2]

train_activity <- read.csv("./train/y_train.txt", header=FALSE)
colnames(train_activity) <- "activity_number"

train_data <- cbind(train_subject_number, train_activity, train_features_561)

### preparing data for test group of subjects

test_subject_number <- read.csv("./test/subject_test.txt", header=FALSE)
colnames(test_subject_number) <- "subject_number"

test_features_561 <- read.fwf("./test/X_test.txt", widths=rep(16,561), strip.white=TRUE)
colnames(test_features_561) <- read.table("./features.txt", header=FALSE)[,2]

test_activity <- read.csv("./test/y_test.txt", header=FALSE)
colnames(test_activity) <- "activity_number"

test_data <- cbind(test_subject_number, test_activity, test_features_561)

### (1) merging training and test sets to create one data set

merged_data <- rbind(train_data, test_data)

### (2) extracting only measurements on mean and standard deviation for each measurement

extracted_data <- merged_data[, grepl("mean\\(", names(merged_data)) |
                                  grepl("std\\(", names(merged_data)) |
                                  grepl("subject_number", names(merged_data)) |
                                  grepl("activity", names(merged_data))]

### (3) using descriptive activity names to name activities in data set

activity_labels <- read.table("./activity_labels.txt", col.names=c("activity_number","activity"))
extracted_data <- merge(activity_labels, extracted_data, by="activity_number")
extracted_data$activity_number <- NULL

### (4) labeling data set with descriptive variable names

names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("-mean\\(\\)", "Mean", names(extracted_data))
names(extracted_data) <- gsub("-std\\(\\)", "StandardDeviation", names(extracted_data))
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))

### (5) creating tidy data set with variable average for each activity and each subject

library(reshape2)
melted <- melt(extracted_data, id=c("activity", "subject_number"))
tidy_data <- dcast(melted, activity + subject_number ~ variable, mean)
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)