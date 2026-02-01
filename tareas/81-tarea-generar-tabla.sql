

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

select count(*) as total, b.name from country a
inner join continent b on a.continent=b.code
where b.name not like '%America'
group by b.name 
UNION
SELECT count(*) as total, 'America' from country a INNER JOIN continent b on a.continent=b.code where b.name like '%America' order by total asc; 

-- pais con mas ciudades
SELECT count(*), b.name from city a
inner join country b on a.countrycode=b.code
GROUP by b."name" order by count(*) desc limit 1 ;