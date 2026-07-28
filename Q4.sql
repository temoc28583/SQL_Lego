select t.name, count(*) as "num_sets" from sets s inner join themes t on t.id=s.theme_id group by t.id, t.name order by num_sets desc limit 10;


 * 
 