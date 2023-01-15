## List of librarys needed

library (readr);

library (esquisse);

library (ggplot2);

library(corrplot);


##Setting working directory and importing .csv file

setwd("C:/Users/omaro/Documents/DSBA/03-Project/");

cardio_good_fitness = read.csv("CardioGoodFitness.csv");

str(cardio_good_fitness);

head(cardio_good_fitness);

summary(cardio_good_fitness);


##Creating data frames for each product

##TM195
product_tm195 = cardio_good_fitness[cardio_good_fitness$Product=="TM195",];

summary(product_tm195);

cut(product_tm195$Age,5)

qplot(cut(Age,5),data= cardio_good_fitness)

#TM498
product_tm498 = cardio_good_fitness[cardio_good_fitness$Product=="TM498",];

summary(product_tm498);

#TM798
product_tm798 = cardio_good_fitness[cardio_good_fitness$Product=="TM798",];

summary(product_tm798);


##Univariate analysis

#Age
hist(cardio_good_fitness$Age,col='blue',main='Age',xlab='Age')
boxplot(cardio_good_fitness$Age,col='blue')

#Gender
ggplot(cardio_good_fitness) +
  aes(x = Gender) +
  geom_bar(fill = "#0c4c8a") +
  labs(y = "Count", title = "Gender") +
  theme_minimal()

#Education
hist(cardio_good_fitness$Education,col='blue',main='Education in Years',xlab='Education')
boxplot(cardio_good_fitness$Education,col='blue')

#Marital Status
ggplot(cardio_good_fitness) +
  aes(x = MaritalStatus) +
  geom_bar(fill = "#0c4c8a") +
  labs(y = "Count", title = "Marital Status") +
  theme_minimal()

#Usage
hist(cardio_good_fitness$Usage,col='blue',main='Usage/Week',xlab='Usage')
boxplot(cardio_good_fitness$Usage,col='blue')

#Fitness
hist(cardio_good_fitness$Fitness,col='blue',main='Fitness Score',xlab='Fitness')
boxplot(cardio_good_fitness$Fitness,col='blue')

#Income
hist(cardio_good_fitness$Income,col='blue',main='Income/Year',xlab='Income')
boxplot(cardio_good_fitness$Income,col='blue')

#Miles
hist(cardio_good_fitness$Miles,col='blue',main='Miles/Weeks',xlab='Miles')
boxplot(cardio_good_fitness$Miles,col='blue')


##Bivariate analysis

esquisser()

ggplot(cardio_good_fitness) +
 aes(x = Education, y = Usage) +
 geom_point(size = 1.5, colour = "#0c4c8a") +
 theme_minimal()

ggplot(cardio_good_fitness) +
 aes(x = Age, y = Fitness) +
 geom_point(size = 1.5, colour = "#0c4c8a") +
 theme_minimal()

ggplot(cardio_good_fitness) +
 aes(x = Age, y = Miles) +
 geom_point(size = 1.5, colour = "#0c4c8a") +
 theme_minimal()

corrplot(cor(cardio_good_fitness[,6:9]),type="lower",method="number")

