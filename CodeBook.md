# Coursera - Getting and Cleaning Data
## Final Project Codebook

The codebook for the original dataset is included below, for reference. As discussed therein, individual variables were provided in a 561-feature vector for each record of a subject performing one of the activities. The subject and activity ID variables for each record are contained in the files "subject_train/test.txt" and "y_train/test.txt", respectively. The 561 measurements included in the vector are identified in "features.txt", and the definitions for the numeric activity ID numbers are in "activity_labels.txt".
 
As described in the criteria for tidy data in this class, variables should be defined by column, with values for each variable identified in rows that correspond to individual observations. The original wide format of the data with 561 "features" actually lists values of several implicit variables across the header. 

run_analysis fixes this problem by melting and reorganizing the data into a "long, skinny"  format, similar to that produced in the swirl exercise for tidyr. The function returns a single dataframe that integrates the processed data from the vectors in the train and test datasets. The script introduces 6 new ID variables, the values of which are originally laid out in the 561 features of the vector in the processed data files "X_train/test.txt". The average of each measurement type (per subject and activity) is reported as an individual row in the output table. 

Note that many of the measurements reported in the processed data are omitted; only those labeled as a mean or standard deviation are integrated by the script.

### ID variables:

"subject" - the subject ID number provided by "subject_train/test.txt" for each record

"activity" - the descriptive name given by "activity_labels.txt" and "y_train/test.txt" for each record

The 6 new ID variables were extracted from the feature names given in "features.txt", and their values are defined as follows:

"domain" - 't' denotes a time-domain measurement, 'f' a frequency-domain measurement

"component" - 'body' is the estimated signal contribution from the body, 'gravity' is that estimated to be from gravity by the low-pass filter

"source" - 'gyro' indicates the signal came from the gyroscope, 'acc' from the accelerometer

"statistic" - 'mean' for the mean or 'std' for the standard deviation

"direction" - 'x', 'y', or 'z' for the vector component measured along those axes, or 'mag' for the total magnitude of the vector

"jerk" - 'yes' or 'no', indicating whether this measurement was a derivative

### Measured variables:

"mean" - the average of the values measured for the given set of id variables (subject, activity, and type of measurement). Because each of the processed values being averaged is normalized to the range [-1,1], the value of this variable is also normalized and restricted to this range.

"count" - the number of records available for the given subject and activity

## Original codebook (from Samsung dataset)

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ <br />
tGravityAcc-XYZ <br />
tBodyAccJerk-XYZ <br />
tBodyGyro-XYZ <br />
tBodyGyroJerk-XYZ <br />
tBodyAccMag <br />
tGravityAccMag <br />
tBodyAccJerkMag <br />
tBodyGyroMag <br />
tBodyGyroJerkMag <br />
fBodyAcc-XYZ <br />
fBodyAccJerk-XYZ <br />
fBodyGyro-XYZ <br />
fBodyAccMag <br />
fBodyAccJerkMag <br />
fBodyGyroMag <br />
fBodyGyroJerkMag <br />

The set of variables that were estimated from these signals are: 

mean(): Mean value <br />
std(): Standard deviation <br />
mad(): Median absolute deviation  <br />
max(): Largest value in array <br />
min(): Smallest value in array <br />
sma(): Signal magnitude area <br />
energy(): Energy measure. Sum of the squares divided by the number of values.  <br />
iqr(): Interquartile range  <br />
entropy(): Signal entropy <br />
arCoeff(): Autorregresion coefficients with Burg order equal to 4 <br />
correlation(): correlation coefficient between two signals <br />
maxInds(): index of the frequency component with largest magnitude <br />
meanFreq(): Weighted average of the frequency components to obtain a mean frequency <br />
skewness(): skewness of the frequency domain signal  <br />
kurtosis(): kurtosis of the frequency domain signal  <br />
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. <br />
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean <br />
tBodyAccMean <br />
tBodyAccJerkMean <br />
tBodyGyroMean <br />
tBodyGyroJerkMean <br />

The complete list of variables of each feature vector is available in 'features.txt'
