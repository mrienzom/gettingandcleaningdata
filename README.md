# gettingandcleaningdata
Getting and Cleaning Data - Final Project

The script "run_analysis.R" is intended to combine data from files in the UCI 
HAR Dataset into a single tidy table containing the averages for each type of 
measurement (only including means and standard deviations) taken from each 
subject while performing each activity.

Before running the script "run_analysis.R", please make sure all the raw data is
included in your working directory with the following relative file paths:

"UCI HAR Dataset/features.txt",
"UCI HAR Dataset/activity_labels.txt",
"UCI HAR Dataset/test/subject_test.txt",
"UCI HAR Dataset/test/X_test.txt",
"UCI HAR Dataset/test/y_test.txt",
"UCI HAR Dataset/train/subject_train.txt",
"UCI HAR Dataset/train/X_train.txt",
"UCI HAR Dataset/train/y_train.txt"

The script should not be passed any arguments. It will return a dataframe with
11880 observations of 10 variables. The first 9 variables specify a subject,
activity, and type of measurement; the final variable gives the average value
of the measurement across all identical instances of the first 9 variables. 
Definitions for the ID variables and their values are given in the modified 
codebook, along with the rationale for this analysis.
