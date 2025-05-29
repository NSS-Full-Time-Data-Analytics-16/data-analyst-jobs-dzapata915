SELECT *
FROM data_analyst_jobs;

--Question 1. 1793
SELECT COUNT (*)
FROM data_analyst_jobs;

--Question 2. ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Question 3. 
--21 job postings in TN
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location='TN';

--27 job postings in TN or KY
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location IN ('TN','KY');

--Question 4. 
--3 postings in TN with a star rating above 4
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location='TN'
AND star_rating >4;

--Question 5. 151
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Question 6. Nebraska
SELECT location AS state,ROUND(AVG(star_rating),2)AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY ROUND(AVG(star_rating),2) DESC;

--Question 7. 881
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;

--Question 8.
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location='CA';

--Question 9.
SELECT company,ROUND(AVG(star_rating),1)AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
AND company IS NOT NULL
GROUP BY company;

--40 distinct companies with more than 5k reviews
SELECT COUNT(DISTINCT(company))
FROM data_analyst_jobs
WHERE review_count>5000
AND company IS NOT NULL;

--Question 10.
SELECT company,AVG(star_rating)AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

--Question 11. 
SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

--11b. how many different titles are there: 774
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--Question 12. Tableau
SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
	AND title NOT ILIKE '%Analytics%';

--BONUS
SELECT domain AS industry,COUNT(title)AS hard_to_fill_jobs
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
	AND (days_since_posting/7) >3
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill_jobs DESC
LIMIT 4;



