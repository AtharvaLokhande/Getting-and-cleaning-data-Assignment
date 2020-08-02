---
title: "Codebook"
author: "You"
date: "8/2/2020"
output: pdf_document
---

## R Markdown

Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

1. loded the data set in the drive E: of the computer

loded the given dataset into 
features from features.txt
activities from activity_labels.txt

subject_test from test/subject_test.txt
x_test from test/X_test.txt
y_test from test/y_test.txt 

subject_train from test/subject_train.txt
x_train from test/X_train.txt 
y_train from test/y_train.txt 

2. merged data using
rbind(x_test,xtrain)
rbind(y_test,y_train)
and the joining subject, mergeY, mergeX using Cbind

4. Selecting only mean and standard dev using "select" function
storede in tidydb

5. changed the accronims to its understandable formats
  Acc  changed to Accelerometer
  Gyro  changed to Gyroscope
  BodyBody  changed to Body
  Mag  changed to Magnitude
  character f  changed to Frequency
  character t  changed to Time

6.from the tidydb
finally averaged using group_by function with subject and activity 
stored its value in requiredb
the answer is stored in CleanedDB.txt file
  

  
  
