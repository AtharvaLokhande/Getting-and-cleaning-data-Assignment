library(dplyr)

#load data
features <- read.table("E://R class//UCI HAR Dataset//features.txt", col.names = c("n","functions"))
activity_data <- read.table("E://R class//UCI HAR Dataset//activity_labels.txt", col.names = c("code", "activity"))

subject_test <- read.table("E://R class//UCI HAR Dataset//test//subject_test.txt", col.names = "subject")
x_test <- read.table("E://R class//UCI HAR Dataset//test//X_test.txt", col.names = features$functions)
y_test <- read.table("E://R class//UCI HAR Dataset//test//y_test.txt", col.names = "code")

subject_train <- read.table("E://R class//UCI HAR Dataset//train/subject_train.txt", col.names = "subject")
x_train <- read.table("E://R class//UCI HAR Dataset//train//X_train.txt", col.names = features$functions)
y_train <- read.table("E://R class//UCI HAR Dataset//train//y_train.txt", col.names = "code")

#merge
mergeX <- rbind(x_train, x_test)
mergeY <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, mergeY, mergeX)

#tidy
tidydb <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#setting up names to the codes
tidydb$code <- activity_data[tidydb$code, 2]

#renameing the accronims
names(tidydb)[2] = "activity"
names(tidydb)<-gsub("Acc", "Accelerometer", names(tidydb))
names(tidydb)<-gsub("Gyro", "Gyroscope", names(tidydb))
names(tidydb)<-gsub("BodyBody", "Body", names(tidydb))
names(tidydb)<-gsub("Mag", "Magnitude", names(tidydb))
names(tidydb)<-gsub("^t", "Time", names(tidydb))
names(tidydb)<-gsub("^f", "Frequency", names(tidydb))
names(tidydb)<-gsub("tBody", "TimeBody", names(tidydb))
names(tidydb)<-gsub("-mean()", "Mean", names(tidydb), ignore.case = TRUE)
names(tidydb)<-gsub("-std()", "STD", names(tidydb), ignore.case = TRUE)
names(tidydb)<-gsub("-freq()", "Frequency", names(tidydb), ignore.case = TRUE)
names(tidydb)<-gsub("angle", "Angle", names(tidydb))
names(tidydb)<-gsub("gravity", "Gravity", names(tidydb))

#grouping with the subject and activity and 
requiredb <- tidydb %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(requiredb, "CleanedDB.txt", row.name=FALSE)