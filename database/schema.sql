CREATE TABLE customers(
    customer_id VARCHAR(50) PRIMARY KEY,

    gender VARCHAR(10) NOT NULL
        CHECK ( gender IN ('Male', 'Female' )),

    senior_citizen SMALLINT NOT NULL
        CHECK (senior_citizen IN (0, 1)),

    partner VARCHAR(3) NOT NULL
        CHECK (partner IN ('Yes', 'No')),

    dependents VARCHAR(3) NOT NULL
        CHECK (dependents IN ('Yes', 'No')),

    phone_service VARCHAR(3) NOT NULL
        CHECK (phone_service IN ('Yes', 'No')),

    multiple_lines VARCHAR(50) NOT NULL
        CHECK ( multiple_lines IN ('Yes', 'No','No phone service')),

    internet_service VARCHAR(50) NOT NULL
        CHECK ( internet_service IN ('Fiber optic','DSL','No')),

    online_security VARCHAR(50) NOT NULL
        CHECK ( online_security IN ('Yes', 'No','No internet service')),

    online_backup VARCHAR(50) NOT NULL
        CHECK ( online_backup IN ('Yes', 'No','No internet service')),

    device_protection VARCHAR(50) NOT NULL
        CHECK ( device_protection IN ('Yes', 'No','No internet service')),

    tech_support VARCHAR(50) NOT NULL
        CHECK ( tech_support IN ('Yes', 'No','No internet service')),

    streaming_tv VARCHAR(50) NOT NULL
        CHECK ( streaming_tv IN ('Yes', 'No','No internet service')),

    streaming_movies VARCHAR(50) NOT NULL
        CHECK ( streaming_movies IN ('Yes', 'No','No internet service')),

    contract VARCHAR(50) NOT NULL
        CHECK ( contract IN ('Month-to-month','Two year', 'One year') ),

    paperless_billing VARCHAR(50) NOT NULL
        CHECK ( paperless_billing IN ('Yes', 'No') ),

    payment_method VARCHAR(50) NOT NULL
        CHECK ( payment_method IN ('Electronic check', 'Mailed check', 'Bank transfer (automatic)','Credit card (automatic)') ),

    tenure INTEGER NOT NULL
        CHECK ( tenure >= 0 ),

    monthly_charges DECIMAL(10,2) NOT NULL
        CHECK ( monthly_charges >= 0 ),

    total_charges DECIMAL(10,2) NOT NULL
        CHECK ( total_charges >= 0 ),

    churn VARCHAR(3) NOT NULL
        CHECK (churn IN ('Yes', 'No'))
);

SELECT current_database();

SELECT * FROM customers;

SELECT
    ordinal_position,
    column_name
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customers'
ORDER BY ordinal_position;

-- test of validation customer
-- data validate
INSERT INTO customers (
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    tenure,
    monthly_charges,
    total_charges,
    churn
)
VALUES (
           'TEST-001',
           'Male',
           0,
           'Yes',
           'No',
           'Yes',
           'No',
           'Fiber optic',
           'No',
           'Yes',
           'No',
           'No',
           'Yes',
           'No',
           'Month-to-month',
           'Yes',
           'Electronic check',
           12,
           79.50,
           954.00,
           'No'
       );
-- data incorrect
INSERT INTO customers (
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    tenure,
    monthly_charges,
    total_charges,
    churn
)
VALUES (
           'TEST-002',
           'Other',
           0,
           'No',
           'No',
           'Yes',
           'No',
           'DSL',
           'No',
           'No',
           'No',
           'No',
           'No',
           'No',
           'One year',
           'Yes',
           'Mailed check',
           10,
           50.00,
           500.00,
           'No'
       );
-- data tenure validate
INSERT INTO customers (
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    tenure,
    monthly_charges,
    total_charges,
    churn
)
VALUES (
           'TEST-003',
           'Female',
           0,
           'No',
           'No',
           'Yes',
           'Yes',
           'DSL',
           'Yes',
           'Yes',
           'Yes',
           'Yes',
           'No',
           'No',
           'Two year',
           'No',
           'Credit card (automatic)',
           -5,
           40.00,
           400.00,
           'No'
       );

-- data gender null validate
INSERT INTO customers (
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    tenure,
    monthly_charges,
    total_charges,
    churn
)
VALUES (
           'TEST-004',
           NULL,
           0,
           'No',
           'No',
           'Yes',
           'No',
           'DSL',
           'No',
           'No',
           'No',
           'No',
           'No',
           'No',
           'One year',
           'Yes',
           'Mailed check',
           10,
           50.00,
           500.00,
           'No'
       );

--delete customer test
DELETE FROM customers
WHERE customer_id = 'TEST-001';

SELECT *
FROM customers;