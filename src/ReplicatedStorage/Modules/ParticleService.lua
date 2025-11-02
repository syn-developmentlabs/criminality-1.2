-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"));
v2.Name = "MainInterface";
local v3 = Instance.new("Frame", v2);
v3.Name = "ParticleFrame";
v3.Size = UDim2.new(1, 0, 1, 0);
v3.BackgroundTransparency = 1;
v1.particleList = {};
function v1.createParticle(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	local v4 = { p1, p2, p3, p4, p5, p6, p7, p8, p9 };
	if not p9 then
		p9 = v3;
	end;
	if p9 then
		p1.Parent = p9;
	end;
	local v5 = false;
	if #v1.particleList < 200 then
		table.insert(v1.particleList, v4);
		return #v1.particleList;
	end;
	for v6, v7 in ipairs(v1.particleList) do
		if not v1.particleList[v6 + 1] then
			v5 = v6 + 1;
		end;
	end;
	if not v5 then
		v5 = 1;
	end;
	if v5 < 201 then
		v1.particleList[v5] = v4;
		return v5;
	end;
	v4[1]:Destroy();
end;
local l__mouse__1 = game.Players.LocalPlayer:GetMouse();
function v1.updateParticle()
	for v8, v9 in pairs(v1.particleList) do
		if v9 ~= nil then
			v9[1].Position = v9[1].Position + v9[3];
			v1.particleList[v8][3] = v1.particleList[v8][3] + v9[5];
			if v9[1].AbsoluteSize.X > 0 or v9[1].AbsoluteSize.Y > 0 then
				v9[1].Size = v9[1].Size + v9[6];
			else
				v9[1].Size = UDim2.new(0, 0, 0, 0);
			end;
			v9[1].Rotation = v9[1].Rotation + v9[4];
			v9[1].ImageTransparency = v9[1].ImageTransparency + v9[7];
			if v9[8] ~= 0 then
				for v10, v11 in pairs(v9[8]) do
					if v11[1] == "TweenToMouse" then
						v9[1]:TweenPosition(UDim2.new(0, l__mouse__1.X, 0, l__mouse__1.Y), "Out", v11[2], v11[3], v11[4]);
					end;
				end;
			end;
			if v9[2] ~= -1 then
				v1.particleList[v8][2] = v1.particleList[v8][2] - 1;
			end;
			if v1.particleList[v8][2] <= 0 and v1.particleList[v8][2] ~= -1 then
				v9[1]:Destroy();
				v1.particleList[v8] = nil;
			end;
		end;
	end;
end;
game:GetService("RunService").RenderStepped:Connect(v1.updateParticle);
return v1;
