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