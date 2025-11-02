	-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent.RotatedRegion3);
local l__WaterCurrents__1 = workspace.Filter.WaterCurrents;
return function(p1, p2)
	local v2 = workspace:FindPartsInRegion3WithWhiteList(Region3.new(p1.Position - Vector3.new(p2, p2, p2), p1.Position + Vector3.new(p2, p2, p2)), { l__WaterCurrents__1 }, 10);
	local v3 = Vector3.new(0, 0, 0);
	for v4, v5 in pairs(v2) do
		v3 = v3 + v2[1].CFrame.LookVector * (v2[1].Force.Value * 10);
	end;
	return v3;
end;
