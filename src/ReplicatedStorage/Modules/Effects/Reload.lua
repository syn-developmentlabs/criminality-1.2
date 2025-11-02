-- Decompiled with the Synapse X Luau decompiler.

local l__Debris__1 = game:GetService("Debris");
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local u2 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Config"));
return function(p1, p2, p3, p4)
	if p1 == l__LocalPlayer__1 then
		return;
	end;
	local l__Handle__2 = p2.Handle;
	local v3 = u2:GetConfig(p2);
	local u3 = require(p2.ReloadM);
	spawn(function()
		u3(p3, p4);
	end);
end;
