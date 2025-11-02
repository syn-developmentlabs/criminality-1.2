-- Decompiled with the Synapse X Luau decompiler.

local l__ServerScriptService__1 = game:GetService("ServerScriptService");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__Players__3 = game:GetService("Players");
local l__Debris__4 = game:GetService("Debris");
local l__Events2__5 = l__ReplicatedStorage__2:WaitForChild("Events2");
local l__Events__6 = l__ReplicatedStorage__2:WaitForChild("Events");
local v7 = {};
local u1 = require(l__ReplicatedStorage__2:WaitForChild("Modules"):WaitForChild("Config"));
local function u2(p1)
	return math.floor(p1 * 100) / 100;
end;
function v7.Calculate(p2, p3, p4, p5, p6)
	local v8 = u1:GetConfig(p3);
	local v9 = v8.Damage;
	if p4.Parent:FindFirstChildOfClass("Humanoid") then
		if p4.Name == "Head" then
			v9 = v9 * (v8.HeadshotMultiplier and 1);
		elseif p4.Name ~= "Torso" then
			v9 = v9 * (v8.LimbMultiplier and 1);
		end;
	end;
	local v10 = u2((math.max(v9 * math.clamp(1 - ((p6 - p5).Magnitude / v8.Range) ^ v8.Dropoff, 0, 1), v9 * 0.4)));
	return v10, v10 / v9;
end;
function v7.PlayerCanDamage(p7, p8, p9)
	local l__Parent__11 = p9.Parent;
	local v12 = game.Players:GetPlayerFromCharacter(l__Parent__11);
	if v12 and _G.TeamCheck(p8, v12) then
		return false;
	end;
	if l__Parent__11:FindFirstChildOfClass("ForceField") then
		return false;
	end;
	if l__Parent__11 == p8.Character then
		return false;
	end;
	return true;
end;
function v7.Damage(p10, p11, p12, p13, p14)
	if p11.Parent:FindFirstChildOfClass("ForceField") then
		return;
	end;
	if not (p11.Health - p12 <= 0) then

	end;
	if p14 then
		p12 = p11.Health - 1;
	end;
	p11:TakeDamage(p12);
end;
return v7;
