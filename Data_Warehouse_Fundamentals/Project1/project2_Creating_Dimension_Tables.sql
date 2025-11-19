--Creating Dimension Tables--
CREATE TABLE MyDimDate (
    dateid INT PRIMARY KEY,
    year INT,
    month INT,
    monthname VARCHAR(20),
    day INT,
    weekday INT,
    weekdayname VARCHAR(20)
);

CREATE TABLE MyDimProduct (
    productid INT PRIMARY KEY,
    productname VARCHAR(255)
);

CREATE TABLE DimCustomerSegment (
	segmentid INT PRIMARY KEY,
	segmentname VARCHAR(255)
);

CREATE TABLE MyFactSales (
    salesid INT PRIMARY KEY,
    productid INT,
    quantitysold INT,
    priceperunit DECIMAL (10, 2),
    segmentid INT,
    dateid INT
);
/*
This SQL statement will create a table named MyFactSales with the following columns:

salesid: Primary key to uniquely identify each sales record.
productid: Identifier for the product sold.
quantitysold: Quantity of the product sold.
priceperunit: Price per unit of the product sold.
segmentid: Identifier for the customer segment.
dateid: Identifier for the date of the transaction.
*/