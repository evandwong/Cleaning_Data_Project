
##  Getting & Cleaning Data Course Project


### Summary

This repo completes in the Getting & Cleaning Data course project.

"run_analysis.R" is the only script.  It does the main work of the assignment.

"Project_Tidy_Data.txt" is the data output of the assignment.

"CodeBook.md" documents the contents of "Project_Tidy_Data.txt"

It is assumed for the sake of this exercise that the input data provided by Coursera is in the R working directory when the script is run.


### "run_analysis.R"

This script processes the given input data and creates the "Project_Tidy_Data.txt" output.  It completes the five points of the assignment slightly out of order for the sake logical cohesion.  In order, it

1. Reads & cleans descriptive variable names (Assignment part 4).
2. Creates a logical vector flagging our variables of interest (Assignment part 2).
3. Reads the large measurement data files, Subject IDs, and Activity Labels, and combines these files (both test and training) into a single data set (Assignment part 1).
4. Matches the descriptive activity names to the data set created in the prior step using the activity labels as a match key (Assignment part 3).
5. Computes the mean of each variable of interest within each combination of Subject ID and Activity Name (Assignment part 5).

Note that while the descriptive column names in the output file "Project_Tidy_Data.txt" are inherited from the input data, they now represent mean values, with each row representing a single combination of Subject ID and Activity Name.