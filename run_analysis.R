## combine training and test sets of class variables
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")
y <- rbind(y_train,y_test)
names(y) <- "activity"
rm(y_train);rm(y_test)

## read the activity_labels and replace numbers with labels
activity_lab<- read.table("activity_labels.txt")
activity_lab$V2 <- tolower(activity_lab$V2)
activity_lab$V2 <- sub("_",".",activity_lab$V2)
y <- activity_lab$V2[unlist(y)]
y <- as.data.frame(y)
names(y)<- "activities"
rm(activity_lab)

## combine the training and test sets of subjects
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
subject <- rbind(subject_train, subject_test)
subject <- as.data.frame(paste("subject",unlist(subject), sep = ""))
names(subject) <- "subject"
rm(subject_test);rm(subject_train)

## combine the training and test sets of features X 
x10rows <- read.table("./test/X_test.txt", nrows = 10)
class <- sapply(x10rows,class)
x_test <- read.table("./test/X_test.txt", colClasses = class)
x_train <- read.table("./train/X_train.txt", colClasses = class)
x <- rbind(x_train,x_test)
rm(x_test);rm(x_train);rm(x10rows);rm(class)

## subsetting the dataset to include only the mean and standard deviation features
features <- read.table("features.txt")
names(x) <- features[,2] ; rm(features)
x_musd <- x[,grep("mean|std", names(x))]

## combine the subject, activities, and feature factors
data <- cbind(x_musd,subject,y)
data$subject <- factor(data$subject)

## calculate the mean of each variables by subjects and activities
library(reshape2)
melted <- melt(data,id = c("subject","activities"))
cylData <- dcast(melted, subject+activities~variable,mean)

## assign names of all the features
names <- c("subject",
           "activities", 
"meanBodyAccelerationofX", 
           "meanBodyAccelerationofY", 
           "meanBodyAccelerationofZ", 
           "stdDevofBodyAccelerationofX", 
           "stdDevofBodyAccelerationofY", 
           "stdDevofBodyAccelerationofZ", 
           "meanGravityAccelerationofX", 
           "meanGravityAccelerationofY", 
           "meanGravityAccelerationofZ", 
           "stdDevofGravityAccelerationofX",  
           "stdDevofGravityAccelerationofY", 
           "stdDevofGravityAccelerationofZ", 
           "meanBodyLinearAccelerationofX", 
           "meanBodyLinearAccelerationofY", 
           "meanBodyLinearAccelerationofZ", 
           "stdDevofBodyLinearAccelerationofX",  
           "stdDevofBodyLinearAccelerationofY", 
           "stdDevofBodyLinearAccelerationofZ",
           "meanAngularVelocityofX",
           "meanAngularVelocityofY",
           "meanAngularVelocityofZ",
           "stdDevAngularVelocityofX",
           "stdDevAngularVelocityofY",
           "stdDevAngularVelocityofZ",
           "meanBodyJerkSignalX",
           "meanBodyJerkSignalY",
           "meanBodyJerkSignalZ",
           "stdDevofBodyJerkSignalX",
           "stdDevofBodyJerkSignalY",
           "stdDevofBodyJerkSignalZ",
           "meanBodyAccelerationMagnitude",
           "stdDevofBodyAccelerationMagnitude",
           "meanGravityAccelerationMagnitude",
           "stdDevofGravityAccelerationMagnitude",
           "meanBodyLinearAccelerationMagnitude",
           "stdDevofBodyLinearAccelerationMagnitude",
           "meanAngularVelocityMagnitude",
           "stdDevAngularVelocityMagnitude",
           "meanBodyJerkSignalMagnitude",
           "stdDevBodyJerkSignalMagnitude",
           "meanFrequencyofBodyAccelerationofX",
           "meanFrequencyofBodyAccelerationofY",
           "meanFrequencyofBodyAccelerationofZ",
           "stdDevofFrequencyofBodyAccelerationofX",
           "stdDevofFrequencyofBodyAccelerationofY",
           "stdDevofFrequencyofBodyAccelerationofZ",
           "weightedAverageFrequencyofBodyAccelerationofX",
           "weightedAverageFrequencyofBodyAccelerationofY",
           "weightedAverageFrequencyofBodyAccelerationofZ",
           "meanFrequencyofBodyLinearAccelerationofX",
           "meanFrequencyofBodyLinearAccelerationofY",
           "meanFrequencyofBodyLinearAccelerationofZ",
           "stDevofFrequencyofBodyLinearAccelerationofX",
           "stDevofFrequencyofBodyLinearAccelerationofY",
           "stDevofFrequencyofBodyLinearAccelerationofZ",
           "weightedAverageFrequencyofBodyLinearAccelerationofX",
           "weightedAverageFrequencyofBodyLinearAccelerationofY",
           "weightedAverageFrequencyofBodyLinearAccelerationofZ",
           "meanFrequencyofBodyJerkSignalX",
           "meanFrequencyofBodyJerkSignalY",
           "meanFrequencyofBodyJerkSignalZ",
           "stdDevofFrequencyofBodyJerkSignalX",
           "stdDevofFrequencyofBodyJerkSignalY",
           "stdDevofFrequencyofBodyJerkSignalZ",
"weightedAverageFrequencyofBodyJerkSignalX",
"weightedAverageFrequencyofBodyJerkSignalY",
"weightedAverageFrequencyofBodyJerkSignalXZ",
"meanFrequencyofBodyAccelerationMagnitude",
"stdDevofFrequencyofBodyAccelerationMagnitude",
"weightedAverageFrequencyofBodyAccelerationMagnitude",
"meanFrequencyofBodyLinearAccelerationMagnitude",
"stdDevofFrequencyofBodyLinearAccelerationMagnitude",
"weightedAverageFrequencyofBodyLinearAccelerationMagnitude",
"meanFrequencyofAngularVelocityMagnitude",
"stdDevofFrequencyofAngularVelocityMagnitude",
"weightedAverageFrequencyofAngularVelocityMagnitude",
"meanBodyJerkSignalFrequencyMagnitude",
"stdDevofBodyJerkSignalFrequencyMagnitude",
"weightedAverageBodyJerkSignalFrequencyMagnitude")

## assignment of names
names(cylData) <- names
write.table(cylData, file = "tidyData.txt", sep = "\t")