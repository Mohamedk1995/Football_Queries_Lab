
--psql -d football -f football_queries.sql
-- Find all the matches from 2017.
SELECT * FROM matches WHERE season = 2017;

--Find all the matches featuring Barcelona.
SELECT * FROM matches WHERE hometeam = 'Barcelona' AND awayteam = 'Barcelona';

--What are the names of the Scottish divisions included?
SELECT * FROM divisions WHERE country = 'Scotland';

-- Find the division code for the Bundesliga. Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.
SELECT code FROM divisions WHERE name = 'Bundesliga';
SELECT COUNT(*) FROM matches WHERE division_code = 'D1' AND (hometeam = 'Freiburg' OR awayteam = 'Freiburg');

--Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT * FROM matches WHERE (hometeam LIKE '%City%' OR awayteam LIKE '%City%');

--How many different teams have played in matches recorded in a French division?
SELECT COUNT (DISTINCT hometeam) FROM matches WHERE division_code LIKE 'F%';

--Have Huddersfield played Swansea in the period covered?
SELECT * FROM matches WHERE hometeam = 'Huddersfield' AND awayteam = 'Swansea' OR awayteam = 'Huddersfield' AND hometeam = 'Swansea';

--How many draws were there in the Eredivisie between 2010 and 2015?
SELECT code FROM divisions WHERE name ='Eredivisie';
SELECT COUNT(*) FROM matches WHERE division_code = 'N1' AND ftr = 'D' AND season BETWEEN 2010 AND 2015;

--Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
SELECT * FROM matches WHERE division_code = 'E0' ORDER BY (ftag + fthg) DESC, fthg DESC;

--In which division and which season were the most goals scored?
SELECT SUM(fthg + ftag) AS GoalsPerSeason, division_code, season from matches GROUP BY division_code, season ORDER BY SUM(fthg + ftag) DESC;