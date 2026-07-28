select ROUND(AVG(num_parts)),(s.year/10)*10 as "decades" FROM "sets" s WHERE num_parts > 0 group by "decades" order by "decades" ASC; 

/*

-- Query 5: Has average set size grown over the decades?
-- Finding: avg building-set size grew ~14x from the 1950s (17 parts) to the 2020s (241).
-- Note: WHERE num_parts > 0 excludes gear/books/keychains (~X,XXX zero-part rows).
-- Note: 1940s row is a tiny sample (n=?) — see num_sets column.
SELECT ...
*/