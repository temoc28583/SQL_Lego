WITH set_per_year AS (
    SELECT COUNT(*) AS num_sets, year
    FROM sets
    GROUP BY year
)
SELECT
    year,
    num_sets,
    LAG(num_sets) OVER (ORDER BY year) AS prev_year_sets,
    num_sets - LAG(num_sets) OVER (ORDER BY year) AS change
FROM set_per_year
ORDER BY year;


/*
-- Query 8: How does LEGO's yearly set output change year over year?
-- Finding: set counts climb over the decades (single digits in the 1950s to
--   hundreds in recent years); the `change` column shows the year-over-year delta.
-- LAG mechanic: LAG(num_sets) OVER (ORDER BY year) pulls num_sets from the
--   PREVIOUS ROW in year order. Subtracting gives the delta. The 1949 row is
--   NULL for prev/change because it has no earlier row to look back to.
-- ORDER BY is required inside OVER(): "previous row" is undefined without a
--   defined order. No PARTITION BY here — we want one continuous timeline, not
--   a per-group reset (contrast Q7, which partitioned by theme).
-- Gap caveat: LAG is ROW-relative, not CALENDAR-relative. Years with zero sets
--   (e.g. 1951, 1952) produce no row, so for 1953 prev_year_sets = 1950's count.
--   Any missing year silently widens the step, so `change` isn't always a true
--   1-year delta. To force real calendar years, generate_series a full year
--   list and LEFT JOIN the counts — heavier, and arguably unwanted here since
--   zero-set years aren't interesting for a growth story.
*/

