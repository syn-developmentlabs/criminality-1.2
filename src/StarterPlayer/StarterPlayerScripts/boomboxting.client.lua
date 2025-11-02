-- Decompiled with the Synapse X Luau decompiler.

local l__RunService__1 = game:GetService("RunService");
local l__TweenService__2 = game:GetService("TweenService");
local l__MonitorBoombox__3 = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("MonitorBoombox");
local l__CurrentCamera__4 = workspace.CurrentCamera;
local v5 = Instance.new("ColorCorrectionEffect", l__CurrentCamera__4);
local v6 = Instance.new("BlurEffect", l__CurrentCamera__4);
v6.Size = 0;
local u1 = nil;
local l__Value__2 = script:WaitForChild("Value");
local u3 = nil;
game.Players.LocalPlayer.CharacterAdded:Connect(function(p1)
	pcall(function()
		u1:Cancel();
	end);
	l__Value__2.Value = 0;
	_G.WaitForChar();
	u3 = Instance.new("NumberValue", _G.GVF().FOVs);
end);
local u4 = {};
local u5 = {};
local u6 = {};
local u7 = 0;
local u8 = false;
l__MonitorBoombox__3.OnClientEvent:Connect(function(p2, p3)
	local v7 = require(p3);
	u4[p2] = v7;
	u5[p2] = p2;
	u6[p2] = p2.Parent;
	u7 = u7 + 1;
	p2.AncestryChanged:Connect(function(p4, p5)
		if p5 == nil then
			u5[p2] = nil;
			u7 = u7 - 1;
			u4[p2] = nil;
			return;
		end;
		u5[p2] = p2;
		u7 = u7 + 1;
		u4[p2] = v7;
	end);
	p2.Parent.AncestryChanged:Connect(function(p6, p7)
		if p7 == nil then
			u6[p2] = nil;
			return;
		end;
		u6[p2] = p2.Parent;
	end);
	if u7 <= 0 then
		u8 = false;
		pcall(function()
			l__RunService__1:UnbindFromRenderStep("BoomboxTing");
		end);
		return;
	end;
	if not u8 then
		u8 = true;
		l__RunService__1:BindToRenderStep("BoomboxTing", 10000, Do);
	end;
end);
function Do()
	if u3 then
		if u3.Parent then
			local v8 = 0;
			local v9 = {};
			local v10, v11, v12 = pairs(u5);
			while true do
				local v13, v14 = v10(v11, v12);
				if v13 then

				else
					break;
				end;
				v12 = v13;
				local v15 = u4[v14];
				if not v15 then
					return;
				end;
				local v16 = (1 - math.clamp(((v14.Parent.Position - l__CurrentCamera__4.CFrame.Position).Magnitude + 3) / v15.Shake.MaxDist, 0.01, 1)) * v14.PlaybackLoudness / 5 * v15.Shake.Multi;
				v9[v14] = v16;
				v8 = v8 + v16;			
			end;
			pcall(function()
				u1:Cancel();
			end);
			u1 = l__TweenService__2:Create(l__Value__2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				Value = v8
			});
			u1:Play();
			local l__Value__17 = l__Value__2.Value;
			local v18, v19, v20 = pairs(u6);
			while true do
				local v21, v22 = v18(v19, v20);
				if v21 then

				else
					break;
				end;
				v20 = v21;			
			end;
			l__CurrentCamera__4.CFrame = l__CurrentCamera__4.CFrame * CFrame.Angles(0, 0, math.rad(math.random(-l__Value__17, l__Value__17) * 0.01)) + Vector3.new(math.rad(math.random(-l__Value__17 * 0.05, l__Value__17 * 0.05) * 0.05), math.rad(math.random(-l__Value__17 * 0.05, l__Value__17 * 0.05) * 0.05), math.rad(math.random(-l__Value__17 * 0.05, l__Value__17 * 0.05) * 0.05));
			u3.Value = l__Value__17 * 0.1;
			v6.Size = l__Value__17 * 0.1;
			v5.Brightness = l__Value__17 * 0.001;
		end;
	end;
end;
