-- Decompiled with the Synapse X Luau decompiler.

local l__UserInputService__1 = game:GetService("UserInputService");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__RunService__3 = game:GetService("RunService");
local v4 = CFrame.new(2.5, 1.5, 5);
local v5 = {};
local u1 = false;
local l__CurrentCamera__2 = workspace.CurrentCamera;
local l__LocalPlayer__3 = game.Players.LocalPlayer;
function v5.SetEnabled(p1, p2)
	u1 = p2;
	if p2 == true then
		l__CurrentCamera__2.CameraType = Enum.CameraType.Scriptable;
		return;
	end;
	if l__LocalPlayer__3.Character and l__LocalPlayer__3.Character.Humanoid then
		l__LocalPlayer__3.Character.Humanoid.AutoRotate = true;
	end;
	l__CurrentCamera__2.CameraType = Enum.CameraType.Custom;
end;
function v5.Init(p3)
	p3:SetEnabled(false);
end;
local u4 = {
	[Enum.UserInputType.Touch] = true, 
	[Enum.UserInputType.MouseMovement] = true
};
local function u5()
	if not l__LocalPlayer__3.Character then
		return false;
	end;
	if not u1 then
		return false;
	end;
	return true;
end;
local u6 = 0;
local u7 = { -60, 60 };
local u8 = 0;
local v6 = RaycastParams.new();
v6.FilterType = Enum.RaycastFilterType.Blacklist;
v6.IgnoreWater = true;
local u9 = nil;
local function u10(p4)
	local l__HumanoidRootPart__7 = l__LocalPlayer__3.Character.HumanoidRootPart;
	l__HumanoidRootPart__7.CFrame = CFrame.new(l__HumanoidRootPart__7.Position) * CFrame.Angles(0, math.rad(-u8), 0);
	l__LocalPlayer__3.Character.Humanoid.AutoRotate = true;
end;
local function u11(p5)
	local l__CFrame__8 = l__LocalPlayer__3.Character.HumanoidRootPart.CFrame;
	local v9 = l__CFrame__8 * CFrame.Angles(math.rad(-u6), 0, 0) * v4;
	local v10 = (u9 and v9):Lerp(v9, p5 * 30);
	v6.FilterDescendantsInstances = { l__LocalPlayer__3.Character };
	local v11 = workspace:Raycast(l__CFrame__8.Position, v9.Position - l__CFrame__8.Position, v6);
	if v11 then
		v10 = v10 - (v10.Position - (v11.Position + v11.Normal * 0.4));
	end;
	l__CurrentCamera__2.CFrame = v10;
	u9 = v10;
end;
l__UserInputService__2.InputChanged:Connect(function(p6, p7)
	if p7 then
		return;
	end;
	if not u4[p6.UserInputType] then
		return;
	end;
	if not u5() then
		return;
	end;
	local l__Delta__12 = p6.Delta;
	u6 = math.clamp(u6 + l__Delta__12.Y / 3, u7[1], u7[2]);
	u8 = u8 + l__Delta__12.X / 3;
end);
l__RunService__3.RenderStepped:Connect(function(p8)
	if not u5() then
		return;
	end;
	if not l__LocalPlayer__3.Character and l__LocalPlayer__3.Character.Humanoid then
		return;
	end;
	l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.LockCenter;
	u10(p8);
	u11(p8);
end);
return v5;
