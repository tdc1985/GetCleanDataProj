##Download and extract data sets
if(!file.exists("~/GCDProj")){dir.create("~/GCDProj")}
setwd("~/GCDProj")
library(downloader)
dataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile<-"data.zip"
#used dowloader package because of https issues
download(dataURL, zipFile, mode = "wb")
unzip(zipFile)



##Read all data sets
test.Subject <- read.table("~/GCDProj/UCI HAR Dataset/test/subject_test.txt",header = F, stringsAsFactors = F)
test.X <- read.table("~/GCDProj/UCI HAR Dataset/test/X_test.txt",
                    header = F, stringsAsFactors = F)
test.Y <- read.table("~/GCDProj/UCI HAR Dataset/test/y_test.txt",
                    header = F, stringsAsFactors = F)
train.Subject <- read.table("~/GCDProj/UCI HAR Dataset/train/subject_train.txt",
                           header = F, stringsAsFactors = F)
train.X <- read.table("~/GCDProj/UCI HAR Dataset/train/X_train.txt",
                     header = F, stringsAsFactors = F)
train.Y <- read.table("~/GCDProj/UCI HAR Dataset/train/y_train.txt",
                     header = F, stringsAsFactors = F)

##descriptive activity names
activities <- read.table("~/GCDProj/UCI HAR Dataset/activity_labels.txt", header = F, stringsAsFactors = F)

##features (col names) defined in features.txt so import that
feats <- read.table("~/GCDProj/UCI HAR Dataset/features.txt", header = F, stringsAsFactors = F)

##Each test table and each train table have same number of rows, so rows probably correspond, hence cbind
##rbind to combine the train and test tables
all.Data <- cbind(rbind(test.Subject, train.Subject),
                    rbind(test.Y, train.Y),
                    rbind(test.X, train.X))

##Give col names for the variables from Subject and Y
colnames(all.Data)[1:2] <- c("Subject", "Activity")

##Give col names for all other variables from X, coming from features.txt
colnames(all.Data)[3:563] <- feats[, 2]

##Extract only measurements on mean and standard deviation for each measurement. 

##Subset all.Data to only include variables that have "mean", "std", "Activity" or "Subject" 
##Inspection implied "meanFreq" remained, but these aren't strict means so removed in second grepl call
all.MeanStd <- all.Data[, grepl("mean()|std()|Activity|Subject", colnames(all.Data)) & !grepl("meanFreq", colnames(all.Data))]



##label the data with descriptive activity names.
all.MeanStd$Activity <- factor(all.MeanStd$Activity, levels = activities[, 1], labels = activities[, 2])


##Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
all.Tidy <- ddply(all.MeanStd, .(Subject, Activity),.fun=function(x){colMeans(x[,-c(1:2)])})

##write tidydata
write.table(all.Tidy, "~/GCDProj/tidydata.txt", row.names = FALSE)



