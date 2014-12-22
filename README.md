cleanin_data_science
====================
This repository is for processing data from Human Activity Recognition Using Smartphones Dataset project required for Coursera Getting and Cleaning Data Course.


Required run_analysis.R script does what follows: 

1. merging data from train and test data folders, adding two variables (columns): "activity_label" and "subject" to both sets before merge

2. creating vector of feature labels in order to name columns with merged data for all the features

3. based on regular expression search, selecting from merged data columns with mean and std values + activity and subject columns

4. placing word labels for activities in activity column

5. using for loop and dcast() function, creating new tidy data with the average of each variable (each one separetly through iteration) for each activity and each subject
