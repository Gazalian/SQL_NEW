CREATE TABLE job_applied ( 
    job_id INT, 
    application_sent_date DATE, 
    custom_resume BOOLEAN, 
    resume_file_name VARCHAR(255), 
    cover_letter_sent BOOLEAN, 
    cover_letter_file_name VARCHAR(255), 
    status VARCHAR(50)
); 

-- SELECT* FROM job_applied 

INSERT INTO job_applied 
            ( job_id, 
            application_sent_date, 
            custom_resume, 
            resume_file_name, 
            cover_letter_sent, 
            cover_letter_file_name,
            status) 
VALUES      (1, 
             '2024-02-01', 
             true, 
             'resume_01.pdf', 
             true, 
             'cover_letter_01.pdf', 
             'submitted'), 
             (2, 
             '2024-02-02', 
             true, 
             'resume_02.pdf', 
             false, 
             'cover_letter_02.pdf', 
             'submitted'), 
             (3, 
             '2024-02-03', 
             false, 
             'resume_03.pdf', 
             true, 
             'cover_letter_03.pdf', 
             'rejected'), 
             (4, 
             '2024-02-04', 
             false, 
             'resume_04.pdf', 
             false, 
             NULL, 
             'interview scheduled');

SELECT* 
FROM job_applied

-- ADD Column 

ALTER TABLE job_applied 
ADD contact VARCHAR(50); 

-- Update Column 

UPDATE job_applied 
SET    contact = 'Gaza lian' 
WHERE  job_id = 1; 

UPDATE job_applied 
SET    contact = 'Fisher Man' 
WHERE  job_id = 2; 

UPDATE job_applied 
SET    contact = 'Jok er' 
WHERE  job_id = 3; 

UPDATE job_applied 
SET    contact = 'mar lian' 
WHERE  job_id = 4; 

-- rename column  

ALTER TABLE job_applied 
RENAME COLUMN contact to contact_name; 

-- updating the date type 

ALTER TABLE job_applied 
ALTER COLUMN contact_name TYPE TEXT; 

-- delete table 

ALTER TABLE job_applied 
DROP COLUMN contact_name; 

-- delete the table 
DROP TABLE job_applied