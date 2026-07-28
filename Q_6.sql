select c.name, sum(ip.quantity) as "color_quantity"
from colors c
inner join "inventory_parts" ip on c.id = ip.color_id 
group by c.id, c.name
order by color_quantity desc
limit 10;