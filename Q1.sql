select COUNT(*) as "num_sets", year from "sets" as s group by "year";


/*
-- Query 1: How many sets did LEGO release each year?
-- Finding: counts climb over time, from a low in 1960 to a peak in 2025.
-- Context: 1960 is a genuine trough — a Feb 1960 factory fire ended LEGO's
--          wooden-toy line, and the modern plastic-set catalogue was only
--          just beginning, so few sets exist for that year.
-- Note: 2025's peak partly reflects thorough cataloguing of the most recent
--        complete year, not production alone; future years (2027) are pre-announced.

*/
