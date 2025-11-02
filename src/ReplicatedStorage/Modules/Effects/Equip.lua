-- Decompiled with the Synapse X Luau decompiler.

local l__Debris__1 = game:GetService("Debris");
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local l__RunService__2 = game:GetService("RunService");
local u3 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Config"));
return function(p1, p2, p3, p4)
	if p1 == l__LocalPlayer__1 then
		return;
	end;
	if not p2:FindFirstChild("EquipM") then
		return;
	end;
	local l__Handle__2 = p2.Handle;
	local v3 = u3:GetConfig(p2);
	local u4 = require(p2.EquipM);
	spawn(function()
		if not pcall(function()
			u4(p3, p4);
		end) then
			warn("Error with equip effect");
		end;
	end);
end;
