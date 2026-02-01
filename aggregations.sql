
-- WORLD DATABASE ASSIGNMENT

USE world;


-- QUESTION 1
-- Count how many cities are there in each country

SELECT c.Name AS Country,
       COUNT(ci.ID) AS TotalCities
FROM Country c
LEFT JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name;


-- QUESTION 2
-- Display all continents having more than 30 countries

SELECT Continent,
       COUNT(*) AS TotalCountries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;


-- QUESTION 3
-- List regions whose total population exceeds 200 million

SELECT Region,
       SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;


-- QUESTION 4
-- Find the top 5 continents by average GNP per country

SELECT Continent,
       AVG(GNP) AS AvgGNP
FROM Country
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;


-- QUESTION 5
-- Find the total number of official languages spoken in each continent

SELECT c.Continent,
       COUNT(cl.Language) AS TotalOfficialLanguages
FROM Country c
JOIN CountryLanguage cl
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;


-- QUESTION 6
-- Find the maximum and minimum GNP for each continent

SELECT Continent,
       MAX(GNP) AS MaxGNP,
       MIN(GNP) AS MinGNP
FROM Country
GROUP BY Continent;


-- QUESTION 7
-- Find the country with the highest average city population

SELECT c.Name AS Country,
       AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;


-- QUESTION 8
-- List continents where the average city population is greater than 200,000

SELECT c.Continent,
       AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;


-- QUESTION 9
-- Find the total population and average life expectancy
-- for each continent ordered by average life expectancy descending


SELECT Continent,
       SUM(Population) AS TotalPopulation,
       AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;


-- QUESTION 10
-- Find the top 3 continents with the highest average life expectancy,
-- only include those where total population is over 200 million

SELECT Continent,
       AVG(LifeExpectancy) AS AvgLifeExpectancy,
       SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC





