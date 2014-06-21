
library(data.table)

# This is a 2 line set of regular expressions that are 
#      passed to sed to remove the 2 spaces at the beginning of
#      the data sets and then changes all column spacing to a single space.
#      This action facilitates the reading to the files into a data table.
write("/^[ ]*/s///\n/  /s// /g","dataCmds.txt")

# This line cleans the training data
system("sed -f dataCmds.txt train/X_train.txt > trainData.txt")

# This line cleans the testing data
system("sed -f dataCmds.txt test/X_test.txt > testData.txt")

# This line concatenates the two data files into a single file
system("cat trainData.txt testData.txt > aggregateData.txt")

# This is a 7 line set of regular expressions that are passed to
#     sed to do the following to the features.txt file
#         Remove empty parenthesis
#         Replace commas with periods
#         Replace dashes with periods
#         Replace the fBody abbreviation at the beginning of names with the string freqBody
#         Replace the tBody abbreviation at the beginning of names with the string timeBody
#         Replace the tGravity abbreviation at the beginning of names with the string timeGravity
#         Remove a stray right paraenthesis in line 556	 
write("/([ ]*)/s///g\n/,/s//./g\n/-/s//./g\n/fBody/s//freqBody/\n/tBody/s//timeBody/\n/tGravity/s//timeGravity/\n556 s/n)./n./","featureCmds.txt")

# This executes the cleaning of the feature.txt file and produces a the colNames.txt file
system("sed -f featureCmds.txt features.txt > colNames.txt")

# These two lines concatenate the two subject and activities files to single 10299
#     line subject.txt and activities.txt files
system("cat train/subject_train.txt test/subject_test.txt > subjects.txt")
system("cat train/y_train.txt test/y_test.txt > activities.txt")

# Now get and read the single aggregated data file.
aggregateDT<-fread("aggregateData.txt")

# Get and read the activities file
activities<-fread("activities.txt")

# Get and read the subject file
subjects<-fread("subjects.txt")

# Get the column names.
colNamesDT<-fread("colNames.txt")
colNames<-colNamesDT[,V2]

# Set the column names for the aggregate data file
setnames(aggregateDT,colNames)

# A function to find and fix duplicate column names in a data frame 
#      Since a data.table is classed as both a data.table and a date.frame
#      this code is appropriate.
duplicateNamesFix<-function(dataFrame){
  currentNames<-names(dataFrame)
  currentNamesDuplicates<-names(table(currentNames)[table(currentNames)>1])
  nameVector<-character()
  for(i in seq_along(currentNames)){
    nameVector[i]<-currentNames[i];
    if( !(nameVector[i] %in% currentNamesDuplicates) ){
      names(nameVector)[i]<-currentNames[i];
    } else {
      j<-1;
      repeat {
        newName<-paste(currentNames[i],letters[j],sep=".");
        if(is.na(nameVector[newName])) break;
        j<-j+1;
      }
      names(nameVector)[i]<-newName;
    }
  }
  names(nameVector);
}

# Find and fix duplicates in the column name file and
#     then set the names for the data file
newNames<-duplicateNamesFix(aggregateDT)
setnames(aggregateDT,newNames)

# The activities_labels.txt file has this sequence of activities associated
#     with the numbers 1 through 6. The formatting of the file is not
#     consistent with the the formatting used in the rest of this
#     data table.  Rather than using a several lines of code to correct the 
#     formatting, it is more straight forward to simply use the following
#     to get the correctly formatted activity vector.
#     This could and should be done in a better way.
activityVector<-c("Walking","WalkingUpStairs","WalkingDownStairs","Sitting","Standing","Laying")
for(i in 1:6) {
	activities[activities==i]<-activityVector[i]
}

# The following 2 lines add the activities and subjects columns to the table;
#     it now has 563 columns.  The table is clean and ready for analytic work.
aggregateDT[,activities:=activities]
aggregateDT[,subjects:=subjects]
colNames<-names(aggregateDT)

# Gets the column numbers of the columns that contain the mean, std, activities, and subjects.
indexExtractColumnsDT<-sort(c(grep("\\bmean\\b",colNames),grep("\\bstd\\b",colNames),grep("^activities|subjects",colNames)))

# Subsets the aggregateDT to the extractDT the contains means and std columns.
extractDT<-aggregateDT[,indexExtractColumnsDT,with=FALSE]

# Sets a double key on the extractDT data table
setkey(extractDT,subjects,activities)

# The key is then used to extract the mean of each variable for each subject,
#     thus producing the desired second, independent tidy data table
meanDT<-extractDT[,lapply(.SD,mean),by=list(subjects,activities)]

# Modify the column names to reflect the variable contents
meanDTColNames<-names(meanDT)
meanDTColNames<-sub('^',"Mean\\.",meanDTColNames)
meanDTColNames<-sub('^Mean\\.subjects',"subjects",meanDTColNames)
meanDTColNames<-sub('^Mean\\.activities',"activities",meanDTColNames)

# Set the modified column names
setnames(meanDT,meanDTColNames)

# Now write the table to a file.  The meanDT data.table is the desired
#     ovjective of this code.
write.table(meanDT,"meanDT.txt",row.names=FALSE)

# The following is Demonstration code.

workSpace<-ls()
if("meanDT" %in% workSpace){rm(meanDT,workSpace)}
colNums<-c(1:3,68)
rowNums<-c(1:12,180)
meanDT<-fread("meanDT.txt")
dim(meanDT)
meanDT[rowNums,colNums,with=FALSE]

#  This produces the first 12 and the last row of columns 1 through 3 and 68, the last column
#     subjects        activities Mean.timeBodyAcc.mean.X Mean.freqBodyBodyGyroJerkMag.std
#  1:        1            Laying               0.2215982                       -0.9326607
#  2:        1           Sitting               0.2612376                       -0.9870496
#  3:        1          Standing               0.2789176                       -0.9946711
#  4:        1           Walking               0.2773308                       -0.3816019
#  5:        1 WalkingDownStairs               0.2891883                       -0.3919199
#  6:        1   WalkingUpStairs               0.2554617                       -0.6939305
#  7:        2            Laying               0.2813734                       -0.9894927
#  8:        2           Sitting               0.2770874                       -0.9896329
#  9:        2          Standing               0.2779115                       -0.9777543
# 10:        2           Walking               0.2764266                       -0.5581046
# 11:        2 WalkingDownStairs               0.2776153                       -0.3436990
# 12:        2   WalkingUpStairs               0.2471648                       -0.6218202
# 13:       30   WalkingUpStairs               0.2714156                       -0.7913494
