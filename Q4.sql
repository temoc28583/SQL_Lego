select t.name, count(*) as "num_sets" from sets s inner join themes t on t.id=s.theme_id group by t.id, t.name order by num_sets desc limit 10;


 -- Q4: Themes with the most sets (INNER JOIN + COUNT + GROUP BY).
-- Finding: Star Wars leads (1045), but 5 of the top 10 are merchandise
-- categories (Key Chain, Bags/Luggage, Stationery, Gear, Houseware),
-- not building themes. COUNT(*) measures catalog entries per theme,
-- so accessory lines inflate the ranking. "Most sets" != "most builds."
