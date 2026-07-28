with parts_per_year AS(select year, sum(num_parts) as parts_that_year from sets group by year) select year, parts_that_year, SUM(parts_that_year) over (order by year) as cumulative_parts from parts_per_year;


-- Q9: Cumulative parts released over time (running total)
-- CTE aggregates SUM(num_parts) per year; outer query applies
-- SUM(parts_that_year) OVER (ORDER BY year) for the running total.
-- No PARTITION BY: one global timeline, no per-category resets.
-- No num_parts > 0 filter: zero-part rows contribute nothing to a SUM
-- (contrast Q5, where zeros skew AVG, and Q7, where they win rankings).
-- Q8/Q9 are inverses: LAG measures change between steps,
-- SUM OVER measures accumulation across all steps.