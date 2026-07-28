select name, year, num_parts from "sets" s order by num_parts desc limit 10;

/*
The LEGO Art World Map (set 31203, 2021) has ~11,695 pieces, and the reason is almost entirely the medium rather than the model. It's part of the LEGO Art line — mosaic wall art built as a flat grid of small round 1×1 tiles ("studs") on baseplates, where each tile is one pixel of the image. Rendering a whole world map at enough resolution to read as continents and oceans takes an enormous number of those tiny identical tiles, so the count balloons.

Contrast that with a big models set — a Technic supercar or a UCS Star Wars ship — where the parts are larger, more varied structural pieces, and even a huge showpiece tends to land in the few-thousands. A mosaic gets its piece count from sheer tile density, not from structural complexity, which is why an essentially flat panel can out-count a detailed 3D build.

This becomes a  "measurement" story: num_parts counts pieces regardless of size, and mosaics optimize for many tiny pieces. That's actually a nice nuance to know is behind the number — the largest set by piece count isn't the most complex build, it's the one made of the most little dots. It held the record for most pieces in an official set when it launched, for exactly that reason.
*/
