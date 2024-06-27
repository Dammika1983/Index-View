USE world;
# 1. Write a query that displays all that is known about Canadian cities.
SELECT city.Name, city.Population, city.District, city.CountryCode
FROM city
WHERE city.CountryCode = "CAN";

#2.Create a view vw_Canadian_cities based on the above query.
CREATE VIEW vw_Canadian_cities AS
SELECT city.Name, city.Population, city.District, city.CountryCode
FROM city
WHERE CountryCode = "CAN";

# 3. In the top left panel of MySQL Workbench, expand the View menu item of the world database. In the menu bar, click on Query then Refresh to refresh the view and verify that the view vw_Canadian_cities is now listed.
SELECT * FROM vw_Canadian_cities;

#4.Using the view from step 2, write a query that displays all that is known about Ottawa.
SELECT Name, Population, District, CountryCode
FROM vw_Canadian_cities
WHERE Name = "Ottawa";

# 5. Write an update query on the view from step 2 to update the population of Ottawa to 883391.
UPDATE vw_Canadian_cities
SET Population = "883391"
WHERE Name = "Ottawa";

# 6. Rerun the query from Step 4. Is the Population updated?
SELECT Name, Population
FROM vw_Canadian_cities
WHERE Name = "Ottawa";

# 7. Create a view called vw_L5 that displays country codes, city names, country names and independence year of every country whose IndepYear field is not null. Rename the country name field "CountryName". (CREATE VIEW, INNER JOIN..ON, tables name and country).
CREATE VIEW VW_L5 AS
SELECT city.CountryCode, city.Name, country.IndepYear, country.Name AS "CountryName"
FROM city 
INNER JOIN country 
ON city.CountryCode = country.Code
WHERE country.IndepYear;

#  In the top left panel of MySQL Workbench, expand the View menu item of the world database. In the menu bar, click on Query then Refresh to refresh the view and verify that the view vw_L5 is now listed.
SELECT * FROM VW_L5;

# 8. Using the view vw_L5, write a query that lists all distinct CountryNames.
SELECT DISTINCT CountryName FROM VW_L5;

#9. Create a view vw_L5_1 based on the above query. 
CREATE VIEW VW_L5_1 AS
SELECT DISTINCT CountryName
FROM VW_L5;

SELECT * FROM VW_L5_1;

# 10.Using view vw_L5, write a query that reports the number of countries that became independent per year. Rename the number of countries as nCount (GROUP BY)
SELECT COUNT(CountryName) AS "nCount", IndepYear
FROM VW_L5
GROUP BY IndepYear;

#11. Create a view vw_L5_2 based on the above query.
CREATE VIEW VW_L5_2 AS
SELECT COUNT(CountryName ) AS "nCount", IndepYear
FROM VW_L5
GROUP BY IndepYear;

SELECT * FROM VW_L5_2;

#12. Write an update query that updates the view vw_L5_2 and sets nCount to 21 for Indepyear 1066. Is the query succesful? Why or why not?
UPDATE VW_L5_2
SET nCount = "21"
WHERE IndepYear = "1066";

#13. Joining vw_L5 and CountryLanguage, write a query that lists the countryName along with the languages spoken in each country and their respective percentages. Sort the list by CountryName then by language. Make sure each record occurs only once.
SELECT VW_L5.CountryName, countrylanguage.Language, countrylanguage.Percentage
FROM VW_L5
INNER JOIN countrylanguage 
ON VW_L5.CountryCode = countrylanguage.CountryCode
GROUP BY countrylanguage.Language;

# 14. Drop the view vw_L5
DROP VIEW IF EXISTS vw_L5;

#15. Drop the view vw_L5_1
DROP VIEW IF EXISTS vw_L5_1;

#16.	Drop the view vw_L5_2
DROP VIEW IF EXISTS vw_L5_2;

#17.	Drop the view vw_Canadian_cities;
DROP VIEW IF EXISTS vw_Canadian_cities;








