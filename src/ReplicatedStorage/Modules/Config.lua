-- Decompiled with the Synapse X Luau decompiler.

return {
	GetConfig = function(p1, p2)
		local v1 = {};
		for v2, v3 in pairs((require(p2:WaitForChild("Config", math.huge)))) do
			v1[v2] = v3;
		end;
		return v1;
	end
};
