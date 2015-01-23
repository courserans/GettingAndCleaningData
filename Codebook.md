## GettingAndCleaningData : CourseProject : CodeBook.

### 1. Information about the Variables

##### (Column Name : Datatype : Possible values)

1. SubjectID                  : integer :  ( 1 to 30 )
2. ActivityDesc               : Character : (LAYING, SITTING,STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
3. AvgtBodyAccmeanX           : numeric  
4. AvgtBodyAccmeanY           : numeric  
5. AvgtBodyAccmeanZ           : numeric  
6. AvgtBodyAccstdX            : numeric 
7. AvgtBodyAccstdY            : numeric  
8. AvgtBodyAccstdZ            : numeric  
9. AvgtGravityAccmeanX        : numeric  
10. AvgtGravityAccmeanY        : numeric  
11. AvgtGravityAccmeanZ        : numeric  
12. AvgtGravityAccstdX         : numeric  
13. AvgtGravityAccstdY         : numeric  
14. AvgtGravityAccstdZ         : numeric  
15. AvgtBodyAccJerkmeanX       : numeric  
16. AvgtBodyAccJerkmeanY       : numeric  
17. AvgtBodyAccJerkmeanZ       : numeric  
18. AvgtBodyAccJerkstdX        : numeric  
19. AvgtBodyAccJerkstdY        : numeric  
20. AvgtBodyAccJerkstdZ        : numeric  
21. AvgtBodyGyromeanX          : numeric  
22. AvgtBodyGyromeanY          : numeric  
23. AvgtBodyGyromeanZ          : numeric  
24. AvgtBodyGyrostdX           : numeric  
25. AvgtBodyGyrostdY           : numeric  
26. AvgtBodyGyrostdZ           : numeric  
27. AvgtBodyGyroJerkmeanX      : numeric  
28. AvgtBodyGyroJerkmeanY      : numeric  
29. AvgtBodyGyroJerkmeanZ      : numeric  
30. AvgtBodyGyroJerkstdX       : numeric  
31. AvgtBodyGyroJerkstdY       : numeric  
32. AvgtBodyGyroJerkstdZ       : numeric  
33. AvgtBodyAccMagmean         : numeric  
34. AvgtBodyAccMagstd          : numeric  
35. AvgtGravityAccMagmean      : numeric  
36. AvgtGravityAccMagstd       : numeric  
37. AvgtBodyAccJerkMagmean     : numeric  
38. AvgtBodyAccJerkMagstd      : numeric  
39. AvgtBodyGyroMagmean        : numeric  
40. AvgtBodyGyroMagstd         : numeric 
41. AvgtBodyGyroJerkMagmean    : numeric  
42. AvgtBodyGyroJerkMagstd     : numeric  
43. AvgfBodyAccmeanX           : numeric  
44. AvgfBodyAccmeanY           : numeric  
45. AvgfBodyAccmeanZ           : numeric 
46. AvgfBodyAccstdX            : numeric  
47. AvgfBodyAccstdY            : numeric  
48. AvgfBodyAccstdZ            : numeric 
49. AvgfBodyAccJerkmeanX       : numeric  
50. AvgfBodyAccJerkmeanY       : numeric  
51. AvgfBodyAccJerkmeanZ       : numeric  
52. AvgfBodyAccJerkstdX        : numeric  
53. AvgfBodyAccJerkstdY        : numeric 
54. AvgfBodyAccJerkstdZ        : numeric  
55. AvgfBodyGyromeanX          : numeric  
56. AvgfBodyGyromeanY          : numeric  
57. AvgfBodyGyromeanZ          : numeric  
58. AvgfBodyGyrostdX           : numeric  
59. AvgfBodyGyrostdY           : numeric  
60. AvgfBodyGyrostdZ           : numeric  
61. AvgfBodyAccMagmean         : numeric  
62. AvgfBodyAccMagstd          : numeric  
63. AvgfBodyBodyAccJerkMagmean : numeric 
64. AvgfBodyBodyAccJerkMagstd  : numeric
65. AvgfBodyBodyGyroMagmean    : numeric
66. AvgfBodyBodyGyroMagstd     : numeric
67. AvgfBodyBodyGyroJerkMagmean: numeric
68. AvgfBodyBodyGyroJerkMagstd : numeric  

For a description of the column Names beginning with Avg and the process of how the data was arrived please refer section D & E.  Avg stands for Average. 

### 2. Tidy data set 
    
- file format : ascii text
- file name   : tidy.txt
- Column Name separator : " "


### 3. Experimental Design approach 

The tidy data set was arrived by applying the following steps on the raw data located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Description of the original data set in section ('Acknowledgement') 

1.  The training and the test sets was merged from the below files to create one data set.
    - 'features_info.txt'
    - 'features.txt': 
    - 'activity_labels.txt'
    - 'train/X_train.txt'
    - 'train/y_train.txt'
    - 'test/X_test.txt'
    - 'test/y_test.txt'
    - The inertial signals files were excluded in the merge. 
2. The string marker mean() and std() was used to arrive at the subset of features(refer features.txt for the list of 561 features )in the tidy data set. These subset of features correspond to the 66 column names in the tidy data set. Column Names beginning with Avg.   
3. The values in the 66 independent tidy data are the average of each variable for each activityDesc and each subjectID for a given feature measurement from the original dataset.
4. The new column lables were arrived at by Appending Avg and removing "-" and () from the orignial feature names. Avg stands for average.


###  4. Acknowledgement - Original Data set.

- Human Activity Recognition Using Smartphones Dataset Version 1.0
- Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
- Smartlab - Non Linear Complex Systems Laboratory
- DITEN - Universit? degli Studi di Genova.
- Via Opera Pia 11A, I-16145, Genoa, Italy.
- activityrecognition@smartlab.ws
- www.smartlab.ws
- location : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##### The dataset includes the following files:


- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

***
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
