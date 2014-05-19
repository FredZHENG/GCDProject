Symmary of Human Activity Recognition Using Smartphones Dataset
====================================================
## Source of Reference Dataset: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit? degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws

## Description
The original dataset records the experimental data from 30 volunteers between 19 and 48. The experiment recorded a series of data regarding the body acceleration, gravity acceleration when they perform different activities. This dataset summarizes the data by taking the mean of each feature, grouped by the subjects and activities.

## Data Cleaning Process
  - **Combine the training and test datasets**
   1. Combine the training and test datasets of class variables y  
   2. Replace numbers with activity labels (walking, sitting etc.)  
   2. Combine the training and test datasets of feature variable X  
   3. Combine the training and test datasets of subjects
   
  - **Subset the data to include only the mean and standard deviation of variables**
   1. Import features
   2. subset the X variables that include the "mean" or "std" in the feature names.
   
  - **Merge and average by subjects and activities**
   1. Combine the X, y, and subjects datasets
   2. Melt the datasets according to subjects and activities
   3. Cast back using mean function to get the mean of each variable
   4. change names of these variables
   
## Variables
  The two categorical variables are the **subjects** and the **activities**, which could serve as the identifier of each row.  
  
  The two main features of the variables are the time and frequency. The frequency measures are described with the term "Frequency" in the variable name, and the remaining variables describe the time. Within each category, the following measures are recorded by accelerometer or gyroscope.
  * **_Body Acceleration Signal_** of X, Y, and Z direction
  * **_Gravity Acceleration Signal_** of X, Y, and Z direction
  * **_Body Linear Acceleration Signal_** of X, Y, and Z direction
  * **_Angular Velocity Signal_** of X, Y, and Z direction
  * **_Body Jerk Signal_** of X, Y, and Z direction
  
  The normalized **mean** and the **standard deviation** of each components were taken for both time and frequenccy measures, and the **weighted average** was taken for frequency components only.