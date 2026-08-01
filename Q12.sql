select (s.year/10) as "decade", count(distinct ip.color_id ) as "distinct_colors" , count(distinct s.set_num) as "num_sets" from inventory_parts ip inner join inventories i on i.id =ip.inventory_id inner join sets s on s.set_num  =i.set_num 
where s.year>0
group by decade 
order by decade desc;
/*


The run-up. LEGO's palette expanded rapidly starting in the mid-to-late 1990s, driven by bright licensed and juvenile themes. The number of colors in use tripled from 1990 to 2000, and the palette peaked in 2004 with more than 110 colors. A big part of that bloat was waste, not richness: in the early 2000s it was common for a new color to be used only in one part in one obscure Duplo set.

Why it was a problem — this is the key link. The color explosion was one symptom of a broader complexity crisis. LEGO's parts catalog had ballooned alongside the palette, and maintaining all of it was financially unsustainable — the expanding portfolio strained the company's finances, and to steady itself LEGO cut both the number of bricks and the size of the palette, going from 14,000 different brick types down to around 3,500. The company was genuinely near bankruptcy in the early 2000s.

The consolidation. Between 2001 and 2004, 47 new colors were added, bringing the palette to a peak of 111 colors; by 2007 that was cut to 72 as part of cost-reduction. The Washington Post's numbers agree — the palette dropped to about 60 by 2007. There was also a famous qualitative change around 2003–2004: after focus groups showed kids preferred brighter, more saturated colors, LEGO replaced many shades — most notably the grays, which caused an uproar among adult fans who'd built up collections in the old colors. (Old gray → "bluish gray," brown → reddish brown — the change adult fans still grumble about.)*/
