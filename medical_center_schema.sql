DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctors (
	first_name TEXT NOT NULL,
	Specialty TEXT NOT NULL,
	id  SERIAL PRIMARY KEY,
	phone_number VARCHAR(20) NOT NULL UNIQUE,
	start_date DATE,
	last_name TEXT NOT NULL,
	middle_initial TEXT,
	email varchar(30) NOT NULL
	
);

CREATE TABLE patients (
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	has_insurance BOOLEAN NOT NULL DEFAULT FALSE,
	insurance_provider TEXT NOT NULL,
	id SERIAL PRIMARY KEY,
	middle_initial TEXT,
	email varchar(30) NOT NULL,
	account_balance FLOAT,
	phone_number VARCHAR(20) NOT NULL UNIQUE
	 
);

CREATE TABLE doctor_patient (
	doctor_id INT REFERENCES doctors,
	patient_id INT REFERENCES patients,
	id SERIAL PRIMARY KEY
);

CREATE TABLE patient_disease (
	patient_id INT REFERENCES patients,
	doctor_id_diagnose INT REFERENCES doctors,
	disease TEXT NOT NULL,
	id SERIAL PRIMARY KEY
);

CREATE TABLE diseases (
	disease TEXT NOT NULL UNIQUE,
	id  SERIAL PRIMARY KEY
);

CREATE TABLE medications (
	medication TEXT NOT NULL UNIQUE,
	side_effects TEXT,
	id  SERIAL PRIMARY KEY
	
);

CREATE TABLE patient_medications (
	medication_id INT REFERENCES medications,
	patient_id INT REFERENCES patients,
	id SERIAL PRIMARY KEY
);

INSERT INTO doctors (first_name, last_name, specialty, phone_number, email) 
VALUES('Tim', 'jones', 'heart','7079878789','doc@doc.com'),
 ('mary', 'goodheart', 'brain','0978675409','doc1@doc.com'),
 ('jean', 'bravehat', 'foot','8798798788','doc3@doc.com');

INSERT INTO patients (first_name, last_name, phone_number, email, insurance_provider) 
VALUES( 'mike', 'john', '6768767898', 'njjnj@pop.com', 'blue cross'),
 ( 'sara', 'times', '6700767898', 'n12nj@pop.com', 'blue cross'),
 ( 'glo', 'rt', '6768117898', 'lsenj@pop.com', 'kaiser');

-- Practice query after I added a patient/doctor 
--  SELECT doctors.last_name, patients.last_name 
--  FROM doctors 
--  JOIN doctor_patient 
--  on doctors.id = doctor_patient.doctor_id 
--  JOIN patients 
--  ON patients.id = doctor_patient.patient_id;







