-- Drop tables if they already exist
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS classification;
DROP TABLE IF EXISTS account;
-- Create Account Type
CREATE TYPE account_type AS ENUM ('Client', 'Employee', 'Admin');
-- Create Classification Table
CREATE TABLE classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR(50) NOT NULL
);
-- Create Inventory Table
CREATE TABLE inventory (
    inv_id SERIAL PRIMARY KEY,
    inv_make VARCHAR(50) NOT NULL,
    inv_model VARCHAR(50) NOT NULL,
    inv_description TEXT NOT NULL,
    inv_image VARCHAR(100) NOT NULL,
    inv_thumbnail VARCHAR(100) NOT NULL,
    inv_price NUMERIC(10, 2) NOT NULL,
    inv_year INT NOT NULL,
    inv_miles INT NOT NULL,
    inv_color VARCHAR(30) NOT NULL,
    classification_id INT REFERENCES classification(classification_id)
);
-- Create Account Table
CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    account_firstname VARCHAR(50) NOT NULL,
    account_lastname VARCHAR(50) NOT NULL,
    account_email VARCHAR(100) UNIQUE NOT NULL,
    account_password VARCHAR(255) NOT NULL,
    account_type account_type DEFAULT 'Client'
);
-- Insert classification data
INSERT INTO classification (classification_name)
VALUES ('Custom'),
    ('Sport'),
    ('SUV'),
    ('Truck'),
    ('Sedan');
-- Insert inventory data
INSERT INTO inventory (
        inv_make,
        inv_model,
        inv_description,
        inv_image,
        inv_thumbnail,
        inv_price,
        inv_year,
        inv_miles,
        inv_color,
        classification_id
    )
VALUES (
        'Chevy',
        'Camaro',
        'Sporty and fast muscle car',
        '/images/camaro.jpg',
        '/images/camaro-tn.jpg',
        35000,
        2019,
        15000,
        'Red',
        2
    ),
    (
        'Ford',
        'Mustang',
        'Classic American sports car',
        '/images/mustang.jpg',
        '/images/mustang-tn.jpg',
        42000,
        2020,
        10000,
        'Blue',
        2
    ),
    (
        'GM',
        'Hummer',
        'Large SUV with small interiors and huge power',
        '/images/hummer.jpg',
        '/images/hummer-tn.jpg',
        58000,
        2018,
        25000,
        'Black',
        3
    ),
    (
        'Toyota',
        'Tacoma',
        'Reliable pickup truck',
        '/images/tacoma.jpg',
        '/images/tacoma-tn.jpg',
        32000,
        2021,
        5000,
        'White',
        4
    ),
    (
        'Honda',
        'Civic',
        'Compact and fuel efficient sedan',
        '/images/civic.jpg',
        '/images/civic-tn.jpg',
        24000,
        2022,
        3000,
        'Silver',
        5
    );
-- QUERY 4 (Description Update)
UPDATE inventory
SET inv_description = REPLACE(
        inv_description,
        'small interiors',
        'a huge interior'
    )
WHERE inv_make = 'GM'
    AND inv_model = 'Hummer';
-- QUERY 6 (Image Path Update)
UPDATE inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');