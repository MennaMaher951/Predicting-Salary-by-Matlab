%% First 5 rows in data
% Display the first five rows in the data
if istable(SalaryData)
    disp('First five rows of the data:')
    head(SalaryData, 5)
end    

%% Handling the missing values
% checking if there exist any missing values
missing_values = any(ismissing(SalaryData(:,6)));
disp('The Missing Values');
disp(missing_values);

% Remove missing Values
data_cleaned = rmmissing(SalaryData);

disp(size(SalaryData));
disp(size(data_cleaned));

%% change the categorical data into numeric vlues

% convert Gender column to numeric values
gender = data_cleaned.Gender;
gender_numeric = grp2idx(gender);
data_cleaned.Gender = gender_numeric;

% convert EducationLevel column to numeric values
education = data_cleaned.EducationLevel;
education_numeric = grp2idx(education);
data_cleaned.EducationLevel = education_numeric;

% convert JobTitle column to numeric values
job_title = data_cleaned.JobTitle;
job_title_numeric = grp2idx(job_title);
data_cleaned.JobTitle = job_title_numeric;


%% Split the data
% Set the percentage of data for training
train_percentage = 0.6; % 60% for training, 40% for testing
% Randomly shuffle the indices
rng(42); % Set random seed for reproducibility
num_samples = size(data_cleaned, 1);
shuffled_indices = randperm(num_samples);
% Determine the number of samples for training and testing
num_train_samples = round(train_percentage * num_samples);
num_test_samples = num_samples - num_train_samples;
% Split the indices into training and testing sets
train_indices = shuffled_indices(1:num_train_samples);
test_indices = shuffled_indices(num_train_samples+1:end);
% Extract the training and testing data based on the indices
x_train = data_cleaned{train_indices, {'Age','EducationLevel','Gender','JobTitle','YearsOfExperience'}};
y_train = data_cleaned.Salary(train_indices);
x_test = data_cleaned{test_indices, {'Age','EducationLevel','Gender','JobTitle','YearsOfExperience'}};
y_test = data_cleaned.Salary(test_indices);

%% min-max normalization
% Perform min-max scaling for each feature in x_train and x_test
%x_train_normalized = normalize(x_train, 'range');
%x_test_normalized = normalize(x_test, 'range');

%% Linear Regression Model
% Linear Regression Model using normalized features
%LR_normalized = fitlm(x_train_normalized, y_train);
%LR_pred_normalized = predict(LR_normalized, x_test_normalized);

%% Linear Regression Model
% fitting the model 
LR = fitlm(x_train, y_train);
LR_pred = predict(LR, x_test);

%% R_Squared Error
disp(['Size of LR_pred: ', num2str(size(LR_pred))]);
disp(['Size of y_test: ', num2str(size(y_test))]);
disp(['NaNs in LR_pred: ', num2str(sum(isnan(LR_pred)))]);
disp(['NaNs in y_test: ', num2str(sum(isnan(y_test)))]);
disp(['NaNs in x_test: ', num2str(sum(isnan(x_test)))]);

SS_Residual = sum((y_test - LR_pred).^2);
SS_Total = sum((y_test - mean(y_test)).^2);
R2 = (1 - (SS_Residual / SS_Total))*100;
disp(['R-squared (R2) Score: ', num2str(R2)]);
