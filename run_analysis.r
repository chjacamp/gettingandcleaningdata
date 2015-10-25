## You should create one R script called run_analysis.R that does the 
## following. 
## 1)Merges the training and the test sets to create one data set.
## 2)Extracts only the measurements on the mean and standard deviation 
##  for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent 
##    tidy data set with the average of each variable for each activity
##    and each subject.

##  Assume data has been loaded into working directory per assignment
##  instructions. 

##  Read data into R and pipe to DPLYR's tbl_df() for further operations.

test <- fread("UCI\ HAR\ Dataset\test\x_test.txt")
test %>% tbl_df()

train <- fread("UCI\ HAR\ Dataset\train\x_train.txt")
train %>% tbl_df()




