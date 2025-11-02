-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2, p3)
	return p1 + (p2 - p1) * p3;
end;
local function u2(p4)
	return 10 * math.floor(p4 / 10 + 0.5);
end;
return function(p5, p6, p7)
	return u2((u1(p6 * 0.1, p6, 1 - math.min(math.max(p7, 0), 1))));
end;
