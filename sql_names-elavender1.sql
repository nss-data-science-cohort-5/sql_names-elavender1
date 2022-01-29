--1. How many rows are in the names table?
Select COUNT(*)
FROM names
--1 Answer: 1957046

--2 How many total registered people appear in the dataset?
SELECT SUM(num_registered)
FROM names
--2 Answer: 351653025

--3 Which name had the most appearances in a single year in the dataset?
SELECT name, year, sum(num_registered) as sum_name_year
FROM names
GROUP BY name, year
ORDER BY sum_name_year DESC
--Answer 3: Linda, 1947, 99905

--4. What range of years are included?
SELECT MIN(year), MAX(year)
FROM names
--ANSWER 4: 1880-2018

--5. What year has the largest number of registrations?
SELECT year, SUM(num_registered) AS sum_reg_year 
FROM names
GROUP BY year
ORDER BY sum_reg_year DESC, year 
--ANSWER 5: 1957, 4200022

--6. How many different (distinct) names are contained in the dataset?
SELECT COUNT(DISTINCT name)
FROM names;
--ANSWER 6: 98400

--7. Are there more males or more females registered?
SELECT SUM(num_registered)
FROM names
WHERE gender = 'M'
--177573793
SELECT SUM(num_registered)
FROM names
WHERE gender = 'F'
--174079232
--Answer 7: There are more males than females registered

--8.What are the most popular male and female names overall (i.e., the most total registrations)?
SELECT name, gender, sum(num_registered) AS name_sum
FROM names
GROUP BY name, gender
ORDER BY name_sum DESC;

--9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT name, gender, SUM(num_registered)
FROM names
WHERE year between 2000 AND 2009
GROUP BY name, gender
ORDER BY SUM (num_registered) DESC;

--10. Which year had the most variety in names (i.e. had the most distinct names)?
SELECT year, COUNT(DISTINCT name)
FROM names
GROUP BY year
ORDER BY COUNT(DISTINCT name) DESC;

--11. What is the most popular name for a girl that starts with the letter X?
SELECT name, sum(num_registered) AS sum_num_registered
FROM names
WHERE gender = 'F' AND name LIKE 'X%'
GROUP BY name
ORDER BY sum_num_registered DESC;

--12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
SELECT name, COUNT (DISTINCT names)
FROM names
WHERE name like 'Q%' 
AND name NOT Like 'Qu%' 
GROUP BY name
ORDER BY COUNT (DISTINCT names) DESC

--13 Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.	
SELECT name, SUM(num_registered)
FROM names
WHERE name = 'Steven' 
OR name = 'Stephen'
GROUP BY name;

--15. How many names have made an appearance in every single year since 1880?
