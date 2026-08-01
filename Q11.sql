select pc.name as category, sum(ip.quantity) as total_pieces from sets s join inventories i on i.set_num= s.set_num join inventory_parts ip on ip.inventory_id= i.id join parts p on p.part_num= ip.part_num  join part_categories pc on pc.id= p.part_cat_id where s.theme_id in (select id from themes where name ='Star Wars') and i.version=1 group by pc.id, pc.name order by total_pieces desc limit 10
/*
-- Query 11: Which part categories make up the most pieces in Star Wars sets?
-- Finding: Plates dominate (62,984), then Plates Special, Bricks Sloped, etc.
-- Deliberate decisions:
--   * SUM(ip.quantity), not COUNT(*): counts actual brick quantities, since one
--     inventory_parts row can carry many identical pieces.
--   * i.version = 1: keeps only the primary inventory per set, avoiding
--     double-counting parts from revised inventory versions.
--   * IN (subquery), not =: "Star Wars" resolves to FOUR theme ids
--     (18, 158, 209, 261), so the subquery returns multiple rows — = would error.
--     (Theme 18's parent is Technic (1) — a multiple-ancestry quirk.)
--   * GROUP BY pc.id AND pc.name: guards against distinct categories that share
--     a name being merged.
-- Scope caveat (what it does NOT measure): this matches only themes named
--   exactly 'Star Wars'. It MISSES sub-themes like Ultimate Collector Series
--   (id 171, parent 158) — ~50 sets including the largest UCS builds. Because
--   total_pieces is a sum and the missed sets are huge, the undercount in pieces
--   exceeds the ~4% set-count gap. Q12's recursive CTE walks the theme subtree
--   to capture the full Star Wars universe — that's the flat-vs-tree contrast.
-- Interpretation: Plates top the list because plates are ubiquitous across ALL
--   LEGO, not because Star Wars is plate-heavy. This measures volume, not what's
--   distinctive to the theme (that would need share-vs-baseline indexing).
*/


Plates are one of LEGO's three foundational element families, alongside bricks and tiles. The distinction is height: a plate is one-third the height of a standard brick (three plates stacked equal one brick), while a tile is a plate with no studs on top. That geometry is why plates dominate any part-count chart.

The market/design reasons they're everywhere:

They're the structural connective tissue. Because plates are thin, they're how designers add fine vertical detail, lock layers together, and create the "offset" connections (called SNOT — studs not on top — techniques) that modern LEGO relies on. Almost every build, in every theme, uses plates as filler and joinery. So high plate counts reflect construction method, not subject matter — a castle, a spaceship, and a race car all lean on plates equally.

They enable resolution and smoothness. The shift toward thinner elements over the past two decades let LEGO build more detailed, curved, and realistic models — the same trend that produced the mosaic-style Art sets. Plates (and their curved/rounded cousins, which is why "Plates Round Curved and Dishes" shows up in your top 4) are the workhorses of that detail.

Economics. Plates are simple, cheap-to-mold, high-volume commodity parts. LEGO produces them in enormous quantities across colors, so they're the "raw material" a set designer reaches for by default rather than a specialty piece.

Serves as Baseline of how these sets are created



