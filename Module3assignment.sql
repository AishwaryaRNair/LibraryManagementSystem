#Create a database named library and following TABLES in the database:
   #1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus
   
   CREATE DATABASE Library;
   USE Library;
   
   

-- 1. Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Insert data into Branch Table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'MG Road, Bengaluru, Karnataka', '08012345678'),
(2, 102, 'Connaught Place, New Delhi, Delhi', '01123456789'),
(3, 103, 'Marine Drive, Mumbai, Maharashtra', '02234567890'),
(4, 104, 'Park Street, Kolkata, West Bengal', '03345678901'),
(5, 105, 'Anna Salai, Chennai, Tamil Nadu', '04456789012');

-- 2. Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Insert data into Employee Table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Amit Sharma', 'Manager', 60000, 1),
(102, 'Rajesh Kumar', 'Manager', 58000, 2),
(103, 'Pooja Verma', 'Manager', 57000, 3),
(104, 'Ravi Patel', 'Manager', 55000, 2),
(105, 'Anita Reddy', 'Manager', 54000, 5),
(106, 'Vikas Singh', 'Assistant', 40000, 2),
(107, 'Sunita Rao', 'Assistant', 38000, 2),
(108, 'Neha Gupta', 'Librarian', 45000, 2),
(109, 'Deepak Mehta', 'Librarian', 42000, 2),
(110, 'Rohit Bansal', 'Librarian', 41000, 5);


-- 3. Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(5, 2),
    Status VARCHAR(3), 
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Insert data into Books Table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1001, 'Wings of Fire', 'Biography', 20.00, 'yes', 'A.P.J Abdul Kalam', 'Universities Press'),
(1002, 'The Discovery of India', 'History', 25.00, 'yes', 'Jawaharlal Nehru', 'Oxford University Press'),
(1003, 'India 2020', 'Non-fiction', 30.00, 'no', 'A.P.J Abdul Kalam', 'Penguin Books'),
(1004, 'Ignited Minds', 'Inspiration', 22.00, 'yes', 'A.P.J Abdul Kalam', 'Penguin Books'),
(1005, 'My Experiments with Truth', 'Autobiography', 18.00, 'yes', 'Mahatma Gandhi', 'Navajivan Trust'),
(1006, 'God of Small Things', 'Fiction', 27.00, 'no', 'Arundhati Roy', 'IndiaInk'),
(1007, 'The White Tiger', 'Fiction', 23.00, 'yes', 'Aravind Adiga', 'HarperCollins'),
(1008, 'The Great Indian Novel', 'Satire', 26.00, 'yes', 'Shashi Tharoor', 'Penguin Books'),
(1009, 'Half Girlfriend', 'Romance', 15.00, 'no', 'Chetan Bhagat', 'Rupa Publications'),
(1010, 'The Namesake', 'Fiction', 24.00, 'yes', 'Jhumpa Lahiri', 'Houghton Mifflin');

-- 4. Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Insert data into Customer Table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Ramesh Yadav', 'Andheri East, Mumbai', '2023-01-15'),
(2, 'Priya Menon', 'Koramangala, Bengaluru', '2022-12-10'),
(3, 'Vikram Malhotra', 'Connaught Place, New Delhi', '2021-11-20'),
(4, 'Sneha Iyer', 'Park Street, Kolkata', '2022-09-05'),
(5, 'Anil Joshi', 'Anna Nagar, Chennai', '2020-08-16'),
(6, 'Pooja Das', 'Jayanagar, Bengaluru', '2021-07-25'),
(7, 'Karan Kapoor', 'MG Road, Pune', '2022-03-18'),
(8, 'Shalini Reddy', 'Banjara Hills, Hyderabad', '2019-05-10'),
(9, 'Naveen Gupta', 'Sector 17, Chandigarh', '2021-04-22'),
(10, 'Divya Srivastava', 'Salt Lake, Kolkata', '2023-02-12');

-- 5. IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Insert data into IssueStatus Table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Wings of Fire', '2023-06-15', 1001),
(2, 2, 'The Discovery of India', '2023-06-20', 1002),
(3, 4, 'Ignited Minds', '2023-06-18', 1004),
(4, 5, 'My Experiments with Truth', '2023-07-05', 1005),
(5, 7, 'The Great Indian Novel', '2023-05-22', 1008),
(6, 8, 'The White Tiger', '2023-03-12', 1007),
(7, 9, 'The Namesake', '2023-06-25', 1010),
(8, 3, 'India 2020', '2022-11-28', 1003),
(9, 6, 'Half Girlfriend', '2023-01-14', 1009),
(10, 10, 'God of Small Things', '2023-04-10', 1006);


-- 6. ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert data into ReturnStatus Table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Wings of Fire', '2023-06-30', 1001),
(2, 2, 'The Discovery of India', '2023-07-05', 1002),
(3, 4, 'Ignited Minds', '2023-07-01', 1004),
(4, 5, 'My Experiments with Truth', '2023-08-01', 1005),
(5, 7, 'The Great Indian Novel', '2023-06-15', 1008),
(6, 8, 'The White Tiger', '2023-04-01', 1007),
(7, 9, 'The Namesake', '2023-07-01', 1010),
(8, 3, 'India 2020', '2023-01-10', 1003),
(9, 6, 'Half Girlfriend', '2023-03-01', 1009),
(10, 10, 'God of Small Things', '2023-05-15', 1006);

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;


#1 Retrieve the book title, category, and rental price of all available books.
Select Book_title,Category,Rental_Price FROM Books WHERE Status ='YES';


#2 List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;


#3 Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issued_book_name,Customer_name FROM IssueStatus LEFT JOIN Customer ON Issued_cust = Customer_Id;

#4 Display the total count of books in each category.
SELECT Category, count(*) AS TOTAL_BOOKS FROM Books GROUP BY Category;

#5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position FROM Employee WHERE Salary > 50000;


#6 List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);


#7) Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count FROM Employee GROUP BY Branch_no;


#8) Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name,Customer_Id FROM IssueStatus LEFT JOIN Customer ON Issued_cust=Customer_Id WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9) Retrieve book_title from book table containing "history".
SELECT Book_title FROM Books WHERE Category LIKE '%history%';

#10) Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(Emp_Id) > 5;


#11) Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Emp_name,Branch_address FROM Branch LEFT JOIN Employee ON Manager_Id = Emp_Id;

#12) Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT Customer_name,Issued_cust FROM Customer RIGHT JOIN IssueStatus ON Issued_cust=Customer_Id LEFT JOIN Books ON IssueStatus.Isbn_book = Books.ISBN WHERE Books.Rental_Price > 25;















