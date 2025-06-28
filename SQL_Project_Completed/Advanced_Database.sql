use advanceddatabase;

CREATE TABLE parcels (
    parcel_id INT AUTO_INCREMENT PRIMARY KEY,
    dispatch_date DATE,
    expected_arrival_date DATE,
    actual_arrival_date DATE,
    status VARCHAR(20),
    location VARCHAR(255),
    destination VARCHAR(255)
);

CREATE TABLE DESTINATION (
    DestinationID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    PhoneNumber VARCHAR(20),
    ContentType VARCHAR(50)
);

CREATE TABLE CONTENT (
    ContentID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Author VARCHAR(100),
    Genre VARCHAR(50),
    PublicationYear INT,
    DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES DESTINATION (DestinationID)
);

CREATE TABLE MAIN (
    main_id INT AUTO_INCREMENT PRIMARY KEY,
    Parcel_ID INT,
    DestinationID INT,
    ContentID INT,
    FOREIGN KEY (Parcel_ID) REFERENCES parcels (parcel_id),
    FOREIGN KEY (DestinationID) REFERENCES DESTINATION (DestinationID),
    FOREIGN KEY (ContentID) REFERENCES CONTENT (ContentID)
);


CREATE TABLE StatusUpdates (
    status_update_id INT AUTO_INCREMENT PRIMARY KEY,
    parcel_id INT,
    status VARCHAR(20),
    update_date DATE,
    FOREIGN KEY (parcel_id) REFERENCES parcels(parcel_id) ON DELETE CASCADE
);


INSERT INTO DESTINATION (DestinationID, Name, Location, PhoneNumber, ContentType)
VALUES
(1011, 'Harvard University Library', 'Cambridge, MA, USA', '+1 617-495-2411', 'Academic Research'),
(1012, 'Yale University Library', 'New Haven, CT, USA', '+1 203-432-1775', 'Humanities and Arts'),
(1013, 'Stanford University Libraries', 'Stanford, CA, USA', '+1 650-723-1493', 'Engineering and Technology'),
(1021, 'University of Oxford Bodleian Libraries', 'Oxford, UK', '+44 1865 277000', 'Historical Archives'),
(1022, 'University of Cambridge Library', 'Cambridge, UK', '+44 1223 333000', 'Classics and Sciences'),
(1014, 'University of California, Berkeley Library', 'Berkeley, CA, USA', '+1 510-642-2531', 'Law and Social Sciences'),
(1023, 'University of Edinburgh Library', 'Edinburgh, UK', '+44 131 650 3401', 'Scottish Literature and History'),
(1031, 'Berlin State Library', 'Berlin, Germany', '+49 30 266-433888', 'Science and Humanities'),
(1032, 'Leipzig University Library', 'Leipzig, Germany', '+49 341 97-30600', 'Mathematics and Philosophy'),
(1024, 'British Library', 'London, UK', '+44 330 333 1144', 'History and Research'),
(1015, 'Library of Congress', 'Washington, D.C., USA', '+1 202-707-5000', 'Comprehensive Collections'),
(1016, 'Seattle Public Library', 'Seattle, WA, USA', '+1 206-386-4636', 'Technology and Arts'),
(1017, 'National Library of Medicine', 'Bethesda, MD, USA', '+1 888-346-3656', 'Medical Sciences'),
(1018, 'University of Michigan Library', 'Ann Arbor, MI, USA', '+1 734-764-0400', 'Public Health and Engineering'),
(1019, 'Columbia University Library', 'New York, NY, USA', '+1 212-854-7309', 'Social Sciences and Journalism');


INSERT INTO CONTENT (ContentID, Title, Author, Genre, PublicationYear, DestinationID)
VALUES
(1, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 1011),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Literature', 1960, 1012),
(3, 'The Art of Computer Programming', 'Donald Knuth', 'Technology', 1968, 1013),
(4, 'Medical Microbiology', 'Patrick R. Murray', 'Medical', 2021, 1017),
(5, 'Introduction to Algorithms', 'Thomas H. Cormen', 'Mathematics', 1990, 1032),
(6, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Literature', 1925, 1011),
(7, 'Philosophy: The Basics', 'Nigel Warburton', 'Philosophy', 2013, 1032),
(8, 'The Catcher in the Rye', 'J.D. Salinger', 'Literature', 1951, 1012),
(9, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell and Peter Norvig', 'Technology', 2020, 1013),
(10, 'Principles of Neural Science', 'Eric R. Kandel', 'Medical', 2013, 1017),
(11, 'Discrete Mathematics and Its Applications', 'Kenneth H. Rosen', 'Mathematics', 2011, 1032),
(12, 'Pride and Prejudice', 'Jane Austen', 'Classic Literature', 1813, 1011);


INSERT INTO parcels (dispatch_date, expected_arrival_date, actual_arrival_date, status, location, destination)
VALUES
('2024-05-31', '2024-06-05', '2024-06-03', 'Delayed','Cambridge, MA, USA', 'Department of Business'),
('2024-09-04', '2024-09-09', '2024-09-11', 'In Transit','Berlin, Germany', 'School of Computing'),
('2024-04-28', '2024-05-03', '2024-05-03', 'Delayed', 'New York, NY, USA', 'School of Computing'),
('2024-06-06', '2024-06-11', '2024-06-14', 'Delivered', 'Seattle, WA, USA', 'School of Computing'),
('2023-12-26', '2023-12-31', '2023-12-31', 'Delayed', 'Leipzig, Germany', 'Department of Mathematics'),
('2024-04-28', '2024-05-03', '2024-05-06', 'In Transit','London, UK', 'School of Computing'),
('2023-11-29', '2023-12-04', '2023-12-06', 'Delayed','Oxford, UK', 'Department of Business'),
('2024-05-01', '2024-05-06', '2024-05-05', 'Delayed', 'Edinburgh, UK', 'Department of Science'),
('2024-06-26', '2024-07-01', '2024-07-06', 'Delivered', 'Seattle, WA, USA', 'Department of Science'),
('2024-07-17', '2024-07-22', '2024-07-25', 'In Transit', 'London, UK', 'Department of Mathematics'),
('2023-12-12', '2023-12-17', '2023-12-21', 'Delayed', 'New York, NY, USA', 'School of Computing'),
('2024-11-16', '2024-11-21', '2024-11-19', 'In Transit', 'Leipzig, Germany', 'Department of Business');


INSERT INTO StatusUpdates (parcel_id, status, update_date)
VALUES
(1, 'Delayed', '2024-06-01'),
(2, 'In Transit', '2024-09-05'),
(3, 'Delayed', '2024-04-30'),
(4, 'Delivered', '2024-06-14'),
(5, 'Delayed', '2023-12-28'),
(6, 'In Transit', '2024-05-02'),
(7, 'Delayed', '2023-12-01'),
(8, 'Delayed', '2024-05-02'),
(9, 'Delivered', '2024-07-06'),
(10, 'In Transit', '2024-07-20'),
(11, 'Delayed', '2023-12-13'),
(12, 'In Transit', '2024-11-17');

-- Temuulen

-- Query Section #1: If a costumer asks for a science book from Harvard University.

SELECT c.Title, c.Author, c.Genre, c.PublicationYear 
	FROM CONTENT c 
		JOIN DESTINATION d ON c.DestinationID = d.DestinationID 
			WHERE d.Name = 'Harvard University Library' AND c.Genre = 'Science';
            
-- Query Section #2: if the books provided had any duplicates;
SELECT Title, Author, PublicationYear, COUNT(*) AS NumberOfCopies
FROM CONTENT
GROUP BY Title, Author, PublicationYear
HAVING COUNT(*) > 0;

-- Camron 

#Query 1: Identify the most common delivery status (e.g., delayed, in transit) over time
#This query can help understand when delays were most frequent, assisting in resource allocation decisions.
-- Selects monthly delay counts for each destination, grouped by year and month for better trend analysis
SELECT 
    YEAR(p.dispatch_date) AS year,
    MONTH(p.dispatch_date) AS month,
    p.destination,
    COUNT(*) AS delay_count
FROM 
    parcels p
JOIN 
    StatusUpdates s ON p.parcel_id = s.parcel_id
WHERE 
    s.status = 'Delayed'
GROUP BY 
    year, month, p.destination
ORDER BY 
    delay_count DESC, year, month;
    
-- Query 2 to retrieve the count of each parcel status grouped by destination
-- Sorting results by highest status count for easy analysis of distribution
SELECT 
    p.destination AS Destination,
    s.status AS Status,
    COUNT(s.status) AS Status_Count
FROM 
    parcels AS p
JOIN 
    StatusUpdates AS s 
ON 
    p.parcel_id = s.parcel_id
GROUP BY 
    p.destination, s.status
ORDER BY 
    Status_Count DESC;
    
    
    #Query 3: Calculate the average time delay for parcels that are delayed
WITH delayed_parcels AS (
    SELECT 
        p.destination,
        DATEDIFF(MAX(s.update_date), p.dispatch_date) AS delay_days
    FROM 
        parcels p
    JOIN 
        StatusUpdates s ON p.parcel_id = s.parcel_id
    WHERE 
        s.status = 'Delayed'
    GROUP BY 
        p.destination, p.parcel_id
)
SELECT 
    destination,
    AVG(delay_days) AS average_delay_days
FROM 
    delayed_parcels
GROUP BY 
    destination
ORDER BY 
    average_delay_days DESC;

-- Danielis 

-- Query 1: Find out which Departments/School are in high and low demand of parcels.

SELECT
MAX(CASE WHEN DepartmentORSchool = 'Computing' THEN Mentioned ELSE NULL END) AS ComputingCounted,
MAX(CASE WHEN DepartmentORSchool = 'Business' THEN Mentioned ELSE NULL END) AS BusinessCounted,
MAX(CASE WHEN DepartmentORSchool = 'Mathematics' THEN Mentioned ELSE NULL END) AS MathematicsCounted,
MAX(CASE WHEN DepartmentORSchool = 'Science' THEN Mentioned ELSE NULL END) AS ScienceCounted,

CASE
WHEN MAX(Mentioned) = MAX(CASE WHEN DepartmentORSchool = 'Computing' THEN Mentioned ELSE 0 END) THEN 'Computing'
WHEN MAX(Mentioned) = MAX(CASE WHEN DepartmentORSchool = 'Business' THEN Mentioned ELSE 0 END) THEN 'Business'
WHEN MAX(Mentioned) = MAX(CASE WHEN DepartmentORSchool = 'Mathematics' THEN Mentioned ELSE 0 END) THEN 'Mathematics'
WHEN MAX(Mentioned) = MAX(CASE WHEN DepartmentORSchool = 'Science' THEN Mentioned ELSE 0 END) THEN 'Science'
END AS MostInDemand,
MAX(Mentioned) AS HighestCounted,

CASE
WHEN MIN(Mentioned) = MIN(CASE WHEN DepartmentORSchool = 'Computing' THEN Mentioned ELSE 0 END) THEN 'Computing'
WHEN MIN(Mentioned) = MIN(CASE WHEN DepartmentORSchool = 'Business' THEN Mentioned ELSE 0 END) THEN 'Business'
WHEN MIN(Mentioned) = MIN(CASE WHEN DepartmentORSchool = 'Mathematics' THEN Mentioned ELSE 0 END) THEN 'Mathematics'
WHEN MIN(Mentioned) = MIN(CASE WHEN DepartmentORSchool = 'Science' THEN Mentioned ELSE 0 END) THEN 'Science'
END AS LeastInDemand,
MIN(Mentioned) AS LowestCounted

FROM(
SELECT
'Computing' AS DepartmentORSchool,
 SUM(CASE WHEN destination LIKE '%Computing%' THEN 1 ELSE 0 END) AS Mentioned
 FROM parcels
 UNION ALL
 SELECT
'Business' AS DepartmentORSchool,
 SUM(CASE WHEN destination LIKE '%Business%' THEN 1 ELSE 0 END) AS Mentioned
 FROM parcels
 UNION ALL
 SELECT
'Mathematics' AS DepartmentORSchool,
 SUM(CASE WHEN destination LIKE '%Mathematics%' THEN 1 ELSE 0 END) AS Mentioned
 FROM parcels
 UNION ALL
 SELECT
'Science' AS DepartmentORSchool,
 SUM(CASE WHEN destination LIKE '%Science%' THEN 1 ELSE 0 END) AS Mentioned
 FROM parcels
 ) AS Mentions;
 
 -- Query 2: Display in descending order how many parcels are going to a given country.
SELECT Mention, Mentioned
FROM(
SELECT 'UK' AS Mention,
SUM(CASE WHEN location LIKE '%UK%' THEN 1 ELSE 0 END) AS Mentioned
FROM parcels
UNION ALL
SELECT 'USA' AS Mention,
SUM(CASE WHEN location LIKE '%USA%' THEN 1 ELSE 0 END) AS Mentioned
FROM parcels
UNION ALL
SELECT 'Germany' AS Mention,
SUM(CASE WHEN location LIKE '%Germany%' THEN 1 ELSE 0 END) AS Mentioned
FROM parcels
UNION ALL
SELECT 'Ireland' AS Mention,
SUM(CASE WHEN location LIKE '%Ireland%' THEN 1 ELSE 0 END) AS Mentioned
FROM parcels
)As Mentions
ORDER BY Mentioned DESC;





