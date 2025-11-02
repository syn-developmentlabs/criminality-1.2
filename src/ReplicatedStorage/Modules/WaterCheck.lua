-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__Terrain__2 = workspace.Terrain;
local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):waitForChild("RotatedRegion3"));
local function u2(p1)
	local v3, v4 = pcall(function()
		if not (#u1.new(p1 + Vector3.new(0, -0.5, 0), Vector3.new(2, 5, 1)):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1) then
			return;
		end;
		return true;
	end);
	return v3 or v4;
end;
local function u3(p2)
	local u4 = p2;
	local v5, v6 = pcall(function()
		u4 = u4 + Vector3.new(0, 1, 0);
		if not (#u1.new(u4, Vector3.new(1, 1, 1)):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1) then
			return;
		end;
		return true;
	end);
	return v5 or v6;
end;
return function(p3, p4, p5, p6)
	return p3 and u2(p5), p4 and u3(p6);
end;
