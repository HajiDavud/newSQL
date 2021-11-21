CREATE TABLE Authors
(
	id INT PRIMARY KEY IDENTITY,
	name NVARCHAR(255),
	surname NVARCHAR(255),
)

CREATE TABLE Books
(
	id INT PRIMARY KEY IDENTITY,
	name NVARCHAR(100) CHECK(LEN(name)>2),
	pc int CHECK(pc>9)
)


DROP TABLE Authors
DROP TABLE Books

ALTER TABLE Books
ADD authorid int 
FOREIGN KEY (authorid) REFERENCES Authors(id)



CREATE VIEW AuthorsBooks AS
SELECT Books.name,Books.pc,Authors.name+' '+Authors.surname AS FullName FROM Books,Authors WHERE Books.authorid=Authors.id;



INSERT INTO Authors VALUES('Davud','davud'); 

INSERT INTO Authors VALUES('ssdd','ss'); 
INSERT INTO Authors VALUES('Salam','Necesen'); 

INSERT INTO Books VALUES('Kitab1',515,1); 

INSERT INTO Books VALUES('Kitab12',420,1); 
INSERT INTO Books VALUES('Kitab123',13,2); 



SELECT * FROM AuthorsBooks;


CREATE PROCEDURE show
AS
SELECT Books.name,Books.pc,Authors.name+' '+Authors.surname AS FullName FROM Books,Authors WHERE Authors.name LIKE 'davud';

DROP PROCEDURE show

EXEC show;


CREATE PROCEDURE insertA
AS
INSERT INTO Authors VALUES('Namiq','Qaracuxur'); 


CREATE PROCEDURE updatetA
AS
UPDATE Authors
SET Authors.name = 'Haci2'
WHERE Authors.id=1;



EXEC insertA;
EXEC updatetA;


SELECT * FROM Authors;





CREATE PROCEDURE ViewA
AS
SELECT Books.name,Books.pc AS BooksCount,Authors.name+' '+Authors.surname AS FullName FROM Books,Authors ORDER BY Books.pc DESC;

DROP PROCEDURE ViewA



EXEC ViewA;