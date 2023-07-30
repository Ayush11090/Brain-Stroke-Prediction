#EDA----
brain_stroke <- read.csv("brain_stroke.csv")
summary(brain_stroke)
library(ggplot2)


# Most basic bar chart
ggplot(brain_stroke, aes(x = factor(stroke))) +
  geom_bar()
#check for nulls
colSums(is.na(brain_stroke))
#column gender
as.data.frame(table(brain_stroke$gender))
#worktype
as.data.frame(table(brain_stroke$work_type))
#Residance
as.data.frame(table(brain_stroke$Residence_type))
#Married
as.data.frame(table(brain_stroke$ever_married))
#smoking
as.data.frame(table(brain_stroke$smoking_status))


library(magrittr)
library(dplyr) 
#replace the unknown with the never smoker
brain_stroke<- brain_stroke %>% mutate(smoking_status = replace(smoking_status, smoking_status == "Unknown", "never smoked" ))

# gender: Male for 0, Female for 1
brain_stroke<- brain_stroke %>% mutate(gender = replace(gender, gender == "Male", 0 ))
brain_stroke<- brain_stroke %>% mutate(gender = replace(gender, gender == "Female", 1 ))

# Residence_type: Urban for 0, Rural for 1
brain_stroke<- brain_stroke %>% mutate(Residence_type = replace(Residence_type, Residence_type == "Urban", 0 ))
brain_stroke<- brain_stroke %>% mutate(gender = replace(Residence_type, Residence_type == "Rural", 1 ))

# ever_married: No for 0, Yes for 1
brain_stroke<- brain_stroke %>% mutate(ever_married = replace(ever_married, ever_married == "No", 0 ))
brain_stroke<- brain_stroke %>% mutate(ever_married = replace(ever_married, ever_married == "Yes", 1 ))

head(brain_stroke)
colSums(is.na(brain_stroke))



# Transform binary variables to factor
brain_stroke$stroke <- as.factor(brain_stroke$stroke)
brain_stroke$hypertension <- as.factor(brain_stroke$hypertension)
brain_stroke$heart_disease <- as.factor(brain_stroke$heart_disease)
brain_stroke$ever_married  <- as.factor(brain_stroke$ever_married )
brain_stroke$Residence_type <- as.factor(brain_stroke$Residence_type)
brain_stroke$gender  <- as.factor(brain_stroke$gender )
brain_stroke$age <- as.factor(brain_stroke$age )
brain_stroke$work_type  <- as.factor(brain_stroke$work_type )
brain_stroke$avg_glucose_level <- as.factor(brain_stroke$avg_glucose_level)
brain_stroke$bmi  <- as.factor(brain_stroke$bmi )
brain_stroke$smoking_status   <- as.factor(brain_stroke$smoking_status )
data1=brain_stroke[,]
table(brain_stroke$stroke)



#SMOTE----
library(DMwR)
data=SMOTE(stroke~.,data1,perc.over=1900,perc.under = 105)
write.csv(data,"D:\\Smote.csv",row.names=FALSE)
table(data$stroke)
ggplot(data, aes(x = factor(stroke))) +
  geom_bar()



#Training set creation----
library(caret)
Training <- createDataPartition(y = data$stroke, p = 0.7, list = FALSE)
training <- data[Training,]
testing <- data[-Training,]
# examine the dimension of the training set and the testing set.
dim(training)
dim(testing)



#Logistic Regression For Prediction----
model <- glm(stroke~ gender+ hypertension+ heart_disease + ever_married  + Residence_type+smoking_status  , data = training, family = binomial(link = 'logit'))
summary(model)
#predict the stroke variable based on the testing dataset
model.prob = predict(model, testing, type="response")
# use caret and compute a confusion matrix
confusionMatrix(data = as.factor(as.numeric(model.prob>0.5)), reference = as.factor(testing$stroke))



#Random Forest----
library(randomForest)
set.seed(222)
rf <- randomForest(stroke~   gender +hypertension+ heart_disease +work_type  + Residence_type , data = training)
#prediction & confusion matrix - train data
library(caret)
p1 <- predict(rf,training)
confusionMatrix(p1,training$stroke)
#prediction & confusion matrix - test data
p2 <- predict(rf,testing)
confusionMatrix(p2,testing$stroke)
#variable importance
varImpPlot(rf, main = "Variable Importance")
importance(rf)



#Support Vector Machine----
library(e1071)
classifier = svm(formula = stroke~ gender + hypertension + heart_disease + ever_married +work_type + Residence_type  ,
                 data = training,
                 type = 'C-classification',
                 kernel = 'linear')
model1.prob = predict(classifier, testing, type="response")
# use caret and compute a confusion matrix
library(caret)
confusionMatrix(table(testing$stroke,model1.prob))

