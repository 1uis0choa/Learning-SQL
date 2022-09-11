SELECT * FROM superbowls;

SELECT Winner, COUNT(*) 
FROM superbowls
GROUP BY Winner;