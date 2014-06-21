##CodeBook.md

The meanDT data.table was produced via subsetting a much larger data.table aggregateDT. meanDT is dimensioned 
at 180 68; aggregateDT is dimensioned at 10299 563.   

The columns (variables) of meanDT are named as follows:  

 1  subjects    
 2  activities   
 3  Mean.timeBodyAcc.mean.X      
 4  Mean.timeBodyAcc.mean.Y  
 5  Mean.timeBodyAcc.mean.Z   
 6  Mean.timeBodyAcc.std.X          
 7  Mean.timeBodyAcc.std.Y           
 8  Mean.timeBodyAcc.std.Z   
 9  Mean.timeGravityAcc.mean.X  
 10 Mean.timeGravityAcc.mean.Y    
 11 Mean.timeGravityAcc.mean.Z   
 12 Mean.timeGravityAcc.std.X        
 13 Mean.timeGravityAcc.std.Y     
 14 Mean.timeGravityAcc.std.Z       
 15 Mean.timeBodyAccJerk.mean.X          
 16 Mean.timeBodyAccJerk.mean.Y    
 17 Mean.timeBodyAccJerk.mean.Z     
 18 Mean.timeBodyAccJerk.std.X       
 19 Mean.timeBodyAccJerk.std.Y    
 20 Mean.timeBodyAccJerk.std.Z   
 21 Mean.timeBodyGyro.mean.X         
 22 Mean.timeBodyGyro.mean.Y    
 23 Mean.timeBodyGyro.mean.Z    
 24 Mean.timeBodyGyro.std.X          
 25 Mean.timeBodyGyro.std.Y     
 26 Mean.timeBodyGyro.std.Z   
 27 Mean.timeBodyGyroJerk.mean.X       
 28 Mean.timeBodyGyroJerk.mean.Y   
 29 Mean.timeBodyGyroJerk.mean.Z    
 30 Mean.timeBodyGyroJerk.std.X      
 31 Mean.timeBodyGyroJerk.std.Y   
 32 Mean.timeBodyGyroJerk.std.Z   
 33 Mean.timeBodyAccMag.mean         
 34 Mean.timeBodyAccMag.std     
 35 Mean.timeGravityAccMag.mean    
 36 Mean.timeGravityAccMag.std       
 37 Mean.timeBodyAccJerkMag.mean    
 38 Mean.timeBodyAccJerkMag.std    
 39 Mean.timeBodyGyroMag.mean        
 40 Mean.timeBodyGyroMag.std    
 41 Mean.timeBodyGyroJerkMag.mean   
 42 Mean.timeBodyGyroJerkMag.std     
 43 Mean.freqBodyAcc.mean.X     
 44 Mean.freqBodyAcc.mean.Y      
 45 Mean.freqBodyAcc.mean.Z          
 46 Mean.freqBodyAcc.std.X      
 47 Mean.freqBodyAcc.std.Y    
 48 Mean.freqBodyAcc.std.Z           
 49 Mean.freqBodyAccJerk.mean.X    
 50 Mean.freqBodyAccJerk.mean.Y   
 51 Mean.freqBodyAccJerk.mean.Z      
 52 Mean.freqBodyAccJerk.std.X    
 53 Mean.freqBodyAccJerk.std.Y   
 54 Mean.freqBodyAccJerk.std.Z       
 55 Mean.freqBodyGyro.mean.X     
 56 Mean.freqBodyGyro.mean.Y    
 57 Mean.freqBodyGyro.mean.Z         
 58 Mean.freqBodyGyro.std.X    
 59 Mean.freqBodyGyro.std.Y   
 60 Mean.freqBodyGyro.std.Z          
 61 Mean.freqBodyAccMag.mean    
 62 Mean.freqBodyAccMag.std      
 63 Mean.freqBodyBodyAccJerkMag.mean   
 64 Mean.freqBodyBodyAccJerkMag.std    
 65 Mean.freqBodyBodyGyroMag.mean  
 66 Mean.freqBodyBodyGyroMag.std       
 67 Mean.freqBodyBodyGyroJerkMag.mean     
 68 Mean.freqBodyBodyGyroJerkMag.std   

The subjects column contains numbers identifying 1 of the 30 subjects who participated in the events that were 
used to create the data. The activities column contains 1 of 6 different activities the subjects participated 
in to generate the data. Each of the remaining 66 columns shows the mean of each activity for each subject for
the indicated variable. So there are 6 records for each of the 30 subjects,thus the 180 rows.

Each of the variable names reference a group of similarly named variables in the original data.table, aggregateDT. The
meanDT variables are means of two descriptive statistics for each referenced group in the aggregateDT. The aggregateDT
variables are described by the original researchers below in paragraphs 1 through 6.

1. The variables included in this database come from the accelerometer and gyroscope 3-axial raw signals 
Mean.timeAcc.XYZ and Mean.timeGyro.XYZ. These time domain signals were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (Mean.timeBodyAcc.XYZ and Mean.timeGravityAcc.XYZ) using another low pass 
Butterworth filter with a corner frequency of 0.3 Hz. 

2. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
(timeBodyAccJerk.XYZ and timeBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were 
calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, 
timeBodyGyroJerkMag). 

3. Finally a Fast Fourier Transform was applied to some of these signals producing freqBodyAcc.XYZ, 
freqBodyAccJerk.XYZ, freqBodyGyro.XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. 

4. These signals were subsequently used to estimate variables for each pattern:  
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.   
timeBodyAcc.XYZ   
timeGravityAcc.XYZ   
timeBodyAccJerk.XYZ   
timeBodyGyro.XYZ   
timeBodyGyroJerk.XYZ   
timeBodyAccMag   
timeGravityAccMag   
timeBodyAccJerkMag   
timeBodyGyroMag   
timeBodyGyroJerkMag   
freqBodyAcc.XYZ   
freqBodyAccJerk.XYZ   
freqBodyGyro.XYZ   
freqBodyAccMag   
freqBodyAccJerkMag   
freqBodyGyroMag   
freqBodyGyroJerkMag   

5. The set of variables that were estimated from these signals are:   
mean: Mean value   
std: Standard deviation   
mad: Median absolute deviation   
max: Largest value in array   
min: Smallest value in array   
sma: Signal magnitude area   
energy: Energy measure. Sum of the squares divided by the number of values   
iqr: Interquartile range   
entropy: Signal entropy    
arCoeff: Autorregresion coefficients with Burg order equal to 4   
correlation: correlation coefficient between two signals   
maxInds: index of the frequency component with largest magnitude   
meanFreq: Weighted average of the frequency components to obtain a mean frequency   
skewness: skewness of the frequency domain signal   
kurtosis: kurtosis of the frequency domain signal    
bandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window   
angle: Angle between to vectors     

6. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle 
variable:    
gravityMean   
timeBodyAccMean   
timeBodyAccJerkMean     
timeBodyGyroMean   
timeBodyGyroJerkMean   
