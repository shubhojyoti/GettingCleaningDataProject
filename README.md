## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Files

This repository contains the files and data pertaining to the course project of the Coursera course "Getting and Cleaning Data". The repository contains the following files:

1. README.md - This readme document.
2. cleaned\_raw\_data/initial\_merged\_dataset.txt - This is the initial dataset generated after merging of individual data and labelling the variables.
2. desc\_variable\_names.R - This R script creates a character vector containing the descriptive names for all the variables in the merged data set.
3. final\_avg\_tidy\_dataset.txt - The final tidy dataset output containing the average of all variables per subject per activity.
4. run\_analysis.R - The main R script which when executed takes in the raw data, analyses it and generates the final tidy dataset file.


### The analysis script

The run\_analysis.R script is a standalone R script. Both the R scripts should be present in the current working directory. Please use a fresh directory as your current working directory and copy the R files. This avoids conflict with existing files. The script can be executed from the R console (or R Studio) by sourcing the main script.

<!-- -->
    source("run_analysis.R")

The analysis script contains steps for downloading the data set from the source directly if it is not available in your current working directory. The user may comment out these lines to prevent the download. Also when the script gets over, the R environment is cleaned of all the local variables used by the script. If you would like to analyze the variables further in your R console please comment the last line of the script during execution.

### The Data Sets

The script will generate two dataset files in yoru current working directory:

1. `initial_merged_dataset.txt` - This is the merged dataset (train + test data) with each variable labelled descriptively. Only the mean() and std() variables have been considered. This is *NOT* the final tidy dataset and should not be considered as the final tidy dataset output. This file is provided just for completion purposes so that the user can use it if needed.

2. `final_avg_tidy_dataset.txt` - This is the final output tidy dataset. This is also uploaded to the Coursera assignment page and available for peer review. This dataset follows all the principles of tidy data as follows<sup>1</sup>:

<!-- -->
        1. Each variable forms a column.
        2. Each observation forms a row.
        3. Each table (or file) stores information about one observational type.

Each observation in the dataset forms a row. Each row should be read as:
`For subject <id>, doing the activity <activity_name>, here are the average results for each variables: <variable1>, <variable2> .....`


**Footnotes**

<sup>1</sup> See "Tidy Data" by Hadley Wickham. https://github.com/hadley/tidy-data
