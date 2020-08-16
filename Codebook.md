#CODEBOOK

This file describes the variables, the data, and any transformations or work that was performed to clean up the data.
The final result is in the file `Final_Dataframe.txt`

##Variable Names:
1. `features` - reads the `features.txt` file
2. `activities` - reads the `activity_labels.txt` file  
3. `sub_test` - reads the `subject_test.txt` file  
4. `x_test` - reads the `X_test.txt` file
5. `y_test` - reads the `y_test.txt` file
6. `sub_train` - reads the `subject_train.txt` file
7. `x_train` - reads the `X_train.txt` file
8. `y_train` - reads the `y_train.txt` file
9. `dfX` - data frame obtained by row binding the tables obtained from `x_train` and `x_test`.
10.`dfY` - data frame obtained by row binding the tables obtained from `y_train` and `y_test`. 
11. `dfSub` - data frame obtained by row binding the tables obtained from `sub_train` and `sub_test`.
12. `dfMerged` - merged data frame obtained by column binding the data frames `dfX`,`dfY`,`dfSub`.
13. `dfT` - Tidy Dataframe that contains the measurements on the mean and standard deviation for each measurement.
14. `r` - renamed variables using gsub() which are then used to rename the variable names of `dfT  
15. `df.Final`- independent tidy data set with the average of each variable for each activity and each subject.

Step-1: The dataset was downloaded and extracted to a folder called `UCI HAR Dataset`.
Step-2: The data was then read and assigned to the variables:
        1.`features`
        2. `activities`  
        3. `sub_test`  
        4. `x_test` 
        5. `y_test`
        6. `sub_train`
        7. `x_train`
        8. `y_train`

Step-3: The data was then merged and assigned to different variables: `dfX`,`dfY` ,`dfSub` & `dfMerged`.

Step-4: The Tidy dataframe `dfT` was made by extracting the measurements on the mean and standard deviation for each measurement.

Step-5: The tidy dataframe `dfT` was then renamed with proper activity names & descriptive variable names .

Step-6: The independent final tidy data frame `df.Final` with the average of each variable for each activity and each subject was obtained from 
        `dfT`
        
Step-7: The independent final tidy data frame `df.Final` is then written into a file called `Final_Dataframe.txt`






