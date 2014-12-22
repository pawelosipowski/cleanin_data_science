####Code Book 

Experiment was on group of 30 people who were to perform 6 activities being measured through accelometer and gyroscope in SAMSUNG smartphones: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Signals from devices were processed to estimate variables of the feature vector for predicting activity pattern.

Data includes signal variables in columns for each specific feature. 3-axial signals for the feature are marked below by "-XYZ"
Features are introduced as:

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag



Variables for each feature are:

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.




Example 1: Complete set of variables for feature introduced as tBodyAcc:

 tBodyAcc-mean()-X

 tBodyAcc-mean()-Y

 tBodyAcc-mean()-Z

 tBodyAcc-std()-X

 tBodyAcc-std()-Y

 tBodyAcc-std()-Z

 tBodyAcc-mad()-X

 tBodyAcc-mad()-Y

 tBodyAcc-mad()-Z

 tBodyAcc-max()-X

 tBodyAcc-max()-Y

 tBodyAcc-max()-Z

 tBodyAcc-min()-X

 tBodyAcc-min()-Y

 tBodyAcc-min()-Z

 tBodyAcc-sma()

 tBodyAcc-energy()-X

 tBodyAcc-energy()-Y

 tBodyAcc-energy()-Z

 tBodyAcc-iqr()-X

 tBodyAcc-iqr()-Y

 tBodyAcc-iqr()-Z

 tBodyAcc-entropy()-X

 tBodyAcc-entropy()-Y

 tBodyAcc-entropy()-Z

 tBodyAcc-arCoeff()-X,1

 tBodyAcc-arCoeff()-X,2

 tBodyAcc-arCoeff()-X,3

 tBodyAcc-arCoeff()-X,4

 tBodyAcc-arCoeff()-Y,1

 tBodyAcc-arCoeff()-Y,2

 tBodyAcc-arCoeff()-Y,3

 tBodyAcc-arCoeff()-Y,4

 tBodyAcc-arCoeff()-Z,1

 tBodyAcc-arCoeff()-Z,2

 tBodyAcc-arCoeff()-Z,3

 tBodyAcc-arCoeff()-Z,4

 tBodyAcc-correlation()-X,Y

 tBodyAcc-correlation()-X,Z

 tBodyAcc-correlation()-Y,Z

 
Raw data is calculated variables from time and frequency domain. In two sets (train and test) with no description. Data was transformed in following manner:


CodeBook:
For each vector of activity pattern, label of the pattern was assigned by adding factor variable "activity_label" to data (another column):WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

For each vector of activity pattern, label of a subject was assigned by adding factor variable "subject" to the data (another column): 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
25 26 27 28 29 30


Two sets were merged together.


Coulumn names for each variable for the feature were assigned like in Example 1


All variables for each feature were dropped but mean and standard deviation estimation variables.


From variables kept new data was created with mean of each variable for each activity and each subject with no changes to column names and labels for activity patterns assigned.
