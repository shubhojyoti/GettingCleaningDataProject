## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Files

This repository contains the files and data pertaining to the course project of the Coursera course "Getting and Cleaning Data". The repository contains the following files:

1. Codebook.md - The codebook containing information on the data and variables in the dataset.
2. README.md - This readme document.
3. cleaned_raw_data/initial_merged_dataset.txt - This is the initial dataset generated after merging of individual data and labelling the variables.
4. desc_variable_names.R - This R script creates a character vector containing the descriptive names for all the variables in the merged data set.
5. run_analysis.R - The main R script which when executed takes in the raw data, analyses it and generates the final tidy dataset file.
6. tidy_data/final_avg_tidy_dataset.txt - The final tidy dataset output containing the average of all variables per subject per activity.


### The analysis script

The run\_analysis.R script is a standalone R script. Both the R scripts should be present in the current working directory. Please use a fresh directory as your current working directory and copy the R files. This avoids conflict with existing files. The script can be executed from the R console (or R Studio) by sourcing the main script.

<!-- -->
    source("run_analysis.R")

The analysis script contains steps for downloading the data set from the source directly if it is not available in your current working directory. The user may comment out these lines to prevent the download. Also when the script gets over, the R environment is cleaned of all the local variables used by the script. If you would like to analyze the variables further in your R console please comment the last line of the script during execution.


### Analysis Method

The run\_analysis.R script is heavily commented to outline the method and steps that are being performed by the script. Please refer to the script to get the detailed steps.

** The tidy dataset can be loaded to R (or R Studio) using the following **

<!-- -->
    data <- read.table("tidy_data//final_avg_tidy_dataset.txt", header=TRUE)

Following steps are being performed by the script:

1. Loading the libraries and sourcing the dependent files.
2. Read and load the data into R.
3. Merge the train and test data.
4. Select the mean() and std() features.
5. Create the merged dataset with descriptive variable names.
6. Reshape data and get averages of all variables per subject/activity.
7. Save the tidy dataset to a file.

Since the assignment specifies that only the mean and standard deviation data need to be utilized for the final dataset, following points were considered to generate the same in Step 4 above:

1. The features in the raw dataset with mean() or std() towards the end were only considered. e.g. tBodyAcc-mean()-X
2. Weighted averages containing the "Mean" string in its name were **NOT** considered. e.g. fBodyAcc-meanFreq()-X
3. Other calculated vectors containing "Mean in their name" like gravityMean were **NOT** considered. These vectors are used in the angle() function to get the angle between the vectors which is a distinct feature different from mean() and std(). e.g. angle(X,gravityMean)


### The Data Sets

The script will generate two dataset files in yoru current working directory:

1. `initial_merged_dataset.txt` - This is the merged dataset (train + test data) with each variable labelled descriptively. Only the mean() and std() variables have been considered. This is **NOT** the final tidy dataset and should not be considered as the final tidy dataset output. This file is provided just for completion purposes so that the user can use it if needed.

2. `final_avg_tidy_dataset.txt` - This is the **final output tidy dataset**. This is also uploaded to the Coursera assignment page and available for peer review. This dataset follows all the principles of tidy data as follows<sup>1</sup>:

<!-- -->
    1. Each variable forms a column.
    2. Each observation forms a row.
    3. Each table (or file) stores information about one observational type.

    Each observation in the dataset forms a row. Each row should be read as:
    `For subject <id>, doing the activity <activity_name>, here are the average results for each variables: <variable1>, <variable2> .....`


### Descriptive Variable Names

All the variable names in the tidy dataset are long and descriptive. This is intentional to make the data contained in the variables obvious. e.g.

avg_mean_time_body_acceleration_xaxis where,

avg - Average of
mean - Mean values (or standard deviation in case of "std")
time - Time Domain (or frequency domain in case of "frequency")
body - Measurements for the body movements (or "gravity" for the gravitational movement)
acceleration - Linear Acceleration measurements (or angular velocity in case of "angular_velocity")
xaxis - X axis measurements (or yaxis/zaxis)

**Footnotes**

<sup>1</sup> See "Tidy Data" by Hadley Wickham. https://github.com/hadley/tidy-data
