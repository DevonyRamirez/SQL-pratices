create
or replace function sayHello () returns varchar as 
$$
begin 
	return 'Hola mundo'; end

$$
language plpgsql;


select sayhello();


-- segunda funcion
create
or replace function sayHello ( user_name varchar) returns varchar as 
$$
begin 
	return 'Hola '|| user_name ; 
	
end

$$
language plpgsql;


select sayhello(users.name), users.name from users;


-- con el json

create
or replace function comment_replies ( id integer) 
returns json 
as 
$$

declare result_j json; 
begin 
	 select 
	json_agg( json_build_object(
	  'user', comments.user_id,
	  'comment', comments.content
	)) into result_j
from comments where comment_parent_id = id;

	return result_j;
end;

$$
language plpgsql;

select comment_replies(1);