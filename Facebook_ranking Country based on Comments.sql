-- Which countries have risen in the rankings based on the number
-- of comments between Dec 2021 vs Jan 2022?
-- Hint: Avoid gaps between ranks when ranking countries

-- Fb_comments_count(
-- User_id int,
-- Created_at datetime,
-- Number_of_comments int);

-- Fb_active_users(
-- User_id int,
-- Name varchar,
-- Status varchar,
-- Country varchar);

WITH dec_summary AS (
SELECT 
	COUNTRY,
    SUM(Number_of_comments) AS 'TOTAL COMMENTS',
    DENSE_RANK() OVER(ORDER BY SUM(Number_of_comments) DESC) AS 'RANKS_OF_COUNTRIES'
FROM Fb_active_users as au
LEFT JOIN Fb_comments_count as cc
ON au.User_id = cc.User_id
WHERE Created_at BETWEEN '2021-12-01' AND '2021-12-31'
AND Country IS NOT NULL
GROUP BY COUNTRY),

jan_summary AS (
SELECT 
	COUNTRY,
    SUM(Number_of_comments) AS 'TOTAL COMMENTS',
    DENSE_RANK() OVER(ORDER BY SUM(Number_of_comments) DESC) AS 'RANK_OF_COUNTRIES'
FROM Fb_active_users as au
LEFT JOIN Fb_comments_count as cc
ON au.User_id = cc.User_id
WHERE Created_at BETWEEN '2022-01-01' AND '2022-01-30'
AND Country IS NOT NULL
GROUP BY COUNTRY
);

SELECT * FROM jan_summary AS j
LEFT JOIN dec_summary AS d
ON j.COUNTRY = d.COUNTRY
WHERE j.RANK_OF_COUNTRIES = d.RANK_OF_COUNTRIES;

