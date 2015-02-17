DROP TABLE nscc_Applicant;
DROP TABLE nscc_Education;
DROP TABLE nscc_Country;
DROP TABLE nscc_Province_State;
DROP TABLE nscc_Phone;
DROP TABLE nscc_Citizenship;
DROP TABLE nscc_Language;
DROP TABLE nscc_School_Type;
DROP TABLE nscc_Education;
DROP TABLE nscc_Payment_Money_Order;
DROP TABLE nscc_Application;
DROP TABLE nscc_Program;
DROP TABLE nscc_Campus_Program;
DROP TABLE nscc_Program_Choice;
DROP TABLE nscc_Payment;
DROP TABLE nscc_Payment_Cheque;
DROP TABLE nscc_Payment_Credit_Card;
DROP TABLE nscc_Credit_Card_Company;
DROP TABLE nscc_Campus;
CREATE TABLE nscc_Applicant
(
Applicant_ID integer PRIMARY KEY,
SIN char(9),
FirstName varchar(30) NOT NULL,
MiddleName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
First_Preferred varchar(30),
LastName_Previous varchar(30),
DOB DATE NOT NULL,
Gender integer NOT NULL,
Apt_Number varchar(10),
Street_Address1 varchar(50) NOT NULL,
Street_Address2 varchar(50),
City varchar(30),
Country varchar(30),
Province_State_Code char(2) FOREIGN KEY REFERENCES nscc_Province_State(Province_State_Code),
Province_State_Other varchar(50),
Country_Code char(2) NOT NULL FOREIGN KEY REFERENCES nscc_Country(Country_Code),
Postal_Code varchar(10) NOT NULL,
Phone_Home_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Phone(Phone_ID),
Phone_Work_ID integer FOREIGN KEY REFERENCES nscc_Phone(Phone_ID),
Phone_Cell_ID integer FOREIGN KEY REFERENCES nscc_Phone(Phone_ID),
Email varchar(50) NOT NULL,
StudentNumber char(8),
Citizenship_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Citizenship(Citizenship_ID),
Citizenship_Other_Country_Code char(2) FOREIGN KEY REFERENCES nscc_Country(Country_Code),
Criminal_Conviction integer,
Child_Abuse_Registry integer,
Disciplinary_Action integer,
African_Canadian integer,
First_Nations integer,
Current_ALP integer,
Has_Disability integer,
FirstLanguage_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Language(Language_ID),
FirstLanguage_Other varchar(50)
);
CREATE TABLE nscc_School_Type
(
School_Type_ID integer NOT NULL PRIMARY KEY,
Type_Name varchar(50) NOT NULL
);
CREATE TABLE nscc_Education
(
Education_ID integer NOT NULL PRIMARY KEY,
School_Name varchar(50) NOT NULL,
Date_Completed date,
LocationAddress varchar(50),
School_Type_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_School_Type(School_Type_ID),
Applicant_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Applicant(Applicant_ID)
);
CREATE TABLE nscc_Language
(
Language_ID integer NOT NULL PRIMARY KEY,
Language_Name varchar(50) NOT NULL
);
CREATE TABLE nscc_Citizenship
(
Citizenship_ID integer NOT NULL PRIMARY KEY,
Description varchar(100) NOT NULL
);
CREATE TABLE nscc_Phone
(
Phone_ID integer NOT NULL PRIMARY KEY,
Phone_Number varchar(20) NOT NULL,
Is_Primary char(1) NOT NULL
);
CREATE TABLE nscc_Province_State
(
Province_State_Code char(2) NOT NULL PRIMARY KEY,
Country_Code char(2) NOT NULL,
Province_State_Name varchar(50) NOT NULL
);
CREATE TABLE nscc_Country
(
Country_Code char(2) NOT NULL PRIMARY KEY,
Country_Name varchar(50) NOT NULL
);
CREATE TABLE nscc_Program
(
Program_ID integer NOT NULL PRIMARY KEY,
Program_Name varchar(100) NOT NULL,
Active integer NOT NULL
);
CREATE TABLE nscc_Application
(
Application_ID integer NOT NULL PRIMARY KEY,
Submit_Date date NOT NULL,
Application_Fee number(7,2),
Paid integer NOT NULL,
Applicant_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Applicant(Applicant_ID)
);
CREATE TABLE nscc_Payment_Money_Order
(
Payment_ID integer NOT NULL,
Money_Order_Number varchar(20) NOT NULL
);
CREATE TABLE nscc_Payment_Cheque
(
Payment_ID integer NOT NULL,
Cheque_Number varchar(20) NOT NULL,
Transit_Number varchar(20) NOT NULL,
Financial_Institution varchar(20) NOT NULL,
Account_Number varchar(20) NOT NULL
);
CREATE TABLE nscc_Campus
(
Campus_ID integer NOT NULL PRIMARY KEY,
Campus_Name varchar(50) NOT NULL
);
CREATE TABLE nscc_Payment
(
Payment_ID integer NOT NULL PRIMARY KEY,
Application_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Application(Application_ID),
Payment_Date date NOT NULL,
Amount number(7,2) NOT NULL
);
CREATE TABLE nscc_Program_Choice
(
Preference integer NOT NULL,
Program_Choice_ID integer NOT NULL PRIMARY KEY,
Application_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Application(Application_ID),
Program_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Program(Program_ID),
Campus_ID integer NOT NULL FOREIGN KEY REFERENCES nscc_Capmus(Campus_ID)
);
CREATE TABLE nscc_Campus_Program(
Program_ID integer NOT NULL,
Campus_ID integer NOT NULL
);
CREATE TABLE nscc_Credit_Card_Company
(
CC_Company_ID integer NOT NULL PRIMARY KEY,
Company_Name varchar(20) NOT NULL FOREIGN KEY REFERENCES()
);
CREATE TABLE nscc_Payment_Credit_Card
(
Payment_ID integer NOT NULL,
CC_Company_ID integer NOT NULL FOREIGN KEY REFERENCES(),
Transaction_ID varchar(100) NOT NULL
);
