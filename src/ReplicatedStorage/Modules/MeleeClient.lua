-- Decompiled with the Synapse X Luau decompiler.

local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__CollectionService__2 = game:GetService("CollectionService");
local l__TweenService__3 = game:GetService("TweenService");
getfenv(0).script = nil;
local deb = false
local function u1(p1, p2)
	return p1:gsub(".", function(p3)
		return string.char(p3:byte() + p2);
	end);
end;
local function u2(p4, p5)
	local v4 = {};
	for v5, v6 in next, p4 do
		v4[u1(tostring(v5), p5)] = v6;
	end;
	return v4;
end;
local function u3(p6)
	local v7 = newproxy(true);
	local v8 = getmetatable(v7);
	v8.__index = p6;
	v8.__namecall = p6;
	function v8.__newindex()
		error("Attempt to modify a protected table.");
	end;
	v8.__metatable = "This table is protected.";
	return v7;
end;
local function v9(p7)
	local v10 = math.floor(math.random() * 100);
	local v11 = {};
	for v12, v13 in next, u2(p7, v10) do
		local v14 = u1(tostring(v12), -v10);
		v11[v14] = v13;
	end;
	return u3(v11);
end;
local l__Events__15 = l__ReplicatedStorage__1:WaitForChild("Events");
local l__Modules__16 = l__ReplicatedStorage__1:WaitForChild("Modules");
local v17 = require(l__Modules__16.Damage);
local v18 = require(l__Modules__16.Effects);
local v19 = {};
local l__MHXU2__20 = l__Events__15:WaitForChild("MHXU2");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__GuiService__5 = game:GetService("GuiService");
local l__FireServer__6 = l__MHXU2__20.FireServer;
local l__Players__9 = game:GetService("Players");
local u11 = require(l__Modules__16:WaitForChild("Config"));
local function u12(p8, p9, p10)
	if p9[1] == "Tool" then
		return p8:FindFirstChild(p9[2]);
	end;
	if p9[1] ~= "Char" or not p10 then
		return;
	end;
	return p10:FindFirstChild(p9[2]);
end;
local l__MeleeClient__13 = l__ReplicatedStorage__1.Storage.MeleeClient;
local l__RunService__14 = game:GetService("RunService");
local function u15(p11)
	if p11 then
		p11:Disconnect();
	end;
	p11 = nil;
end;
local u16 = require(l__Modules__16:WaitForChild("RCHB"));
local function u17(p12)
	if p12 and p12.Parent then
		p12:Destroy();
	end;
	p12 = nil;
end;
local u18 = require(l__Modules__16.FastWait);
local u19 = v19;
local u20 = v9({
	S1 = 38506, 
	S2 = 81919, 
	UserIdSalt = false
});
local l__Events2__21 = l__ReplicatedStorage__1:WaitForChild("Events2");
local function u22()
	if l__FireServer__6 == l__MHXU2__20.FireServer then
		return;
	end;
	pcall(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = math.random(30, 100);
	end);
	pcall(function()
		game.Players.LocalPlayer:Kick("lol nah");
	end);
	wait(1);
	while true do

	end;
end;
local l__MHXU__23 = l__Events__15:WaitForChild("MHXU");
local l____DASFXD__24 = l__Events__15:WaitForChild("__DASFXD");
local u25 = require(l__Modules__16:WaitForChild("GetCharName"));
local u26 = require(l__Modules__16:WaitForChild("RotatedRegion3"));
local function u27()
	if l__UserInputService__4.GamepadEnabled and l__GuiService__5:IsTenFootInterface() and not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.TouchEnabled then
		return "xbox";
	end;
	if l__UserInputService__4.TouchEnabled and not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.GamepadEnabled and not l__GuiService__5:IsTenFootInterface() then
		return "mobile";
	end;
	return "pc";
end;
function u19.new(p13)
	local l__LocalPlayer__21 = l__Players__9.LocalPlayer;
	local l__mouse__22 = l__LocalPlayer__21:GetMouse();
	local v23 = tick();
	while true do
		wait();
		if tick() - v23 > 4 then
			break;
		end;
		if _G.CrosshairModule ~= nil then
			break;
		end;	
	end;
	local v24 = {
		Tool = p13, 
		Equipped = false, 
		Equipping = false
	};
	local l__CurrentCamera__25 = workspace.CurrentCamera;
	local v26 = v9((u11:GetConfig(p13)));
	local l__Character__27 = l__LocalPlayer__21.Character;
	local l__Head__28 = l__Character__27:WaitForChild("Head");
	local l__HumanoidRootPart__29 = l__Character__27:WaitForChild("HumanoidRootPart");
	local l__Humanoid__30 = l__Character__27:WaitForChild("Humanoid");
	local v31 = u12(p13, v26.Handle, nil);
	local l__Values__32 = p13:WaitForChild("Values");
	local v33 = _G.GVF();
	v33:WaitForChild("Sprinting");
	local v34 = l__MeleeClient__13:WaitForChild("MeleeGUI"):Clone();
	local v35 = l__ReplicatedStorage__1:WaitForChild("Storage").GUIs.KeybindHintFrames.Melee:Clone();
	v35.Name = "BindsFrame";
	v35.Parent = v34;
	v34.Enabled = true;
	local l__AnimsFolder__28 = p13:WaitForChild("AnimsFolder");
	local function v36(p14, p15)
		if not l__AnimsFolder__28:FindFirstChild(p14) then
			local v37 = Instance.new("Animation");
			v37.AnimationId = "rbxassetid://0";
			game.Debris:AddItem(v37, 0);
			return l__Humanoid__30:LoadAnimation(v37);
		end;
		if not p15 then
			return l__Humanoid__30:LoadAnimation(l__AnimsFolder__28[p14]);
		end;
		local v38 = l__AnimsFolder__28[p14]:Clone();
		v38.Name = v38.Name .. "_Clone";
		v38.Parent = l__AnimsFolder__28;
		return l__Humanoid__30:LoadAnimation(v38);
	end;
	local v39 = {
		Equip = v36("Equip"), 
		Idle = v36("Idle"), 
		Slash1 = v36("Slash1"), 
		Slash2 = v36("Slash2"), 
		Slash3 = v36("Slash3"), 
		BlockStart = v36("BlockStart"), 
		BlockIdle = v36("BlockIdle"), 
		BlockHit = v36("BlockHit"), 
		Finish = v36("Finish"),
		Revive = v36("Revive")
	};
	local v40 = l__Humanoid__30:LoadAnimation(l__MeleeClient__13.climbting);
	v40.Priority = Enum.AnimationPriority.Action;
	table.insert(v39, v40);
	v39.Equip.Priority = Enum.AnimationPriority.Movement;
	v39.Idle.Priority = Enum.AnimationPriority.Idle;
	v39.Slash1.Priority = Enum.AnimationPriority.Action;
	v39.Slash2.Priority = Enum.AnimationPriority.Action;
	v39.Slash3.Priority = Enum.AnimationPriority.Action;
	v39.Finish.Priority = Enum.AnimationPriority.Action;
	v39.Slash1.Priority = Enum.AnimationPriority.Action;
	v39.Slash2.Priority = Enum.AnimationPriority.Action;
	v39.Slash3.Priority = Enum.AnimationPriority.Action;
	v39.BlockStart.Priority = Enum.AnimationPriority.Action;
	v39.BlockIdle.Priority = Enum.AnimationPriority.Movement;
	v39.BlockIdle.Looped = true;
	v39.BlockHit.Priority = Enum.AnimationPriority.Action;
	if _G.VM and _G.VM.Current and _G.VM.Current.Parent then
		for v41, v42 in pairs(l__AnimsFolder__28:GetChildren()) do
			coroutine.resume(coroutine.create(function()
				local v43 = _G.VM.Current:FindFirstChildOfClass("Humanoid"):LoadAnimation(v42);
				v43.Looped = false;
				v43:Play(0, 0.01, 10000);
				l__RunService__14.Heartbeat:Wait();
				v43:Stop();
				l__RunService__14.Heartbeat:Wait();
				v43:Stop();
				l__RunService__14.Heartbeat:Wait();
				v43:Stop();
			end));
		end;
	end;
	if v26.Customs.DoorKick then
		v39.DoorHit1 = v36("DoorHit");
		if l__AnimsFolder__28:FindFirstChild("DoorHit2") then
			v39.DoorHit2 = v36("DoorHit2");
		end;
	end;
	if v26.Customs.RegisterHit then
		v39.RegisterHit = v36("RegisterHit");
	end;
	local l__Slashing1__44 = l__Values__32:WaitForChild("Slashing1");
	local l__Event__45 = p13:WaitForChild("Event");
	local v46 = tick();
	local u29 = nil;
	local l__SlashDB__30 = l__Values__32:WaitForChild("SlashDB");
	local u31 = 0;
	local u32 = v24;
	local u33 = nil;
	local u34 = false;
	local function u35(p16)
		if l__Humanoid__30:GetState() == Enum.HumanoidStateType.Climbing then
			if not p16 then
				return;
			end;
		else
			v40:Stop(0.15);
			return;
		end;
		local v47 = math.random();
		u31 = v47;
		coroutine.resume(coroutine.create(function()
			p16.Stopped:Wait();
			if u31 == v47 then
				v40:Stop(0.15);
			end;
		end));
	end;
	local u36 = false;
	local u37 = nil;
	local u38 = nil;
	local u39 = nil;
	local u40 = nil;
	local u41 = 0;
	local u42 = 0;
	local u43 = false;
	local u44 = false;
	local u45 = false;
	local u46 = {};
	local l__Modules__47 = p13:FindFirstChild("Modules");
	local u48 = 0;
	local u49 = _G.CrosshairModule.new();
	local u50 = nil;
	local u51 = nil;
	local u52 = nil;
	local u53 = nil;
	local u54 = nil;
	local u55 = v26.Mains["S" .. 1];
	local function u56(p17)
		local l__Hitter__48 = p17.Hitter;
		if l__Hitter__48[1] == "Tool" then
			return p13:FindFirstChild(l__Hitter__48[2]);
		end;
		if l__Hitter__48[1] ~= "Char" then
			return;
		end;
		return l__Character__27:FindFirstChild(l__Hitter__48[2]);
	end;
	local function u57(p18)
		if u36 then
			return;
		end;
		if u37 and u37.Parent then
			u38 = u16:Deinitialize(u37);
		end;
		local v49 = (function(p19)
			if _G.VM and _G.VM.Check(p13) and p18 ~= nil then
				if p18.Hitter[1] == "Tool" and _G.VM.CloneTool:FindFirstChild(p19.Name) then
					return _G.VM.CloneTool:FindFirstChild(p19.Name);
				end;
				if p18.Hitter[1] == "Char" and _G.VM.Current:FindFirstChild(p19.Name) then
					return _G.VM.Current:FindFirstChild(p19.Name);
				end;
			end;
			return p19;
		end)(u39);
		if not v49 then
			u38 = nil;
			u37 = nil;
			return;
		end;
		u38 = u16:Initialize(v49);
		u37 = v49;
		if u38 then
			pcall(function()
				u40:Disconnect();
			end);
			u40 = u38.ONHE391:Connect(u32.HZ45598425);
		end;
		u41 = u42;
		u42 = math.random();
		return u38;
	end;
	local function u58()
		if u29 and not u43 and not u44 and not u45 and not u46.pickingUp and not v33.Currents:FindFirstChild("DU") then
			return true;
		end;
		if not u29 then
			return true;
		end;
		return false;
	end;
	local u59 = nil;
	local u60 = false;
	function u32.Equip()
		if u36 then
			return;
		end;
		if l__Modules__47 and l__Modules__47:FindFirstChild("Equip") then
			require(l__Modules__47.Equip)(p13.Parent, true);
		end;
		if not _G.CheckIfCan(l__Character__27) then
			return;
		end;
		l__UserInputService__4.MouseIconEnabled = false;
		u33 = true;
		v35.Block.Visible = v26.BlockSettings and v26.BlockSettings.Enabled;
		v35.Grab.Visible = v26.Customs and v26.Customs.Pickup;
		v35.Break.Visible = v26.Customs and (v26.Customs.DoorKick or v26.Customs.RegisterHit);
		v35.Revive.Visible = v26.Customs and v26.Customs.Revive;
		v35.Snowball.Visible = v26.Customs and v26.Customs.Snowball;
		v34.Parent = l__LocalPlayer__21.PlayerGui;
		l__Event__45:FireServer("Equip")
		u48 = math.random();
		if u49 then
			u49:connect();
			u49:setcrosssettings(4, 30, 0.9);
			u49:inactive();
		end;
		v39.Equip:Play(0.1, 1, v26.EquipAnimSpeed);
		u35(v39.Equip);
		if not (not v26.RunIdle) and not (not u34) or not u34 then
			v39.Idle:Play(0.1);
		end;
		if _G.AffectChar then
			if v26.SlowDown.Enabled then
				u50 = _G.AffectChar("SD", math.huge, math.random(), v26.SlowDown.Amount);
			end;
			if v26.JReduction then
				u51 = _G.AffectChar("JR", math.huge, math.random(), v26.JReduction);
			end;
			if v26.SlowDown.AntiSprint then
				u52 = _G.AffectChar("AS", math.huge);
			end;
		end;
		u53 = _G.AffectChar("B", v26.EquipTime);
		if v26.AntiJump and _G.AffectChar then
			u54 = _G.AffectChar("AJ", math.huge);
		end;
		l__mouse__22.TargetFilter = p13;
		if p13:FindFirstChild("Tool6D") then
			p13.Tool6D.Part0 = p13.Parent:WaitForChild("Right Arm");
			pcall(function()
				if v31 and v31.Name == "Handle" then
					u17(l__Character__27["Right Arm"]:WaitForChild("RightGrip"));
				end;
			end);
		elseif p13:FindFirstChild("Tool6D_Torso") then
			p13.Tool6D_Torso.Part0 = p13.Parent:WaitForChild("Torso");
			pcall(function()
				if v31 and v31.Name == "Handle" then
					l__Character__27["Right Arm"]:WaitForChild("RightGrip"):Destroy();
				end;
			end);
		end;
		u55 = v26.Mains.S1;
		pcall(function()
			u38:Deinitialize();
		end);
		u39 = u56(u55);
		u38 = u57(u55);
		_G.DoorOpenCheck = u58;
		if _G.VM then
			u59 = _G.VM.ChangeEvent.Event:Connect(function()
				pcall(function()
					u38:Deinitialize();
				end);
				u38 = u57(u55);
				if u60 then
					u38:HZISTARRT();
					u60 = true;
				end;
			end);
		end;
		u18(v26.EquipTime);
		if u48 == u48 then
			if u49 then
				u49:active();
			end;
			u29 = true;
		end;
	end;
	local u61 = nil;
	local u62 = nil;
	local u63 = 1;
	local u64 = false;
	local u65 = false;
	function u32.Unequip()
		if not u29 and not u33 then
			return;
		end;
		u48 = 0;
		u45 = false;
		l__UserInputService__4.MouseIconEnabled = true;
		for v50, v51 in pairs(v39) do
			v51:Stop(0.1);
		end;
		u32.BLOSTOOP(false);
		v40:Stop(0);
		v34.Parent = p13;
		u38 = u16:Deinitialize(u37);
		u60 = false;
		u15(u59);
		u15(nil);
		u15(nil);
		u17(u51);
		u17(u50);
		u17(u54);
		u17(u52);
		u17(nil);
		u17(u61);
		u17(u62);
		v40:Stop();
		u35(nil);
		u63 = 1;
		u64 = false;
		if u44 then
			u32.BLOSTOOP(false);
		end;
		if u65 then
			u32.CancelExecution();
		end;
		u33 = false;
		u29 = false;
		u32.CancelDoorKick(true);
		if u49 then
			u49:disconnect(true);
		end;
		u45 = false;
		u32.DEACCTIV();
	end;
	local u66 = false;
	local function u67(p20, p21)
		if _G.CheckIfFlinching ~= nil and _G.CheckIfFlinching(nil, p21) then
			return false;
		end;
		if not _G.CheckIfCan() then
			return false;
		end;
		if l__LocalPlayer__21.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
			return false;
		end;
		if not l__LocalPlayer__21.Character:FindFirstChild("Right Arm") or l__LocalPlayer__21.Character["Right Arm"]:FindFirstChild("Broken") then
			return;
		end;
		return true;
	end;
	local u68 = false;
	local u69 = false;
	local u70 = nil;
	local l__StaminaUsage__71 = v26.StaminaUsage;
	local u72 = 0;
	local u73 = 0;
	local u74 = false;
	local function u75()

	end;
	local u76 = 0;
	local u77 = nil;
	local u87 = nil;
	function u32.ACTIVTE()
		if deb then
			return
		end
		if u36 then
			return;
		end;
		u66 = true;
		if not u29 then
			return;
		end;
		if not u67(nil, true) then
			return;
		end;
		if l__SlashDB__30.Value then
			return;
		end;
		if u68 then
			return;
		end;
		if u44 then
			return;
		end;
		if u65 then
			return;
		end;
		if u43 then
			return;
		end;
		if u69 then
			return;
		end;
		if l__Humanoid__30.Sit then
			return;
		end;
		if v26.Customs.Revive and l__Values__32.Reviving.Value then
			return;
		end;
		u69 = true;
		u17(u70);
		local v52 = u56(v26.Mains["S" .. u63]);
		for v53 = 1, 2 do
			if not v52 or v52 and v52.Parent == l__Character__27 and v33.HealthValues:FindFirstChild(v52.Name) and (v33.HealthValues:FindFirstChild(v52.Name).Broken.Value or v33.HealthValues:FindFirstChild(v52.Name).Destroyed.Value) then
				u63 = u63 + 1;
				if v26.SlashStages < u63 then
					u63 = 1;
				end;
				v52 = u56(v26.Mains["S" .. u63]);
			end;
		end;
		if not _G.S_Check(u19.gc(u20.S1), l__StaminaUsage__71, true) then
			l__Events2__21.CantStamina:Fire();
			u69 = false;
			u87 = false
			return;
		end;
		local v54 = tick();
		u72 = tick();
		u22();
		local v55 = l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "GBFD9239", "Normal", u63);
		if v55 and tick() - v54 < 3 then
			_G.S_Take(u19.gc(u20.S1), l__StaminaUsage__71);
			if u29 then
				u72 = tick();
				u45 = true;
				u73 = v55;
				u74 = false;
				v39.BlockHit:Stop(0);
				v39.BlockIdle:Stop(0);
				v39.BlockStart:Stop(0);
				if u49 then
					u49.crossspring:Accelerate(200);
				end;
				spawn(u75);
				u55 = v26.Mains["S" .. u63];
				local v56 = math.random();
				u76 = v56;
				if u77 then
					u77:Stop(0);
				end;
				v39.Finish:Stop(0);
				local v57 = v39["Slash" .. u63];
				v57:Play(nil, 1, u55.AnimSpeed);
				l__Event__45:FireServer("SwingSound", u63)
				v57.Priority = l__Humanoid__30:GetState() == Enum.HumanoidStateType.Climbing and Enum.AnimationPriority.Movement or Enum.AnimationPriority.Action;
				u77 = v57;
				u35(v57);
				u64 = u63 > 1;
				u63 = u63 + 1;
				if v26.SlashStages < u63 then
					u63 = 1;
				end;
				pcall(function()
					u38:Deinitialize();
				end);
				u39 = u56(u55);
				u38 = u57(u55);
				if u49 then
					u49:bar(u55.DebounceTime);
				end;
				if _G.AffectChar then
					u17(u61);
					u17(u62);
					if v26.AttackSlowDown.Enabled then
						u61 = _G.AffectChar("SD", u55.SwingTime + u55.SwingWait, math.random(), v26.AttackSlowDown.Amount);
					end;
					if v26.AttackSlowDown.AntiSprint then
						u62 = _G.AffectChar("AS", u55.SwingTime + u55.SwingWait);
					end;
				end;
				local v58 = u55.SwingTime + u55.SwingWait;
				if v58 < u55.DebounceTime then
					v58 = u55.DebounceTime;
				end;
				_G.AffectChar("NRG", v58 * 0.5);
				u18(u55.SwingWait);
				if l__Slashing1__44.Value and u45 then
					u38:HZISTARRT();
					u60 = true;
					u18(u55.SwingTime);
					if not u74 then
						u17(u70);
						u70 = _G.AffectChar("SD", math.min(u55.DebounceTime - (u55.SwingTime + u55.SwingWait), 0.65), "SD2", 10);
					end;
					if u76 == v56 then
						u45 = false;
						u74 = false;
						if u38 then
							u60 = false;
							u38:HZISTOOP();
							u40:Disconnect();
						end;
					end;
				end;
				coroutine.wrap(function()
					u18(u55.DebounceTime + u55.ComboEndTime);
					if u55 and u55.ComboEndTime and u76 == v56 then
						u63 = 1;
						u64 = false;
					end;
				end)();
			end;
		end;
		u69 = false;
		u87 = false
	end;
	function u32.ExecuteHandler()
		if u65 then
			u32.CancelExecution();
			return;
		end;
		u32.Execute();
	end;
	local u78 = v26.ExecuteSettings and v26.ExecuteSettings.StaminaUsage;
	local u79 = 0;
	local u80 = nil;
	local u81 = nil;
	local u82 = nil;
	local u83 = nil;
	local u84 = nil;
	local u85 = nil;
	local u86 = false;
	function u32.Execute()
		if deb then
			return
		end
		if u36 then
			return;
		end;
		if not u29 then
			return;
		end;
		if not v26.ExecuteSettings.Enabled then
			return;
		end;
		if not u67() then
			return;
		end;
		if l__SlashDB__30.Value then
			return;
		end;
		if u68 then
			return;
		end;
		if u44 then
			return;
		end;
		if u65 then
			return;
		end;
		if u43 then
			return;
		end;
		if u45 then
			return;
		end;
		if not _G.DownedCheck then
			return;
		end;
		if u69 then
			return;
		end;
		if l__Humanoid__30:GetState() == Enum.HumanoidStateType.Climbing then
			return;
		end;
		if v26.Customs.Revive and l__Values__32.Reviving.Value then
			return;
		end;
		if not (function()
				for v59, v60 in pairs(workspace:FindPartsInRegion3WithWhiteList(Region3.new(l__HumanoidRootPart__29.Position - Vector3.new(3, 3, 3), l__HumanoidRootPart__29.Position + Vector3.new(3, 2, 3)), { workspace.Characters }, math.huge)) do
					local l__Parent__61 = v60.Parent;
					if l__Parent__61 ~= l__Character__27 and v60.Name == "Torso" and l__Parent__61:FindFirstChildOfClass("Humanoid") and (l__Parent__61:FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and _G.DownedCheck(l__Parent__61) and _G.GVF(l__Parent__61.Name) and _G.GVF(l__Parent__61.Name).Grabbed.Value == false) then
						return true;
					end;
				end;
				return false;
			end)() then
			return;
		end;
		if not _G.S_Check(u19.gc(u20.S1), u78, true) then
			l__Events2__21.CantStamina:Fire();
			return;
		end;
		u22();
		local v62 = l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "EXEVUZA");
		if v62 and tick() - tick() < 2 then
			_G.S_Take(u19.gc(u20.S1), u78);
			u65 = true;
			u43 = true;
			u73 = v62;
			v39.BlockHit:Stop(0);
			v39.BlockIdle:Stop(0);
			v39.BlockStart:Stop(0);
			u55 = v26.Mains.E;
			local v63 = tick();
			v39.Finish:Play(0.15, 1, u55.AnimSpeed);
			local v64 = math.random();
			u79 = v64;
			u80 = _G.AffectChar("SD", u55.DebounceTime, math.random(), 14);
			u81 = _G.AffectChar("B", u55.DebounceTime);
			u82 = _G.AffectChar("ADT", u55.DebounceTime);
			u83 = _G.AffectChar("AS", u55.DebounceTime);
			u84 = _G.AffectChar("AJ", u55.DebounceTime or 0.1);
			u85 = _G.AffectChar("AC", u55.DebounceTime);
			if u49 then
				u49:bar(u55.DebounceTime);
			end;
			u86 = true;
			delay(0.25, function()
				u86 = false;
			end);
			if u55.Hitter[2] == "Right Leg" then
				_G.AffectChar("RLEG", u55.DebounceTime);
			end;
			local v65 = u55.SwingWait;
			local v66 = u55.SwingTime;
			if u41 ~= u42 then
				v65 = v65 - 0.1;
				v66 = v66 + 0.1;
			end;
			pcall(function()
				u38:Deinitialize();
			end);
			u39 = u56(u55);
			u38 = u57(u55);
			local v67 = u55.SwingTime + u55.SwingWait;
			if v67 < u55.DebounceTime then
				v67 = u55.DebounceTime;
			end;
			_G.AffectChar("NRG", v67 * 0.5);
			coroutine.wrap(function()
				u18(v65);
				if u79 == v64 then
					u38:HZISTARRT();
					u60 = true;
					local v68 = tick();
					delay(v66, function()
						if u79 == v64 then
							u65 = false;
							u38:HZISTOOP();
							u40:Disconnect();
							u60 = false;
							u38 = nil;
						end;
					end);
					return;
				end;
				if u38 then
					u38:HZISTOOP();
					u40:Disconnect();
					u60 = false;
					u38 = nil;
				end;
			end)();
			coroutine.wrap(function()
				u18(u55.DebounceTime);
				if u79 == v64 then
					u43 = false;
					u65 = false;
				end;
			end)();
		end;
	end;
	function u32.CancelExecution(p22)
		if not u65 then
			return;
		end;
		u65 = false;
		u17(u85);
		delay(1, function()
			u17(u80);
			u17(u81);
			u17(u82);
			u17(u83);
			u17(u84);
		end);
		v39.Finish:Stop(0.2);
		u79 = 0;
		for v69, v70 in pairs((l__Humanoid__30:GetPlayingAnimationTracks())) do
			if v70.Name == "Animation" or v70.Name == "Animation2" then
				v70:Stop(0.2);
			end;
		end;
		if u38 then
			u38:HZISTOOP();
			u40:Disconnect();
			u60 = false;
		end;
		u22();
		l__MHXU2__20:FireServer(u19.gc(u20.S2), p13, "EXEVUZA2");
		delay(1, function()
			u43 = false;
			u65 = false;
		end);
	end;
	local u88 = {};
	function u32.HZ45598425(p23, ...)
		if u87 then
			return;
		end;
		local v71 = v26.MultipleHits and v26.MultipleHits.Enabled;
		if v71 and u88[p23.Parent] and tick() - u88[p23.Parent] < v26.MultipleHits.DB then
			return;
		end;
		if not v71 then
			u87 = true;
		end;
		if v71 then
			u88[p23.Parent] = tick();
			coroutine.wrap(function()
				u18(v26.MultipleHits.DB);
				u88[p23.Parent] = nil;
			end)();
		end;
		u22();
		if l__HumanoidRootPart__29.Velocity.Magnitude > 10 and _G.lastFall and _G.lastClimb then
			if not (tick() - _G.lastFall > 0.15) or not (tick() - _G.lastFall < 0.5) then
				if tick() - _G.lastClimb > 0.1 and tick() - _G.lastClimb < 1 and p23 and (p23.Parent:FindFirstChildOfClass("Humanoid") and _G.CheckIfCan(p23.Parent)) and (p23.Parent:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Climbing and p23.Position.Y < l__HumanoidRootPart__29.Position.Y) then
					_G.RagdollChar(1);
					l____DASFXD__24:FireServer("RZXCKIRLL");
					return;
				end;
			elseif p23 and (p23.Parent:FindFirstChildOfClass("Humanoid") and _G.CheckIfCan(p23.Parent)) and (p23.Parent:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Climbing and p23.Position.Y < l__HumanoidRootPart__29.Position.Y) then
				_G.RagdollChar(1);
				l____DASFXD__24:FireServer("RZXCKIRLL");
				return;
			end;
		end;
		local ic = 1
		if u63 == 2 then
			ic = 1
		elseif u63 == 3 then
			ic = 2
		elseif u63 == 1 then
			ic = 3
		end
		l__MHXU2__20:FireServer(u19.gc(u20.S2), p13, "2389ZFX33", u73, u64, u39, p23, ic, ...);
	end;
	function u32.DEACCTIV()
		u66 = false;
	end;
	local u89 = false;
	local function u90()
		l__RunService__14.Stepped:Wait();
		return _G.DoorLockCheck and _G.DoorLockCheck() or false;
	end;
	local u91 = 0;
	local u92 = nil;
	local u93 = false;
	function u32.BLOSTAR()
		if deb then
			return
		end
		if not u29 then
			return;
		end;
		if not u67(nil, true) then
			return;
		end;
		if u89 then
			return;
		end;
		if u65 then
			return;
		end;
		if u43 then
			return;
		end;
		if u90() then
			return;
		end;
		if l__SlashDB__30.Value then
			return;
		end;
		if u69 then
			return;
		end;
		if u45 then
			return;
		end;
		if v26.Customs.Revive and l__Values__32.Reviving.Value then
			return;
		end;
		if not _G.S_Check(u19.gc(u20.S1), v26.BlockSettings.StaminaUsage, true) then
			l__Events2__21.CantStamina:Fire();
			return;
		end;
		u69 = true;
		u22();
		if l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "BLSTAZ1") and not u89 then
			u44 = true;
			if not u29 then
				u18(0);
				u32.BLOSTOOP();
				return;
			end;
			u91 = tick();
			u89 = true;
			v39.BlockIdle:Play();
			v39.BlockStart:Play();
			u17(u92);
			u17(u83);
			u17(u84);
			if v26.BlockSettings.SlowDown > 0 then
				u92 = _G.AffectChar("SD", math.huge, p13.Name .. "Block", v26.BlockSettings.SlowDown);
			end;
			if not v26.BlockSettings.CanCharge then
				u83 = _G.AffectChar("AS", math.huge);
			else
				u52.Parent = nil;
			end;
			u84 = _G.AffectChar("AJ", math.huge);
			coroutine.resume((coroutine.create(function()
				local u94 = nil;
				u94 = l__RunService__14.Heartbeat:Connect(function(p24)
					if u29 and u67(nil, true) and ((u93 or tick() - u91 < 0.5) and not u36 and u44) and _G.S_Check(u19.gc(u20.S1), v26.BlockSettings.StaminaUsage) then
						_G.S_Take(u19.gc(u20.S1), v26.BlockSettings.StaminaUsage * 125 * p24);
						return;
					end;
					u94:Disconnect();
					if u29 and not u36 then
						u32.BLOSTOOP(false);
					end;
				end);
			end)));
		end;
		u69 = false;
	end;
	function u32.BLOSTOOP(p25)
		if u44 then
			u89 = true;
			u68 = true;
			v39.BlockStart:Stop(0.15);
			v39.BlockIdle:Stop(0.15);
			if p25 then

			end;
			if u52 then
				u52.Parent = v33.Currents;
			end;
			u17(u92);
			u17(u83);
			u17(u84);
			if not p25 then
				u22();
				l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "BZLZSTO2");
			else
				_G.S_Take(u19.gc(u20.S1), v26.BlockSettings.HitStaminaUsage or -10);
			end;
			coroutine.wrap(function()
				u18(v26.BlockSettings.DebounceTime or 1);
				u89 = false;
			end)();
			u44 = false;
			u68 = false;
		end;
	end;
	function u32.BlockHit()
		v39.BlockHit:Play();
		_G.S_Take(u19.gc(u20.S1), v26.BlockSettings.HitStaminaUsage or -10);
	end;
	function u32.Grab(p26)
		if not v26.Customs.Pickup then
			return;
		end;
		if u36 then
			return;
		end;
		if not u29 then
			return;
		end;
		if p26 == "S1" then
			if not u67() then
				return;
			end;
			if l__SlashDB__30.Value then
				return;
			end;
			if u68 then
				return;
			end;
			if u44 then
				return;
			end;
			if u65 then
				return;
			end;
			if u43 then
				return;
			end;
			if not _G.DownedCheck then
				return;
			end;
			if not (function()
					for v72, v73 in pairs(workspace:FindPartsInRegion3(Region3.new(l__HumanoidRootPart__29.Position - Vector3.new(2, 3, 2), l__HumanoidRootPart__29.Position + Vector3.new(2, 2, 2)), nil, math.huge)) do
						local l__Parent__74 = v73.Parent;
						if l__Parent__74 ~= l__Character__27 and v73.Name == "Torso" and l__Parent__74:FindFirstChildOfClass("Humanoid") and (l__Parent__74:FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and _G.DownedCheck(l__Parent__74) and _G.GVF(l__Parent__74.Name) and _G.GVF(l__Parent__74.Name).Grabbed.Value == false) then
							return true;
						end;
					end;
					return false;
				end)() then
				return;
			end;
			if not _G.S_Check(u19.gc(u20.S1), v26.Customs.Pickup.GrabStaminaUsage, true) then
				l__Events2__21.CantStamina:Fire();
				return;
			end;
			u22();
			if l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "PPZXKU1") then
				v39.Idle:Stop(0.5);
				_G.S_Take(u19.gc(u20.S1), v26.Customs.Pickup.GrabStaminaUsage);
				u46.pickingUp = true;
				u18(0.5);
				u46.pickingUp = false;
				return;
			end;
		else
			if p26 == "S2" and l__Values__32.Grabbing.Value then
				if u29 then
					v39.Idle:Play(0.5);
				end;
				u22();
				l__MHXU2__20:FireServer(u19.gc(u20.S2), p13, "PPZXKU2");
				return;
			end;
			if p26 == "T" and l__Values__32.Grabbing.Value then
				if _G.S_Check(u19.gc(u20.S1), v26.Customs.Pickup.ThrowStaminaUsage) then
					u22();
					if u29 then
						v39.Idle:Play(0.5);
					end;
					l__MHXU2__20:FireServer(u19.gc(u20.S2), p13, "PPZXKU3");
					return;
				else
					l__Events2__21.CantStamina:Fire();
				end;
			end;
		end;
	end;
	local u95 = false;
	function u32.Revive()
		if deb then
			return
		end
		if not v26.Customs.Revive then
			return;
		end;
		if u36 then
			return;
		end;
		if not u29 then
			return;
		end;
		if v26.Customs.Revive and l__Values__32.Reviving.Value then
			return;
		end;
		if not u67() then
			return;
		end;
		if l__SlashDB__30.Value then
			return;
		end;
		if u68 then
			return;
		end;
		if u44 then
			return;
		end;
		if u65 then
			return;
		end;
		if u43 then
			return;
		end;
		if u69 then
			return;
		end;
		local v75 = (function()
			for v76, v77 in pairs(workspace:FindPartsInRegion3(Region3.new(l__HumanoidRootPart__29.Position - Vector3.new(2, 3, 2), l__HumanoidRootPart__29.Position + Vector3.new(2, 2, 2)), nil, math.huge)) do
				local l__Parent__78 = v77.Parent;
				if l__Parent__78 ~= l__Character__27 and v77.Name == "Torso" and l__Parent__78:FindFirstChildOfClass("Humanoid") and (l__Parent__78:FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and _G.DownedCheck(l__Parent__78) and _G.GVF(l__Parent__78.Name) and _G.GVF(l__Parent__78.Name).Grabbed.Value == false) and (not _G.GVF(l__Parent__78.Name).Currents:FindFirstChild("Reviving") and not _G.LimbCheck(l__Parent__78, "Head", "Broken")) then
					return l__Parent__78;
				end;
			end;
			return false;
		end)();
		if not v75 then
			return;
		end;
		u22();
		local v79, v80 = l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "REV1");
		if v79 then
			local l__HumanoidRootPart__81 = v75:FindFirstChild("HumanoidRootPart");
			local v82 = l__ReplicatedStorage__1.Storage.GUIs:WaitForChild("GBarGUI"):Clone();
			v82.Frame.Msg.Text = "Reviving: " .. l__MeleeClient__13.RichT1.Value .. u25(v75) .. l__MeleeClient__13.RichT2.Value;
			v82.Parent = l__LocalPlayer__21.PlayerGui;
			v82.Enabled = true;
			u46.ReviveGUI = v82;
			v82:WaitForChild("Frame"):WaitForChild("Bar").InnerBar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, v80, true);
			v39.Revive:Play(nil, nil, v26.Customs.Revive.AnimSpeed)
			while l__Values__32.Reviving.Value and u29 and l__Character__27.Humanoid.Health > 0 and u46.ReviveGUI do
				if not u95 then
					l__MHXU2__20:FireServer(u19.gc(u20.S2), p13, "REV2");
					break;
				end;
				u18(0);			
			end;
			u32.StopRevive();
			v39.Revive:Stop(0.1)
		end;
	end;
	function u32.StopRevive()
		if not v26.Customs.Revive then
			return;
		end;
		if u36 then
			return;
		end;
		if u46.ReviveGUI and u46.ReviveGUI.Parent then
			u46.ReviveGUI:Destroy();
		end;
		u46.ReviveGUI = nil;
	end;
	local u96 = nil;
	local u97 = nil;
	local u98 = nil;
	local u99 = nil;
	local u100 = nil;
	function u32.DoorKick()
		if deb then
			return
		end
		if not v26.Customs.DoorKick and not v26.Customs.RegisterHit then
			return;
		end;
		if not u29 then
			return;
		end;
		if not u67() then
			return;
		end;
		if u44 then
			return;
		end;
		if u68 then
			return;
		end;
		if u65 then
			return;
		end;
		if u43 then
			return;
		end;
		if l__SlashDB__30.Value then
			return;
		end;
		local u101 = { workspace.Filter, workspace.Debris, workspace.CurrentCamera, l__Character__27, p13 };
		local function u102(p27, p28, p29)
			local v83, v84 = workspace:FindPartOnRayWithWhitelist(Ray.new(p27, (p28.Position - p27).Unit * 6.5), { p29 }, true);
			return v83 and v83 == p28;
		end;
		local function u103()
			if not v26.Customs.DoorKick then
				return;
			end;
			local v85, v86, v87 = workspace:FindPartOnRayWithIgnoreList(Ray.new(l__HumanoidRootPart__29.Position, (l__HumanoidRootPart__29.Position + l__HumanoidRootPart__29.CFrame.LookVector * 100 - l__HumanoidRootPart__29.Position).Unit * v26.Customs.DoorKick.Range), u101, false, true);
			if v85 then
				if v85:IsDescendantOf(workspace.Characters) and v85.Name ~= "Torso" then
					table.insert(u101, v85);
					return u103();
				end;
				if v85:IsDescendantOf(workspace.Map.Doors) and v26.Customs.DoorKick then
					local l__Parent__88 = v85.Parent;
					if not v85.Parent:FindFirstChild("DFrame") then
						table.insert(u101, v85);
						return u103();
					end;
					local v89 = false;
					if l__Parent__88.Values.Type.Value ~= "Wood" then
						v89 = v26.Customs.DoorKick.WoodOnly;
					end;
					if v89 then
						return;
					end;
					if l__Parent__88.Values.Broken.Value == false and l__Parent__88.Values.Locked.Value == true and u102(l__HumanoidRootPart__29.Position, l__Parent__88.Knob2, l__Parent__88) then
						return { l__Parent__88, "Door" };
					end;
				end;
			end;
		end;
		local v90 = u103() or (function()
			if not v26.Customs.RegisterHit then
				return;
			end;
			local v91 = {};
			for v92, v93 in pairs((u26.new(l__HumanoidRootPart__29.CFrame + l__HumanoidRootPart__29.CFrame.LookVector, (Vector3.new(1, 1, v26.Customs.RegisterHit.Range + 1))):FindPartsInRegion3WithWhiteList({ workspace.Map.BredMakurz }, 100))) do
				if v93.Name == "MainPart" and v93.CFrame:toObjectSpace(l__HumanoidRootPart__29.CFrame).p.Z < 0 and (u102(l__HumanoidRootPart__29.Position, v93, v93.Parent) or u102(l__Head__28.Position, v93, v93.Parent)) then
					table.insert(v91, v93);
				end;
			end;
			if not (#v91 > 0) then
				return;
			end;
			local v94 = nil;
			local v95 = math.huge;
			for v96, v97 in pairs(v91) do
				local l__Magnitude__98 = (v97.Position - l__HumanoidRootPart__29.Position).Magnitude;
				if l__Magnitude__98 < v95 then
					v95 = l__Magnitude__98;
					v94 = v97;
				end;
			end;
			return { v94.Parent, "Register" };
		end)();
		local v99 = v90 and v90[1];
		if not v99 then
			return;
		end;
		local v100 = v90 and v90[2];
		u55 = v100 == "Door" and v26.Customs.DoorKick or v26.Customs.RegisterHit;
		if not _G.S_Check(u19.gc(u20.S1), u55.StaminaUsage, true) then
			l__Events2__21.CantStamina:Fire();
			return;
		end;
		_G.AffectChar("DU", 0);
		u22();
		local v101 = l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "DZDRRRKI", v99, v100);
		u46.doorKicking = true;
		if v101 then
			u46.doorKickCode = math.random();
			u46.doorKickType = v100;
			local v102 = nil;
			if v100 == "Door" then
				v102 = v99.DoorBase;
				if v99.Values.DoubleDoors.Value then
					v102 = v99.DFrame;
				end;
			elseif v100 == "Register" then
				v102 = v99.MainPart;
			end;
			if v102 then
				local v103 = Vector3.new(v102.Position.X, l__HumanoidRootPart__29.Position.Y, v102.Position.Z);
				local v104 = CFrame.new(l__HumanoidRootPart__29.Position, v103);
				local v105 = nil
				if v99 then
					v105 = v99:FindFirstChild("RangeAdd") and v99.RangeAdd.Value or 0;
				else
					v105 = 0;
				end;
				local l__CFrame__104 = l__HumanoidRootPart__29.CFrame;
				local u105 = v104 + v104.LookVector * -(u55.Range + v105 - 1 - (v103 - l__HumanoidRootPart__29.Position).Magnitude);
				coroutine.wrap(function()
					for v106 = 0, 1, 0.1 do
						local v107 = l__CFrame__104:lerp(u105, v106);
						if not l__HumanoidRootPart__29.Parent then
							break;
						end;
						if (l__HumanoidRootPart__29.Position - v107.p).Magnitude > 7.5 then
							break;
						end;
						if not _G.CheckIfCan(l__Character__27) then
							break;
						end;
						if not u46.doorKicking then
							break;
						end;
						if not u33 then
							break;
						end;
						l__HumanoidRootPart__29.CFrame = v107;
						u18(0);
					end;
				end)();
			end;
			_G.S_Take(u19.gc(u20.S1), u55.StaminaUsage);
			u96 = _G.AffectChar("CM", u55.DebounceTime * 1.15, "Kick", 20);
			u97 = _G.AffectChar("AJ", u55.DebounceTime * 1.15);
			u98 = _G.AffectChar("B", u55.DebounceTime);
			u99 = _G.AffectChar("AS", u55.DebounceTime);
			u100 = _G.AffectChar("DU", u55.DebounceTime);
			if u49 then
				u49:bar(u55.DebounceTime);
			end;
			if u55.Hitter[2] == "Right Leg" then
				_G.AffectChar("RLEG", u55.DebounceTime);
			end;
			u73 = v101;
			local v108 = u55.SwingTime + u55.SwingWait;
			if v108 < u55.DebounceTime then
				v108 = u55.DebounceTime;
			end;
			_G.AffectChar("NRG", v108 * 0.5);
			if v100 == "Door" then
				local v109 = false;
				if v100 == "Door" then
					v109 = v99.Values.IsInverted.Value;
				end;
				local v110 = nil
				if v109 then
					v110 = v39.DoorHit2 ~= nil and v39.DoorHit2 or v39.DoorHit1;
				else
					v110 = v39.DoorHit1;
				end;
				v110:Play(0.1, 1, u55.AnimSpeed or 1);
			else
				v39.RegisterHit:Play();
			end;
			u39 = u56(u55);
			u38 = u57(u55);
			coroutine.wrap(function()
				u18(u55.SwingWait);
				if u38 then
					u38:HZISTARRT();
					u60 = true;
				end;
				u18(u55.SwingTime);
				if u38 then
					u38:HZISTOOP();
					u40:Disconnect();
					u60 = false;
					u38 = nil;
				end;
			end)();
			u18(u55.DebounceTime);
		end;
		u46.doorKicking = false;
		u87 = false
	end;
	function u32.CancelDoorKick(p30)
		if not u46.doorKicking then
			return;
		end;
		if not p30 and u38 == nil then
			return;
		end;
		u46.doorKickCode = 0;
		if u46.doorKickType == "Door" then
			v39.DoorHit1:Stop(0.35);
			if v39.DoorHit2 ~= nil then
				v39.DoorHit2:Stop(0.35);
			end;
		else
			v39.RegisterHit:Stop(0.35);
		end;
		delay(1, function()
			u17(u96);
			u17(u97);
			u17(u98);
			u17(u99);
			u17(u100);
		end);
		if u38 then
			u38:HZISTOOP();
			u40:Disconnect();
			u60 = false;
			u38 = nil;
		end;
		u46.doorKicking = false;
	end;
	function u32.SnowballCheck()
		if not v26.Customs.Snowball then
			return;
		end;
		if u36 then
			return;
		end;
		if not u29 then
			return;
		end;
		if not u67() then
			return;
		end;
		if l__SlashDB__30.Value then
			return;
		end;
		if u68 then
			return;
		end;
		if u44 then
			return;
		end;
		if u65 then
			return;
		end;
		if u43 then
			return;
		end;
		local v111, v112, v113 = (function()
			local v114 = l__HumanoidRootPart__29.Position + Vector3.new(0, 1, 0);
			return workspace:FindPartOnRayWithWhitelist(Ray.new(v114, (l__HumanoidRootPart__29.Position - Vector3.new(0, 10, 0) - v114) * 4), { workspace.Filter.Snow, workspace.Map.Parts }, true);
		end)();
		if not v111 or v111 and v111:IsDescendantOf(workspace.Filter.Snow) and v111.Size.X < 5 and v111.Size.Z < 5 then
			return;
		end;
		if not _G.S_Check(u19.gc(u20.S1), v26.Customs.Snowball.StaminaUsage, true) then
			l__Events2__21.CantStamina:Fire();
			return;
		end;
		if l__MHXU__23:InvokeServer(u19.gc(u20.S2), p13, "SNNBZAA", v111) then
			_G.S_Take(u19.gc(u20.S1), v26.Customs.Snowball.StaminaUsage);
			u43 = true;
			wait(2);
			u43 = false;
		end;
	end;
	function u32.Disconnect()
		u36 = true;
		u32.Unequip();
		v40:Stop(0);
		u32.BLOSTOOP(false);
		u32.CancelExecution();
		u32.ACTIVTE();
		if u49 then
			u49:disconnect(true);
		end;
		u63 = 1;
		u64 = false;
		u17(u51);
		u17(u50);
		u17(u80);
		u17(u92);
		u17(u61);
		u17(u70);
		u17(u54);
		u17(nil);
		u17(u85);
		u17(u84);
		u17(u81);
		u17(u82);
		u17(u53);
		for v115, v116 in pairs(v39) do
			v116:Stop(0);
		end;
		return true;
	end;
	local u106 = false;
	local u107 = false;
	l__UserInputService__4.InputBegan:Connect(function(p31, p32)
		if p32 then
			return;
		end;
		if not u29 then
			return;
		end;
		if (p31.KeyCode == Enum.KeyCode.F or p31.KeyCode == Enum.KeyCode.ButtonX) and not u86 then
			u32.ExecuteHandler();
			if u46.doorKicking then
				return;
			else
				u32.DoorKick();
				return;
			end;
		end;
		if p31.KeyCode == Enum.KeyCode.Q or p31.KeyCode == Enum.KeyCode.ButtonL2 then
			u93 = true;
			u32.BLOSTAR();
			return;
		end;
		if (p31.KeyCode == Enum.KeyCode.X or p31.KeyCode == Enum.KeyCode.ButtonY) and v26.Customs.Pickup then
			u106 = tick();
			if l__Values__32.Grabbing.Value then
				u107 = true;
				delay(0.5, function()
					if l__Values__32.Grabbing.Value and tick() - u106 >= 0.49 then
						u32.Grab("T");
					end;
				end);
				return;
			else
				u32.Grab("S1");
				return;
			end;
		end;
		if p31.KeyCode == Enum.KeyCode.R and v26.Customs.Revive then
			u95 = true;
			u32.Revive();
			return;
		end;
		if p31.KeyCode == Enum.KeyCode.Z and v26.Customs.Snowball then
			u32.SnowballCheck();
		end;
	end);
	l__UserInputService__4.InputEnded:Connect(function(p33, p34)
		if p33.KeyCode == Enum.KeyCode.Q or p33.KeyCode == Enum.KeyCode.ButtonL2 then
			u93 = false;
			return;
		end;
		if (p33.KeyCode == Enum.KeyCode.X or p33.KeyCode == Enum.KeyCode.ButtonY) and v26.Customs.Pickup then
			u106 = 0;
			if u107 and l__Values__32.Grabbing.Value then
				u107 = false;
				u32.Grab("S2");
				return;
			end;
		elseif p33.KeyCode == Enum.KeyCode.R then
			u95 = false;
		end;
	end);
	l__Event__45.OnClientEvent:Connect(function(p35, p36, p37)
		if p35 == "Stun" then
			coroutine.wrap(function()
				deb = true
				_G.S_Take(u19.gc(u20.S1), 25);
				local Time = v26.BlockSettings.DebounceTime or 1
				u92 = _G.AffectChar("SD", Time + v26.BlockSettings.HitFlinchTime, p13.Name .. "Block", 8);
				u18(Time + v26.BlockSettings.HitFlinchTime);
				deb = false
			end)();
		end
		if p35 == "BS" then
			u32.BLOSTOOP(p36);
			return;
		end;
		if p35 == "BH2" then
			v39.Slash1:Stop(0.15);
			v39.Slash2:Stop(0.15);
			v39.Slash3:Stop(0.15);
			_G.S_Take(u19.gc(u20.S1), 10);
			return;
		end;
		if p35 == "BH" then
			u32.BlockHit();
			return;
		end;
		if p35 == "Flinch" then
			if not p36 then
				u63 = 1;
				u64 = false;
			end;
			u32.CancelExecution();
			if not p36 then
				u32.BLOSTOOP(false);
			end;
			u32.CancelDoorKick(true);
			return;
		end;
		if p35 == "GrabStop" and u29 then
			v39.Idle:Play(0.5);
			return;
		end;
		if p35 ~= "Hitmarker" then
			if p35 == "StopRevive" then
				u32.StopRevive();
			end;
			return;
		end;
		if u49 then
			u49:hitmarker(p36, p37, 0.1);
		end;
		u74 = true;
	end);
	coroutine.resume(coroutine.create(function()
		p13:WaitForChild("DisconREMOTE", math.huge).OnClientInvoke = function()
			u32.Disconnect();
		end;
	end));
	p13.Equipped:Connect(function()
		u32.Equip();
	end);
	p13.Unequipped:Connect(function()
		u32.Unequip();
	end);
	p13.Activated:Connect(function()
		if u27() ~= "mobile" then
			u32.ACTIVTE();
		end;
	end);
	p13.Deactivated:Connect(function()
		if u27() ~= "mobile" then
			u32.DEACCTIV();
		end;
	end);
	spawn(function()
		local l__Right_Arm__117 = l__Character__27:FindFirstChild("Right Arm");
		local u108 = nil;
		local u109 = nil;
		local u110 = nil;
		local u111 = nil;
		local u112 = nil;
		local u113 = nil;
		local u114 = nil;
		local function u115()
			u32.Unequip();
			u32.Disconnect();
			u15(u108);
			u15(u109);
			u15(u110);
			u15(u111);
			u15(u112);
			u15(u113);
			u15(u114);
		end;
		u108 = p13.AncestryChanged:Connect(function(p38, p39)
			if not p39 or p39 ~= l__LocalPlayer__21.Backpack and l__Character__27.Parent and p13.Parent ~= l__Character__27 then
				u115();
			end;
		end);
		if not l__Right_Arm__117 then
			u115();
		else
			u109 = l__Right_Arm__117.Changed:Connect(function()
				if not l__Right_Arm__117 or not l__Right_Arm__117.Parent or l__Right_Arm__117:FindFirstChild("Broken") then
					u115();
				end;
			end);
		end;
		u109 = l__Humanoid__30.Died:Connect(function()
			u115();
		end);
		u110 = l__Humanoid__30.HealthChanged:Connect(function()
			if not _G.CheckIfCan(l__Character__27) and (u29 or u33) then
				u32.Unequip();
			end;
		end);
		u111 = l__LocalPlayer__21.CharacterRemoving:Connect(function()
			u115();
		end);
		u112 = v33.Sprinting.Changed:Connect(function(p40)
			u34 = p40;
			if u34 and not v26.RunIdle then
				v39.Idle:Stop(0.15);
				return;
			end;
			if not u34 and not v26.RunIdle and u33 then
				v39.Idle:Play(0.15);
			end;
		end);
		u113 = l__Humanoid__30.StateChanged:Connect(u35);
		u114 = v33.RagdollTime.RagdollSwitch.Changed:Connect(function(p41)
			if p41 then
				u32.Unequip();
				return;
			end;
			if not p41 and p13.Parent == l__Character__27 then
				u32.Equip();
			end;
		end);
	end);
	u32 = v9(u32);
	return v24;
end;
local function u116(p42)
	local v118 = 0;
	for v119 in p42(".") do
		v118 = v118 + v119:byte();
	end;
	return v118 and 0;
end;
function u19.gc(p43)
	local v120, v121 = pcall(function()
		return tick() - (p43 + (u20.UsernameSalt and u116(tostring(game.Players.LocalPlayer)) or 0) + (u20.UserIdSalt and game.Players.LocalPlayer.UserId / 2 or 0));
	end);
	return v120 and v121 or nil;
end;
u19 = v9(u19);
return v19;