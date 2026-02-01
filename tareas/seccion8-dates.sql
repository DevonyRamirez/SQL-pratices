-- ver empleados
select * from employees where hire_date>'1998-02-05' ;

-- empleado mas nuevo y viejo
select max(hire_date) as mas_nuevo, min(hire_date) as primer_empleado from employees order by mas_nuevo asc;

-- rango de años
select * from employees where hire_date BETWEEN '1990-01-01' and '1995-01-01'  order by hire_date asc;


-- sumar dias
select max(hire_date) as actually ,
	max(hire_date) + interval '1 month' as month,
	date_part('year',now()),
	make_interval (years:=2023)
	
	from employees;
	
-- 	diferencias entre fechas y actualizaciones
select hire_date, make_interval(YEARS:=2026- EXTRACT(YEARS from hire_date):: integer) from employees;
-- as manual

select hire_date, make_interval(YEARS:=date_part('years', CURRENt_date)::integer- EXTRACT(YEARS from hire_date):: integer) from employees;
-- as computed


select hire_date 
		hire_date + INTERVAL '26 years'
from employees;


update employees set hire_date=hire_date+ INTERVAL '23 YEARS';


-- CASE-THEN

SELECT first_name, last_name, hire_date,
case 
	when hire_date>now()- interval '1 year' then 'Rango A'
	else 'Rango D'
end as rango_antiguedad from employees order by hire_date desc;