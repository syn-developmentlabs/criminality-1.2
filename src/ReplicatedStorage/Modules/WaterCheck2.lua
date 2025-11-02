-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__Terrain__2 = workspace.Terrain;
local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):waitForChild("RotatedRegion3"));
local function u2(p1)
	local v3, v4 = pcall(function()
		local l__Position__5 = p1.Position;
		if not (#u1.FromPart(p1):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1) then
			return;
		end;
		return true;
	end);
	return v3 or v4;
end;
return function(p2)
	return u2(p2);
end;
