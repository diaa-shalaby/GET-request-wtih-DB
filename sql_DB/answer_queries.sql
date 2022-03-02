use sportradar;

SELECT * FROM impressions;
SELECT * FROM conversions;

-- How many impressions have we served in Austria?
SELECT COUNT(request_country) as 'Number of impressions in Austria'
FROM impressions
WHERE request_country = 'AT';

-- For each converted user, find out how many impressions they were served.
SELECT i.user_id, COUNT(*) AS 'Number of impressions served'
FROM impressions i
	JOIN conversions c
    ON i.user_id = c.user_id
    GROUP BY c.user_id;
    
    
-- List all the different browsers that we have served impressions on in the last week.
SELECT DISTINCT request_browser_name
	FROM impressions
    WHERE DATEDIFF(CURRENT_DATE(), `timestamp`) <= 7;
