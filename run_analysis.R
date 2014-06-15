##############################################################################
# Script Name - run_analysis.R
# Author - Shubhojyoti Bhattacharya
#
# This is the analysis script that analyzes the raw data given in the project
# and generates the tidy dataset at the end. Two datasets are generated.
#
#     1. The initial merged data is generated as "initial_merged_dataset.txt".
#     2. The final tidy dataset is generated as "final_avg_tidy_dataset.txt".
#
# Both the datasets are saved in your current working directory.
##############################################################################

##############################################################################
# STEP 1: Loading the libraries and sourcing the dependent files
##############################################################################

# The following commands are present for the sake of completion. If the two
# packages are not present in your R environment, please uncomment the below
# two lines.
#install.packages("sqldf", dependencies=TRUE)
#install.packages("reshape2", dependencies=TRUE)
library(sqldf)
library(reshape2)

# The following file must be present in your current working directory. This
# is used to get a character vector containing the descriptive names of each
# variables in the dataset. This has been moved to a different file to improve
# the readability of the script.
source("desc_variable_names.R")

##############################################################################
# STEP 2: Read and load the data into R
##############################################################################

# Downloading the source data file if not already present in the current
# working directory.
if(!file.exists('dataset.zip')) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile="dataset.zip", method="curl")
    unzip("dataset.zip")
}

# Read the training data
train_data <- read.table('UCI HAR Dataset/train/X_train.txt')
train_activity_labels <- read.table('UCI HAR Dataset/train/y_train.txt')
train_subjects <- read.table('UCI HAR Dataset/train/subject_train.txt')

# Read the test data
test_data <- read.table('UCI HAR Dataset/test/X_test.txt')
test_activity_labels <- read.table('UCI HAR Dataset/test/y_test.txt')
test_subjects <- read.table('UCI HAR Dataset/test/subject_test.txt')

# Read the features list = Each row represent one feature
features <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors = F)
# Read the activity labels list - Each row represent the activity id and name
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors = F)

##############################################################################
# STEP 3: Merge the train and test data
##############################################################################

# Merge the train and test data rows in sequence
all_data <- rbind(train_data, test_data)
# Merge the train and test activity labels in sequence
all_activity_labels <- rbind(train_activity_labels, test_activity_labels)
# Merge the train and test subject ids in sequence
all_subjects <- rbind(train_subjects, test_subjects)

# Set proper column names to the activity labels
# activity _id and activity_name
names(activity_labels) <- c("activity_id", "activity_name")
# Set proper column name to data activity labels which the subjects performed
# subject_acitivity_id
names(all_activity_labels) <- c("subject_activity_id")
# Set column name subject_id to the list of subjects for each observation
names(all_subjects) <- c("subject_id")
# Set proper column names to features table
# feature_id and feature_name
names(features) <- c("feature_id", "feature_name")

# Get the list of activity names corresponding to the activity labels that the
# subjects have performed. Care should be taken that the activity names are
# in exact sequence as the activity labels.
activity_names = character()
count <- 1
for(indx in all_activity_labels[[1]]) {
    activity_names[count] <- fn$sqldf("select activity_name from activity_labels where activity_id = '$indx'")[[1]]
    count <- count + 1
}

##############################################################################
# STEP 4: Select the mean() and std() features
##############################################################################

# Only the features having the mean() and std() at the end have been selected.
# Other means like weighted average Meanfreq() and means giving to the angle()
# functions are NOT considered

# The feature_id are appended with a "V" to match the initial default column
# names assigned by R.
features$feature_id <- paste("V", as.character(features$feature_id), sep="")
# Select only the mean() and std() feature ids
save <- grep("mean\\(\\)|std\\(\\)", features$feature_name)
reqd_features <- features[save,]
# Subset the merged data and keep only the mean() and std() variables
all_data <- all_data[, reqd_features[["feature_id"]]]

##############################################################################
# STEP 4: Create the merged dataset with descriptive variable names
##############################################################################

# Add the subject_ids and activity names to the merged data
all_data <- cbind(all_subjects, activity_names, all_data)

# Give proper descriptive names to the variables
# The descriptive variable names are in the character vector
# "all_data_var_column_names" sourced from the desc_variable_names.R
# file.
names(all_data) <- c("subject_id", "activity_name", all_data_var_column_names)

# Order the data by subject_id and activity_name
all_data <- all_data[order(all_data$subject_id, all_data$activity_name), ]

# Write the merged dataset to the file "initial_merged_dataset.txt"
write.table(all_data, "initial_merged_dataset.txt", row.names = FALSE)

##############################################################################
# STEP 5: Reshape data and get averages of all variables per subject/activity
##############################################################################

# Get the long data set by melting the data
long_data <- melt(all_data, id=c("subject_id", "activity_name"), measure.vars=all_data_var_column_names)

# Get back the wide tidy data by performing a mean of all variables
wide_tidy_data <- dcast(long_data, subject_id + activity_name ~ variable, mean)

# Add a avg_ prefix to all variable column names to make the tidy dataset
# descriptive
all_data_var_column_names <- paste("avg", all_data_var_column_names, sep="_")
names(wide_tidy_data) <- c("subject_id", "activity_name", all_data_var_column_names)

##############################################################################
# STEP 6: Save the tidy dataset to a file
##############################################################################

# Write the wide tidy data to file "final_avg_tidy_dataset.txt"
write.table(wide_tidy_data, "final_avg_tidy_dataset.txt", row.names = FALSE)

# Remove all the local variables from the R environment
remove(list = ls())
