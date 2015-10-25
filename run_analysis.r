##  Assume data has been loaded into working directory per assignment
##  instructions. 

##  Read data into R and pipe to DPLYR's tbl_df() for further operations.
##  If you haven't seen the pipe operator ( %>% ) before, I recommended the
##  swirl tutorials.
test <- "./test/x_test.txt" %>% fread %>% tbl_df
test_activity <- "./test/y_test.txt" %>% fread
test_subject_id <- "./test/subject_test.txt" %>% fread

train <- "./train/x_train.txt" %>% fread %>% tbl_df
train_activity <- "./train/y_train.txt" %>% fread
train_subject_id <- "./train/subject_train.txt" %>% fread

## Feature.txt functions as descriptive variable names - we
## need to transpose them into a row and add subjectID and activity.
measurements <- 
  "features.txt" %>% 
  fread %>% 
  tbl_df %>% 
  t

measurements <- measurements[2,]
measurements <- c("subjectID", "activity",measurements)

## Binds the columns
test <- bind_cols(test_subject_id, test_activity, test)
train <- bind_cols(train_subject_id, train_activity, train)

## Adds column names
colnames(test) <- measurements
colnames(train) <- measurements

## Merges the training and test sets
all <- rbind(test, train)

## Creates a boolean vector to remove problematic "bandsEnergy" measurements.
summer <- grepl("bandsEnergy", measurements)
all <- all[!summer]

## Select any measurement columns containing mean or standard deviations.
## Group by subjectID and activity, summarise the other columns by their
## means.
all %>% 
  tbl_df %>%
  arrange(subjectID, activity) %>%
  select(subjectID, activity, contains("mean"), contains("std")) %>%
  group_by(subjectID, activity) %>%
  summarise_each(funs(mean)) %>%
  write.table(file="../gettingandcleaningdata.txt", row.names=F)