# GettingAndCleaningData
Course Assignment By Haim Kotler, 12 May 2017

run_analysis.R contains a function names run_analysis(), which does the following:
1. read activities and features labels from files (assume files are in UCI HAR Dataset directory under working directoey)
2. read test and train databases, including the subjects, activities and feature results files
3. merge test and train data.
4. select part of the data that contain only mean and standard deviation results, into a new DB
5. aggregate the new db by subject and activity and calculate average on results (per subject and per activity)
6. write result to file - run_analysis_result.txt (also in this repo)

