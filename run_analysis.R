library(reshape)
library(reshape2)

## setting workdirectory
setwd("~/Dropbox/praca/R/data_science/cleaning_data/PA1/")

## cleaning train set
# feauture labels
f_labels <- read.table("./UCI HAR Dataset/features.txt")
f_labels <- as.vector(f_labels$V2)
# train data
tr_set <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")

tr_labels <- read.table("./UCI HAR Dataset//train/y_train.txt")
tr_labels <- as.vector(tr_labels$V1)
tr_set$label <- tr_labels

tr_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
tr_subjects <- as.vector(tr_subjects$V1)
tr_set$subject <- tr_subjects

# test data
t_set <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")

t_labels <- read.table("./UCI HAR Dataset/test//y_test.txt", sep="")
t_labels <- as.vector(t_labels$V1)
t_set$label <- t_labels

t_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
t_subjects <- as.vector(t_subjects$V1)
t_set$subject <- t_subjects

#merging
set <- rbind(tr_set, t_set)
#building signal and variable descriptions + activity labels
f_labels[c(562,563)] <- c("activity_label","subject")
colnames(set) <- f_labels


##subsetting full data set to mean and std 
#defining regular expressions for selecting columns of mean and std
to_match <- c("mean","std","activity_label","subject")
matches <- unique(grep(paste(to_match, collapse="|"), colnames(set), value= TRUE))
#subsetting 
subset <- set[,matches]

## putting labels to activity column

subset$activity_label[subset$activity_label == 1] <- "WALKING"
subset$activity_label[subset$activity_label == 2] <- "WALKING_USTAIRS"
subset$activity_label[subset$activity_label == 3] <- "WALKING_DOWNSTAIRS"
subset$activity_label[subset$activity_label == 4] <- "SITTING"
subset$activity_label[subset$activity_label == 5] <- "STANDING"
subset$activity_label[subset$activity_label == 6] <- "LAYING"

## Creating second tidy data
data <- dcast(subset, subject + activity_label ~ "tBodyAcc-mean()-X", mean, value.var="tBodyAcc-mean()-X" )
for(col in colnames(subset[1:79])){
      x <- dcast(subset, subject + activity_label ~ col, mean, value.var = col )
      data[col] <- x[col]
}
