# Brain-Stroke-Prediction

1.	Project Title:    Brain Strokes Prediction
2.	Data Set Name:  brain_stroke.csv
3.	Data set Link:    https://www.kaggle.com/datasets/jillanisofttech/brain-stroke-dataset
4.	Objective:   Brain Stroke is the second leading cause of death worldwide and remains an important health burden both for the individuals and for the national healthcare systems. Potentially modifiable risk factors for stroke include hypertension, heart disease, smoking status, residence type, work type, gender, bmi, glucose level and age. Therefore, the goal of our project is to apply principles of data science over large existing data sets to effectively predict brain stroke based on potentially modifiable risk factors. 
5.	Project Description:   The dataset for brain stroke prediction is from Kaggle. Our dataset contains total 4981 individual patient’s information of which 2074 and are male and 2907 are female patient. The dataset contains total of 11 features and they are as follows 'gender','age','hypertension', heart_disease', 'ever_married', 'work_type', 'Residence_type', 'avg_glucose_level', 'bmi', 'smoking_status' and 'stroke'. The output column stroke has the values either ‘1’ or ‘0’. The value '0' indicates no stroke risk detected, whereas the value '1' indicates a possible risk of stroke. This dataset is highly imbalanced as the possibility of '0' in the output column ('stroke') outweighs that of '1' in the same column. Only 248 rows have the value '1' whereas 4733 rows have the value '0' in the stroke column. The dataset chosen for the task of stroke prediction is highly imbalanced. 


Attribute Name 	Type	Description
gender	String literal
(Male, Female)	Tells the gender of the patient
age	Integer
	Age of the patient
hypertension	Integer
(1, 0)	Tells whether patient has hypertension or not
heart_disease	Integer	Tells whether the patient has heart disease or not 
ever_married	String literal
(Yes,No)	It tell whether the patient is married or not
work_type	String literal
(children, Govt_job, Never_worked, Private, Self-employed)	It gives different categories for work
Residence_type	String literal
(Urban, Rural)
	Patients residence type is stored 
avg_glucose_level	Floating point number	Gives the value of average glucose level in blood 
bmi	Floating point number	Gives the value of patients Body Mass Index
smoking_status	String literal 
(formerly smoked, never smoked, smokes, unknown)	It gives the smoking status of the patient
stroke	Integer	Output column that gives the stroke
The entire dataset has 4981 rows, of which 248 rows are suggesting the occurrence of a stroke and 4733 rows having the possibility of no stroke. The method of oversampling SMOTE is used to balance the data. Oversampling balances the data wherein the minority class is oversampling to match the majority class. After oversampling, the minority becomes 4960 and majority becomes 4947. The graphical representation is shown in fig1 and fig2. After completing data preprocessing and handling the imbalanced dataset, oversampled data is split into training and testing data for better accuracy and efficiency of this task keeping the ratio as 70% training data 


and 30% testing data. After splitting, various classification algorithms are used to train the model. The classification algorithms used for this purpose are Logistic Regression, Random Forest Classification, Support Vector Machine classification. For classification important variables are ‘hypertension’, ‘heart_disease’, ‘gender’, ‘Residence_type’.
