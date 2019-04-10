## This codebook will describe the data used in this project.

30 volunteers wore a smartphone that recorded various movement data while they performed 6 different activities such as walking and sleeping. These 30 volunteers are divided into a "test" group and a "train" group.

The movement data was recorded at a frequency of 128 readings per time window of 2.56 seconds. Each time window will overlap by 50%. These movement data are found under **"./UCI HAR Dataset/test/Inertial Signals"** for the "test" group and **"./UCI HAR Dataset/train/Inertial Signals"** for the "train" group. These movement data can be considered **unprocessed** raw data.

Using the readings, 561 different features can be calculated for each time window. One example of such a feature is "body acceleration in the X-axis". Another example of such a feature is "angular velocity in the y-axis". These features data are found under **"./UCI HAR Dataset/test/X_test.txt"** for the "test" group and **"./UCI HAR Dataset/train/X_train.txt"** for the "train" group. These features data can be considered **processed** raw data.

By combining "subject_test.txt", "y_test.txt" and "X_test.txt", one can get **processed** raw data set complete with subject ID and activity ID for the "test" group. This is the same for the "train group" i.e. combining "subject_train.txt", "y_train.txt" and "X_train.txt".

## Explaining each file

features.txt : names of the 561 features
activity_labels.txt : IDs and names for the 6 activities

**For files below, each row will represent an observation per time window per subject per activity. Each observation should have a subject ID, an activity ID and values for 561 features.**

X_train.txt : 7,352 observations of 561 features for 21 "train" volunteers
X_test.txt : 2,947 observations of 561 features for 9 "test" volunteers

subject_train.txt : IDs of 21 "train" volunteers for each of 7,352 observations
subject_test.txt : IDs of 9 "test" volunteers for each of 2,947 observations

y_train.txt : activity ID for each of 7,352 observations
y_test.txt : activity ID for each of 2,947 observations

**The analysis does not require the unprocessed raw data in the "Inertial Signals" folders.**

## Processing steps

- download, unzip and read all of the required files into data frames
- add column headers
- combine training and test sets into one
- remove feature columns that did not contain "mean()" or "std()"
- change the activity IDs into activity labels
- group the data by unique combinations of subject ID + activity
- for each group, calculate means for each of the 561 features
- output a summary table showing the means