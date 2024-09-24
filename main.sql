CREATE DATABASE netflixs;

use netflixs;

-- 1. Group by type of content

SELECT 
    type,
    COUNT(*)
FROM netflix_titles
GROUP BY type;


-- 2. Find the most common rating for movies and TV shows

WITH RatingCounts AS (
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count
    FROM netflix_titles
    GROUP BY type, rating
),
RankedRatings AS (
    SELECT 
        type,
        rating,
        rating_count,
        RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT 
    type,
    rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;


-- 3. List all movies released in a specific year (e.g., 2020)

SELECT * 
FROM netflix_titles
WHERE release_year = 2020;


-- 4. Find the top 5 countries with the most content on Netflix

SELECT country, COUNT(*) as total_content
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;


-- 5. Identify the longest movie

SELECT * 
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;


-- 6. Find content added in the last 5 years

SELECT *
FROM netflix_titles
WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= CURDATE() - INTERVAL 5 YEAR;


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'

SELECT * 
FROM netflix_titles
WHERE FIND_IN_SET('Rajiv Chilaka', REPLACE(director, ', ', ',')) > 0;


-- 8. List all TV shows with more than 5 seasons

SELECT *
FROM netflix_titles
WHERE type = 'TV Show'
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5;


-- 9. Count the number of content items in each genre

SELECT 
    genre,
    COUNT(*) as total_content
FROM (
    SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, ',', n.n), ',', -1)) genre
    FROM netflix_titles 
    CROSS JOIN (SELECT a.N + b.N * 10 + 1 n
    FROM (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    , (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
    ) n
    WHERE n.n <= 1 + (LENGTH(listed_in) - LENGTH(REPLACE(listed_in, ',', '')))
) AS genres
GROUP BY genre;


-- 10. Find each year and the average numbers of content release by India on Netflix

SELECT 
    release_year,
    COUNT(show_id) as total_release,
    ROUND(COUNT(show_id) / (SELECT COUNT(show_id) FROM netflix_titles WHERE country LIKE '%India%') * 100, 2) AS avg_release
FROM netflix_titles
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY avg_release DESC
LIMIT 5;


-- 11. List all movies that are documentaries

SELECT * 
FROM netflix_titles
WHERE listed_in LIKE '%Documentaries%';


-- 12. Find all content without a director

SELECT * 
FROM netflix_titles
WHERE director IS NULL;


-- 13. Find how many movies actor 'Salman Khan' appeared in the last 10 years

SELECT * 
FROM netflix_titles
WHERE casts LIKE '%Salman Khan%'
AND release_year > (YEAR(CURDATE()) - 10);


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India

SELECT 
    actor,
    COUNT(*) AS appearances
FROM (
    SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(casts, ',', n.n), ',', -1)) AS actor
    FROM netflix_titles
    CROSS JOIN (
        SELECT a.N + b.N * 10 + 1 AS n
        FROM (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
        , (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ) n
    WHERE n.n <= 1 + (LENGTH(casts) - LENGTH(REPLACE(casts, ',', '')))
) AS actors
WHERE actor IS NOT NULL 
  AND LENGTH(actor) > 0 
  AND FIND_IN_SET('India', REPLACE(country, ', ', ',')) > 0
GROUP BY actor
ORDER BY appearances DESC
LIMIT 10;


-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field

SELECT 
    CASE 
        WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
        ELSE 'Good'
    END AS category,
    type,
    COUNT(*) AS content_count
FROM netflix_tiles
GROUP BY category, type
ORDER BY type;


