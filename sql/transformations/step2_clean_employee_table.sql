-- Adding employee email addresses
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov');

-- Remove white space at the end of employee's phone_number
UPDATE employee
SET phone_number = TRIM(phone_number);
