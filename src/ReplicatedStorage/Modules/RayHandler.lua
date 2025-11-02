-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__PhysicsService__2 = game:GetService("PhysicsService");
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
	for v3, v4 in pairs({ ... }) do
		warn("RayHandler: ", v4);
	end;
end;
local u6
u6 = {
	CastRay = function(p1, p2, p3)
		local u7 = nil;
		local u8 = nil;
		local u9 = nil;
		local u10 = nil;
		p3 = p3 or {};
		local function u11()
			local v5 = Vector3.new(0, 1, 0);
			u7 = nil;
			u8 = p1.Origin + p1.Direction;
			u9 = v5;
			u10 = Enum.Material.Air;
		end;
		(function()
			local v6 = u2;
			if p3 and p3.type then
				if p3.type == "m" then
					v6 = u3;
				elseif p3.type == "f" then
					v6 = u4;
				end;
			end;
			local v7 = RaycastParams.new();
			v7.CollisionGroup = v6.CollisionGroup;
			v7.IgnoreWater = v6.IgnoreWater;
			v7.FilterType = v6.FilterType;
			local v8 = v6.FilterDescendantsInstances;
			local v9 = p2;
			if v9 then
				v9 = typeof(p2);
				if v9 == "table" then
					for v10, v11 in pairs(p2) do
						table.insert(v8, v11);
					end;
				end;
			end;
			local function u12()
				v7.FilterDescendantsInstances = v8;
				local v12 = workspace:Raycast(p1.Origin, p1.Direction, v7);
				if v12 then
					u7 = v12.Instance;
					u8 = v12.Position;
					u9 = v12.Normal;
					u10 = v12.Material;
					u5("HitPart:", tostring(u7 and u7:GetFullName()));
					if u7 then
						u5("REDO TIME", tostring(u7 and u7:GetFullName()));
						table.insert(v8, 1, u7);
						u12();
					end;
				else
					u11();
				end;
				u5(v12);
			end;
			u12();
		end)();
		if u7 then
			u5(p3.type, u7 and u7:GetFullName());
		end;
		return u7, u8, u9, u10;
	end
};
local l__RunService__13 = game:GetService("RunService");
local u14 = {};
local u15 = {};
local u16 = {};
local l__CollectionService__17 = game:GetService("CollectionService");
local u18 = {};
local u19 = {};
local u20 = {};
local function u21(p4)
	local v13 = true;
	if p4.Name ~= "Head" then
		v13 = true;
		if p4.Name ~= "Torso" then
			v13 = true;
			if p4.Name ~= "Left Arm" then
				v13 = true;
				if p4.Name ~= "Right Arm" then
					v13 = true;
					if p4.Name ~= "Left Leg" then
						v13 = p4.Name == "Right Leg";
					end;
				end;
			end;
		end;
	end;
	return v13;
end;
function u6.SetUp()
	if u6.HasSetUp then
		return;
	end;
	u6.HasSetUp = true;
	u6.IsClient = l__RunService__13:IsClient();
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
	local l__Map__14 = workspace:WaitForChild("Map");
	local l__Filter__15 = workspace:WaitForChild("Filter");
	local l__Debris__16 = workspace:WaitForChild("Debris");
	local l__Characters__17 = workspace:WaitForChild("Characters");
	l__Filter__15:WaitForChild("Parts", 60);
	l__Map__14:WaitForChild("Parts", 60);
	u5("RayHandler: Created base Params up..");
	local function u22()
		u2.FilterDescendantsInstances = u14;
		u3.FilterDescendantsInstances = u15;
		if u6.IsClient then
			u4.FilterDescendantsInstances = u16;
		end;
		u5("RHTC:", #u14, #u15, #u16, 0 + #u16 + #u15 + #u14);
	end;
	(function()
		u6.HFuncs = {};
		u6.HFuncs.MIP_0_A = function(p5)
			u5("AddedTag0:", p5:GetFullName());
			l__CollectionService__17:AddTag(p5, "MainIgnorePart");
			if not u18[p5] then
				table.insert(u14, p5);
				u18[p5] = #u14;
			end;
			if not u19[p5] then
				table.insert(u15, p5);
				u19[p5] = #u15;
			end;
			if u6.IsClient and not u20[p5] then
				table.insert(u16, p5);
				u20[p5] = #u16;
			end;
			u22();
		end;
		u6.HFuncs.MIP_0_R = function(p6)
			u5("RemovedTag0 " .. p6:GetFullName());
			if u18[p6] then
				table.remove(u14, table.find(u14, p6));
				u18[p6] = nil;
			end;
			if u19[p6] then
				table.remove(u15, table.find(u15, p6));
				u19[p6] = nil;
			end;
			if u20[p6] then
				table.remove(u16, table.find(u16, p6));
				u20[p6] = nil;
			end;
			u22();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart"):Connect(u6.HFuncs.MIP_0_R);
		u6.HFuncs.MIP_1_A = function(p7)
			l__CollectionService__17:AddTag(p7, "MainIgnorePart_1");
			u5("AddedTag1:", p7:GetFullName());
			if not u18[p7] then
				table.insert(u14, p7);
				u18[p7] = #u14;
			end;
			u22();
		end;
		u6.HFuncs.MIP_1_R = function(p8)
			u5("RemovedTag1:", p8:GetFullName());
			if u18[p8] then
				table.remove(u14, table.find(u14, p8));
				u18[p8] = nil;
			end;
			u22();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart_1"):Connect(u6.HFuncs.MIP_1_R);
		u6.HFuncs.MIP_2_A = function(p9)
			u5("AddedTag2:", p9:GetFullName());
			l__CollectionService__17:AddTag(p9, "MainIgnorePart_2");
			if not u19[p9] then
				table.insert(u15, p9);
				u19[p9] = #u15;
			end;
			u22();
		end;
		u6.HFuncs.MIP_2_R = function(p10)
			u5("RemovedTag2:", p10:GetFullName());
			if u19[p10] then
				table.remove(u15, table.find(u15, p10));
				u19[p10] = nil;
			end;
			u22();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart_2"):Connect(u6.HFuncs.MIP_2_R);
		u6.HFuncs.MIP_3_A = function(p11)
			if not u6.IsClient then
				return;
			end;
			u5("AddedTag3:", p11:GetFullName());
			l__CollectionService__17:AddTag(p11, "MainIgnorePart_3");
			if not u20[p11] then
				table.insert(u16, p11);
				u20[p11] = #u16;
			end;
			u22();
		end;
		u6.HFuncs.MIP_3_R = function(p12)
			if not u6.IsClient then
				return;
			end;
			u5("RemovedTag3:", p12:GetFullName());
			if u20[p12] then
				table.remove(u16, table.find(u16, p12));
				u20[p12] = nil;
			end;
			u22();
		end;
		l__CollectionService__17:GetInstanceRemovedSignal("MainIgnorePart_3"):Connect(u6.HFuncs.MIP_3_R);
		for v18, v19 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart")) do
			u6.HFuncs.MIP_0_A(v19);
		end;
		for v20, v21 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart_1")) do
			u6.HFuncs.MIP_1_A(v21);
		end;
		for v22, v23 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart_2")) do
			u6.HFuncs.MIP_2_A(v23);
		end;
		for v24, v25 in pairs(l__CollectionService__17:GetTagged("MainIgnorePart_3")) do
			u6.HFuncs.MIP_3_A(v25);
		end;
	end)();
	u5("RayHandler: Handled removals..");
	wait(0.1);
	(function()
		function u6.CheckAfterRay(p13, p14)
			local v26 = false;
			local v27 = false;
			local v28 = false;
			if not p13:FindFirstChild("CanHitT") then
				if p13:IsDescendantOf(workspace.Characters) and not u21(p13) then
					v26 = true;
					v27 = true;
					u6.HFuncs.MIP_0_A(p13);
				elseif not p13.CanCollide and not p13.CanTouch then
					u5(1, p13.CanCollide, p13.CanTouch, p13:GetFullName());
					v26 = true;
					v27 = true;
				end;
				if not v27 then
					if p14 and p14 == "g" and p13:FindFirstChild("FilterV") then
						u5(2, p13:GetFullName());
						v26 = true;
					end;
					if p14 and p14 == "m" and p13:IsDescendantOf(l__Map__14.Doors) then
						if p13.Parent and p13.Parent.Parent and p13.Name ~= "DoorBase" and p13.Name ~= "DoorBase2" then
							u5(3, p13:GetFullName());
							v26 = true;
						end;
					elseif p14 and p14 == "m" and p13:IsDescendantOf(l__Map__14.BredMakurz) and p13.Name ~= "MainPart" then
						u5(4, p13:GetFullName());
						v26 = true;
					end;
					if p13:IsDescendantOf(l__Map__14.Parts) and p13.Transparency >= 1 and not p13.CanCollide then
						u5(5, p13.Transparency, p13.CanCollide, p13:GetFullName());
						v26 = true;
						v27 = true;
						p13.Parent = l__Filter__15.Parts;
					end;
					if not v27 and p14 and ((p14 == "f" or p14 == "g") and p13.Transparency >= 1) then
						u5(6, p13:GetFullName());
						v28 = true;
						v26 = true;
					end;
					if not v27 and not v28 and p14 and p14 == "f" then
						if not (p13.Transparency >= 0.2) then
							if not p13.CanCollide and not p13.CanTouch and p13.Size.Magnitude >= 2 then
								u5(6, p13.Transparency, p13.CanCollide, p13:GetFullName());
								v26 = true;
							end;
						elseif p13.Size.Magnitude >= 2 then
							u5(6, p13.Transparency, p13.CanCollide, p13:GetFullName());
							v26 = true;
						end;
					end;
				end;
			end;
			return v26;
		end;
		if u6.IsClient then
			u6.HFuncs.MIP_0_A(workspace.CurrentCamera);
			u6.HFuncs.MIP_3_A(l__Characters__17);
		end;
		u6.HFuncs.MIP_0_A(l__Filter__15);
		u6.HFuncs.MIP_0_A(l__Debris__16);
		u5("Total CSP:", 0);
	end)();
	u5("RayHandler: Monitored map..");
	u5("RayHandler: Monitored players..");
	wait(0.1);
	u22();
	u5("RayHandler: Completed.");
end;
return u6;
