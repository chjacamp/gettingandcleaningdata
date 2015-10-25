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

## REMINDER FOR GRADERS: PIPING (SEE SWIRL TUTORIAL) ALLOWS YOU TO PASS 
## AN OBJECT TO THE FUNCTION ON THE LEFT. PARENTHESES ARE NOT REQUIRED
## IF THERE EXISTS SOLELY (1) ARGUMENT.

test <- "./test/x_test.txt" %>% fread %>% tbl_df
test_activity <- "./test/y_test.txt" %>% fread
test_subject_id <- "./test/subject_test.txt" %>% fread

train <- "./train/x_train.txt" %>% fread %>% tbl_df
train_activity <- "./train/y_train.txt" %>% fread
train_subject_id <- "./train/subject_train.txt" %>% fread

##this one needs some work to function as column names - we
##need to transpose them into a row.
measurements <- 
  "features.txt" %>% 
  fread %>% 
  tbl_df %>% 
  t

##measurements still needs a little work
measurements <- measurements[2,]
measurements <- c("subjectID", "activity",measurements)

##bind us those col's
test <- bind_cols(test_subject_id, test_activity, test)
train <- bind_cols(train_subject_id, train_activity, train)

##add us those column names
colnames(test) <- measurements
colnames(train) <- measurements

all <- rbind(test, train)

##Create a list of duplicate column names from measurements
summer <- grepl("bandsEnergy", measurements)

##Remove duplicate columns from data frame
all <- all[!summer]

##Piping so easy that Mario might get bored - 
all %>% 
  tbl_df %>%
  arrange(subjectID, activity) %>%
  select(subjectID, activity, contains("mean"), contains("std")) %>%
  group_by(subjectID, activity) %>%
  summarise_each(funs(mean)) %>%
  print






