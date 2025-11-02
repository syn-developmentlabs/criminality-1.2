-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local u1 = {};
function v1.Effect(p1, p2, ...)
	if not u1[p2] and script:FindFirstChild(p2) then
		u1[p2] = require(script[p2]);
	end;
	if u1[p2] then
		u1[p2](...);
	end;
end;
return v1;
