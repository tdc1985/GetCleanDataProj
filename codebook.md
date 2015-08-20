---
layout: post
title: Course Project
author: Anthony Carter
date: 2015-08-20 22:53:28 +01:00
---

30 volunteers were observes performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, which are the factor levels in the Activity variable) wearing a Samsung Galaxy S II. Using its accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity measurements were recorded at 50Hz.  The obtained dataset has been randomly partitioned into two set - straining and test data.

Following transformation has been performed on this data:

   * Measurements, activities and subject IDs were merged into a single data set using rbind and cbind.
   * Variables (columns) were named sensibly and according to features.txt.
   * The data were subset using grepl to only include measurements on the mean and standard deviation for each measurement, i.e. omitting any observed variable not representing these statistics.
   * Activities were relabelled more descriptively using activity_labels.txt.
   * ddply (from plyr) with colMeans was used to tidy the dataset, summarising to averages of observations of each activity/subject combination
   * The tidy dataset was saved using write.table with row.names = FALSE

tidydata.txt is a textfile containing a table with the following 68 variables (the first two of which are identifiers and the rest observed variables) each with 180 observations. Each numeric variable has been averaged for each combination of Subject and Activity. It contains the following variables:

 * Subject                    : int   
 * Activity                   : Factor w/ 6 levels
 * tBodyAcc-mean()-X          : num   
 * tBodyAcc-mean()-Y          : num   
 * tBodyAcc-mean()-Z          : num   
 * tBodyAcc-std()-X           : num   
 * tBodyAcc-std()-Y           : num   
 * tBodyAcc-std()-Z           : num   
 * tGravityAcc-mean()-X       : num   
 * tGravityAcc-mean()-Y       : num   
 * tGravityAcc-mean()-Z       : num   
 * tGravityAcc-std()-X        : num   
 * tGravityAcc-std()-Y        : num   
 * tGravityAcc-std()-Z        : num   
 * tBodyAccJerk-mean()-X      : num   
 * tBodyAccJerk-mean()-Y      : num   
 * tBodyAccJerk-mean()-Z      : num   
 * tBodyAccJerk-std()-X       : num   
 * tBodyAccJerk-std()-Y       : num   
 * tBodyAccJerk-std()-Z       : num   
 * tBodyGyro-mean()-X         : num   
 * tBodyGyro-mean()-Y         : num   
 * tBodyGyro-mean()-Z         : num   
 * tBodyGyro-std()-X          : num   
 * tBodyGyro-std()-Y          : num   
 * tBodyGyro-std()-Z          : num   
 * tBodyGyroJerk-mean()-X     : num   
 * tBodyGyroJerk-mean()-Y     : num   
 * tBodyGyroJerk-mean()-Z     : num   
 * tBodyGyroJerk-std()-X      : num   
 * tBodyGyroJerk-std()-Y      : num   
 * tBodyGyroJerk-std()-Z      : num   
 * tBodyAccMag-mean()         : num   
 * tBodyAccMag-std()          : num   
 * tGravityAccMag-mean()      : num   
 * tGravityAccMag-std()       : num   
 * tBodyAccJerkMag-mean()     : num   
 * tBodyAccJerkMag-std()      : num   
 * tBodyGyroMag-mean()        : num   
 * tBodyGyroMag-std()         : num   
 * tBodyGyroJerkMag-mean()    : num   
 * tBodyGyroJerkMag-std()     : num   
 * fBodyAcc-mean()-X          : num   
 * fBodyAcc-mean()-Y          : num   
 * fBodyAcc-mean()-Z          : num   
 * fBodyAcc-std()-X           : num   
 * fBodyAcc-std()-Y           : num   
 * fBodyAcc-std()-Z           : num   
 * fBodyAccJerk-mean()-X      : num   
 * fBodyAccJerk-mean()-Y      : num   
 * fBodyAccJerk-mean()-Z      : num   
 * fBodyAccJerk-std()-X       : num   
 * fBodyAccJerk-std()-Y       : num   
 * fBodyAccJerk-std()-Z       : num   
 * fBodyGyro-mean()-X         : num   
 * fBodyGyro-mean()-Y         : num   
 * fBodyGyro-mean()-Z         : num   
 * fBodyGyro-std()-X          : num   
 * fBodyGyro-std()-Y          : num   
 * fBodyGyro-std()-Z          : num   
 * fBodyAccMag-mean()         : num   
 * fBodyAccMag-std()          : num   
 * fBodyBodyAccJerkMag-mean() : num   
 * fBodyBodyAccJerkMag-std()  : num   
 * fBodyBodyGyroMag-mean()    : num   
 * fBodyBodyGyroMag-std()     : num   
 * fBodyBodyGyroJerkMag-mean(): num   
 * fBodyBodyGyroJerkMag-std() : num   