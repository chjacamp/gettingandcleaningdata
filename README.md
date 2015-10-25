---
title: "README"
author: "Christopher Campbell"
date: "October 25, 2015"
output: html_document
---


#Getting and Cleaning Data Coursera#

##An tidy data set created from the Human Activity Recognition Using Smartphones Data Set##
##Hosted by the Machine Learning Repository, http://archive.ics.uci.edu/ml/index.html.

###Background:

The idea of this data set was to record movement data from Samsung phones about human activities such as standing, walking, sitting, etc... and then build a prediction model
from the data.

###Goals

The script, run_analysis.r, attempts to create a tidy data set from the available data. The final result will be one row or record for each subject and each activity. The corrosponding data will be the average of each measurement relating to mean or standard deviation.

###Method

1) Read the data into R using fread of the data.table package. Assume the data is in the working directory and unzipped. Wrap the main data frames in tbl_df of the DPLYR package for further operations.
2) Bind the data into appropriate columns and rows.
3) Use DPLYR verbs to select the measurements relating to standard deviation and mean, and to summarize this data by providing the mean of each measurement per subject per activity.

###Results

The script results in a txt file containing a tidy data set with one record containing the mean of measurements relating to mean and standard deviation per each subject per each activity. 


###Citation:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

Data.table package at:
https://github.com/Rdatatable/data.table

DPLYR package at:
https://github.com/hadley/dplyr