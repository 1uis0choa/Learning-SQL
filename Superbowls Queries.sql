SELECT * FROM superbowls;

/* How many teams have won the most superbowls? */
SELECT count(*), winner FROM superbowls
GROUP BY winner
ORDER BY count(*) desc;


/* Analyze each final result and create a column that describes each final by the amount of points scored by each team.
	Divide by point difference .. greater than 20, less than 20, 10, and 5 points. */
SELECT date, winner, loser, 
CASE
    WHEN Winner_Pts-Loser_Pts>20 THEN 'Ran Through'
    WHEN Winner_Pts-Loser_Pts<20 THEN 'Crushed'
    WHEN Winner_Pts-Loser_Pts<10 THEN 'By 10'
    WHEN Winner_Pts-Loser_Pts<5 THEN 'Barely'
    END AS "Defeat"
FROM superbowls;


/* Which state has housed the most superbowls? */
SELECT count(*)as number, state 
FROM superbowls 
group by state
having count(*)>2
ORDER BY number desc;

/* Find the finals that were played in Florida OR California */
SELECT date, winner, loser, state FROM superbowls
where state='California' or state='Florida';

/* What was the average points scored by the winners and losers of the superbowl? */
SELECT avg(Winner_Pts) as avgWinner, avg(Loser_Pts) as avgLoser from superbowls;

/* What was the maximum points scored by the winner in a superbowl? 
	SUBQUERY */
SELECT max(Winner_Pts) as maxWinner, winner, loser, date
FROM superbowls
WHERE Winner_Pts = (Select Max(Winner_Pts) FROM superbowls)
GROUP BY winner, loser, date;

/* Give me the data for the last 20 superbowls*/
SELECT TOP(20) date, sb, winner, loser, winner_pts, loser_pts, mvp, stadium, city, state FROM superbowls;

SELECT date, sb, winner, loser, winner_pts, loser_pts, mvp, stadium, city, state from superbowls
WHERE date > '01-01-2001';

/* Did anyone win Superbowl MVP more than once? */
SELECT MVP, count(*) number_of_MVP FROM superbowls
GROUP BY MVP
ORDER BY number_of_MVP desc;

--Find how score difference has changed over years
SELECT [date], winner_pts-loser_pts as score_difference FROM superbowls
order by date asc;