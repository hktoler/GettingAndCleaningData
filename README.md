# GettingAndCleaningData
Course Assignment By Haim Kotler, 12 May 2017

run_analysis.R contains a funtion names run_analysis()m which does the following:
1. read activities and features from files ( files are in UCI HAR Dataset directory under working directoey)
2. read test and train databases, including the subjects, activities and feature results files
3. merge test and train data.
4. select part of the data that contain only mean and standard deviation results, into a new DB
5. aggregate the new db by subject and activity and calculate average on results (per subject and per activity)
6. write result to file - run_analysis_result.txt

Code book for results file:
1. subject - number of test subject (1 to 30)
2. activity - Activity label (WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)
3. rest of the columns begining with "Avergae_Of_" (e.g "Average_Of_tBodyAcc-mean-X", "Average_Of_tBodyAccMag-std") refer to avreage means and standard devaiation taken on these measurments ('XYZ' is used to denote 3-axial signals in the X, Y and Z directions):
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
