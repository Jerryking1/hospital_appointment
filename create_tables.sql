CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date TIMESTAMP,
    status TEXT,
    notes TEXT
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(255),
    phone_number TEXT,
    email TEXT,
    consultation_fee NUMERIC,
    years_of_experience INT
);
ALTER TABLE doctor
ALTER COLUMN phone_number TYPE TEXT;

CREATE TABLE nurses(
    nurse_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number TEXT,
    email TEXT,
    shift TEXT
);

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(50),
    phone_number TEXT,
    email TEXT,
    address TEXT,
    blood_type VARCHAR(50),
    emergency_contact_name VARCHAR(255),
    emergency_contact_phone TEXT,
    insurance_provider TEXT,
    insurance_number TEXT
);


CREATE TABLE treatment (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    diagnosis TEXT,
    treatment_description TEXT,
    prescribed_medication TEXT
);
-- use in postgres PSQLTOOL
\COPY appointment FROM 'C:\Users\jerem\hospital_appointment\appointment.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY doctors FROM 'C:\Users\jerem\hospital_appointment\doctors.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY nurses FROM 'C:\Users\jerem\hospital_appointment\nurses.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY patient FROM 'C:\Users\jerem\hospital_appointment\patients.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY treatment FROM 'C:\Users\jerem\hospital_appointment\treatment.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM treatment