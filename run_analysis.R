
#install.packages("sqldf", dependencies=TRUE)
#install.packages("reshape2", dependencies=TRUE)

library(sqldf)
library(reshape2)

source("desc_variable_names.R")

if(!file.exists('dataset.zip')) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile="dataset.zip", method="curl")
    unzip("dataset.zip")
}

train_data <- read.table('UCI HAR Dataset/train/X_train.txt')
train_activity_labels <- read.table('UCI HAR Dataset/train/y_train.txt')
train_subjects <- read.table('UCI HAR Dataset/train/subject_train.txt')

test_data <- read.table('UCI HAR Dataset/test/X_test.txt')
test_activity_labels <- read.table('UCI HAR Dataset/test/y_test.txt')
test_subjects <- read.table('UCI HAR Dataset/test/subject_test.txt')

features <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors = F)
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors = F)

all_data <- rbind(train_data, test_data)
all_activity_labels <- rbind(train_activity_labels, test_activity_labels)

all_subjects <- rbind(train_subjects, test_subjects)

names(activity_labels) <- c("activity_id", "activity_name")
names(all_activity_labels) <- c("subject_activity_id")
names(all_subjects) <- c("subject_id")
names(features) <- c("feature_id", "feature_name")

activity_names = character()
count <- 1
for(indx in all_activity_labels[[1]]) {
    activity_names[count] <- fn$sqldf("select activity_name from activity_labels where activity_id = '$indx'")[[1]]
    count <- count + 1
}

features$feature_id <- paste("V", as.character(features$feature_id), sep="")
save <- grep("mean\\(\\)|std\\(\\)", features$feature_name)
reqd_features <- features[save,]
all_data <- all_data[, reqd_features[["feature_id"]]]
all_data <- cbind(all_subjects, activity_names, all_data)

names(all_data) <- c("subject_id", "activity_name", all_data_var_column_names)
all_data <- all_data[order(all_data$subject_id, all_data$activity_name), ]

write.table(all_data, "initial_merged_dataset.txt", row.names = FALSE)

long_data <- melt(all_data, id=c("subject_id", "activity_name"), measure.vars=all_data_var_column_names)

wide_tidy_data <- dcast(long_data, subject_id + activity_name ~ variable, mean)
all_data_var_column_names <- paste("avg", all_data_var_column_names, sep="_")
names(wide_tidy_data) <- c("subject_id", "activity_name", all_data_var_column_names)

write.table(wide_tidy_data, "final_avg_tidy_dataset.txt", row.names = FALSE)

remove(list = ls())
