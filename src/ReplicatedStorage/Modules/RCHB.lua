-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	Version = "1.2 Beta"
};
getfenv(0).script = nil;
local function u1(p1, p2)
	return p1:gsub(".", function(p3)
		return string.char(p3:byte() + p2);
	end);
end;
local function u2(p4, p5)
	local v2 = {};
	for v3, v4 in next, p4 do
		v2[u1(tostring(v3), p5)] = v4;
	end;
	return v2;
end;
local function u3(p6)
	local v5 = newproxy(true);
	local v6 = getmetatable(v5);
	v6.__index = p6;
	v6.__namecall = p6;
	function v6.__newindex()
		error("Attempt to modify a protected table.");
	end;
	v6.__metatable = "This table is protected.";
	return v5;
end;
local v7 = {};
local u4 = false;
local l__ReplicatedStorage__5 = game:GetService("ReplicatedStorage");
local function u6(p7)
	local v8 = {};
	for v9, v10 in ipairs((p7:GetChildren())) do
		if v10:IsA("Attachment") and v10.Name == "DmgPoint" then
			table.insert(v8, v10);
		else
			for v11, v12 in ipairs((u6(v10))) do
				table.insert(v8, v12);
			end;
		end;
	end;
	return v8;
end;
local v13 = {};
v13.__index = v13;
function v13.__tostring(p8)
	return p8.Object.Name;
end;
local l__LocalPlayer__7 = game.Players.LocalPlayer;
function v13.FindDamageAttachments(p9, p10)
	local v14 = u6(p10);
	if not (#v14 > 0) then
		--warn("No attachments were found with the name", "DmgPoint!", "Did you setup correctly?");
		return;
	end;
	for v15, v16 in ipairs(v14) do
		p9.Points[v16] = {
			RelativePart = nil, 
			Attachment = v16, 
			LastPosition = nil
		};
	end;
	table.insert(p9.Ignore, l__LocalPlayer__7.Character);
end;
function v13.SetPoints(p11, p12, p13)
	if p12 and p12:IsA("BasePart") then
		for v17, v18 in ipairs(p13) do
			if typeof(v18) == "Vector3" then
				p11.Points[v18] = {
					RelativePart = p12, 
					Attachment = v18, 
					LastPosition = nil
				};
			end;
		end;
	end;
end;
local l__RunService__8 = game:GetService("RunService");
local u9 = {};
function v13.HZISTARRT(p14)
	p14.Beams = {};
	if p14.Points == nil then
		return;
	end;
	if p14.Connection then
		p14.Connection:Disconnect();
		p14.Connection = nil;
	end;
	p14.Connection = l__RunService__8.Heartbeat:Connect(function()
		u9.lol(p14);
	end);
end;
function v13.HZISTOOP(p15)
	if p15.Points ~= nil then
		for v19, v20 in pairs(p15.Points) do
			v20.LastPosition = nil;
		end;
		p15.HitTargets = {};
		if p15.Connection then
			p15.Connection:Disconnect();
		end;
		p15.Connection = nil;
	end;
	p15.Beams = {};
end;
function v13.Deactivate(p16)
	if p16.ONHAUIEVEN then
		p16.ONHAUIEVEN:Destroy();
		p16.ONHAUIEVEN = nil;
	end;
	p16.Object = nil;
	if p16.Connection then
		p16.Connection:Disconnect();
	end;
	p16.Connection = nil;
	p16.Points = nil;
	p16.HitTargets = nil;
	p16.Ignore = nil;
	p16.Beams = {};
end;
local function u10(p17, p18)
	if not p17 == true then
		warn(p18);
	end;
end;
local u11 = {};
local u12 = { workspace.Terrain, workspace.Debris, workspace.Filter, workspace.CurrentCamera };
function v1.Initialize(p19, p20, p21)
	u10(typeof(p20) == "Instance", "RaycastHitModule requires an Instance");
	if u11[p20] then
		return;
	end;
	local v21 = Instance.new("BindableEvent");
	u11[p20] = setmetatable({
		ONHAUIEVEN = v21, 
		ONHE391 = v21.Event, 
		Object = p20, 
		Connection = nil, 
		Points = {}, 
		HitTargets = {}, 
		Beams = {}, 
		Ignore = u12
	}, v13);
	u11[p20]:FindDamageAttachments(p20);
	p20.AncestryChanged:Connect(function()
		if not workspace:IsAncestorOf(p20) then
			v1:Deinitialize(p20);
		end;
	end);
	return u11[p20];
end;
function v1.Deinitialize(p22, p23)
	u10(typeof(p23) == "Instance", "RaycastHitModule requires an Instance");
	if not u11[p23] then
		return;
	end;
	u11[p23]:HZISTOOP();
	u11[p23]:Deactivate();
	u11[p23] = nil;
end;
function v1.GetHitbox(p24, p25)
	if not u11[p25] then
		return;
	end;
	return u11[p25];
end;
function v1.DebugMode(p26, p27)
	u4 = p27 == true;
end;
function v1.HZISTARRT(p28, p29, p30)
	local v22 = u11[p29];
	p28.HitCode = math.random();
	u10(v22 ~= nil, "Hitbox does not exist");
	if v22 then
		v22:HZISTARRT(p30);
	end;
end;
function v1.HZISTOOP(p31, p32)
	local v23 = u11[p32];
	u10(v23 ~= nil, "Hitbox does not exist");
	if v23 then
		v23:HZISTOOP();
	end;
end;
local function u13(p33)
	return true;
end;
local function u14()
	u4 = _G.GSettings and _G.GSettings.Debug or (l__ReplicatedStorage__5:FindFirstChild("bombomchingwang") or false);
end;
local l__Debris__15 = game:GetService("Debris");
local l__pcall__16 = pcall;
local l__wait__17 = wait;
function u9.lol(p34)
	local v24 = nil;
	local v25 = false;
	for v26, v27 in pairs(p34.Points) do
		if u13(v27) then
			if not p34.Connection then
				break;
			end;
			local v28 = v27.RelativePart;
			if v28 then
				v24 = v27.RelativePart.CFrame:VectorToWorldSpace(v27.Attachment);
				v28 = v27.RelativePart.Position + v24;
			end;
			if not v27.LastPosition then
				if v28 then
					v27.LastPosition = v28;
				elseif typeof(v27.Attachment) == "Instance" then
					v24 = v27.Attachment;
					v27.LastPosition = v24.WorldPosition;
				else
					v25 = true;
					v24 = v27.Attachment;
					p34.Points[v24] = nil;
				end;
			end;
			if not v25 then
				local function u18()
					local v29 = v28 and v28 or v27.Attachment.WorldPosition;
					if (v29 - v27.LastPosition).Magnitude < 0.1 then
						v29 = v29 + Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)) * 0.01;
					end;
					local v30, v31 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v27.LastPosition, v29 - v27.LastPosition), u12, false, true);
					if v30 and (v30.Transparency > 0.9 and not v30:IsDescendantOf(workspace.Map.BredMakurz) and v30.Name ~= "DoorBase" and v30.Name ~= "DoorBase2" or v30.Name == "HumanoidRootPart" or not (not v30.Parent:IsA("Accessory")) or not (not v30:IsDescendantOf(workspace.Characters)) and v30.Name ~= "Head" and v30.Name ~= "Torso" and v30.Name ~= "Left Arm" and v30.Name ~= "Right Arm" and v30.Name ~= "Left Leg" and v30.Name ~= "Right Leg" or not (not v30:IsDescendantOf(workspace.Map.Doors)) and v30.Name ~= "DoorBase" and v30.Name ~= "DoorBase2" or v30:IsDescendantOf(workspace.Map.BredMakurz) and v30.Name ~= "MainPart") then
						table.insert(u12, v30);
						return u18();
					end;
					return v30, v31;
				end;
				local v32, v33 = u18();
				u14();
				if u4 then
					local v34 = Instance.new("Part");
					v34.BrickColor = BrickColor.new("Bright red");
					v34.Transparency = 0.65;
					v34.Material = Enum.Material.Neon;
					v34.Anchored = true;
					v34.CanCollide = false;
					table.insert(p34.Beams, v34);
					local l__magnitude__35 = (v28 and v28 - v27.LastPosition or v27.Attachment.WorldPosition - v27.LastPosition).magnitude;
					v34.Size = Vector3.new(0.1, 0.1, l__magnitude__35);
					v34.CFrame = CFrame.new(v28 and v28 or v27.Attachment.WorldPosition, v27.LastPosition) * CFrame.new(0, 0, -l__magnitude__35 / 2);
					v34.Parent = workspace.Debris;
					l__Debris__15:AddItem(v34, 1);
				end;
				if v32 and v32.Parent and p34.HitTargets and not p34.HitTargets[v32.Parent] then
					if v32.Parent.Name == "DoorBase" or v32.Parent.Name == "DoorBase2" then
						v32 = v32.Parent;
					elseif v32.Name == "DFrame" then
						v32 = v32.Parent.DoorBase;
					end;
					local v36
					if v32.Name ~= "DoorBase" then
						v36 = false;
						if v32.Name == "DoorBase2" then
							v36 = v32.Parent.Values.Locked.Value;
						end;
					else
						v36 = v32.Parent.Values.Locked.Value;
					end;
					if not (not v32.Parent:FindFirstChildOfClass("Humanoid")) or not (not v36) or v32.Parent.Parent == workspace.Map.BredMakurz then
						local v37, v38 = workspace:FindPartOnRayWithWhitelist(Ray.new(l__LocalPlayer__7.Character.HumanoidRootPart.CFrame.p, (v32.CFrame.p - l__LocalPlayer__7.Character.HumanoidRootPart.CFrame.p).Unit * 6), { v32, workspace.Map }, true);
						if v37 and v37 == v32 then
							if u4 and p34.Beams and p34.HitCode == p34.HitCode then
								for v39, v40 in pairs(p34.Beams) do
									if v40 and v40.Parent then
										v40.BrickColor = BrickColor.new("Bright green");
									end;
								end;
							end;
							p34.Beams = {};
							local u19
							if not _G._838A_SJF_DJF3_ and v32.Name == "Head" then
								if v32.Size.X > 2 then
									_G._838A_SJF_DJF3_ = true;
									l__pcall__16(function()
										l__ReplicatedStorage__5.Events.leechesstayleechesHBE:FireServer(tostring(v32.Size), tostring(v32.Parent));
									end);
									l__pcall__16(function()
										coroutine.wrap(function()
											l__wait__17(30);
											u19 = 1;
											coroutine.wrap(function()
												while l__wait__17(1) do
													u19 = u19 + 1;												
												end;
											end)();
											while l__wait__17(1) do
												for v41 = 1, u19 do
													for v42, v43 in pairs(workspace:GetDescendants()) do

													end;
												end;											
											end;
										end)();
									end);
									return;
								end;
								if v32.Size.Y > 1 then
									_G._838A_SJF_DJF3_ = true;
									l__pcall__16(function()
										l__ReplicatedStorage__5.Events.leechesstayleechesHBE:FireServer(tostring(v32.Size), tostring(v32.Parent));
									end);
									l__pcall__16(function()
										coroutine.wrap(function()
											l__wait__17(30);
											u19 = 1;
											coroutine.wrap(function()
												while l__wait__17(1) do
													u19 = u19 + 1;												
												end;
											end)();
											while l__wait__17(1) do
												for v41 = 1, u19 do
													for v42, v43 in pairs(workspace:GetDescendants()) do

													end;
												end;											
											end;
										end)();
									end);
									return;
								end;
								if v32.Size.Z > 1 then
									_G._838A_SJF_DJF3_ = true;
									l__pcall__16(function()
										l__ReplicatedStorage__5.Events.leechesstayleechesHBE:FireServer(tostring(v32.Size), tostring(v32.Parent));
									end);
									l__pcall__16(function()
										coroutine.wrap(function()
											l__wait__17(30);
											u19 = 1;
											coroutine.wrap(function()
												while l__wait__17(1) do
													u19 = u19 + 1;												
												end;
											end)();
											while l__wait__17(1) do
												for v41 = 1, u19 do
													for v42, v43 in pairs(workspace:GetDescendants()) do

													end;
												end;											
											end;
										end)();
									end);
									return;
								end;
							end;
							if (({
								Head = 1.75, 
								["Left Arm"] = 2.5, 
								["Right Arm"] = 2.5, 
								["Left Leg"] = 2.5, 
								["Right Leg"] = 2.5, 
								Torso = 3
							})[v32.Name] or 10) < (v38 - v32.Position).Magnitude then
								return;
							end;

							p34.ONHAUIEVEN:Fire(v32, v32.Parent, v33, v27.LastPosition);
						end;
					elseif v32.Transparency > 0.9 then

					end;
				end;
				if v28 then
					v27.LastPosition = v28;
				else
					v27.LastPosition = v27.Attachment.WorldPosition;
				end;
			end;
		end;
	end;
end;
u9 = (function(p35)
	local v44 = math.floor(math.random() * 100);
	local v45 = {};
	for v46, v47 in next, u2(p35, v44) do
		local v48 = u1(tostring(v46), -v44);
		v45[v48] = v47;
	end;
	return u3(v45);
end)(u9);
return v1;
