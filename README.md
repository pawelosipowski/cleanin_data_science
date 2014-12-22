cleanin_data_science
====================
run_analysis.R script is about following:
1. creating vector of feature labels in order to name columns with data for all the features
2. merging data from train and test data_files, adding two variables (columns): "activity_label" and "subject" to both sets before merge
3. based on regular expression search, selecting from merged data columns with mean and std values
4. placing word labels for activity in "activity_label" column
5. using loop and dcast function creating tidy data as was given in the task
