

-- 1. Ver todos los registros
Select * from users;

-- 2. Ver el registro cuyo id sea igual a 10
Select * from users where id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
Select * from users where name like 'Jim %'

-- 4. Todos los registros cuyo segundo nombre es Alexander
Select * from users where name like '% Alexander'

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
update users set name='Devony Ramirez' where id=2;

-- 6. Borrar el último registro de la tabla
delete from users where id = (select max(id)from users)