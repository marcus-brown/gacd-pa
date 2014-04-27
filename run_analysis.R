# read in all necessary files
features = read.table("./UCI HAR Dataset/features.txt")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train = read.table("./UCI HAR Dataset/train/x_train.txt")
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test = read.table("./UCI HAR Dataset/test/x_test.txt")
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")

#combine and name readings
data = rbind(x_train, x_test)
names(data) = features[,2]

#combine and name activities
activity = rbind(y_train, y_test)
names(activity) = "activity"

#combine and name subjects
subject = rbind(subject_train, subject_test)
names(subject) = "subject"

# combine all data
combined_data = cbind(subject, activity, data)

# change "activity" column to descriptive names
combined_data$activity = factor(combined_data$activity, labels=c("WALKING",
                                                           "WALKING_UPSTAIRS",
                                                           "WALKING_DOWNSTAIRS",
                                                           "SITTING",
                                                           "STANDING",
                                                           "LAYING"))

# build a regex expression to select the mean() and std() columns
# two escape characters are needed, one for R and one for regex
regex_mean_std = "mean\\(\\)|std\\(\\)"

# create vector of desired column names
mean_std = as.character(features[grepl(regex_mean_std, features$V2),2])

# final data is subset of combines data with meand and standard deviations only
final_data = subset(combined_data, select=c("subject", "activity", mean_std))

# get means per subject and activity
subject_split = split(final_data[,-c(1:2)], list(final_data$subject, final_data$activity))
subject_means = sapply(subject_split, colMeans)

# convert list to an data.frame (and transpose)
# extract correct subject and activity data, combine and export
tidy_data_means = data.frame(t(subject_means))
subject_activity = t(data.frame(strsplit(rownames(tidy_data_means), ".", fixed=TRUE)))
tidy_data = cbind(subject_activity, tidy_data_means)
names(tidy_data) = names(final_data)
write.csv(tidy_data, "tidy_data.csv", row.names=FALSE)