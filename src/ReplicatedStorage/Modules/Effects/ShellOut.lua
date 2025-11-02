-- Decompiled with the Synapse X Luau decompiler.

local l__TweenService__1 = game:GetService("TweenService");
local l__Workspace__2 = game:GetService("Workspace");
local l__Debris__3 = game:GetService("Debris");
local l__CurrentCamera__1 = l__Workspace__2.CurrentCamera;
local function u2(p1, p2)
	return (l__CurrentCamera__1.CFrame.p - p1).Magnitude < p2;
end;
local l__ReplicatedStorage__3 = game:GetService("ReplicatedStorage");
local l__Debris__4 = l__Workspace__2:WaitForChild("Debris");
local l__PhysicsService__5 = game:GetService("PhysicsService");
return function(p3, p4, p5)
	if p3.ShellOutSettings.Do and u2(p4.Position, 75) then
		local l__RotVel__4 = p3.ShellOutSettings.RotVel;
		local v5 = l__ReplicatedStorage__3.Storage.Shells[p3.ShellType]:Clone();
		if p5 == "RB" then
			v5.BrickColor = BrickColor.new("Institutional white");
			v5.TextureID = "";
		end;
		game.Debris:AddItem(v5, 2);
		v5.CFrame = p4.ShellOutPos.WorldCFrame * CFrame.Angles(math.rad(math.random(-700, 700) / 100), 0, math.rad(math.random(-700, 700) / 100));
		v5.Parent = l__Debris__4;
		v5.Velocity = v5:GetMass() * (v5.CFrame.LookVector * p3.ShellOutSettings.Vel * p3.ShellOutSettings.Vec) + p4.Velocity;
		v5.RotVelocity = Vector3.new(math.random(l__RotVel__4 / 100, l__RotVel__4 * 100) / 100, math.random(l__RotVel__4 / 100, l__RotVel__4 * 100) / 100, math.random(l__RotVel__4 / 100, l__RotVel__4 * 100) / 100);
		pcall(function()
			v5.CollisionGroupId = l__PhysicsService__5:GetCollisionGroupId("NoCharCollide");
			v5.CanCollide = true;
		end);
	end;
end;
