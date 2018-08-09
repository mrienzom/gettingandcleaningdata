# gettingandcleaningdata
Getting and Cleaning Data - Final Project

The script "run_analysis.R" is intended to combine the processed data from files 
in the UCI HAR Dataset [1] into a single tidy table containing the averages for 
each type of measurement (only including means and standard deviations) taken 
from records for each subject while performing each activity.

Before running the script "run_analysis.R", please make sure all the processed 
data are included in your working directory with the following relative file 
paths:

"UCI HAR Dataset/features.txt",
"UCI HAR Dataset/activity_labels.txt",
"UCI HAR Dataset/test/subject_test.txt",
"UCI HAR Dataset/test/X_test.txt",
"UCI HAR Dataset/test/y_test.txt",
"UCI HAR Dataset/train/subject_train.txt",
"UCI HAR Dataset/train/X_train.txt",
"UCI HAR Dataset/train/y_train.txt"

The script should not be passed any arguments. It will return a dataframe with
11880 observations of 10 variables. The first 8 variables are ID variables that 
specify a subject, activity, and type of measurement; the final 2 are summary
variables describing the set of records with the values defined by the first 8
variables. The script combines the processed data along with the ID variables 
from both the test and train files. Definitions for all the ID variables and 
their values are given in the modified codebook, along with the rationale for 
organizing the data in this manner.

The files included in this repository are:
'README.md'
'codebook.txt' - gives an description of the variables in the output dataframe
'run_analysis.R' - contains the code for the data analysis

References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012