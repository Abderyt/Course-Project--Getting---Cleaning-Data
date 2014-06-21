## README.md

The code, run_analysis.R, is extensively commented.

The code is designed to run in the folder/directory where the provided data is located.

The data files are all text files.  Unix and Unix-like systems have a rich set of mature text manipulation and managements tools. Two of those tools, sed and cat, are used here to clean and manipulate the constituent data files.  Those tools are called via the R system() command. On windows machines the cygwin set provides similar capabilities.

The initial file cleaning steps are done to remove undesired, inconsistent spacing in the the data files and to increase the human readability of the feature.txt file. The modified features.txt file is saved as colNames.txt. The two data files are then concatenated to form a single file for the data, aggregateData.txt. The y_train.txt and y_test.txt file are concatenated to produce the acivities.txt file. The subject_train.txt and subject_test.txt files are concatenated to produce the subject.txt file. These steps facilitate the subsequent reading and manipulation of the files using the data.table library. The use of the data.table library is highly desirable due to the increased versatility of the data.table functions over those of the data frame. As side advantages the data.table functions improve speed of execution and generally use less memory.

All produced files where checked to insure complete data.  No missing data was found. The colNames.txt was found to have three sets of duplicate file names. Correcting the duplicates was left to process using R functions.

The aggregateData.txt, activities.txt, subject.txt and colNames.txt are then read as data tables using the data.table fread command.

The colName.txt file is then added to the aggregateData.txt to name the data columns.  The duplicateNameFix function, a modification of a file referenced in the discussion section of a previous Data Analysis course, is used to find and fix the noted duplicate file names. The newNames file is then set to be the column names of the aggregateDT data table.

The activities file is then modified to replace the numerical activity entries with man readable text entries. Then the activities and subjects are each added to the aggregrateDT file to become the 562 and 563 variables in each record observation.

Next the aggregateDT is subsetted to obtain a data table which contains the columns that are the mean and std of each measurement. Grep is used to get the column numbers of the mean and std columns.  These are used as an index to subset the aggregateDT data table; this is named the extractDT data table.

A double key,subjects and activities, is then set on the extract DT data table. The grouping and use of functions in the column selection to produce means for each activity for each subject. Here is the primary reason the previous work was done to allow the data.table library to be used.  One command produces the desired clean, tidy data table, meanDT. It has 180 records, 6 activity records for each of the 30 subjects.  This is saved to disk as a data.table.

A double key, subjects and activities, is then set on the extractDT data table. The grouping and use of functions in the column selection to produce means for each activity for each subject. Here is the primary reason the previous work was done to allow the data.table library to be used.  One command produces the desired clean, tidy data table, meanDT. It has 180 records, 6 activity records for each of the 30 subjects.  This is saved to disk as a data.table.

The last 7 lines of code are used to demonstrate an example of the contents of the meanDT data table. The meanDT data.tables is first removed from the work space, then fread from the saved file back into the work space. Several rows and columns of each are then read to stdout to show the results of having generated the data.table.




