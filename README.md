# GetCleanDataProj
Repository for peer-assessed code and codebook for Getting and Cleaning Data Course Project.

run_analysis.R is a script that performs the following:

 * Downloads data from source
 * Unzips it into ~/GCDProj directory (created if it doesn't already exist)
 * Reads each file for Subject, X and Y, both from test and train data sets into data frames using read.csv
 * All data frames are merged and combined using rbind and cbind
 * Column variables are given meaningful names using sensible names for Subject and Activity and using feature names from features.txt
 * Uses grepl to retain only variables containing "mean" or "std" data, based on variable names
 * Uses activity_labels.txt to relabel activity IDs uuefully
 * Uses ddply (from plyr) to create a tidy data set with the average of each variable for each combination of activity and  subject. colMeans are used to calculate means on all observable variables.
 * Uses write.table to save the final tidy dataset as a text file named ~/GCDProj/tidydata.txt. 

