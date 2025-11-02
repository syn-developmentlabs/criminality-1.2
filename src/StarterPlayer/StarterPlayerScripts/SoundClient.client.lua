-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__MovementSounds__3 = script:WaitForChild("MovementSounds");
local l__Sounds__1 = l__MovementSounds__3:WaitForChild("Sounds");
local function u2(p1, p2, p3, p4, p5)
	return (p1 - p2) * (p5 - p4) / (p3 - p2) + p4;
end;
local function u3(p6, p7, p8)
	return p6 + (p7 - p6) * p8;
end;
local l__LocalPlayer__4 = l__Players__1.LocalPlayer;
local l__MaterialSounds__5 = l__MovementSounds__3:WaitForChild("MaterialSounds");
local u6 = require(l__ReplicatedStorage__2:WaitForChild("Modules"):WaitForChild("FastWait"));
local l__RunService__7 = game:GetService("RunService");
local function v4(p9)
	local v5 = {};
	local v6 = {};
	local v7 = l__Players__1:GetPlayerFromCharacter(p9);
	local l__HumanoidRootPart__8 = p9:WaitForChild("HumanoidRootPart");
	for _, v in pairs(l__HumanoidRootPart__8:GetChildren()) do
		if v:IsA("Sound") then
			v:Destroy()
		end
	end
	for v9, v10 in pairs(l__Sounds__1:GetChildren()) do
		local v11 = v10:Clone();
		v11.Parent = l__HumanoidRootPart__8;
		v5[v10.Name] = v11;
	end;
	if not v7 then
		return;
	end;
	local u8 = {};
	local v14 = {};
	local function u9(p10)
		for v15, v16 in pairs(u8) do
			if v15 ~= p10 then
				v15.Playing = false;
				u8[v15] = nil;
			end;
		end;
	end;
	v14[Enum.HumanoidStateType.FallingDown] = function()
		u9();
	end;
	local function u10(p11, p12, p13)
		p11.TimePosition = p12 and 0;
		p11.Playing = true;
	end;
	v14[Enum.HumanoidStateType.GettingUp] = function()
		u9();
		u10(v5.GettingUp, nil, l__HumanoidRootPart__8);
	end;
	v14[Enum.HumanoidStateType.Jumping] = function()
		u9();
		if l__HumanoidRootPart__8.Parent.Torso.Transparency < 1 then
			u10(v5.Jumping, 0.15, l__HumanoidRootPart__8);
		end;
	end;
	v14[Enum.HumanoidStateType.Swimming] = function()
		local v17 = math.abs(l__HumanoidRootPart__8.Velocity.Y);
		if v17 > 0.1 and l__HumanoidRootPart__8.Parent.Torso.Transparency < 1 then
			local v18 = v5["Splash" .. math.random(1, 3)]:Clone();
			game.Debris:AddItem(v18, 2);
			v18.Parent = l__HumanoidRootPart__8;
			v18.Volume = math.clamp(u2(v17, 100, 350, 0.28, 1), 0, 1);
			u10(v18, nil, l__HumanoidRootPart__8);
			if v17 > 15 then
				local v19 = script.SplashPart:Clone();
				v19.CFrame = l__HumanoidRootPart__8.CFrame;
				v19.Parent = workspace.Debris;
				game.Debris:AddItem(v19, 2);
				v19.SplashParticle:Emit(75);
			end;
		end;
		u9(v5.Swimming);
		v5.Swimming.Playing = true;
		u8[v5.Swimming] = true;
	end;
	v14[Enum.HumanoidStateType.Freefall] = function()
		v5.FreeFalling.Volume = 0;
		u9(v5.FreeFalling);
		u8[v5.FreeFalling] = true;
	end;
	local function u11(p14, p15)
		local v20 = math.abs(p14);
		if v20 > 10 then
			local v21 = l__Sounds__1.LandHard:Clone();
			game.Debris:AddItem(v21, 0.5);
			v21.Parent = l__HumanoidRootPart__8;
			v21.Volume = math.clamp(u2(v20, 10, 80, 0.08, 0.2), 0.1, 0.5);
			v21.Volume = v21.Volume * p15;
			v21.EmitterSize = v21.EmitterSize * u3(0.5, 1, p15);
			v21.PlaybackSpeed = u3(0.5, 1, v21.PlaybackSpeed / p15);
			v21.Playing = true;
		end;
	end;
	local function u12()
		return 1;
	end;
	v14[Enum.HumanoidStateType.Landed] = function()
		u9();
		if l__HumanoidRootPart__8.Parent.Torso.Transparency < 1 then
			u11(l__HumanoidRootPart__8.Velocity.Y, u12());
		end;
	end;
	v14[Enum.HumanoidStateType.Running] = function()

	end;
	v14[Enum.HumanoidStateType.Seated] = function()
		u9();
	end;
	v14[Enum.HumanoidStateType.Dead] = function()

	end;
	local l__Humanoid__13 = p9:WaitForChild("Humanoid");
	local u14 = 0;
	local u15 = 0;
	local u16 = 0;
	local u17 = false;
	local u18 = 0;
	local function u19()
		local v22 = math.min(l__Humanoid__13.WalkSpeed, 50);
		return (v22 + math.min(l__HumanoidRootPart__8.Velocity.Magnitude, v22)) / 2;
	end;
	local u20 = tick();
	local function v23(p16)
		u14 = p16;
		u15 = math.random();
		if p9 then
			if p9:FindFirstChild("Torso") then
				if p9.Torso:IsA("BasePart") then
					if u14 < 1 and u14 > -1 or p9:FindFirstChild("Torso") and p9.Torso.Transparency >= 1 then
						u16 = math.random();
						u17 = false;
						u18 = tick();
						return;
					end;
				end
			end
		end
		if l__HumanoidRootPart__8.Anchored then
			return;
		end;
		if u17 then
			return;
		end;
		local function v24()
			return 0.3333333333333333 / (u19() / 16) * 1.1;
		end;
		u16 = math.random();
		local v25 = tick();
		u17 = true;
		local function v26(p17, p18)
			if p17 and l__MaterialSounds__5:FindFirstChild(p17) then
				local v27 = l__MaterialSounds__5[p17]:GetChildren()[math.random(1, #l__MaterialSounds__5[p17]:GetChildren())]:Clone();
				local v28 = nil;
				v27.Pitch = v27.Pitch + math.random(-100, 100) / 1000;
				local v29 = u19();
				v27.EmitterSize = v27.EmitterSize * 1.65;
				if u14 >= 23 then
					local v30 = Instance.new("DistortionSoundEffect");
					v30.Level = 0.34;
					v30.Priority = 2;
					v30.Parent = v27;
					v27.EmitterSize = v27.EmitterSize * 1.25;
					if v28 then
						v28.Volume = v28.Volume * 1.5;
						v28.EmitterSize = v28.EmitterSize * 1.25;
					end;
				end;
				local v31 = u12();
				if v31 > 0 then
					local v32 = Instance.new("DistortionSoundEffect");
					v32.Level = u3(0, 0.35, v31);
					v32.Priority = 1;
					v32.Parent = v27;
				end;
				v27.Volume = v27.Volume * v31;
				v27.EmitterSize = v27.EmitterSize * u3(0.85, 1, v31);
				v27.PlaybackSpeed = u3(0.5, 1, v27.PlaybackSpeed / v31);
				local v33
				if l__LocalPlayer__4 == v7 then
					v33 = _G.FP and workspace.CurrentCamera or l__HumanoidRootPart__8;
				else
					v33 = l__HumanoidRootPart__8;
				end;
				v27.Parent = v33;
				v27:Play();
				game.Debris:AddItem(v27, 0.5);
				if v28 then
					local v34
					if l__LocalPlayer__4 == v7 then
						v34 = _G.FP and workspace.CurrentCamera or l__HumanoidRootPart__8;
					else
						v34 = l__HumanoidRootPart__8;
					end;
					v28.Parent = v34;
					v28:Play();
					game.Debris:AddItem(v28, 0.5);
				end;
			end;
		end;
		while u17 and u16 == u16 and l__Humanoid__13.Parent and p9.Parent do
			local v35 = false;
			local v36 = l__Humanoid__13:GetState();
			if not v35 and not (tick() - u18 < 0.1) and (not (u14 < 1) or not (u14 > -1)) and (v36 ~= Enum.HumanoidStateType.Climbing or not (tick() - v25 < 0.15)) and v24() <= tick() - u20 then
				u20 = tick();
				if v36 == Enum.HumanoidStateType.Climbing then
					v26("Ladder");
				else
					local l__FloorMaterial__37 = l__Humanoid__13.FloorMaterial;
					if l__FloorMaterial__37 then
						v26(({
							Concrete = "Concrete", 
							Slate = "Granite", 
							Brick = "Concrete", 
							Cobblestone = "Concrete", 
							Marble = "Granite", 
							Pebble = "Concrete", 
							Plastic = "Concrete", 
							SmoothPlastic = "Concrete", 
							Rock = "Concrete", 
							Pavement = "Concrete", 
							Granite = "Granite", 
							Limestone = "Granite", 
							Wood = "Wood", 
							WoodPlanks = "Wood", 
							Sand = "Sand", 
							Snow = "Sand", 
							Ice = "Sand", 
							Fabric = "Fabric", 
							Grass = "Grass", 
							Mud = "Grass", 
							LeafyGrass = "Grass", 
							Glass = "Glass", 
							Metal = "Metal", 
							DiamondPlate = "Metal", 
							Neon = "Metal"
						})[string.sub(tostring(l__FloorMaterial__37), 15, string.len(tostring(l__FloorMaterial__37)))]);
					end;
				end;
			end;
			u6(0.05);		
		end;
	end;
	local v38 = {
		[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
	};
	local v39 = {};
	local u21 = v38[l__Humanoid__13:GetState()] or l__Humanoid__13:GetState();
	local u22 = {
		[v5.Climbing] = function(p19, p20, p21)
			p20.Playing = p21.Magnitude > 0.1;
		end, 
		[v5.FreeFalling] = function(p22, p23, p24)
			if not (p24.Magnitude > 55) then
				p23.Volume = 0;
				return;
			end;
			p23.Volume = math.clamp(p23.Volume + 0.9 * p22, 0, 3);
		end, 
		[v5.Running] = function(p25, p26, p27)
			local v40 = false;
			if p27.Magnitude > 0.5 then
				v40 = l__Humanoid__13.MoveDirection.Magnitude > 0.5;
			end;
			p26.Playing = v40;
		end
	};
	local u23 = l__Humanoid__13.StateChanged:Connect(function(p28, p29)
		p29 = v38[p29] and p29;
		if p29 ~= u21 then
			local v41 = v14[p29]
			u21 = p29;
		end;
	end);
	local u24 = l__RunService__7.Stepped:Connect(function(p30, p31)
		for v42, v43 in pairs(u8) do
			local v44 = u22[v42];
			if v44 then
				v44(p31, v42, l__HumanoidRootPart__8.Velocity);
			end;
		end;
	end);
	local u25 = nil;
	local u26 = nil;
	local u27 = nil;
	local function u28()
		u23:Disconnect();
		u24:Disconnect();
		u25:Disconnect();
		u26:Disconnect();
		u27:Disconnect();
	end;
	u25 = l__Humanoid__13.AncestryChanged:Connect(function(p32, p33)
		if not p33 then
			u28();
		end;
	end);
	l__Humanoid__13.Running:Connect(v23);
	l__Humanoid__13.Climbing:Connect(v23);
	u26 = l__HumanoidRootPart__8.AncestryChanged:Connect(function(p34, p35)
		if not p35 then
			u28();
		end;
	end);
	u27 = p9.AncestryChanged:Connect(function(p36, p37)
		if not p37 then
			u28();
		end;
	end);
end;
local l__Characters__45 = workspace:WaitForChild("Characters");
l__Characters__45.ChildAdded:Connect(v4);
for v46, v47 in pairs(l__Characters__45:GetChildren()) do
	v4(v47);
end;
