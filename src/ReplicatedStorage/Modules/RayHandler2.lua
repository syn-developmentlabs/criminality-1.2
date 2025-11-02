-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__RunService__2 = game:GetService("RunService");
local l__PhysicsService__3 = game:GetService("PhysicsService");
local u1 = {
	Debug = false
};
local u2 = nil;
local u3 = nil;
local u4 = nil;
local function u5(...)
	if not u1.Debug then
		return;
	end;
	local v4 = "RayHandler: ";
	for v5, v6 in pairs({ ... }) do
		v4 = v4 .. tostring(v6) .. " |";
	end;
	warn(v4);
end;
local u6 
u6 = {
	CastRay = function(p1, p2, p3, p4)
		local u7 = nil;
		local u8 = nil;
		local u9 = nil;
		local u10 = nil;
		p3 = p3 or {};
		local u11 = nil;
		local function u12()
			local v7 = Vector3.new(0, 1, 0);
			u7 = nil;
			u8 = p1.Origin + p1.Direction;
			u9 = v7;
			u10 = Enum.Material.Air;
		end;
		(function()
			local v8 = u2;
			if p3 then
				if p3.type then
					if p3.type == "m" then
						v8 = u3;
					elseif p3.type == "f" then
						v8 = u4;
					end;
				end;
				if p3.cg then
					v8.CollisionGroup = p3.cg;
				end;
			end;
			if not v8 then
				return;
			end;
			local v9 = v8.FilterDescendantsInstances;
			local v10 = p2;
			if v10 then
				v10 = typeof(p2);
				if v10 == "table" then
					for v11, v12 in pairs(p2) do
						table.insert(v9, v12);
					end;
				end;
			end;
			local function u13()
				local v13 = RaycastParams.new();
				v13.CollisionGroup = v8.CollisionGroup;
				v13.IgnoreWater = v8.IgnoreWater;
				v13.FilterType = v8.FilterType;
				v13.FilterDescendantsInstances = v9;
				local v14 = workspace:Raycast(p1.Origin, p1.Direction, v13);
				if v14 then
					u7 = v14.Instance;
					u8 = v14.Position;
					u9 = v14.Normal;
					u10 = v14.Material;
					u5("HitPart:", tostring(u7 and u7:GetFullName()));
					if u7 and u6 and u6.CheckAfterRay ~= nil then
						local v15, v16 = u6.CheckAfterRay(u7, p3, p4);
						if v16 and not u11 then
							u11 = v16;
						end;
						if v15 == true then
							u5("REDO", tostring(u7 and u7:GetFullName()));
							table.insert(v9, 1, u7);
							u13();
							return;
						end;
					end;
				else
					u12();
				end;
			end;
			u13();
		end)();
		if u7 == nil and u8 == nil then
			u12();
		end;
		if u7 then
			u5(p3.type, u7 and u7:GetFullName());
		end;
		return u7, u8, u9, u10, u11;
	end
};
local u14 = {};
local u15 = {};
local u16 = {};
local l__CollectionService__17 = game:GetService("CollectionService");
local u18 = {};
local u19 = {};
local u20 = {};
local function u21(p5)
	local v17 = true;
	if p5.Name ~= "Head" then
		v17 = true;
		if p5.Name ~= "Torso" then
			v17 = true;
			if p5.Name ~= "Left Arm" then
				v17 = true;
				if p5.Name ~= "Right Arm" then
					v17 = true;
					if p5.Name ~= "Left Leg" then
						v17 = p5.Name == "Right Leg";
					end;
				end;
			end;
		end;
	end;
	return v17;
end;
local u22 = l__RunService__2:IsClient();
function u6.SetUp()
	if u6.HasSetUp then
		return;
	end;
	u6.HasSetUp = true;
	u6.IsClient = l__RunService__2:IsClient();
	u5("RayHandler: Setting up..");
	u2 = RaycastParams.new();
	u2.FilterType = Enum.RaycastFilterType.Blacklist;
	u2.IgnoreWater = true;
	u2.CollisionGroup = "Character";
	u3 = RaycastParams.new();
	u3.FilterType = Enum.RaycastFilterType.Blacklist;
	u3.IgnoreWater = true;
	u3.CollisionGroup = "Character";
	if u6.IsClient then
		u4 = RaycastParams.new();
		u4.FilterType = Enum.RaycastFilterType.Blacklist;
		u4.IgnoreWater = true;
		u4.CollisionGroup = "Character";
	end;
	local l__Map__18 = workspace:WaitForChild("Map", 1000);
	local l__Filter__19 = workspace:WaitForChild("Filter", 1000);
	local l__Debris__20 = workspace:WaitForChild("Debris");
	local l__Characters__21 = workspace:WaitForChild("Characters");
	l__Filter__19:WaitForChild("Parts", 60);
	l__Map__18:WaitForChild("Parts", 60);
	u5("RayHandler: Created base Params up..");
	local function u23()
		u2.FilterDescendantsInstances = u14;
		u3.FilterDescendantsInstances = u15;
		if u6.IsClient then
			u4.FilterDescendantsInstances = u16;
		end;
		u5("RHTC:", #u14, #u15, #u16, 0 + #u16 + #u15 + #u14);
	end;
	(function()
		u6.HFuncs = {};
		u6.HFuncs.MIP_0_A = function(p6)
			u5("AddedTag0:", p6:GetFullName());
			l__CollectionService__17:AddTag(p6, "MainIgnorePart");
			if not u18[p6] then
				table.insert(u14, p6);
				u18[p6] = #u14;
			end;
			if not u19[p6] then
				table.insert(u15, p6);
				u19[p6] = #u15;
			end;
			if u6.IsClient and not u20[p6] then
				table.insert(u16, p6);
				u20[p6] = #u16;
			end;
			u23();
		end;
		u6.HFuncs.MIP_0_R = function(p7)
			u5("RemovedTag0 " .. p7:GetFullName());
			if u18[p7] then
				table.remove(u14, table.find(u14, p7));
				u18[p7] = nil;
			end;
			if u19[p7] then
				table.remove(u15, table.find(u15, p7));
				u19[p7] = nil;
			end;
			if u20[p7] then
				table.remove(u16, table.find(u16, p7));
				u20[p7] = nil;
			end;
			u23();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart"):Connect(u6.HFuncs.MIP_0_R);
		u6.HFuncs.MIP_1_A = function(p8)
			l__CollectionService__17:AddTag(p8, "MainIgnorePart_1");
			u5("AddedTag1:", p8:GetFullName());
			if not u18[p8] then
				table.insert(u14, p8);
				u18[p8] = #u14;
			end;
			u23();
		end;
		u6.HFuncs.MIP_1_R = function(p9)
			u5("RemovedTag1:", p9:GetFullName());
			if u18[p9] then
				table.remove(u14, table.find(u14, p9));
				u18[p9] = nil;
			end;
			u23();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart_1"):Connect(u6.HFuncs.MIP_1_R);
		u6.HFuncs.MIP_2_A = function(p10)
			u5("AddedTag2:", p10:GetFullName());
			l__CollectionService__17:AddTag(p10, "MainIgnorePart_2");
			if not u19[p10] then
				table.insert(u15, p10);
				u19[p10] = #u15;
			end;
			u23();
		end;
		u6.HFuncs.MIP_2_R = function(p11)
			u5("RemovedTag2:", p11:GetFullName());
			if u19[p11] then
				table.remove(u15, table.find(u15, p11));
				u19[p11] = nil;
			end;
			u23();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart_2"):Connect(u6.HFuncs.MIP_2_R);
		u6.HFuncs.MIP_3_A = function(p12)
			if not u6.IsClient then
				return;
			end;
			u5("AddedTag3:", p12:GetFullName());
			l__CollectionService__17:AddTag(p12, "MainIgnorePart_3");
			if not u20[p12] then
				table.insert(u16, p12);
				u20[p12] = #u16;
			end;
			u23();
		end;
		u6.HFuncs.MIP_3_R = function(p13)
			if not u6.IsClient then
				return;
			end;
			u5("RemovedTag3:", p13:GetFullName());
			if u20[p13] then
				table.remove(u16, table.find(u16, p13));
				u20[p13] = nil;
			end;
			u23();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart_3"):Connect(u6.HFuncs.MIP_3_R);
		for v22, v23 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart")) do
			u6.HFuncs.MIP_0_A(v23);
		end;
		for v24, v25 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart_1")) do
			u6.HFuncs.MIP_1_A(v25);
		end;
		for v26, v27 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart_2")) do
			u6.HFuncs.MIP_2_A(v27);
		end;
		for v28, v29 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart_3")) do
			u6.HFuncs.MIP_3_A(v29);
		end;
	end)();
	u5("RayHandler: Handled removals..");
	wait(0.1);
	(function()
		function u6.CheckAfterRay(p14, p15, p16)
			local v30 = false;
			local v31 = nil;
			local v32 = false;
			local v33 = false;
			if not p14:FindFirstChild("CanHitT") then
				if p14:IsDescendantOf(workspace.Characters) and (not u21(p14) or p14.Transparency >= 1) then
					v30 = true;
					v32 = true;
					if u22 and p14.Transparency < 1 and p14:GetAttribute("ARv") then
						v31 = {
							HIP = p14, 
							ARv = p14:GetAttribute("ARv")
						};
					else
						u6.HFuncs.MIP_0_A(p14);
					end;
				elseif not p14.CanCollide and not p14.CanTouch then
					v30 = true;
					v32 = true;
				end;
				if not v32 then
					if p15 and p15 == "g" and p14:FindFirstChild("FilterV") then
						v30 = true;
					end;
					if p15 and p15 == "m" and p14:IsDescendantOf(l__Map__18.Doors) then
						if p14.Parent and p14.Parent.Parent and p14.Name ~= "DoorBase" and p14.Name ~= "DoorBase2" then
							u5(3, p14:GetFullName());
						end;
					elseif p15 and p15 == "m" and p14:IsDescendantOf(l__Map__18.BredMakurz) and p14.Name ~= "MainPart" then
						v30 = true;
					end;
					if p14:IsDescendantOf(l__Map__18.Parts) and p14.Transparency >= 1 and not p14.CanCollide then
						v30 = true;
						v32 = true;
						p14.Parent = l__Filter__19.Parts;
					end;
					if not v32 and p15 and ((p15 == "f" or p15 == "g") and p14.Transparency >= 1) then
						v33 = true;
						v30 = true;
					end;
					if not v32 and not v33 and p15 and p15 == "f" then
						if not (p14.Transparency >= 0.2) then
							if not p14.CanCollide and not p14.CanTouch and p14.Size.Magnitude >= 2 then
								v30 = true;
							end;
						elseif p14.Size.Magnitude >= 2 then
							v30 = true;
						end;
					end;
				end;
			end;
			return v30, v31;
		end;
		if u6.IsClient then
			u6.HFuncs.MIP_0_A(workspace.CurrentCamera);
			u6.HFuncs.MIP_3_A(l__Characters__21);
		end;
		u6.HFuncs.MIP_0_A(l__Filter__19);
		u6.HFuncs.MIP_0_A(l__Debris__20);
		u5("Total CSP:", 0);
	end)();
	u5("RayHandler: Monitored map..");
	u5("RayHandler: Monitored players..");
	wait(0.1);
	u23();
	u5("RayHandler: Completed.");
end;
return u6;
