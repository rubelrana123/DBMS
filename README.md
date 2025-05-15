# DBMS
Task - 1 
#Case Study 
A Medical Database System is needed to enhance the efficiency and effectiveness of healthcare services. This system will be able to seamlessly integrates the information of patients, doctors, appointments, medical records, and medical facilities.
Entities:
1.Patients:
Attributes: PatientID (Primary Key), FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email
2.Doctors:
Attributes: DoctorID (Primary Key), FirstName, LastName, Specialization, ContactNumber, Email
3.Appointments:
Attributes: AppointmentID (Primary Key), PatientID (Foreign Key), DoctorID (Foreign Key), AppointmentDate, AppointmentTime, Status
4.Medical Records:
Attributes: RecordID (Primary Key), AppointmentID (Foreign Key), Diagnosis, Prescription, TestResults, createdAt
5.Medical Facilities:
Attributes: FacilityID (Primary Key), FacilityName, Location, ContactNumber
Relationships:
Patients can have multiple appointments with different doctors.
Doctors can have multiple appointments with different patients.
Each appointment may have a corresponding medical record, and vice versa. 
A medical facility can have multiple doctors, and a doctor can work in multiple medical facilities. This relationship is represented through a junction table.

https://lily-plate-b6a.notion.site/Case-Study-082bcd700e034e0b85a54bf82ba590ab

diagram : 

![alt text](image.png)
