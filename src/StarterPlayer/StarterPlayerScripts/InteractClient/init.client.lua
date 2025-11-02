-- Decompiled with the Synapse X Luau decompiler.

local l__UserInputService__1 = game:GetService("UserInputService");
local l__RunService__2 = game:GetService("RunService");
local l__ReplicatedStorage__3 = game:GetService("ReplicatedStorage");
local l__TweenService__4 = game:GetService("TweenService");
while true do
	wait(1);
	if _G.WaitForChar and _G.GVF then
		break;
	end;
end;
local l__Modules__5 = l__ReplicatedStorage__3:WaitForChild("Modules");
local v6 = {};
local l__Events__7 = l__ReplicatedStorage__3:WaitForChild("Events");
local l__Events2__8 = l__ReplicatedStorage__3:WaitForChild("Events2");
for v9 = 1, 2 do
	table.insert(v6, l__ReplicatedStorage__3.Storage.GUIs:WaitForChild("INTER_BGUI"):Clone());
end;
local l__Map__10 = workspace:WaitForChild("Map");
l__Map__10:WaitForChild("Doors");
l__Map__10:WaitForChild("ATMz");
l__Map__10:WaitForChild("Shopz");
local v11 = Vector3.new(0, 0, 0);
local l__Gets__12 = script:WaitForChild("Gets");
local v13 = {
	GetDoor = require(l__Gets__12:WaitForChild("GetDoor"):Clone()), 
	GetMP = require(l__Gets__12:WaitForChild("GetMP"):Clone()), 
	GetDrops = require(l__Gets__12:WaitForChild("GetDrops"):Clone()), 
	WaterCheck2 = require(l__Modules__5:WaitForChild("WaterCheck2"))
};
l__Gets__12:ClearAllChildren();
local u1 = nil;
local u2 = nil;
local u3 = nil;
local u4 = nil;
function AliveCheck()
	local v14 = u1;
	if v14 then
		v14 = u1.Parent;
		if v14 then
			v14 = u2;
			if v14 then
				v14 = u2.Parent;
				if v14 then
					v14 = u3;
					if v14 then
						v14 = u3.Parent;
						if v14 then
							v14 = false;
							if u3:GetState() ~= Enum.HumanoidStateType.Dead then
								v14 = not u4;
								if not v14 then
									v14 = u4 and u4.RagdollTime.Value <= 0;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	return v14;
end;
local u5 = {};
local u6 = {};
local u7 = {};
local u8 = {};
function SetUp()
	local function v15(p1)
		if p1:WaitForChild("DFrame", 2) then

		else
			warn("No DFrame in door!");
			return;
		end;
		local l__DFrame__16 = p1.DFrame;
		table.insert(u5, l__DFrame__16);
		local u9 = nil;
		u9 = l__DFrame__16.AncestryChanged:Connect(function(p2, p3)
			if not p3 then
				local v17, v18, v19 = pairs(u5);
				while true do
					local v20, v21 = v17(v18, v19);
					if v20 then

					else
						break;
					end;
					v19 = v20;
					if v21 == l__DFrame__16 then
						table.remove(u5, v20);
					end;				
				end;
				u9:Disconnect();
			end;
		end);
	end;
	local v22, v23, v24 = pairs(l__Map__10.Doors:GetChildren());
	while true do
		local v25, v26 = v22(v23, v24);
		if v25 then

		else
			break;
		end;
		v24 = v25;
		spawn(function()
			v15(v26);
		end);	
	end;
	l__Map__10.Doors.ChildAdded:Connect(v15);
	local v27, v28, v29 = pairs(l__Map__10.ATMz:GetChildren());
	while true do
		local v30, v31 = v27(v28, v29);
		if v30 then

		else
			break;
		end;
		v29 = v30;
		if v31:FindFirstChild("MainPart") then
			table.insert(u6, v31.MainPart);
		else
			warn("ATM: Not a MainPart!");
		end;	
	end;
	local v32, v33, v34 = pairs(l__Map__10.Shopz:GetChildren());
	while true do
		local v35, v36 = v32(v33, v34);
		if v35 then

		else
			break;
		end;
		v34 = v35;
		if v36:FindFirstChild("MainPart") then
			table.insert(u7, v36.MainPart);
		else
			warn("Shop: Not a MainPart!");
		end;	
	end;
	l__Events2__8.AddExtraInteract.Event:Connect(function(p4, p5, p6, p7, p8, p9)
		if p4 then
			if not p4:IsA("BasePart") then
				if not u8[p4] then
					return;
				end;
			end;
		elseif not u8[p4] then
			return;
		end;
		u8[p4] = { p4, p5, p6, p7, p8, p9 };
		local u10 = nil;
		u10 = p4.AncestryChanged:Connect(function(p10, p11)
			if not p11 then
				u8[p4] = nil;
				u10:Disconnect();
			end;
		end);
	end);
end;
local u11 = {};
function CancelDo(p12)
	if typeof(p12) == "Instance" then
		if p12.Parent then
			if u11[p12] then
				u11[p12][2].Frame.Bar:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0, true);
				u11[p12] = nil;
			end;
		end;
	end;
end;
local u12 = {};
local function u13(p13, p14, p15, p16, p17, p18)
	local v37, v38 = workspace:FindPartOnRayWithWhitelist(Ray.new(p13, (p14.Position - p13).Unit * p15), p16, true);
	local v39 = true;
	if v37 ~= p14 then
		v39 = p17 and v37 and v37:IsDescendantOf(p14) or p18 and (v37 and v37:IsDescendantOf(p14.Parent));
	end;
	return v39, v38;
end;
function u12.DoorCheck()
	local v40, v41 = v13.GetDoor(u2, u5, u11);
	if v40 and v41 then
		local l__Events__42 = v40.Events;
		local l__Values__43 = v40.Values;
		local l__Health__44 = l__Values__43.Health;
		local l__Open__45 = l__Values__43.Open;
		local l__Busy__46 = l__Values__43.Busy;
		local l__Busy2__47 = l__Values__43.Busy2;
		local l__Busy3__48 = l__Values__43.Busy3;
		local l__Lock__49 = v40:FindFirstChild("Lock");
		if u12.DoorCheck_knob ~= v41 then
			CancelDo(u12.DoorCheck_knob);
		end;
		if u12.DoorCheck_l ~= l__Lock__49 then
			CancelDo(u12.DoorCheck_l);
		end;
		if v40.DoorBase:FindFirstChild("KnockPos") and u12.DoorCheck_knockPos ~= v40.DoorBase.KnockPos then
			CancelDo(u12.DoorCheck_knockPos);
		end;
		u12.DoorCheck_knob = v41;
		u12.DoorCheck_l = l__Lock__49;
		u12.DoorCheck_knockPos = v40.DoorBase:FindFirstChild("KnockPos");
		if not l__Values__43.Broken.Value and u13(u2.Position, v41, l__Values__43.ActiveDistance.Value, { workspace.Map }) then
			local v50 = u1:FindFirstChildOfClass("Tool");
			local v51 = not _G.CheckIfFlinching(u1, true) and (not _G.GVF().Currents:FindFirstChild("AntiDoor") and (not v50 or (not (not v50:FindFirstChild("DoorAllow")) or not v50:FindFirstChild("DoorUnable"))));
			if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
				v51 = false;
			end;
			local v52 = {};
			if v51 then
				if not l__Busy__46.Value and not l__Busy2__47.Value then
					if l__Busy3__48.Value then
						v52[1] = { false, 0, v41, Color3.new(1, 0, 0), Enum.KeyCode.E };
					else
						local v53
						local v54
						if not v40:FindFirstChild("IsGarageDoor") and not v40:FindFirstChild("IsElevator1") then
							if not l__Open__45.Value then
								v53 = "Open";
							else
								v53 = "Close";
							end;
							v54 = v53;
						else
							v54 = "Do";
						end;
						v52[1] = { true, 0, v41, Color3.new(1, 1, 1), Enum.KeyCode.E, l__Events__42.Toggle, { v54, v41 } };
					end;
				else
					v52[1] = { false, 0, v41, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.E };
				end;
				local v55 = l__Lock__49 and u13(u2.Position, v40.Lock, l__Values__43.ActiveDistance.Value, { workspace.Map }, true);
				if l__Lock__49 and l__Values__43.CanLock.Value and not l__Busy2__47.Value and not l__Values__43.Busy2_5.Value and not l__Open__45.Value and not l__Busy__46.Value and v55 then
					if l__Values__43.Locked.Value then
						v52[2] = { true, 0.15, l__Lock__49, Color3.fromRGB(24, 147, 255), Enum.KeyCode.G, l__Events__42.Toggle, { "Unlock", v40.Lock } };
					else
						v52[2] = { true, 0.15, l__Lock__49, Color3.new(1, 1, 1), Enum.KeyCode.G, l__Events__42.Toggle, { "Lock", v40.Lock } };
					end;
				elseif l__Lock__49 and l__Values__43.CanLock.Value and not l__Open__45.Value and v55 then
					v52[2] = { false, 0.15, l__Lock__49, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.G };
				elseif not v55 and not l__Open__45.Value and v40.DoorBase:FindFirstChild("KnockPos") then
					if not (not l__Values__43.Busy4.Value) or not (not l__Busy__46.Value) or not (not l__Busy2__47.Value) or l__Busy3__48.Value then
						v52[2] = { false, 0, v40.DoorBase.KnockPos, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.K };
					else
						v52[2] = { true, 0, v40.DoorBase.KnockPos, Color3.new(1, 1, 1), Enum.KeyCode.K, l__Events__42.Toggle, { "Knock", v41 } };
					end;
				end;
			else
				v52[1] = { false, 0, v41, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.E };
			end;
			local v56 = 0;
			if v52[1] then
				v56 = v56 + 1;
			end;
			if v52[2] then
				v56 = v56 + 1;
			end;
			if v52[3] then
				v56 = v56 + 1;
			end;
			return v52, v56;
		end;
	else
		CancelDo(u12.DoorCheck_knob);
		CancelDo(u12.DoorCheck_l);
		CancelDo(u12.DoorCheck_knockPos);
	end;
end;
function u12.ATMCheck()
	local v57 = v13.GetMP(u2, u6, u11);
	if v57 then
		if v57:FindFirstChild("posA") then
			if not v57 or not u13(u2.Position, v57, 4.5, { workspace.Map }, true, true) then
				CancelDo(u12.ATMCheck_atm);
				return;
			end;
			local v58 = u1:FindFirstChildOfClass("Tool");
			local v59 = not _G.CheckIfFlinching();
			if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
				v59 = false;
			end;
			local v60 = {};
			if u12.ATMCheck_atm and u12.ATMCheck_atm ~= v57 then
				CancelDo(u12.ATMCheck_atm);
			end;
			u12.ATMCheck_atm = v57;
			if v59 then
				v60[1] = { true, 0, v57.posA, Color3.new(1, 1, 1), Enum.KeyCode.E, l__Events2__8.ATM, { v57 } };
			else
				v60[1] = { false, 0, v57.posA, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.E };
			end;
			return v60, 1;
		end
	end
end;
local u14 = {
	toggle1 = nil, 
	toggle2 = nil
};
function u12.ShopCheck()
	local v61 = v13.GetMP(u2, u7, u11);
	if v61 then
		if v61:FindFirstChild("posA") then
			if not v61 or not u13(u2.Position, v61, 4.5, { workspace.Map }, true, true) then
				CancelDo(u12.ShopCheck_shop);
				return;
			end;
			local v62 = u1:FindFirstChildOfClass("Tool");
			local v63 = not _G.CheckIfFlinching();
			if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
				v63 = false;
			end;
			if v62 and v62:FindFirstChild("CantDrop") and v62.CantDrop.Value then
				v63 = false;
			end;
			local v64 = {};
			if u12.ShopCheck_shop ~= v61 then
				CancelDo(u12.ShopCheck_shop);
			end;
			u12.ShopCheck_shop = v61;
			if v63 then
				v64[1] = { true, 0, v61.posA, Color3.new(1, 1, 1), Enum.KeyCode.E, l__Events2__8.Shop, { v61 }, u14.toggle1 };
			else
				v64[1] = { false, 0, v61.posA, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.E };
			end;
			return v64, 1;
		end
	end
end;
function u12.ToolDropCheck()
	local v65 = {};
	for v66, v67 in pairs(workspace.Filter.SpawnedPiles:GetChildren()) do
		if v67.PrimaryPart then
			table.insert(v65, v67.PrimaryPart);
		end;
	end;
	local v68 = v13.GetDrops(u2, v65, u11, 3, -1);
	if not u2 or not u2.Parent then
		return;
	end;
	local v69 = nil;
	local v70 = nil;
	if v68 then
		local v71, v72 = u13(u2.Position, v68, 4, { workspace.Map.Parts, workspace.Map.Doors, workspace.Map.ATMz, workspace.Map.StreetLights, workspace.Filter.SpawnedPiles }, true, false);
		v69 = v71;
		v70 = v72;
		if not v69 then

		end;
	end;
	if not v68 or not v70 or not v69 and not ((v70 - v68.Position).Magnitude <= 0.1) then
		CancelDo(u12.ToolDropCheck_drop);
		return;
	end;
	local v73 = u1:FindFirstChildOfClass("Tool");
	local v74 = not _G.CheckIfFlinching();
	if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
		v74 = false;
	end;
	if u1:FindFirstChild("SpawnFF") then
		u1.SpawnFF:Destroy();
	end;
	local v75 = {};
	if u12.ToolDropCheck_drop ~= v68 then
		CancelDo(u12.ToolDropCheck_drop);
	end;
	u12.ToolDropCheck_drop = v68;
	if v74 then
		local v76 = {};
		local v77 = false;
		if v68.Position.Y + 1 < u2.Position.Y then
			v77 = false;
			if u3:GetState() ~= Enum.HumanoidStateType.Swimming then
				v77 = u3:GetState() ~= Enum.HumanoidStateType.Climbing;
				if not v77 then
					return
				end
			end;
		end;
		v76[1] = true;
		v76[2] = 3;
		v76[3] = v68;
		v76[4] = Color3.new(1, 1, 1);
		v76[5] = Enum.KeyCode.E;
		v76[6] = l__Events__7.PIC_PU;
		v76[7] = { v68 };
		v76[8] = _G.CheckIfCan(u1, "Left Arm") and u14.pickup1 or u14.pickup2;
		v76[9] = v77;
		v75[1] = v76;
	else
		v75[1] = { false, 3, v68, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.E };
	end;
	return v75, 1;
end;
function u12.CashDropCheck()
	local v78 = {};
	for v79, v80 in pairs(workspace.Filter.SpawnedBread:GetChildren()) do
		if v80:IsA("BasePart") and v80:FindFirstChild("Value") then
			table.insert(v78, v80);
		end;
	end;
	local v81 = v13.GetDrops(u2, v78, u11, 6, -1);
	if not u2 or not u2.Parent then
		return;
	end;
	local v82 = nil;
	local v83 = nil;
	if v81 then
		local v84, v85 = u13(u2.Position, v81, 6, { workspace.Map.Parts, workspace.Map.Doors, workspace.Map.ATMz, workspace.Map.StreetLights, workspace.Filter.SpawnedBread }, true, false);
		v82 = v84;
		v83 = v85;
		if not v82 then
			local v86, v87 = u13(u2.Parent.Head.Position, v81, 5, { workspace.Map.Parts, workspace.Map.Doors, workspace.Map.ATMz, workspace.Map.StreetLights, workspace.Filter.SpawnedBread }, true, false);
			v82 = v86;
			v83 = v87;
		end;
	end;
	if not v81 or not v83 or not v82 and not ((v83 - v81.Position).Magnitude <= 0.1) then
		CancelDo(u12.CashDropCheck_drop);
		return;
	end;
	local v88 = u1:FindFirstChildOfClass("Tool");
	local v89 = not _G.CheckIfFlinching();
	if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
		v89 = false;
	end;
	local v90 = {};
	if u1:FindFirstChild("SpawnFF") then
		u1.SpawnFF:Destroy();
	end;
	if v81.Parent ~= workspace.Filter.SpawnedBread then
		v81 = v81.Parent;
	end;
	if u12.CashDropCheck_drop ~= v81 then
		CancelDo(u12.CashDropCheck_drop);
	end;
	u12.CashDropCheck_drop = v81;
	if v89 then
		pcall(function()
			local v91 = {};
			local v92 = false;
			if v81.Position.Y + 1 < u2.Position.Y then
				v92 = false;
				if u3:GetState() ~= Enum.HumanoidStateType.Swimming then
					v92 = u3:GetState() ~= Enum.HumanoidStateType.Climbing;
					if not v92 then
						return
					end
				end;
			end;
			v91[1] = true;
			v91[2] = 1;
			v91[3] = v81;
			v91[4] = Color3.new(1, 1, 1);
			v91[5] = Enum.KeyCode.E;
			v91[6] = l__Events__7.CZDPZUS;
			v91[7] = { v81 };
			v91[8] = _G.CheckIfCan(u1, "Left Arm") and u14.pickup1 or u14.pickup2;
			v91[9] = v92;
			v90[1] = v91;
		end)
	else
		v90[1] = { false, 1, v81, Color3.new(0.5, 0.5, 0.5), Enum.KeyCode.E };
	end;
	return v90, 1;
end;
function u12.GetExtrasCheck()
	local v93 = {};
	local v94 = {};
	for v95, v96 in pairs(u8) do
		if v96[1] and v96[1].Parent and v96[1]:IsA("BasePart") then
			table.insert(v93, v96[1]);
			v94[v96[1]] = { v96[1], v96[2], v96[3], v96[4], v96[5], v96[6], v96[7] };
		end;
	end;
	local v97 = v13.GetDrops(u2, v93, u11, 5, 0);
	if not u2 or not u2.Parent then
		return;
	end;
	local v98 = nil;
	if v97 then
		local v99 = u13(u2.Position, v97, 6, v93, true, false);
		v98 = nil;
		if not v99 then
			local v100 = u13(u2.Parent.Head.Position, v97, 6, v93, true, false);
			v98 = nil;
		end;
	end;
	if not v97 or not u13 and not ((v98 - v97.Position).Magnitude <= 1.5) then
		CancelDo(u12.ExtraDrop_drop);
		return;
	end;
	local v101 = u1:FindFirstChildOfClass("Tool");
	local v102 = not _G.CheckIfFlinching();
	local v103 = v94[v97];
	if v103 then
		local v104 = v103[5];
		if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
			v102 = false;
		end;
		local v105 = {};
		if u12.ExtraDrop_drop ~= v97 then
			CancelDo(u12.ExtraDrop_drop);
		end;
		u12.ExtraDrop_drop = v97;
		local v106 = v103[4] and 0;
		if v103[6] then
			local v107 = v103[6]();
		end;
		if v102 then
			v105[1] = { true, v106, v97, Color3.new(1, 1, 1), v104, v103[2], v103[3], _G.CheckIfCan(u1, "Left Arm") and u14.pickup1 or u14.pickup2 };
		else
			v105[1] = { false, v106, v97, Color3.new(0.5, 0.5, 0.5), v104 };
		end;
		return v105, 1;
	end
end;
local u15 = {};
local l__CurrentCamera__16 = workspace.CurrentCamera;
local u17 = 1;
local function u18(p19)
	return string.sub(tostring(p19), 14, string.len(tostring(p19)));
end;
function Main()
	local v108, v109, v110 = pairs(v6);
	while true do
		local v111, v112 = v108(v109, v110);
		if v111 then

		else
			break;
		end;
		v110 = v111;
		v112.Parent = script;
		v112.Adornee = nil;	
	end;
	u15 = {};
	if not _G.ATM_Active then
		if not _G.Shop_Active then
			if not _G.CheckIfCan(u1, "Any") then
				return;
			end;
		else
			return;
		end;
	else
		return;
	end;
	if u4 then
		if not u4.Parent then
			u4 = _G.GVF();
		end;
	else
		u4 = _G.GVF();
	end;
	if not u4 then
		return;
	end;
	local v113, v114 = (function()
		local v115 = nil;
		local v116 = nil;
		local v117 = math.huge;
		local v118, v119, v120 = pairs({ u12.ATMCheck, u12.ShopCheck, u12.DoorCheck, u12.CashDropCheck, u12.ToolDropCheck, u12.GetExtrasCheck });
		while true do
			local v121, v122 = v118(v119, v120);
			if v121 then

			else
				break;
			end;
			v120 = v121;
			local v123, v124 = v122();
			if v123 then
				if v123[1] then
					pcall(function()
						local v125 = v123[1][3];
						local l__Magnitude__126 = ((v125:IsA("Attachment") and v125.WorldPosition or v125.Position) - u2.Position).Magnitude;
						v123[9] = v122;
						if l__Magnitude__126 < v117 then
							v115 = v123;
							v116 = v124;
							v117 = l__Magnitude__126;
						end;
					end)
				end;
			end;		
		end;
		return v115, v116;
	end)();
	local v127 = v113 and v113[9];
	if v113 then

	else
		u17 = 1;
		return;
	end;
	u17 = 2;
	local v128 = 1 - 1;
	while true do
		local v129 = v113[v128];
		if v129 then
			local v130 = v129[2];
			local v131 = v129[3];
			local v132 = v129[4];
			local v133 = v129[5];
			local v134 = v6[v128];
			local l__Label__135 = v134.Frame.Label;
			local l__Hold__136 = v134.Frame.Hold;
			v134.Parent = l__CurrentCamera__16;
			v134.Adornee = v131;
			l__Label__135.Text = u18(v133);
			l__Label__135.TextColor3 = v132;
			l__Hold__136.TextColor3 = v132;
			if v130 <= 0 then
				l__Hold__136.Visible = false;
				l__Label__135.Size = UDim2.new(1, 0, 1, 0);
				l__Label__135.Position = UDim2.new(0, 0, 0, 0);
			else
				l__Hold__136.Visible = true;
				l__Label__135.Size = UDim2.new(1, 0, 0.85, 0);
				l__Label__135.Position = UDim2.new(0, 0, 0.215, 0);
			end;
			v134.Enabled = true;
			if v129[1] then
				if v130 <= 0 then
					if 0 < v134.Frame.Bar.Size.X.Scale then
						v134.Frame.Bar:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0, true);
					end;
				end;
				u15[v133] = { v129[6], v130, v129[7], v131, v129[8], v134, v128, v127, v129[9] };
			else
				if 0 < v134.Frame.Bar.Size.X.Scale then
					v134.Frame.Bar:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0, true);
				end;
				u11[v131] = nil;
			end;
		end;
		if 0 <= 1 then
			if v128 < v114 then

			else
				break;
			end;
		elseif v114 < v128 then

		else
			break;
		end;
		v128 = v128 + 1;	
	end;
end;
local u19 = {};
local function u20(p20)
	local v137 = nil;
	local v138 = (function()
		local v139 = u3;
		if v139 then
			v139 = u3.Parent;
			if v139 then
				v139 = false;
				if u3.Health > 0 then
					v139 = u15[p20.KeyCode];
				end;
			end;
		end;
		return v139;
	end)();
	if not v138 then
		return;
	end;
	local u21 = v138[1];
	local u22 = v138[2];
	local u23 = v138[3];
	local u24 = v138[4];
	local u25 = v138[6];
	local u26 = v138[5];
	v137 = function()
		if u21 and u22 and u23 and u24 and u25 and not u19[u24] then
			(u26 or (function()
				if _G.CheckIfCan(u1, "Left Arm") then
					return u14.toggle2;
				end;
				return u14.toggle1;
			end)()):Play(0.1);
			if u21:IsA("RemoteEvent") then
				u21:FireServer(unpack(u23));
			elseif u21:IsA("BindableEvent") then
				u21:Fire(unpack(u23));
			end;
			u19[u24] = true;
			delay(0.25, function()
				pcall(function()
					u19[u24] = nil;
				end);
			end);
		end;
	end;
	if u22 <= 0 then
		v137();
		return;
	end;
	local v140 = math.random();
	u11[u24] = { v140, u25, p20.KeyCode };
	local u27 = nil;
	local u28 = nil;
	local u29 = v138[9];
	local u30 = tick();
	local u31 = true;
	local u32 = v138[8];
	local u33 = v138[7];
	local u34 = false;
	coroutine.wrap(function()
		if u22 and u22 > 0 then
			u27 = u14.grabbing1;
			if not _G.CheckIfCan(u1, "Left Arm") then
				u27 = u14.grabbing2;
			end;
			u27:Play(0.15);
			u28 = u29 and _G.AffectChar("FORCEC", u22 + 0.15);
			u25.Frame.Bar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, u22, true);
			while tick() - u30 < u22 and u11[u24] and u11[u24][1] == v140 do
				if _G.CheckIfFlinching(u1) then
					u31 = false;
					break;
				end;
				l__RunService__2.Heartbeat:Wait();			
			end;
		end;
		u14.grabbing1:Stop(0.15);
		if u31 and u24 and u24.Parent and u11[u24] and u11[u24][1] == v140 then
			local v141 = u32();
			if v141 and typeof(v141) == "table" and v141[u33] and v141[u33][1] == true and v141[u33][3] == u24 then
				u34 = true;
				CancelDo(u24);
				v137();
			end;
		end;
		CancelDo(p20.KeyCode);
		if u27 then
			local v142
			if u34 then
				v142 = 0.05;
			else
				v142 = 0.15;
			end;
			u27:Stop(v142);
		end;
		if not u34 and u28 and u28.Parent then
			u28:Destroy();
		end;
	end)();
end;
local l__LocalPlayer__35 = game.Players.LocalPlayer;
local u36 = v11;
function newChar()
	_G.WaitForChar();
	u1 = l__LocalPlayer__35.Character;
	if u1 then
		if not u1.Parent then
			return;
		end;
	else
		return;
	end;
	u3 = u1:WaitForChild("Humanoid");
	u2 = u1:WaitForChild("HumanoidRootPart");
	local function v143(p21)
		return u3:LoadAnimation(l__ReplicatedStorage__3.Storage.Animations[p21]);
	end;
	u14 = {
		toggle1 = v143("Toggle1"), 
		toggle2 = v143("Toggle2"), 
		pickup1 = v143("Pickup1"), 
		pickup2 = v143("Pickup2"), 
		grabbing1 = v143("Grabbing1"), 
		grabbing2 = v143("Grabbing2")
	};
	local u37 = true;
	local u38 = nil;
	u38 = u1.AncestryChanged:Connect(function(p22, p23)
		if not p23 then
			u37 = nil;
			u38:Disconnect();
		end;
	end);
	u17 = 1;
	u15 = {};
	u19 = {};
	while true do
		if u37 then

		else
			break;
		end;
		wait(0.05);
		Main();
		u36 = u2.Position;	
	end;
end;
SetUp();
l__LocalPlayer__35.CharacterAdded:Connect(newChar);
l__UserInputService__1.InputBegan:Connect(function(p24, p25)
	if p25 then
		return;
	end;
	pcall(Main);
	u20(p24);
end);
l__UserInputService__1.InputEnded:Connect(function(p26, p27)
	local l__KeyCode__144 = p26.KeyCode;
	for v145, v146 in pairs(u11) do
		if v146[3] == l__KeyCode__144 then
			CancelDo(v145);
			return;
		end;
	end;
end);
newChar();
