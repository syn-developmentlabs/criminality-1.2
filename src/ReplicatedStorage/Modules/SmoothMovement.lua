-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__RunService__2 = game:GetService("RunService");
local l__LocalPlayer__3 = game.Players.LocalPlayer;
local v4 = Vector3.new();
local u1 = {
	Forward = {
		Key = Enum.KeyCode.W, 
		Direction = Enum.NormalId.Front
	}, 
	Backward = {
		Key = Enum.KeyCode.S, 
		Direction = Enum.NormalId.Back
	}, 
	Left = {
		Key = Enum.KeyCode.A, 
		Direction = Enum.NormalId.Left
	}, 
	Right = {
		Key = Enum.KeyCode.D, 
		Direction = Enum.NormalId.Right
	}
};
local l__UserInputService__2 = game:GetService("UserInputService");
local l__CurrentCamera__3 = workspace.CurrentCamera;
local function u4()
	local v5 = Vector3.new();
	for v6, v7 in pairs(u1) do
		if l__UserInputService__2:IsKeyDown(v7.Key) then
			v5 = v5 + Vector3.FromNormalId(v7.Direction);
		end;
	end;
	if v5.Magnitude > 0 then
		v5 = v5.Unit;
	end;
	return v5;
end;
local function u5()
	local v8 = l__CurrentCamera__3.CFrame:VectorToWorldSpace(u4()) * Vector3.new(1, 0, 1);
	if v8.Magnitude > 0 then
		v8 = v8.Unit;
	end;
	return v8;
end;
local u6 = false;
local u7 = Vector3.new();
local u8 = Vector3.new();
local function u9(p1, p2, p3)
	return p1 + (p2 - p1) * p3;
end;
function v1.Update(p4, p5, p6)
	local l__Humanoid__9 = p5:FindFirstChild("Humanoid");
	if l__Humanoid__9 then
		local v10 = u5();
		if not u6 then
			u7 = v10;
		end;
		u8 = u9(u8, u7, math.clamp(p6 * 9, 0, 1));
		l__Humanoid__9:Move(u8);
	end;
end;
l__UserInputService__2.InputBegan:Connect(function(p7, p8)
	u6 = p8;
end);
l__UserInputService__2.InputEnded:Connect(function(p9, p10)
	u6 = p10;
end);
return v1;
