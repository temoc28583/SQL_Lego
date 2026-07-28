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