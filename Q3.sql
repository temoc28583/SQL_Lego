select m.fig_num , name, num_parts from minifigs m order by num_parts desc limit 10;
/*
part / element / piece  =  one molded object (atomic, indivisible)
num_parts               =  how many of those you snapped together
-- Q3 insight: what does "top by part count" actually reveal?

GET the top 10 minifigs by num_parts       (the query)

LOOK at the part counts
  IF the numbers form a smooth gradient
      → the table is homogeneous, ranking is straightforward
  IF the numbers cluster with a big gap    (118+  ...then normal figs)
      → the table is mixing two kinds of thing

INSPECT what sits above the gap
  → all brick-built models (Dry Bowser, Bowser, Mack, Donkey Kong)
  → NOT standard minifigs

ASK why they rank high
  → their detail comes from CONSTRUCTION (many bricks assembled)
  → standard figures' detail comes from MOLDING + PRINTING (few parts)
  → so num_parts measures HOW A FIGURE IS MADE, not how detailed it looks

CONCLUDE
  → "top by parts" ≠ "most complex minifig"
  → the ranking surfaced a category boundary hiding inside one table

*/
