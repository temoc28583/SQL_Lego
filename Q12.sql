select (s.year/10) as "decade", count(distinct ip.color_id ) as "distinct_colors" , count(distinct s.set_num) as "num_sets" from inventory_parts ip inner join inventories i on i.id =ip.inventory_id inner join sets s on s.set_num  =i.set_num 
where s.year>0
group by decade 
order by decade desc;