select theme_id, name, num_parts
from (
    select s.theme_id,
           s.name,
           s.num_parts,
           row_number() over (partition by s.theme_id order by s.num_parts desc) as rn
    from sets s
    where s.num_parts > 0
) ranked
where rn = 1
order by num_parts desc;
/*
-- Query 7: What is the largest single set in each theme?
-- Finding: returns one row per theme — that theme's flagship (biggest) set.
--   e.g. theme 709 → World Map (11,695), theme 721 → Eiffel Tower (10,001).
-- What it measures: a PEAK, not a total. row_number() ranks sets *within* each
--   theme by their own part count; where rn = 1 keeps only the winner and
--   discards the rest. Nothing is summed across the theme.
-- What it deliberately does NOT measure: which themes are biggest overall.
--   That's a different question — SUM(num_parts) for total volume, or COUNT(*)
--   for number of sets. A theme of many mid-size sets can lose here to a theme
--   with one giant set.
-- Real-world note: the line-1 flagship (World Map, Art theme) is a MOSAIC —
--   ~11k identical 1×1 round tiles on 40 baseplates. Its record part count
--   reflects image resolution, not build complexity. num_parts is a noisy
--   proxy: it counts pieces, not sophistication (same caveat as Q3's Dry Bowser).
-- Tiebreaker note: ROW_NUMBER with no tiebreaker in ORDER BY picks arbitrarily
--   among sets tied on num_parts (nondeterministic run-to-run). Use RANK /
--   DENSE_RANK instead if tied flagships should both be kept.
-- Cross-check: the overall largest set in the DB must appear here at rn = 1 for
--   its theme — if it were missing, the partition logic would be broken.
*/
