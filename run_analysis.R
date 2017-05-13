###############################################################
## Getting and Cleaning Data - Course Assignment
## By Haim Kotler, 12 May 2017
###############################################################

run_analysis <- function(){
    
    ## read activity and features labels
    activityLables <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
    features <- read.table(".\\UCI HAR Dataset\\features.txt")
    features[,2] <- gsub("\\()","", features[,2])
    
    ## read test data
    testDB <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
    testSubjects <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
    testActivity <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
    
    ## read train data
    trainDB <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
    trainSubjects <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
    trainActivity <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
    
    ##combine test and train data to a single data frame
    cmbDB <- rbind(testDB, trainDB)
    cmbSubjects <- rbind(testSubjects,trainSubjects)
    cmbActivity <- rbind(testActivity, trainActivity)
    
    ## add activity labels
    cmbActivity[,"label"] <- left_join(cmbActivity, activityLables ,by = "V1")[,2]
    
    ## merge subjects and activities into combined DB
    cmbDB <- data.frame(cmbSubjects[,1], cmbActivity[,2], cmbDB)
    colnames(cmbDB) <- c("subject", "activity", as.character(features[,2]))
    
    ## select columns that contain features of mean and standard deviation only
    colsFiltered <- colnames(cmbDB)[grepl("mean|std",colnames(cmbDB))]
    finalDB <- cmbDB[,c("subject", "activity",colsFiltered)]
    
    ## group DB by subjects an activities and calculate mean of feature columns
    groupFinalDB <- aggregate(finalDB[3:ncol(finalDB)], by = list(finalDB$subject, finalDB$activity), FUN  = mean)
    
    ## assign meaningfull names to columns
    colnames(groupFinalDB) <- c("subject", "activity", paste("Average_Of_",colnames(groupFinalDB)[3:ncol(groupFinalDB)],sep=""))
    groupFinalDB <- groupFinalDB[order(groupFinalDB$subject),]
    
    ## export DB to file
    write.table(groupFinalDB,file = "run_analysis_result.txt", row.names = FALSE)
}
