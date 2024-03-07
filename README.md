## Salary Data Preprocessing and Linear Regression
* This project performs data preprocessing and builds a linear regression model for predicting salaries based on features like age, education level, gender, job title, and years of experience by using MATLAB

*Data*
* SalaryData: containing the salary data. This data should be a table with features like 'Age', 'EducationLevel', 'Gender', 'JobTitle', 'YearsOfExperience', and 'Salary'.

*Steps*
* Exploring Data:

The script displays the first five rows of the data to get a quick glimpse.

* Handling Missing Values:

It checks for missing values in the data and removes any rows containing missing values.

*Feature Engineering:*

Categorical features like 'Gender', 'EducationLevel', and 'JobTitle' are converted into numerical values using grp2idx.

*Data Splitting:*

The data is randomly shuffled and split into training and testing sets with a 60/40 ratio (60% for training, 40% for testing).

*Feature Scaling (commented out):*

The script includes commented-out sections for performing min-max normalization on the training and testing data. You can uncomment these lines if you want to normalize the features.

*Linear Regression Model:*

A linear regression model is trained on the training data.

The model is then used to predict salaries on the testing data.

*Evaluation:*

R-squared error is calculated to evaluate the model's performance.
