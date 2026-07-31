
with recursive theme_tree as (
  select id, name , name as path, 1
as depth from themes where parent_id is NULL
    union all
   select t.id, t.name,   tt.path || '>' || t.name as path ,tt.depth +1 as depth from themes t inner join theme_tree tt on  t.parent_id= tt.id
)   
select * from theme_tree
order by path;
-- Q10: Full ancestry path of every theme (e.g. "City > Police > SWAT")
--
-- Uses a RECURSIVE CTE to walk the themes parent-child hierarchy.
-- Anchor: seeds the roots (parent_id IS NULL) at depth 1.
-- Recursive member: each round scans the full table for rows whose
--   parent_id matches an id from the previous batch, attaching each child
--   onto its parent. Repeats layer by layer until a round returns no
--   children (empty batch = stop).
--
-- Two invented columns, each BUILT FROM THE PARENT rather than from scratch:
--   path  = parent's path || ' > ' || child name   (inherit string, append)
--   depth = parent's depth + 1                      (inherit number, add one)
--
-- Join direction: t.parent_id = tt.id (child's pointer meets parent's id).
-- ORDER BY path sorts lexicographically, which groups each subtree under
--   its ancestor; depth is therefore not strictly top-to-bottom increasing.
-- Real-data finding: one "Star Wars" row has parent_id = 1 (Technic),
--   producing "Technic > Star Wars" — ancestry isn't always what the
--   theme name suggests.
