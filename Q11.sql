select pc.name as category, sum(ip.quantity) as total_pieces from sets s join inventories i on i.set_num= s.set_num join inventory_parts ip on ip.inventory_id= i.id join parts p on p.part_num= ip.part_num  join part_categories pc on pc.id= p.part_cat_id where s.theme_id in (select id from themes where name ='Star Wars') and i.version=1 group by pc.id, pc.name order by total_pieces desc limit 10

-- Q11: Which part categories dominate Star Wars sets, by total piece count?
--
-- SELECT   category name, and the summed quantity of pieces
-- FROM     sets
--   JOIN   inventories      -- set → its inventory   (on set_num)
--   JOIN   inventory_parts  -- inventory → its parts + quantities  (on inventory id)
--   JOIN   parts            -- part_num → part's category id  (on part_num)
--   JOIN   part_categories  -- category id → readable name  (on id)
-- WHERE    set's theme is Star Wars   (IN, because multiple SW theme rows)
--   AND    inventory version = 1      (avoid double-counting re-releases)
-- GROUP BY category           -- pool every part in the theme into category bins
-- ORDER BY total pieces DESC   -- biggest bins first
-- LIMIT    10