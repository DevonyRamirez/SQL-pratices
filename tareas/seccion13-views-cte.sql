--  vista normal
create view comments_per_week as
select date_trunc('week',posts.created_at) as weeks,

count(DISTINCT posts.post_id) as number_of_posts,
sum(claps.counter) as total_claps

from posts
inner join claps on claps.post_id=posts.post_id

group by weeks order by weeks desc;

-- para llamar a la vista
select * from comments_per_week;

--para cambiar el nombre de la vista
alter view comments_per_week rename to comments_per_week_v2;

-- vista materializada

create MATERIALIZED view comments_per_week_mat as
select date_trunc('week',posts.created_at) as weeks,

count(DISTINCT posts.post_id) as number_of_posts,
sum(claps.counter) as total_claps

from posts
inner join claps on claps.post_id=posts.post_id

group by weeks order by weeks desc;


select * from posts WHERE post_id=1;

-- para refrescar la vista materializada
refresh MATERIALIZED view comments_per_week_mat;

--para cambiar el nombre de la vista materializada
alter MATERIALIZED view comments_per_week_mat rename to comments_per_week_mat_v2;

--cte recursivo descendente

with recursive countdown(val) as (
	--inicializacion primer nivel o valores iniciales
	
	select 5 as val
	UNION
	--query recursive
	select val-1 from countdown where val>1
	
)
-- select de los campos
select * from countdown;


--cte recursivo ascendente
with recursive countdown(val) as (
	--inicializacion primer nivel o valores iniciales
	
	select 1 as val
	UNION
	--query recursive
	select val+1 from countdown where val<10
	
)
-- select de los campos
select * from countdown;


--recursive multiplicacion

with recursive multi(base,val,result) as (
	--inicializacion primer nivel o valores iniciales
	
	select 5 as base,1 as val, 5 as RESULT 
	UNION
	--query recursive
	select 5 as base, val+1, (val+1)*base from multi where val<10
	
)
-- select de los campos
select * from multi;



--cte recursico con jerarquia de empleados
with recursive bosses as (
	--inicializacion primer nivel o valores iniciales
	
	select employees.id, employees.name, employees.report_to from employees where id=5
	UNION
	--query recursive
	select employees.id,employees.name,employees.report_to from employees 
	inner join bosses on bosses.id= employees.report_to
	
	
)
-- select de los campos
select * from bosses;

--con limite
with recursive bosses as (
	--inicializacion primer nivel o valores iniciales
	
	select employees.id, employees.name, employees.report_to, 1 as depth from employees where id=1
	UNION
	--query recursive
	select employees.id,employees.name,employees.report_to, DEPTH+1 from employees 
	inner join bosses on bosses.id= employees.report_to
	
	where depth<2
	
)
-- select de los campos
select * from bosses
left join employees on employees.id=bosses.report_to;

