gacd-pa
=======

Getting and Cleaning Data - Peer Assessment
=======

This codebook describes the process of creating a tidy data set based on the Human Activity Recognition Using Smartphones experiment (described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The purpose of this project is to perform the steps below (from the Peer Assessment project of the Getting and Cleaning Data course (https://class.coursera.org/getdata-002)):<cite>
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</cite>

The data needed for this project is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

In order to run the run_analyis.R script, the data must be unzipped and placed in the working directory for R. The folder structure should be left alone after unzipping, with the top folder, UCI HAR Dataset, residing in the working directory.

Running run_analyis.R will perform the following steps:
* read in all necessary files:
    * ./UCI HAR Dataset/features.txt - column names
    * ./UCI HAR Dataset/train/subject_train.txt - subject numbers for train data
    * ./UCI HAR Dataset/train/x_train.txt - data collected for train data
    * ./UCI HAR Dataset/train/y_train.txt - activity number for train data (1 to 1 with x_train)
    * ./UCI HAR Dataset/test/subject_test.txt - subject numbers for test data
    * ./UCI HAR Dataset/test/x_test.txt - data collected for test data
    * ./UCI HAR Dataset/test/y_test.txt - activity number for test data (1 to 1 with x_test)
* combine all data into single data frame with correct column names
* change "activity" column to descriptive names:
    * 1 - "WALKING"
    * 2 - "WALKING_UPSTAIRS"
    * 3 - "WALKING_DOWNSTAIRS"
    * 4 - "SITTING"
    * 5 - "STANDING"
    * 6 - "LAYING"
* create final_data, a subset of the combined data, only using the columns with "mean()" or "std()" in the name.
* create tidy_data, a <cite>tidy data set with the average of each variable for each activity and each subject.</cite>
* export the tidy_data set to ./tidy_data.csv

Please see the following for further information on the data (in the extracted original extracted data in the working directory)
* ./UCI HAR Dataset/README.txt
* ./UCI HAR Dataset/features.txt
* ./UCI HAR Dataset/features_info.txt