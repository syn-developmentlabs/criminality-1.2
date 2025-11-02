-- Decompiled with the Synapse X Luau decompiler.

local l__TweenService__1 = game:GetService("TweenService");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__RunService__3 = game:GetService("RunService");
local l__Debris__4 = game:GetService("Debris");
local l__BloodStuff__5 = l__ReplicatedStorage__2:WaitForChild("Storage"):WaitForChild("BloodStuff");
local v6 = l__BloodStuff__5.BloodSpray:Clone();
local v7 = l__BloodStuff__5.BloodPool:Clone();
local v8 = l__BloodStuff__5.BloodHit1:Clone();
local v9 = l__BloodStuff__5.BloodHit2:Clone();
local v10 = l__BloodStuff__5.BloodHit3:Clone();
local l__SettingsChanged__11 = l__ReplicatedStorage__2.Events2:WaitForChild("SettingsChanged");
local v12 = require(l__ReplicatedStorage__2:WaitForChild("Modules").RayHandler);
local l__Events__13 = l__ReplicatedStorage__2:WaitForChild("Events");
local l__BloodTrailEvent__14 = l__Events__13:WaitForChild("BloodTrailEvent");
local l__BloodHitEvent__15 = l__Events__13:WaitForChild("BloodHitEvent");
local l__GorePart__16 = l__Events__13:WaitForChild("GorePart");
local l__BloodOnPart__17 = l__Events__13:WaitForChild("BloodOnPart");
local l__Events2__18 = l__ReplicatedStorage__2:WaitForChild("Events2");
local l__BloodTrailEvent__19 = l__Events2__18:WaitForChild("BloodTrailEvent");
local l__BloodHitEvent__20 = l__Events2__18:WaitForChild("BloodHitEvent");
local v21 = Instance.new("Folder", (workspace:WaitForChild("Debris")));
v21.Name = "BloodInstances";
local u1 = {
	BT_X_Min = -10, 
	BT_X_Max = 10, 
	BT_Y_Min = -10, 
	BT_Y_Max = 10, 
	BP_S_Min = 1, 
	BP_S_Max = 2, 
	BP_T_Min = 0.2, 
	BP_T_Max = 0.3, 
	BP_GT_Min = 1.5, 
	BP_GT_Max = 2, 
	BP_ET_Min = 5, 
	BP_ET_Max = 7, 
	MaxBloodInstances = 300, 
	BloodLoadMaxDist = 225
};
local function u2(p1)
	local v22 = {};
	for v23, v24 in pairs(p1) do
		if type(v24) == "table" then
			v24 = u2(v24);
		end;
		v22[v23] = v24;
	end;
	return v22;
end;
local v25 = { workspace:WaitForChild("Filter"), workspace:WaitForChild("Debris"), workspace.Camera, workspace.Characters, workspace.Map.Parts.Grinders, workspace.Map.Security, workspace.Map.BredMakurz };
local v26 = u2(v25);
math.randomseed(tick());
local l__Camera__3 = workspace.Camera;
local function u4()
	if u1.MaxBloodInstances <= #v21:GetChildren() then
		return true;
	end;
	return false;
end;
local u5 = {};
function CreateBlood(p2, p3, p4, p5, p6, p7, p8)
	if not (u1.BloodLoadMaxDist < (p2.WorldCFrame.p - l__Camera__3.CFrame.p).Magnitude) then
		if u4() then
			return;
		end;
	else
		return;
	end;
	p3 = p3 or 10;
	p7 = p7 or Vector3.new(0, 0, 0);
	if p8 then
		if typeof(p8) == "table" then
			if p8[1] then
				if p8[2] then
					p5 = p5 * math.random(p8[1] * 100, p8[2] * 100) / 100;
				end;
			end;
		end;
	end;
	local v27 = v6:Clone();
	v27.Parent = v21;
	v27.Trail.WidthScale = NumberSequence.new(p6);
	local v28 = p2.WorldCFrame * CFrame.Angles(math.rad(math.random(p4[1], p4[2])), math.rad(math.random(p4[1], p4[2])), 0);
	v27.CFrame = v28;
	v27.Velocity = v28.LookVector * math.random(p3 * 0.8, p3 * 1.2) + p7;
	l__Debris__4:AddItem(v27, 10);
	if 1 < p5 then
		p5 = math.max(p5, 1);
	end;
	local u6 = false;
	local function u7()
		local v29, v30, v31 = pairs(u5);
		while true do
			local v32, v33 = v29(v30, v31);
			if v32 then

			else
				break;
			end;
			v31 = v32;
			if v33 then
				if typeof(v33) == "table" then
					if v33[1] == v27 then
						table.remove(u5, v32);
						return;
					end;
				end;
			end;		
		end;
	end;
	table.insert(u5, { v27, function(p9, p10, p11)
		if u6 then
			return;
		end;
		u7();
		u6 = true;
		v27.Anchored = true;
		v27.Trail.Enabled = false;
		v27.ParticleEmitter.Enabled = false;
		local v34 = v7:Clone();
		l__Debris__4:AddItem(v34, 60);
		v34.Parent = v21;
		v34.CFrame = CFrame.new(p10, p10 + p11);
		if p9 then
			if not p9.Anchored then
				local v35 = Instance.new("WeldConstraint", v34);
				v35.Part0 = p9;
				v35.Part1 = v34;
				v34.Anchored = false;
			else
				v34.Anchored = true;
			end;
		else
			v34.Anchored = true;
		end;
		v27:Destroy();
		local v36 = math.random(p5 * 100 * 0.8, p5 * 100 * 1.2) / 100;
		local v37 = math.random(u1.BP_GT_Min, u1.BP_GT_Max);
		l__TweenService__1:Create(v34.Mesh, TweenInfo.new(v37 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Scale = Vector3.new(1, 1, 1)
		}):Play();
		l__TweenService__1:Create(v34, TweenInfo.new(v37, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Size = Vector3.new(v36, v36, 0.1), 
			Transparency = math.random(u1.BP_T_Min, u1.BP_T_Max)
		}):Play();
		local v38 = v36 * 8;
		delay(math.random(v38 * 0.9, v38 * 1.1), function()
			l__Debris__4:AddItem(v34, 3);
			l__TweenService__1:Create(v34, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Transparency = 1
			}):Play();
		end);
	end });
	local u8 = nil;
	u8 = v27.AncestryChanged:Connect(function(p12, p13)
		if not p13 then
			u8:Disconnect();
			u7();
		end;
	end);
end;
local u9 = 0;
local v40;
local v41;
local v42;
local v43;
local v44;
local v45;
local v46;
local v47;
local function v39(p14, p15, p16, p17)
	if u4() then
		return;
	end;
	pcall(function()
		if (p14.WorldPosition - game:GetService("Players").LocalPlayer.Character.Torso.Position).Magnitude > 150 then
			return
		end
	end)
	if not p16 then
		v40 = p15[1];
		v41 = p15[2];
	 	v42 = p15[3];
		v43 = p15[4];
		v44 = p15[5];
		v45 = p15[6];
		v46 = p15[7];
		v47 = p15[8];
	else
		v40 = p15.Amount;
		v41 = p15.Speed;
		v42 = p15.Spread;
		v43 = p15.Size;
		v44 = p15.WidthScale;
		v45 = p15.UpVector;
		v46 = p15.RepeatCount;
		v47 = p15.RepeatTick;
	end;
	if _G.GSettings and not _G.GSettings.Blood then
		return;
	end;
	if not p14 or not p14.Parent then
		return;
	end;
	local u10 = nil;
	local u11 = true;
	u10 = p14.AncestryChanged:Connect(function(p18, p19)
		if not p19 then
			u10:Disconnect();
			u11 = false;
			u10 = nil;
		end;
	end);
	for v48 = 1, v46 do
		if u4() then
			break;
		end;
		u9 = u9 + 1;
		if not u11 then
			break;
		end;
		for v49 = 1, math.random(v40[1], v40[2]) do
			if u4() then
				break;
			end;
			if not u11 then
				break;
			end;
			u9 = u9 + 1;
			coroutine.resume(coroutine.create(function()
				CreateBlood(p14, v41, v42, v43, v44, v45, p17);
			end));
			l__RunService__3.RenderStepped:Wait();
		end;
		wait(v47);
	end;
	if u10 then
		u10:Disconnect();
	end;
end;
local function v50(p20)
	if _G.GSettings and not _G.GSettings.Blood then
		return;
	end;
	local v51 = v10:Clone();
	v51.Parent = p20;
	v51:Emit(math.random(10, 20));
	l__Debris__4:AddItem(v51, 1);
end;
function BloodOnPartFunc(p21, p22, p23, p24)
	if _G.GSettings then
		if not _G.GSettings.Blood then
			return;
		end;
	end;
	local v52, v53, v54 = pairs(p21);
	while true do
		local v55, v56 = v52(v53, v54);
		if v55 then

		else
			break;
		end;
		v54 = v55;
		local v57 = p22[v56];
		if v57 then
			v57.Transparency = v57.Transparency * p23;
			v57.Parent = v56;
			delay(p24, function()
				if v57 then
					if v57.Parent then
						l__TweenService__1:Create(v57, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							Transparency = 1
						}):Play();
						game.Debris:AddItem(v57, 3);
					end;
				end;
			end);
		end;	
	end;
end;
function GorePartFunc(p26)
	if _G.GSettings then
		if not _G.GSettings.Blood then
			p26:Destroy()
		end;
	end;
end;
l__BloodTrailEvent__14.OnClientEvent:Connect(v39);
l__BloodHitEvent__15.OnClientEvent:Connect(v50);
l__BloodTrailEvent__19.Event:Connect(v39);
l__BloodHitEvent__20.Event:Connect(v50);
l__GorePart__16.OnClientEvent:Connect(GorePartFunc);
l__BloodOnPart__17.OnClientEvent:Connect(BloodOnPartFunc);
l__SettingsChanged__11.Event:Connect(function(p27, p28)
	if p27 == "Blood" and not p28 then
		u5 = {};
		v21:ClearAllChildren();
	end;
end);
local u12 = v26;
local function u13(p29, p30)
	local v63, v64, v65 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p30, (p29.Position - p30) * 1.25, false, true), u12);
	if not v63 or not (v63.Transparency > 0.9) and v63.Name ~= "Grinder" then
		return v63, v64, v65;
	end;
	table.insert(u12, v63);
	return u13(p29, p30);
end;
game.Players.LocalPlayer.CharacterAdded:Connect(function(p31)
	u12 = u2(v25);
end);
l__RunService__3.Heartbeat:Connect(function()
	for v66, v67 in pairs(u5) do
		if v67 then
			local v68 = v67[1];
			local v69 = v67[3] or v68.Position;
			if not v68 then
				table.remove(u5, v66);
				return;
			end;
			if not v68.Parent then
				table.remove(u5, v66);
				return;
			end;
			if not v68:FindFirstChild("cPos") then
				table.remove(u5, v66);
				return;
			end;
			if not v68.Parent:FindFirstChild(v68.Name) then
				table.remove(u5, v66);
				return;
			end;
			local v70 = v68 and v68.Position + v68.CFrame:VectorToWorldSpace(v68.cPos.WorldPosition);
			local v71 = Ray.new(v69, v70 and v70 or v68.pos.WorldPosition - v69);
			local v72, v73, v74 = u13(v68, v69);
			if v72 then
				v67[2](v72, v73, v74);
				table.remove(u5, v66);
			end;
			v67[3] = v68.Position;
		else
			table.remove(u5, v66);
		end;
	end;
end);
