## Submitting assignment for "Getting and Cleaning Data"

**The "Human Activity Recognition Using Smartphones" data set contains several files related to each other that should be put together to form a complete set of data.**

These 3 files below are variables or columns of the "test" group and they have the same number of rows (2,947 observations) and they should be combined side by side to form a table for "test" group.
- "subject_test.txt" : one column showing subject ID
- "y_test.txt" : one column showing activity ID
- "X_test.txt" : many columns containing values of another 561 variables

These 3 files below are variables or columns of the "train" group and they have the same number of rows (7,352 observations) and they should be combined side by side to form a table for "train" group.
- "subject_train.txt" : one column showing subject ID
- "y_train.txt" : one column showing activity ID
- "X_train.txt" : many columns containing values of another 561 variables

2nd column of "features.txt" contains column labels for the 561 variables.
2nd column of "activity_labels.txt" contains factor labels for various values of activity ID.

**The R script "run_analysis.R" will first download the required data set and unzip it. It will then combine the files as described above into a complete data table. This complete data table will contain multiple values for a particular subject for a particular activity for a particular variable. The second part of the R script will then summarize the complete data table to produce a single mean for each variable for each activity for each subject. The summary table will be output into "tidy_data.txt".**