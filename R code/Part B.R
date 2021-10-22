#Importing the data 
setwd("F:\\uOttawa\\Fundamental\\Assignment\\Part B\\bank-additional")
bank_addtional_full <- read.delim(file="bank-additional-full.csv", header=TRUE, sep=";")

#dataset contains only four predictors (age, education, previous, pdays and the target Y)
reqd <- as.vector(c("age", "education","previous","pdays","y"))

Results <- bank_addtional_full[ ,reqd]

#Changing the field value 999 to “NA” to represent missing values

Results[which(Results[,4]==999, arr.ind=TRUE), 4] <- NA

#Creating a histogram for the values in the columns pdays
c<- hist(Results$pdays)
sum(is.na(Results$pdays))

#mapping categorical values of education to numerical values
Results$education <- factor(Results$education,levels=c("illiterate","basic.4y","basic.6y",
                                                       "basic.9y","high.school",
                                                       "professional.course",
                                                       "university.degree","unknown"),
                                             labels = c(0,4,6,9,12,12,16,NA))

mean_age <- mean(Results$age)
mean_age
median_age <- median(Results$age)
median_age
#creating a function to get the mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
age_mode <- getmode(Results$age)
age_mode


boxplot(Results$age, main="Age box blot", ylab="age",ylim=c(1,100),las=1) #Box plot of the data 

age_summary <- summary(Results$age) #calculating the exact numbers of the five number summary

age_summary
grid(nx=25)
boxplot(Results$age)

#Creating the new field age_z and adding it to the dataframe
age_z <- scale(Results$age)
mean(age_z)
Results$age_z <- age_z


# Obtaining a listing of all records that are outliers according to the field age_z.
lower_bound <- quantile(Results$age_z, 0.01)
upper_bound <- quantile(Results$age_z, 0.99)

outlier_ind <- which(Results$age_z < lower_bound | Results$age_z > upper_bound)

outliers_record <- Results[outlier_ind, ]

