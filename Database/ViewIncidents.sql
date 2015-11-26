-- VIEW INCIDENTS
SELECT  c.Name AS Customer, p.Name AS Product, i.Title, i.Description, t.Name AS Technician, i.DateOpened, i.DateClosed
FROM Customers AS c 
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Products AS p ON i.ProductCode = p.ProductCode 
INNER JOIN Technicians AS t ON i.TechID = t.TechID

-- VIEW TECH DETAILS
SELECT t.Name, t.Phone, t.Email, t_Types.TypeName, t.Employed
FROM Technicians as t
INNER JOIN TechTypes as t_Types ON t.TypeID = t_Types.TypeID

use TechSupport ;
-- SELECT TECH BY NUMBER INCIDENTS ASSIGNED
SELECT t.TechID, t.Name AS Technician,  
(count(i.IncidentID)) AS 'Assigned Incidents'
FROM Incidents AS i
INNER JOIN Technicians AS t ON i.TechID = t.TechID
WHERE T.Employed = 0
GROUP BY t.Name
ORDER BY 'Assigned Incidents' DESC


-- VIEW INCIDENTS BY TECH ID
use TechSupport ;
SELECT  c.Name AS Customer, p.Name AS Product, i.Title, i.Description, t.Name AS Technician, i.DateOpened, i.DateClosed
FROM Customers AS c 
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Products AS p ON i.ProductCode = p.ProductCode 
INNER JOIN Technicians AS t ON i.TechID = t.TechID
where t.TechID = 11
order by t.Name

--UPDATE INCIDENT QUERY FROM GRIDVIEW
UPDATE Incidents
SET CustomerID =  (	
					SELECT c.CustomerID
					FROM Customers as c
					WHERE c.Name = @ClientName
				  ), 
	ProductCode = (
					SELECT p.ProductCode 
					FROM Products as p
					WHERE p.Name = @ProdName
				  ), 
	TechID =	  (
					SELECT t.TechID 
					FROM Technicians as t
					WHERE t.Name = @TechName
				   ), 
	DateOpened = Convert(datetime, @Opened, 103), 
	DateClosed = Convert(datetime, @Closed, 103), 
	Title = @Title, 
	Description = @Descr
WHERE IncidentID = @IncidentID;

-- SELECT ALL CUSTOMERS WITH SUBSCRIBED REGISTRATION
SELECT DISTINCT c.Name
FROM Customers AS c
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Registrations as r on c.CustomerID = r.CustomerID
WHERE r.Subscribed = 0;