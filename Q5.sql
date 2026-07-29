select ROUND(AVG(num_parts)),(s.year/10)*10 as "decades" FROM "sets" s WHERE num_parts > 0 group by "decades" order by "decades" ASC; 

/*

-- Q5: Has average set size grown over the decades?
-- Finding: avg parts/set climbed ~20x, 1950s (19) -> 2020s (381).
--   Steepest after 2000. One dip in the 1980s.
-- Caveat 1 (sample): 1940s row (96) is a near-empty bucket -- LEGO
--   plastic bricks start ~1949. Check num_sets; it's a tiny n, not a
--   real "high starting point." Ignore for trend.
-- Caveat 2 (what the mean measures): most sets are still small
--   (<500 parts). The rising MEAN is pulled by a small number of
--   huge collector sets, not a shift in the typical set. A MEDIAN
--   would likely look flatter -- worth flagging.
--
-- Market drivers behind the climb:
--   1950s-70s: small kids' starter boxes -> low baseline.
--     Technic (1977) + minifigure (1978) add build complexity.
--   1980s dip (hypothesis): flood of small themed impulse sets
--     (Town/Space/Castle) + DUPLO pulls the average DOWN even as
--     the product range widens. VERIFY: check share of small sets
--     in the 80s vs num_sets count.
--   1999-2000s: licensing era -- Star Wars (1999), Harry Potter
--     (2001). Bigger, pricier sets aimed at older fans.
--   2010s-2020s: "Adults Welcome" pivot. UCS, Modular, Icons,
--     Architecture, Botanicals -> large display sets for AFOLs
--     with disposable income. This is what drives 2020s = 381.
*/
