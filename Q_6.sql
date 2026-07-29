select c.name, sum(ip.quantity) as "color_quantity"
from colors c
inner join "inventory_parts" ip on c.id = ip.color_id 
group by c.id, c.name
order by color_quantity desc
limit 10;
/*
-- Q6: Which colors have the highest total part quantity across inventories?
-- Metric: SUM(ip.quantity) = total parts of each color across ALL set
--   inventories (weighted by parts/set x sets). NOT distinct sets, NOT
--   real-world production. Note: is_spare not filtered -> spares included.
-- Finding: black tops the list -- it's a structural/neutral color (Technic,
--   tires, frames) used across every theme, so it accumulates. Brights
--   (red/yellow/blue) rank lower -> catalog is mostly neutral structure.
-- KEY INSIGHT: the grays encode LEGO's 2004 palette change ("bley").
--   Light/Dark BLUISH Gray (#2/#4) = post-2004 replacements; old Light
--   Gray (#10) is only the pre-2004 tail. Reddish Brown (#9) replaced old
--   brown. The ranking is really a fossil record of production era.
-- Follow-up: bucket Light Gray vs Light Bluish Gray by set year to show
--   the 2004 break directly.
*/
