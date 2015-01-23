# Getting & Cleaning Data : Course Project

# Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. You should create one R script called run_analysis.R that does the following. 
# 2. Merges the training and the test sets to create one data set.
# 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 4. Uses descriptive activity names to name the activities in the data set
# 5. Appropriately labels the data set with descriptive variable names. 
# 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library("stringr")
library("plyr")

# Load the data set. 
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
cwd <- getwd()

x.train.file <- str_join(cwd,"/UCI HAR Dataset/train/X_train.txt")
y.train.file <- str_join(cwd,"/UCI HAR Dataset/train/y_train.txt")
subject.train.file <- str_join(cwd,"/UCI HAR Dataset/train/subject_train.txt")
x.test.file <- str_join(cwd,"/UCI HAR Dataset/test/X_test.txt")
y.test.file <- str_join(cwd,"/UCI HAR Dataset/test/y_test.txt")
subject.test.file <- str_join(cwd,"/UCI HAR Dataset/test/subject_test.txt")
features.file <- str_join(cwd,"/UCI HAR Dataset/features.txt")
activity.labels.file <- str_join(cwd,"/UCI HAR Dataset/activity_labels.txt")

x.train <- read.table(x.train.file, sep="")
y.train <- read.table(y.train.file, sep="")
subject.train <- read.table(subject.train.file,sep="")
x.test <- read.table(x.test.file, sep="")
y.test <- read.table(y.test.file, sep="")
subject.test <- read.table(subject.test.file,sep="")
features <- read.table(features.file, sep="")
activity.labels <- read.table(activity.labels.file, sep="")


# Merges the training and the test sets to create one data set.
subject.merge <- rbind(subject.train,subject.test)
x.merge <- rbind(x.train,x.test)
y.merge <- rbind(y.train,y.test)


# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# Assumption : mean() - mean marker ; std() - standarad deviation marker
colnames(x.merge) <- as.character(features[[2]])
col.filter <- grep("mean\\(\\)|std\\(\\)",colnames(x.merge), ignore.case=TRUE)
x.reduce <- x.merge[,col.filter]

y.merge[,1] <- activity.labels[y.merge[,1],2]
data <- cbind(subject.merge,y.merge, x.reduce)

colnames(data)[1] <- "SubjectID"
colnames(data)[2] <- "ActivityDesc"

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Rename the column : add Avg** and remove "-" and "()"
tidy.data <- ddply(data,.(SubjectID,ActivityDesc),colwise(mean, is.numeric))
i<- ncol(tidy.data)
colnames(tidy.data)[3:i] <- str_join("Avg",colnames(tidy.data)[3:i])
colnames(tidy.data) <- str_replace_all(colnames(tidy.data), "\\(\\)|-", "")
write.table(tidy.data,"tidy.txt",row.names=FALSE,sep=" ")

# Test if the tidy dataset loads.
tidy.test <- read.table("tidy.txt",header=TRUE,sep=" ")
ncol(tidy.test)
nrow(tidy.test)



