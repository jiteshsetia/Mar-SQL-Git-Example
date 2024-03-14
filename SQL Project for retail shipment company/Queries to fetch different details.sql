-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    company_name VARCHAR(10) NOT NULL,
    contact_name VARCHAR(10) NOT NULL,
    contacttitle VARCHAR(10) NOT NULL,
    address VARCHAR(10) NOT NULL,
    city VARCHAR(10) NOT NULL,
    country VARCHAR(10) NOT NULL);

--Orders Table
CREATE TABLE Orders (
  Order_id INT PRIMARY KEY,    
    Employee_ID INT,
    OrderDate Date,
    ShippedDate Date,
   ShipVia VARCHAR(255) NOT NULL,
   Freight VARCHAR(255) NOT NULL,
   Shipaddress VARCHAR(255) NOT NULL,
   ShipCity VARCHAR(255) NOT NULL,
   ShipPostalcode VARCHAR(255) NOT NULL,
 customer_id int REFERENCES customers(customer_id)  
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    Orderdetails VARCHAR(100) PRIMARY KEY,
    UnitPrice decimal(10,2),
    Discount decimal(10,2),
    quantity INT,
   order_id int REFERENCES orders(order_id),
    ProductsID int REFERENCES Products(ProductsID)
);

-- Products Table
CREATE TABLE Products (
    ProductsID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    UnitPrice decimal(10,2),
    RecorderLevel INT,
    supplierid int REFERENCES Suppliers(supplierid)
);

-- Suppliers Table
CREATE TABLE Suppliers (
SupplierID INT PRIMARY KEY,
contact_name VARCHAR(10) NOT NULL,
    contacttitle VARCHAR(10) NOT NULL,
    address VARCHAR(10) NOT NULL,
    city VARCHAR(10) NOT NULL,
    country VARCHAR(10) NOT NULL);