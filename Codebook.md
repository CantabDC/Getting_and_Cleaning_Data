#Codebook

##Background on the data

The data used for this project come from the Human Activity Recognition Using Smartphones Data Set. The version of the data used in this project can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

As explained by the experimenters, 

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz....The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Variables in the original data set

As explained by the experimenters (in the "features"info.txt" file included with their data):

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>tBodyAcc-XYZ  
>tGravityAcc-XYZ  
>tBodyAccJerk-XYZ  
>tBodyGyro-XYZ  
>tBodyGyroJerk-XYZ  
>tBodyAccMag  
>tGravityAccMag  
>tBodyAccJerkMag  
>tBodyGyroMag  
>tBodyGyroJerkMag  
>fBodyAcc-XYZ  
>fBodyAccJerk-XYZ  
>fBodyGyro-XYZ  
>fBodyAccMag  
>fBodyAccJerkMag  
>fBodyGyroMag  
>fBodyGyroJerkMag  

>The set of variables that were estimated from these signals are: 

>mean(): Mean value  
>std(): Standard deviation  
>mad(): Median absolute deviation   
>max(): Largest value in array  
>min(): Smallest value in array  
>sma(): Signal magnitude area  
>energy(): Energy measure. Sum of the squares divided by the number of values  
>iqr(): Interquartile range   
>entropy(): Signal entropy  
>arCoeff(): Autorregresion coefficients with Burg order equal to 4  
>correlation(): correlation coefficient between two signals  
>maxInds(): index of the frequency component with largest magnitude  
>meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
>skewness(): skewness of the frequency domain signal   
>kurtosis(): kurtosis of the frequency domain signal   
>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window  
>angle(): Angle between to vectors  

>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

>gravityMean  
>tBodyAccMean  
>tBodyAccJerkMean  
>tBodyGyroMean  
>tBodyGyroJerkMean

All of the variables described above are normalized and bounded within [-1,1].

##Transformation of the data

The experimenters partitioned the observations on the 561 variables described in the preceding section into two data sets: training data (70%) and testing data (30%).

To produce the current data set, the training and testing data were merged, and information identifying the subject and activity associated with each set of measurements was added to the merged data. 

The variables representing measurements of mean (identified as containing "mean()" in the variable name) and standard deviation (identified as containing "std()" in the variable name) were then extracted from the merged data. There were 66 such variables.

The data for these 66 variables were grouped by subject and activity, and the mean of each variable was calculated for each subject-activity pair.

The final data set contains 68 columns. The first column identifies the subject. The second column identifies the activity. Each remaining column contains the mean of all observations on that variable for that subject-activity pair. 

The labels for the variables in the final data set have been simplified slightly from the originals.Parentheses have been dropped, hyphens have been replaced with underscores, and on occasion, the incorrect use of "BodyBody" has been replaced with "Body." As an example, tBodyAcc_mean_X in the final data set is derived from tBodyAcc-mean()-x in the original data set.

## Variables in the final data set

Note that variables 3-68 are mean values. For example, "tBodyAcc_mean_x" should be interpreted as the mean of observations of tBodyAcc_mean_x for that subject-activity pair.

VAR |  NAME                | CLASS  
1  |  subject              | integer (1-30)  
2  |  activity             | factor (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
3  |  tBodyAcc_mean_X      | |numeric  
4  |	tBodyAcc_mean_Y	     | numeric  
5  |	tBodyAcc_mean_Z	     | numeric  
6	 |  tGravityAcc_mean_X	 | numeric  
7	 |  tGravityAcc_mean_Y   | numeric  
8	 |  tGravityAcc_mean_Z   | numeric  
9	 |  tBodyAccJerk_mean_X	 | numeric  
10 |  tBodyAccJerk_mean_Y	 | numeric  
11 |  tBodyAccJerk_mean_Z	 | numeric  
12 |	tBodyGyro_mean_X	   | numeric  
13 | 	tBodyGyro_mean_Y	   | numeric  
14 |  tBodyGyro_mean_Z	   | numeric  
15 |  tBodyGyroJerk_mean_X	 | numeric   
16 |  tBodyGyroJerk_mean_Y	 | numeric  
17 |  tBodyGyroJerk_mean_Z	 |numeric  
18 |	tBodyAccMag_mean	| numeric  
19 | tGravityAccMag_mean	 | numeric  
20 |	tBodyAccJerkMag_mean |	 numeric  
21 |	tBodyGyroMag_mean	| numeric  
22 |	tBodyGyroJerkMag_mean	 numeric  
23 |	fBodyAcc_mean_X	| numeric  
24 |	fBodyAcc_mean_Y	| numeric  
25 |	fBodyAcc_mean_Z	| numeric  
26 |	fBodyAccJerk_mean_X	| numeric  
27 |	fBodyAccJerk_mean_Y	| numeric  
28 |	fBodyAccJerk_mean_Z	| numeric  
29 | fBodyGyro_mean_X	| numeric  
30 |	fBodyGyro_mean_Y	| numeric  
31 |	fBodyGyro_mean_Z	| numeric  
32 |	fBodyAccMag_mean | numeric  
33 |	fBodyAccJerkMag_mean	| numeric  
34 |	fBodyGyroMag_mean	| numeric  
35 |	fBodyGyroJerkMag_mean	| numeric  
36 |	tBodyAcc_std_X	| numeric  
37 |	tBodyAcc_std_Y	| numeric  
38 |	tBodyAcc_std_Z	| numeric  
39 |	tGravityAcc_std_X	| numeric  
40 |	tGravityAcc_std_Y	| numeric  
41 |	tGravityAcc_std_Z	| numeric  
42 |	tBodyAccJerk_std_X	| numeric  
43 |	tBodyAccJerk_std_Y	| numeric  
44 |	tBodyAccJerk_std_Z	| numeric  
45 |	tBodyGyro_std_X	| numeric  
46 |	tBodyGyro_std_Y	| numeric  
47 |	tBodyGyro_std_Z	| numeric  
48 |	tBodyGyroJerk_std_X	| numeric  
49 |	tBodyGyroJerk_std_Y | numeric  
50 |	tBodyGyroJerk_std_Z	| numeric  
51 |	tBodyAccMag_std	| numeric  
52 |	tGravityAccMag_std	| numeric  
53 |	tBodyAccJerkMag_std	| numeric  
54 |	tBodyGyroMag_std | numeric  
55 |	tBodyGyroJerkMag_std	| numeric  
56 |	fBodyAcc_std_X	| numeric  
57 |  fBodyAcc_std_Y	| numeric  
58 |	fBodyAcc_std_Z	| numeric  
59 |	fBodyAccJerk_std_X	| numeric  
60 |	fBodyAccJerk_std_Y	| numeric  
61 |	fBodyAccJerk_std_Z	| numeric  
62 |	fBodyGyro_std_X	| numeric  
63 |	fBodyGyro_std_Y	| numeric  
64 |	fBodyGyro_std_Z	| numeric  
65 |	fBodyAccMag_std	| numeric  
66 |	fBodyAccJerkMag_std	| numeric  
67 |	fBodyGyroMag_std |	 numeric  
68 |	fBodyGyroJerkMag_std	| numeric  


