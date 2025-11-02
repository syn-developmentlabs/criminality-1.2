-- Decompiled with the Synapse X Luau decompiler.

local l__ServerScriptService__1 = game:GetService("ServerScriptService");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__Players__3 = game:GetService("Players");
local l__Debris__4 = game:GetService("Debris");
local l__Events2__5 = l__ReplicatedStorage__2:WaitForChild("Events2");
local l__Events__6 = l__ReplicatedStorage__2:WaitForChild("Events");
local v7 = {};
local u1 = require(l__ReplicatedStorage__2:WaitForChild("Modules"):WaitForChild("Config"));
function v7.Calculate(p1, p2, p3, p4)
	local v8 = u1:GetConfig(p2);
	local v9 = v8.Damage;
	if p3.Name == "Head" then
		v9 = v9 * (v8.HeadshotMultiplier and 1);
	end;
	local v10 = p3.Parent:FindFirstChildOfClass("Humanoid");
	local v11 = math.max(v9 * math.clamp(1 - ((p4 - p3.Position).Magnitude / v8.Range) ^ v8.Dropoff, 0, 1), v9 * 0.3);
	return math.ceil(v11), v11 / v9;
end;
function v7.PlayerCanDamage(p5, p6, p7)
	local l__Parent__12 = p7.Parent;
	local v13 = game.Players:GetPlayerFromCharacter(l__Parent__12);
	if v13 and _G.TeamCheck(p6, v13) then
		return false;
	end;
	if not l__Parent__12:FindFirstChildOfClass("ForceField") and l__Parent__12 ~= p6.Character then
		return true;
	end;
	return false;
end;
function v7.Damage(p8, p9, p10, p11, p12)
	local v14 = true;
	local l__Parent__15 = p9.Parent;
	if l__Parent__15:FindFirstChildOfClass("ForceField") then
		v14 = false;
	end;
	if v14 then
		if p11 then

		end;
		if p12 or p9.Health - p10 <= 0 and not _G.DownedCheck(l__Parent__15) then
			p10 = p9.Health - 1;
		end;
		p9:TakeDamage(p10);
	end;
end;
return v7;
