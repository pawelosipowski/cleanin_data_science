library(reshape)
library(reshape2)

### preparing train and test sets

## tidying train data
tr_set <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")

# adding activity labels
tr_labels <- read.table("./UCI HAR Dataset//train/y_train.txt")
tr_labels <- as.vector(tr_labels$V1)
tr_set$label <- tr_labels

# adding subject labels
tr_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
tr_subjects <- as.vector(tr_subjects$V1)
tr_set$subject <- tr_subjects

## tidying test data
t_set <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")

# adding activity labels
t_labels <- read.table("./UCI HAR Dataset/test//y_test.txt", sep="")
t_labels <- as.vector(t_labels$V1)
t_set$label <- t_labels

# adding subject labels
t_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
t_subjects <- as.vector(t_subjects$V1)
t_set$subject <- t_subjects

### merging two datasets
set <- rbind(tr_set, t_set)

##building signal and variable descriptions + activity labels & subject
# preparing feauture labels to name columns
f_labels <- read.table("./UCI HAR Dataset/features.txt")
f_labels <- as.vector(f_labels$V2)
f_labels[c(562,563)] <- c("activity_label","subject")
#setting names for columns in fulldata set
colnames(set) <- f_labels


###Subsetting 
##subsetting fulldata set to mean and std 
#defining regular expressions for selecting columns of mean and std
to_match <- c("mean","std","activity_label","subject")
matches <- unique(grep(paste(to_match, collapse="|"), colnames(set), value= TRUE))

subset <- set[,matches]

## putting word labels for numerics in activity column

subset$activity_label[subset$activity_label == 1] <- "WALKING"
subset$activity_label[subset$activity_label == 2] <- "WALKING_USTAIRS"
subset$activity_label[subset$activity_label == 3] <- "WALKING_DOWNSTAIRS"
subset$activity_label[subset$activity_label == 4] <- "SITTING"
subset$activity_label[subset$activity_label == 5] <- "STANDING"
subset$activity_label[subset$activity_label == 6] <- "LAYING"

## maiking new tidy data with mean of each variable for each activity and each subject
data <- dcast(subset, subject + activity_label ~ "tBodyAcc-mean()-X", mean, value.var="tBodyAcc-mean()-X" )
for(col in colnames(subset[2:79])){
      x <- dcast(subset, subject + activity_label ~ col, mean, value.var = col )
      data[col] <- x[col]
}
