---1.
CREATE TABLE Members (
    MemberID       NUMBER        PRIMARY KEY,
    Name           VARCHAR2(50)  NOT NULL,
    Email          VARCHAR2(100) UNIQUE,
    JoinDate       DATE DEFAULT SYSDATE NOT NULL
);




CREATE TABLE Books (
    BookID          NUMBER        PRIMARY KEY,
    Title           VARCHAR2(100) NOT NULL,
    Author          VARCHAR2(50),
    CopiesAvailable NUMBER CHECK (CopiesAvailable >= 0)
);




CREATE TABLE IssuedBooks (
    IssueID     NUMBER        PRIMARY KEY,
    MemberID    NUMBER        REFERENCES Members(MemberID),
    BookID      NUMBER        REFERENCES Books(BookID),
    IssueDate   DATE DEFAULT SYSDATE,
    ReturnDate  DATE
);



-----2.
SELECT 
    table_name, 
    column_name, 
    data_type, 
    data_length, 
    nullable, 
    data_default
FROM user_tab_columns
WHERE table_name IN ('MEMBERS', 'BOOKS', 'ISSUEDBOOKS')
ORDER BY table_name, column_id;



----3.
---a)
INSERT INTO Members VALUES (1, 'Ali Khan',  'ali@example.com',  DEFAULT);
INSERT INTO Members VALUES (2, 'Sara Ahmed', 'sara@example.com', DEFAULT);
INSERT INTO Members VALUES (3, 'John Doe',  'john@example.com',  DEFAULT);


INSERT INTO Books VALUES (101, 'Database Systems',   'Elmasri',      5);
INSERT INTO Books VALUES (102, 'Operating Systems',  'Silberschatz', 3);
INSERT INTO Books VALUES (103, 'Computer Networks',  'Tanenbaum',    2);

----b)
INSERT INTO IssuedBooks (IssueID, MemberID, BookID)
VALUES (1, 1, 101);

UPDATE Books
SET CopiesAvailable = CopiesAvailable - 1
WHERE BookID = 101;

----c)
SELECT 
    m.Name AS Member_Name, 
    b.Title AS Book_Title, 
    i.IssueDate
FROM Members m
JOIN IssuedBooks i ON m.MemberID = i.MemberID
JOIN Books b ON i.BookID = b.BookID;




-----4.
INSERT INTO Members VALUES (1, 'Duplicate', 'dup@example.com', DEFAULT);

INSERT INTO IssuedBooks (IssueID, MemberID, BookID)
VALUES (2, 99, 101);

INSERT INTO Books VALUES (104, 'AI Basics', 'Russell', -5);



-----5.
-- 1. Add a Fine_Collection table to calculate penalties for late returns.
-- 2. Add a Reservation table so members can reserve books when all copies are issued.


-----6.
---a)
SELECT Name 
FROM Members
WHERE MemberID NOT IN (SELECT MemberID FROM IssuedBooks);


----b)
SELECT Title 
FROM Books
WHERE CopiesAvailable = (SELECT MAX(CopiesAvailable) FROM Books);


----c)
SELECT Name 
FROM Members
WHERE MemberID = (
    SELECT MemberID 
    FROM IssuedBooks
    GROUP BY MemberID
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROWS ONLY
);



-----d)
SELECT Title 
FROM Books
WHERE BookID NOT IN (SELECT BookID FROM IssuedBooks);



----e)
SELECT m.Name
FROM Members m
JOIN IssuedBooks i ON m.MemberID = i.MemberID
WHERE i.ReturnDate IS NULL
  AND i.IssueDate < SYSDATE - 30;





