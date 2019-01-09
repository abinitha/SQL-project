library(tidyverse)
library(gains)
library(leaps)
library(caret)
library(dplyr)
library(base)
data<- read.delim("BUAN6320-DataSet2.txt", header = TRUE, sep = "\t")

head(data)

#Selecting columns for Column table
CUSTOMER <- data[, c(1:8)] 

#Selecting columns for Invoice table
INVOICE <- data[, c(12,9,1,10,11)]
#Renaming Employee_ID as Emp_Num
colnames(INVOICE)[5] <- "EMP_NUM"

#Selecting columns for Line table
LINE <- data[, c(12:16)]


data2<- read.delim("BUAN6320-DataSet3.txt", header = TRUE, sep = "\t")

colnames(data2)

#Selecting columns for Brand table
BRAND <- data2[, c(12,2,9)]

#Selecting columns for Product table
PRODUCT <- data2[, c(1,4,5,17,7,11,14,16,12)]

#Selecting columns for Vendor table
VENDOR <- data2[, c(13,6,3,10,8,15)]

#Selecting columns for Supplies table
SUPPLIES <- data2[, c(1,13)]

data3<- read.delim("BUAN6320-DataSet4.txt", header = TRUE, sep = "\t")

colnames(data3)

#Selecting columns for Employee table
EMPLOYEE <- data3[, c(1:8, 12)]

#Selecting columns for Department table
DEPARTMENT <- data3[, c(12:16)]
colnames(DEPARTMENT)[5] <- "EMP_NUM"

#Selecting columns for Salary_History table
SALARY_HISTORY <- data3[,c(1,9:11)]

#Cleaning data -  removing duplicates

CUSTOMER <- CUSTOMER %>% distinct(CUST_CODE, .keep_all = TRUE)

BRAND<- BRAND %>%  distinct(BRAND_ID, .keep_all = TRUE)

DEPARTMENT<- DEPARTMENT %>% distinct(DEPT_NUM, .keep_all = TRUE)

EMPLOYEE<- EMPLOYEE %>% distinct(EMP_NUM, .keep_all = TRUE)

INVOICE<- INVOICE %>% distinct(INV_NUM, .keep_all = TRUE)

##Formatting date column

str(EMPLOYEE$EMP_HIREDATE)

library(lubridate)
data[ , 6] <- ymd(data[, 6])
