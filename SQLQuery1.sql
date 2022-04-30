--Checking if the table was brought in correctly

Select *
From [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$
Order by ORTG desc


--Looking only at specific columns from the PlayerStats table. Easy way to look at the order of players for specific stats. 
Select full_name, team, pos, PPG, APG
From [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$
--Where team like 'hou'
Order by 4 desc


--The average age of the team for each team.
Select team, AVG(age) as AverageAge
From [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$
Group by team
Order by AverageAge desc
--Conclusion: The lakers and nets were at a shocking almost 30 year old age of players, while memphis and okc were the youngest at 24. 

--The average ORTG of the team for each team.
Select team, AVG(ORTG) as AverageORTG
From [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$
Group by team
Order by AverageORTG 


--Lets find out which teams have good player development programs for younger players. Aka the average ORTGs and DRTGs of their players in the age group of 19-22. 
--Note that there are only 26 teams here, as the 4 missing teams did not have any players in the non-inclusive age range of 19 to 22 OR did not have registered ORTGs and DRTGs.
Select full_name, team, age , ORTG, DRTG
From [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$
Where age BETWEEN 19 AND 22
AND ORTG is not null
Order by team

--Select count (DISTINCT team) as "number of teams"
--FROM [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$

Select team, AVG(age) as AverageAge, AVG(ORTG) as AverageORTG, AVG(DRTG) as AverageDRTG
From [NBA 2021-22 Reg Season Portfolio Project]..PlayerStats$
Where age BETWEEN 19 AND 22
AND ORTG is not null
Group by team
Order by AverageORTG

--Jazz has the worst ORTG in the NBA's young core. Potential indicator of a poor player development program.
--On the other hand, toronto has the best ORTG in the NBA's young core. Could be due to better talent, or great coaching and PD. 
--In DTRG, sacramento has the worst (highest) , while indiana has the best (lowest)