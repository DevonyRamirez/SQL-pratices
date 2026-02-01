

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


-- quiero saber cuales son los idiomas que se hablan por continente
select  distinct a."language", c."name" from countrylanguage a 
inner join country b on a.countrycode=b.code
inner join continent c on b.continent=c.code

where a.isofficial is TRUE;

-- cuantos idiomas se hablan por continente
select count(*), continent from (
	select  distinct a."language", c."name" as continent from countrylanguage a 
	inner join country b on a.countrycode=b.code
	inner join continent c on b.continent=c.code
	where a.isofficial is TRUE
) as totales GROUP by continent; 


