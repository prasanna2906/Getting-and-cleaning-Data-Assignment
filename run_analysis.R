library(dplyr)
library(data.table)
# Downloading the required files provided they havent been downloaded already
filename <- "dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Reading the files

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("no", "activity"))
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "no")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "no")


dfX <- rbind(x_train, x_test)
dfY <- rbind(y_train, y_test)
dfSub <- rbind(sub_train, sub_test)
dfMerged <- cbind(dfSub,dfX,dfY) # merged df

# Tidy dataframe
dfT <- select(dfMerged,subject, no, contains("mean"), contains("std"))

dfT$no <- activities[dfT$no,2]

# Getting the names of the Columns of the Tidy Dataframe and assigning it to a variable 'r'
r <- names(dfT)
r[2] <- "Activity"
r <- gsub("Acc", "Accelerometer",r)
r <- gsub("Gyro","Gyroscope",r)
r <- gsub("BodyBody", "Body", r)
r <- gsub("Mag", "Magnitude", r)
r <- gsub("^t", "Time", r)
r <- gsub("^f", "Frequency", r)
r <- gsub("tBody", "TimeBody", r)
r <- gsub("angle", "Angle", r)
r <- gsub("gravity", "Gravity", r)

# Changing the names of the Columns of the Tidy dataframe using 'r'
names(dfT) <- r

# Making the final dataframe and saving it into a text file
df.Final <- dfT %>%
  group_by(subject, Activity) %>%
  summarise_all(funs(mean))
write.table(df.Final, "Final_Dataframe.txt", row.name=FALSE)



