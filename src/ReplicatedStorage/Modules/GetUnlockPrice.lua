-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2, p3)
	return p1 + (p2 - p1) * p3;
end;
local function u2(p4)
	return 100 * math.floor(p4 / 100 + 0.5);
end;
return function(p5, p6, p7, p8)
	p6 = p6;
	return u2((u1(p8.MinPrice.Value, p8.MaxPrice.Value, (math.clamp(1 - p6 / p7, 0, 1)))));
end;
