--Which doctor has handled the most appointments?

SELECT
    doctors.doctor_id,
    COUNT(doctors.doctor_id) AS no_of_appointment,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name
FROM appointment
LEFT JOIN doctors ON doctors.doctor_id = appointment.doctor_id
GROUP BY doctors.doctor_id 
ORDER BY no_of_appointment DESC;

--Which specialization attracts the highest number of appointments?

SELECT
    doctors.doctor_id,
    COUNT(appointment.doctor_id) AS no_of_appointment,
    doctors.specialization,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name
FROM appointment
LEFT JOIN doctors ON doctors.doctor_id = appointment.doctor_id
GROUP BY doctors.doctor_id, doctors.first_name, doctors.last_name
ORDER BY no_of_appointment DESC;

--Which doctor has the highest average consultation fee?
SELECT
    doctors.doctor_id,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name,
    ROUND(doctors.consultation_fee, 2) AS doctor_fee,
    doctors.specialization
FROM doctors
GROUP BY doctors.doctor_id, doctors.first_name, doctors.last_name
ORDER BY doctor_fee DESC;

--What is the monthly trend of appointments?

SELECT
    (EXTRACT(MONTH FROM appointment_date)) AS appointment_month,
    COUNT(*) AS total_appointments
FROM appointment
GROUP BY  appointment_month
ORDER BY total_appointments DESC;


--Which day of the month has highest number of appointment
SELECT
    EXTRACT(DAY FROM appointment_date) AS day_of_month,
    COUNT(*) AS total_appointments
FROM appointment
GROUP BY day_of_month
ORDER BY total_appointments DESC;

--What is the appointment no-show rate (i.e., how many appointments were not attended)?

SELECT
    appointment_id,
    appointment_date,
    status
FROM appointment
WHERE status = 'Canceled';

SELECT
    count(*)
FROM appointment
WHERE status = 'Canceled'

--Find the peak appointment hours (i.e., what time slot has the most appointments?)


SELECT
    EXTRACT(HOUR FROM appointment_date) AS appointment_hour,
    COUNT(*) AS total_appointments
FROM appointment
GROUP BY appointment_hour
ORDER BY total_appointments DESC;


--How many appointments were scheduled per doctor in the last month?

SELECT 
    appointment.doctor_id,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name,
    doctors.specialization,
    COUNT(*) AS total_appointments
FROM appointment
LEFT JOIN doctors ON doctors.doctor_id = appointment.doctor_id
WHERE EXTRACT(MONTH FROM appointment_date) = 3
GROUP BY appointment.doctor_id, doctors.first_name, doctors.last_name,doctors.specialization
ORDER BY total_appointments DESC;

--Which doctors prescribe the most medications?

SELECT 
    appointment.doctor_id,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name,
    COUNT(treatment.prescribed_medication) AS total_medications
FROM appointment
LEFT JOIN treatment ON treatment.appointment_id = appointment.appointment_id
LEFT JOIN doctors ON doctors.doctor_id = appointment.doctor_id
GROUP BY appointment.doctor_id, doctors.first_name, doctors.last_name
ORDER BY total_medications DESC;
