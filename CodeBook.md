## Project_Tidy_Data Code Book

This file documents the contents of "Project_Tidy_Date.txt".

###  Match Key Variables

Each row of this data set summarizes the set of records from the original data corresponding to the given combination of Subject_ID and Activity_Name. Consequently, these variables uniquely identify the rows of the data set.

* Subject_ID  - Identifies the participant in the study.
* Activity_Name - Identifies the type of activity the subject engaged in.


###  Other Variables

For each row (i.e. match key combination), these varables summarize the corresponding set of records from the original data set.  66 variables from the original data were selected for summary inclusion, corresponding to the 66 non-match key variables in this data set.

Names are inherited from the original data, and values now represent means of the same variable grouped by match key combination. Note that the original data had previously been normalized, and therefore these variables are unitless.

Further information (taken from the code book to the original data set):

-----

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

-----

Note: while other statistics were estimated from the original data, only mean and standard deviation were selected for summary inclusion in this data set.

The complete list of descriptive variable names is available on the data set.
