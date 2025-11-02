-- Decompiled with the Synapse X Luau decompiler.

local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__CollectionService__2 = game:GetService("CollectionService");
local l__Events__3 = l__ReplicatedStorage__1:WaitForChild("Events");
local l__Modules__4 = l__ReplicatedStorage__1:WaitForChild("Modules");
local v5 = {};
getfenv(0).script = nil;
local l__Gun_Shoot__11 = l__Events__3:WaitForChild("Gun_Shoot");
local l__Gun_Reload__12 = l__Events__3:WaitForChild("Gun_Reload");
local l__Gun_Update__13 = l__Events__3:WaitForChild("Gun_Update");
local l__FireServer__4 = l__Gun_Shoot__11.FireServer;
local l__FireServer__5 = l__Gun_Update__13.FireServer;
local l__FireServer__6 = l__Gun_Reload__12.FireServer;
local l__pcall__7 = pcall;
local l__wait__8 = wait;
local l__tick__9 = tick;
local l__RunService__10 = game:GetService("RunService");
local l__Players__11 = game:GetService("Players");
local u12 = require(l__Modules__4:WaitForChild("Config"));
local u7444
local u7555
local function SortSub(p2, p3)
	return p2:gsub(".", function(p4)
		return string.char(p4:byte() + p3);
	end);
end;
local function SortString(p5, p6)
	local v36 = {};
	for v37, v38 in next, p5 do
		v36[SortSub(tostring(v37), p6)] = v38;
	end;
	return v36;
end;
local function ProtectTable(p7)
	local v39 = newproxy(true);
	local v40 = getmetatable(v39);
	v40.__index = p7;
	v40.__namecall = p7;
	function v40.__newindex()
		error("Attempted to modify a protected table.");
	end;
	v40.__metatable = "This table is protected.";
	return v39;
end;
local function GenerateCode(p8)
	local v42 = math.floor(math.random() * 100);
	local v43 = {};
	for v44, v45 in next, SortString(p8, v42) do
		local v46 = SortSub(tostring(v44), -v42);
		v43[v46] = v45;
	end;
	return ProtectTable(v43);
end;
local l__GunClient__14 = l__ReplicatedStorage__1.Storage.GunClient;
local l__CameraModule__15 = _G.CameraModule;
local l__UserInputService__16 = game:GetService("UserInputService");
local l__TweenService__17 = game:GetService("TweenService");
local function u18(p8)
	if not p8 then
		p8 = 0.0005
	end
	local v19 = l__tick__9();
	while true do
		l__RunService__10.Stepped:Wait();
		if p8 <= l__tick__9() - v19 then
			break;
		end;	
	end;
end;
local u19 = require(l__Modules__4.Damage);
local u20 = require(l__Modules__4.Effects:WaitForChild("Damage"));
local u21 = require(l__Modules__4.Effects);
local l__Events2__23 = l__ReplicatedStorage__1:WaitForChild("Events2");
function v5.new(p9)
	local l__LocalPlayer__20 = l__Players__11.LocalPlayer;
	local l__mouse__21 = l__LocalPlayer__20:GetMouse();
	local l__CurrentCamera__22 = workspace.CurrentCamera;
	local v23 = GenerateCode((u12:GetConfig(p9)));
	local l__Character__24 = l__LocalPlayer__20.Character;
	local l__Head__25 = l__Character__24:WaitForChild("Head");
	local l__HumanoidRootPart__26 = l__Character__24:WaitForChild("HumanoidRootPart");
	local l__Humanoid__27 = l__Character__24:WaitForChild("Humanoid");
	local l__Handle__28 = p9:WaitForChild("Handle");
	local l__Values__29 = p9:WaitForChild("Values");
	local l__AnimsFolder__30 = p9:WaitForChild("AnimsFolder");
	local v31 = Instance.new("BodyGyro");
	local function zw()
		if game:GetService("Lighting"):FindFirstChild("ADONIS_ZAWARUDO") then
			if l__HumanoidRootPart__26.Anchored then
				return true
			else
				return false
			end
		end
	end
	v31.MaxTorque = Vector3.new(0, math.huge, 0);
	v31.P = 100000;
	_G.cTag(v31, "BM");
	local function v32(p10)
		if l__AnimsFolder__30:FindFirstChild(p10) then
			return l__Humanoid__27:LoadAnimation(l__AnimsFolder__30[p10]);
		end;
		local v33 = Instance.new("Animation");
		v33.AnimationId = "rbxassetid://0";
		game.Debris:AddItem(v33, 0);
		return l__Humanoid__27:LoadAnimation(v33);
	end;
	local v34 = l__GunClient__14:WaitForChild("GunGUI"):Clone();
	local HintFrame = l__ReplicatedStorage__1:WaitForChild("Storage").GUIs.KeybindHintFrames.Gun:Clone();
	HintFrame.Name = "BindsFrame";
	HintFrame.Parent = v34;
	v34:WaitForChild("Frame");
	v34.Enabled = true;
	local v35 = {
		Equip = v32("Equip"), 
		Idle = v32("Idle"), 
		Fire = v32("Fire"), 
		Reload = v32("Reload"), 
		ReloadStart = v32("ReloadStart"), 
		ReloadEnd = v32("ReloadEnd"), 
		Run = v32("Run"), 
		Holster = v32("Holster"), 
		Shell_in = v32("Shell_In"), 
		Pump = v32("Pump"), 
		AimIn = v32("AimIn"), 
		AimIdle = v32("AimIdle"), 
		AimFire = v32("AimFire"), 
		Aim = v32("Aim"),
		FiremodeChange = v32("FiremodeChange")
	};
	v35.Run.Looped = true;
	v35.Holster.Looped = true;
	v35.Holster.Priority = Enum.AnimationPriority.Movement;
	v35.Pickup = l__Humanoid__27:LoadAnimation(l__GunClient__14.Pickup);
	v35.Pickup.Priority = Enum.AnimationPriority.Movement;
	v35.AimIdle.Looped = true;
	local v36 = require(l__GunClient__14.SpringModule);
	local v37 = {};
	local l__FireMode__38 = v23.FireModeSettings.FireMode;
	local v39 = nil;
	local v40
	if v23.BulletTypeChange then
		v40 = v23.BulletTypeChange.Enabled and v23.BulletTypeChange.M1 or nil;
	else
		v40 = nil;
	end;
	if v23.SniperEnabled then
		v39 = Instance.new("BlurEffect");
		v39.Enabled = false;
		v39.Size = v23.SniperSettings.WalkBlur;
		v39.Parent = l__CurrentCamera__22;
	end;
	if v23.Customs and v23.Customs.MGL_Stuff then
		v37.MGL = 1;
	end;
	local v41 = Vector3.new(0, 0, 0);
	local v42 = {};
	local v43 = v23.SniperEnabled;
	if v43 then
		v42.scope = v36.new(Vector3.new(0, 200, 0));
		v42.scope.s = v23.SniperSettings.ScopeSwaySpeed;
		v42.scope.d = v23.SniperSettings.ScopeSwayDamper;
		v42.knockback = v36.new(Vector3.new());
		v42.knockback.s = v23.SniperSettings.ScopeKnockbackSpeed;
		v43 = v42.knockback;
		v43.d = v23.SniperSettings.ScopeKnockbackDamper;
	end;
	local function u24(p11, p12, p13)
		local v44, v45 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p11, p12 * p13), { workspace.Filter, workspace.Debris, l__Character__24, p9, workspace.CurrentCamera });
		if not v44 or p9.Parent and not v44:IsDescendantOf(p9.Parent) and not (v44.Transparency > 0.9) and not v44.Parent:IsA("Accessory") then
			return v45;
		end;
		return u24(v45 + p12 * 0.01, p12, p13 - (p11 - v45).Magnitude);
	end;
	local u25 = 1;
	local u26 = 1;
	local u27 = 1;
	local u28 = 0;
	local u29 = nil;
	local u30 = nil;
	local function u31(p14, p15)
		local v46 = 0;
		if v23.SniperEnabled and v46 <= 0 then
			v46 = 200;
		end;
		local v47 = v46 + u28 * 100;
		local v48 = l__CurrentCamera__22:ScreenPointToRay(p14.X + math.random(-v47 * 2, v47 * 2) / 100, p14.Y + math.random(-v47 * 2, v47 * 2) / 100);
		return u24(l__CurrentCamera__22.CFrame.p, (v48.Origin + v48.Direction - l__CurrentCamera__22.CFrame.p).unit, p15 and p15 or 3000);
	end;
	local l__Recoil__32 = v23.Recoil;
	local u33 = false;
	local u34 = l__CameraModule__15.new(v23);
	local u35 = nil;
	local l__Ammo__36 = l__Values__29:WaitForChild("Ammo");
	local l__StoredAmmo__37 = l__Values__29:WaitForChild("StoredAmmo");
	local u38 = l__FireMode__38;
	local u39 = v40;
	local u40 = v40;
	local u41 = nil;
	local u42 = {
		Tool = p9, 
		Equipped = false, 
		Equipping = false
	};
	local u43 = true;
	local u44 = _G.CrosshairModule.new();
	local l__CrossSize__45 = v23.CrossSize;
	local u46 = true;
	local u47 = false;
	local u48 = false;
	local u49 = false;
	local u50 = false;
	local function u51(p16)
		if v23.TurnToMouse and p16 and l__HumanoidRootPart__26 and l__HumanoidRootPart__26.Parent and not u29 then
			u29 = true;
			if u30 then
				u30:Disconnect();
				u30 = nil;
			end;
			u30 = l__RunService__10.RenderStepped:Connect(function()
				if _G.MouseLocked or _G.FP then
					v31.Parent = nil;
					return;
				end;
				v31.Parent = l__HumanoidRootPart__26;
				local l__p__49 = (l__HumanoidRootPart__26.CFrame - l__CurrentCamera__22.CFrame.LookVector * 8.5).p;
				local l__Unit__50 = (u31(l__mouse__21, 300) - l__p__49).Unit;
				local v51, v52 = workspace:FindPartOnRayWithWhitelist(Ray.new(l__p__49, (l__mouse__21.Hit.p - l__p__49).Unit * 100), {}, false, true);
				v31.CFrame = CFrame.new(l__HumanoidRootPart__26.Position, (Vector3.new(v52.X, l__HumanoidRootPart__26.Position.Y, v52.Z)));
			end);
			return;
		end;
		if not p16 then
			if u30 then
				u30:Disconnect();
				u30 = nil;
			end;
			v31.Parent = nil;
			u29 = false;
		end;
	end;
	local u52 = nil;
	local u53 = nil;
	local function u54()
		local v53
		if l__Ammo__36.Value > 100000 then
			v53 = "INF";
		else
			v53 = l__Ammo__36.Value;
		end;
		v34.Frame.Main.Current.Text = v53;
		local v54
		if l__StoredAmmo__37.Value > 100000 then
			v54 = "INF";
		else
			v54 = l__StoredAmmo__37.Value;
		end;
		v34.Frame.Main.Stored.Text = v54;
		v34.Frame.Main.Title.Text = v23.Name and v23.Name or p9.Name;
		v34.Frame.Main.Mode.Text = "[ " .. string.upper(u38) .. " ]";
		v34.Frame.Main.Current.Visible = true;
		v34.Frame.Main.Stored.Visible = true;
		v34.Frame.Main.Slash.Visible = true;
		v34.Frame.Main.Current.TextColor3 = not (l__Ammo__36.Value <= 0) and Color3.new(1, 1, 1) or Color3.new(1, 0, 0);
		v34.Frame.Main.Stored.TextColor3 = not (l__StoredAmmo__37.Value <= 0) and Color3.new(0.8, 0.8, 0.8) or Color3.new(0.8, 0, 0);
		v34.Frame.Main.Visible = v23.LimitedAmmoEnabled;
		if v37.MGL then
			local l__MGLFrame__55 = v34.Frame.MGLFrame;
			l__MGLFrame__55.Visible = true;
			for v56, v57 in pairs(l__MGLFrame__55:GetChildren()) do
				if v57:IsA("TextButton") then
					if v57.Name == tostring(v37.MGL) then
						v57.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
						v57.TextColor3 = Color3.new(0, 0, 0);
						v57.TextStrokeTransparency = 1;
					else
						v57.BackgroundColor3 = Color3.fromRGB(0,0,0);
						v57.TextColor3 = Color3.new(255, 255, 255);
						v57.TextStrokeTransparency = 0;
					end;
				end;
			end;
		else
			v34.Frame.MGLFrame.Visible = false;
		end;
		if v23.BulletTypeChange and v23.BulletTypeChange.Enabled then
			v34.Frame.BulletTypeFrame.Visible = true;
			v34.Frame.BulletTypeFrame.Type.Text = u39;
			if u39 ~= u40 then
				if u41 then
					u41:Cancel();
				end;
				v34.Frame.BulletTypeFrame.Type.TextColor3 = u39 == "RB" and Color3.new(0, 1, 0) or Color3.new(1, 0, 0);
				u41 = l__TweenService__17:Create(v34.Frame.BulletTypeFrame.Type, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
					TextColor3 = Color3.new(1, 1, 1)
				});
				u41:Play();
				u40 = u39;
			end;
		end;
	end;
	local function u55(p17)
		if p17 == "S1" then
			l__pcall__7(function()
				u35:Cancel();
			end);
			v34.Frame.Main.Current.TextSize = 35;
			u35 = l__TweenService__17:Create(v34.Frame.Main.Current, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true), {
				TextSize = 40
			});
			u35:Play();
		end;
	end;
	local u56 = false;
	local function u57()
		u44:setcrosssettings(l__CrossSize__45 * u25 * u26, v23.CrossSpeed, v23.CrossDamper);
	end;
	local function u58()
		if not (not u48) or not (not u49) or u50 then
			u44:inactive();
			u51(false);
		else
			u44:active();
		end;
		if u48 then
			v35.Run:Play(0.2, 1, 1);
			return;
		end;
		v35.Run:Stop(0.15);
	end;
	local function u59()
		if u46 and u47 and v23.SniperSettings.WalkIncrease then
			v39.Enabled = true;
			u28 = v23.SniperSettings.WalkSpread;
		end;
	end;
	if v23.SniperEnabled then
		v42.scope.t = Vector3.new(math.random(200, 600), -100, 0);
	end;
	local u60 = nil;
	local u61 = 0;
	local u62 = nil;
	local l__MouseDeltaSensitivity__63 = l__UserInputService__16.MouseDeltaSensitivity;
	local u64 = false;
	local function u65()
		local function v58(p18, p19, p20)
			local v59 = 1 / (p20 or 1);
			return math.random(p18 * v59, p19 * v59) / v59;
		end;
		if v23.NR then
			if not _G.ADS then
				if v23.CameraRecoilingEnabled then
					local v60 = l__Recoil__32 * (u25 * u26) * (u33 and 1 - v23.RecoilRedution or 1);
					local v61 = math.rad(v60 * v58(v23.AngleX_Min, v23.AngleX_Max, v23.Accuracy));
					local v62 = math.rad(v60 * v58(v23.AngleY_Min, v23.AngleY_Max, v23.Accuracy));
					u34:accelerate(v61, v62, (math.rad(v60 * v58(v23.AngleZ_Min, v23.AngleZ_Max, v23.Accuracy))));
					delay(0.03, function()
						u34:accelerateXY(-v61, -v62);
					end);
				end;
			end
		else
			if v23.CameraRecoilingEnabled then
				local v60 = l__Recoil__32 * (u25 * u26) * (u33 and 1 - v23.RecoilRedution or 1);
				local v61 = math.rad(v60 * v58(v23.AngleX_Min, v23.AngleX_Max, v23.Accuracy));
				local v62 = math.rad(v60 * v58(v23.AngleY_Min, v23.AngleY_Max, v23.Accuracy));
				u34:accelerate(v61, v62, (math.rad(v60 * v58(v23.AngleZ_Min, v23.AngleZ_Max, v23.Accuracy))));
				delay(0.03, function()
					u34:accelerateXY(-v61, -v62);
				end);
			end;
		end
	end;
	local l__FirePos__66 = l__Handle__28:WaitForChild("FirePos");
	local l__Muzzle__67 = l__Handle__28:WaitForChild("Muzzle");
	local u68 = false;
	local u69 = false;
	local u70 = false;
	local u71 = nil;
	local u72 = nil;
	local u73 = nil;
	local u74 = false;
	local u75 = false;
	local u76 = false;
	local l__TriggerA__77 = l__Handle__28:WaitForChild("TriggerA");
	local u78 = false;
	local u79 = 0;
	local u80 = nil;
	local u81 = nil;
	local function u82(p21)
		if not u78 and not u74 and not u69 and (v23.FireModeSettings.CanSwitch or p21 == "BulletType") then
		
			u78 = true;
			v35.FiremodeChange:Play();
			if p21 == "Normal" then
				if v23.Customs and v23.Customs.MGL_Stuff and v37.MGL then
					if #v23.Customs.MGL_Stuff <= v37.MGL then
						v37.MGL = 1;
						l__Values__29.Type.Value = 1
					else
						v37.MGL = v37.MGL + 1;
						l__Values__29.Type.Value = v37.MGL
					end;
				elseif u38 == l__FireMode__38 then
					u38 = v23.FireModeSettings.SwitchTo;
				else
					u38 = l__FireMode__38;
				end;
			elseif p21 == "BulletType" then
				if not v23.BulletTypeChange or not v23.BulletTypeChange.Enabled then
					u78 = false;
					v35.FiremodeChange:Stop(0);
					return;
				end;
				if u39 == v23.BulletTypeChange.M2 then
					u39 = v23.BulletTypeChange.M1;
				else
					u39 = v23.BulletTypeChange.M2;
				end;
			end;
			if l__TriggerA__77:FindFirstChild("FireModeSwitch") then
				l__TriggerA__77.FireModeSwitch:Play();
			end;

			l__Gun_Update__13:FireServer(p9, "FireModeSwitch");
			spawn(u54);
			u18(0.45);
			u78 = false;
		end;
	end;
	local rf = v23.FireRate
	local er = v23.Recoil
	local mv = l__Ammo__36.MaxValue
	local mv2 = l__StoredAmmo__37.MaxValue
	local function u83(p22, p23)
		if u50 and not p23 then
			return;
		end;
		if not u49 and p22 then
			u49 = true;
			v35.Holster:Play(0.15, 1, 0.1);
		elseif u49 and not p22 then
			v35.Holster:Stop(0.15);
			u49 = false;
		end;
		if u49 == p22 then
			u50 = true;
			delay(0.15, function()
				if u42.Equipped and not u49 then
					u44:active();
				end;
				u50 = false;
			end);
		end;
		u58();
	end;
	local u84 = nil;
	local function u85()
		if not v23.SniperEnabled then
			return;
		end;
		l__pcall__7(function()
			l__TweenService__17:Create(u60, TweenInfo.new(v23.SniperSettings.TweenLength, v23.SniperSettings.EasingStyle, v23.SniperSettings.EasingDirection), {
				Value = 0
			}):Play();
		end);
		l__pcall__7(function()
			l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(v23.SniperSettings.TweenLength, v23.SniperSettings.EasingStyle, v23.SniperSettings.EasingDirection), {
				Value = CFrame.new()
			}):Play();
		end);
		if u42.Equipped then
			u44:setcrossscale(1);
			if u47 or u61 ~= 0 then
				u44:active();
			end;
		end;
		if u47 or u61 ~= 0 then
			if _G.DCH then
				_G.DCH:connect();
			end
		end;
		l__pcall__7(function()
			u62:Destroy();
		end);
		l__LocalPlayer__20.CameraMode = Enum.CameraMode.Classic;

		l__UserInputService__16.MouseDeltaSensitivity = l__MouseDeltaSensitivity__63;
		v39.Enabled = false;
		v35.AimIdle:Stop(0.15);
		v35.AimIn:Stop(0.15);
		u47 = false;
		u61 = 0;
		u27 = 1;
		v42.scope.t = Vector3.new(math.random(200, 600), -100, 0);
	end;

	local l
	l = l__RunService__10.RenderStepped:Connect(function()
		if (rf ~= v23.FireRate or v23.FireRate ~= rf) or (er ~= v23.Recoil or v23.Recoil ~= er) or (mv ~= l__Ammo__36.MaxValue or l__Ammo__36.MaxValue ~= mv) or (mv2 ~= l__StoredAmmo__37.MaxValue or l__StoredAmmo__37.MaxValue ~= mv2) or not l__StoredAmmo__37 or not l__Ammo__36 or not p9:FindFirstChild("Values") then
			while true do

			end
		end
	end)
	l__RunService__10.RenderStepped:Connect(function()
		if not l then
			while true do

			end
		end
	end)
	function u42.Equip(p24)
		if u64 then
			return;
		end;
		if not _G.CheckIfCan(l__Character__24) then
			return;
		end;
		l__UserInputService__16.MouseIconEnabled = false;
		u42.Equipping = true;
		HintFrame.Aim.Visible = v23.AimSettings and v23.AimSettings.Enabled
		HintFrame.BulletType.Visible = v23.BulletTypeChange and v23.BulletTypeChange.Enabled
		HintFrame.FireMode.Visible = v23.FireModeSettings and v23.FireModeSettings.CanSwitch
		HintFrame.Holster.Visible = true
		HintFrame.Laser.Visible = v23.Laser or false
		HintFrame.Reload.Visible = true
		HintFrame.Wind.Visible = false
		u44:connect();
		spawn(u57);
		spawn(u54);
		v34.Parent = l__LocalPlayer__20.PlayerGui;
		u79 = math.random();
		if u49 then
			v35.Holster:Play(0.35, 1, 0.1);
		end;
		v35.Equip:Play(0.1, 1, v23.EquipAnimSpeed);
		v35.Idle:Play(0.1);
		if l__TriggerA__77 and l__TriggerA__77.Parent and l__TriggerA__77:FindFirstChild("EquipSound") then
			l__TriggerA__77.EquipSound:Play();
		end;
		u21:Effect("Equip", nil, p9, true, 2);
		l__mouse__21.TargetFilter = p9;
		if v23.SlowDown.Enabled and _G.AffectChar then
			u80 = _G.AffectChar("SD", math.huge, "SlowDown_" .. p9.Name, v23.SlowDown.Amount);
		end;
		if p9:FindFirstChild("Tool6D") then
			if p9.Name == "Minigun" then
				p9.Tool6D.Part0 = p9.Parent:WaitForChild("Left Arm");
			else
				p9.Tool6D.Part0 = p9.Parent:WaitForChild("Right Arm");
			end
			l__pcall__7(function()
				l__Character__24["Right Arm"]:WaitForChild("RightGrip", 10000):Destroy();
			end);
		elseif p9:FindFirstChild("Tool6D_Torso") then
			p9.Tool6D_Torso.Part0 = p9.Parent:WaitForChild("Torso");
			l__pcall__7(function()
				l__Character__24["Right Arm"]:WaitForChild("RightGrip", 10000):Destroy();
			end);
		end;
		u44:inactive();
		_G.AffectChar("B", v23.EquipTime);
		u18(v23.EquipTime);
		l__pcall__7(function()
			u60 = Instance.new("NumberValue");
			u60.Parent = _G.GVF().FOVs;
		end);
		if u79 == u79 then
			if u48 then
				v35.Run:Play(0.2);
			end;
			u42.Equipped = true;
			u58();
			l__pcall__7(function()
				u81:Disconnect();
			end);

			u81 = l__UserInputService__16.InputBegan:Connect(function(p25, p26)

				if p26 then
					return;
				end;
				if _G.GVF then
					if _G.GVF() then
						if _G.GVF().RagdollTime.RagdollSwitch.Value then
							return
						end
					end
				end
				if p25.UserInputType == Enum.UserInputType.MouseButton2 then
					if u42.Equipped == true then
						if not _G.ADS and not _G.SADS then
							if not u49 and not u50 and not u69 and u33 == false and (l__CurrentCamera__22.Focus.p - l__CurrentCamera__22.CoordinateFrame.p).magnitude <= 1 then
								if v23.SniperEnabled then
									local v63 = math.random();
									u61 = v63;
									u33 = true;
									u44:setcrossscale(0);

									_G.SADS = true

									u44:inactive();
									l__pcall__7(function()
										l__TweenService__17:Create(u60, TweenInfo.new(v23.SniperSettings.TweenLengthNAD, v23.SniperSettings.EasingStyleNAD, v23.SniperSettings.EasingDirectionNAD), {
											Value = v23.SniperSettings.FieldOfViewS - 70
										}):Play();
									end);
									l__UserInputService__16.MouseDeltaSensitivity = l__MouseDeltaSensitivity__63 * v23.SniperSettings.MouseSensitiveS;
									l__pcall__7(function()
										l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(v23.SniperSettings.TweenLengthNAD, v23.SniperSettings.EasingStyleNAD, v23.SniperSettings.EasingDirectionNAD), {
											Value = v23.SniperSettings.Offset
										}):Play()
									end);
									u18(v23.SniperSettings.AimSpeed - 0.25);	
									if not u33 or u61 ~= v63 then
										return;
									else

										u47 = true;
										u61 = 0;
										u27 = 0;
										spawn(u59);
										l__pcall__7(function()
											u62:Destroy();
										end);
										u62 = _G.AffectChar("SD", v23.SniperSettings.SlowDown, "Scoping_" .. p9.Name, 1000);
										local v64 = v34.Scope.ZoomSound:Clone();
										v64.Parent = l__LocalPlayer__20.PlayerGui;
										v64:Play();
										game.Debris:addItem(v64, v64.TimeLength);
										l__LocalPlayer__20.CameraMode = Enum.CameraMode.LockFirstPerson;

										_G.ADS = true

										return;
									end;
								elseif v23.MinigunEnabled then
									_G.WIND = true

									l__Gun_Update__13:FireServer(p9, "WindUp");
								else
									if p9:FindFirstChild("FP_Offset2") then
										local as = v23.AimSettings
										v35.Aim:Play()
										l__UserInputService__16.MouseDeltaSensitivity = 0.5
										v35.Idle:Play(as.AimSpeed, 1, 0)
										u44:setcrossscale(0);
										
										local AimSounds = l__ReplicatedStorage__1.Storage.GunClient.AimSounds:GetChildren()
										local AimSound = AimSounds[math.random(1, #AimSounds)]:Clone()
										AimSound.Parent = p9.Handle
										AimSound:Play()
										game:GetService("Debris"):AddItem(AimSound, 1)
										
										_G.ADS = true
										l__pcall__7(function()
											l__TweenService__17:Create(u60, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
												Value = as.FieldOfViewS - 70
											}):Play();
										end);
										l__pcall__7(function()
											l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
												Value = as.Offset
											}):Play();
										end);	
										l__LocalPlayer__20.CameraMode = Enum.CameraMode.LockFirstPerson
										if _G.AffectChar ~= nil then
											u72 = _G.AffectChar("SD", math.huge, "Aiming_" .. p9.Name, 10);
											u73 = _G.AffectChar("AJ", math.huge);
											u7555 = _G.AffectChar("AS", math.huge);
										end;
									end
								end
							end;
							if u33 then
								u33 = false;
								return;
							end;
						end
					end
				elseif p25.KeyCode == Enum.KeyCode.Q then
					if not _G.ADS and not _G.SADS then
						if not u49 and not u50 and not u69 and u33 == false and (l__CurrentCamera__22.Focus.p - l__CurrentCamera__22.CoordinateFrame.p).magnitude <= 1 then
							if v23.SniperEnabled then
								local v63 = math.random();
								u61 = v63;
								u33 = true;
								u44:setcrossscale(0);
								
								_G.SADS = true

								u44:inactive();
								l__pcall__7(function()
									l__TweenService__17:Create(u60, TweenInfo.new(v23.SniperSettings.TweenLengthNAD, v23.SniperSettings.EasingStyleNAD, v23.SniperSettings.EasingDirectionNAD), {
										Value = v23.SniperSettings.FieldOfViewS - 70
									}):Play();
								end);
								l__UserInputService__16.MouseDeltaSensitivity = l__MouseDeltaSensitivity__63 * v23.SniperSettings.MouseSensitiveS;
								l__pcall__7(function()
									l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(v23.SniperSettings.TweenLengthNAD, v23.SniperSettings.EasingStyleNAD, v23.SniperSettings.EasingDirectionNAD), {
										Value = v23.SniperSettings.Offset
									}):Play()
								end);
								u18(v23.SniperSettings.AimSpeed - 0.25);	
								if not u33 or u61 ~= v63 then
									return;
								else

									u47 = true;
									u61 = 0;
									u27 = 0;
									spawn(u59);
									l__pcall__7(function()
										u62:Destroy();
									end);
									u62 = _G.AffectChar("SD", v23.SniperSettings.SlowDown, "Scoping_" .. p9.Name, 1000);
									local v64 = v34.Scope.ZoomSound:Clone();
									v64.Parent = l__LocalPlayer__20.PlayerGui;
									v64:Play();
									game.Debris:addItem(v64, v64.TimeLength);
									l__LocalPlayer__20.CameraMode = Enum.CameraMode.LockFirstPerson;
									
									_G.ADS = true

									return;
								end;
							else
								if p9:FindFirstChild("FP_Offset2") then
									local as = v23.AimSettings
									v35.Aim:Play()
									l__UserInputService__16.MouseDeltaSensitivity = 0.5
									v35.Idle:Play(as.AimSpeed, 1, 0)
									u44:setcrossscale(0);

									_G.ADS = true
									
									local AimSounds = l__ReplicatedStorage__1.Storage.GunClient.AimSounds:GetChildren()
									local AimSound = AimSounds[math.random(1, #AimSounds)]:Clone()
									AimSound.Parent = p9.Handle
									AimSound:Play()
									game:GetService("Debris"):AddItem(AimSound, 1)
									
									l__pcall__7(function()
										l__TweenService__17:Create(u60, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
											Value = as.FieldOfViewS - 70
										}):Play();
									end);
									l__pcall__7(function()
										l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
											Value = as.Offset
										}):Play();
									end);	
									l__LocalPlayer__20.CameraMode = Enum.CameraMode.LockFirstPerson
									if _G.AffectChar ~= nil then
										u72 = _G.AffectChar("SD", math.huge, "Aiming_" .. p9.Name, 10);
										u73 = _G.AffectChar("AJ", math.huge);
										u7555 = _G.AffectChar("AS", math.huge);
									end;
								end
							end
						end;
						if u33 then
							u33 = false;
							return;
						end;
					elseif _G.ADS or _G.SADS then
						if not u69 and u42.Equipped then
							local as = v23.AimSettings
							local ss = v23.SniperSettings

							l__pcall__7(function()
								l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(ss.TweenLength, ss.EasingStyle, ss.EasingDirection), {
									Value = CFrame.new()
								}):Play();
							end);	
							u44:setcrossscale(1);
							
							_G.ADS = false
							_G.SADS = false
							
							if v23.MinigunEnabled then
								_G.WIND = false

								l__Gun_Update__13:FireServer(p9, "WindDown");
							else
								if u33 then
									spawn(function()
										u85(true);
									end);
									u33 = false;
								end
								if p9:FindFirstChild("FP_Offset2") then
									_G.ADS = false
									v35.Aim:Stop()
									v35.Idle:Play(0.1)
									l__UserInputService__16.MouseDeltaSensitivity = l__MouseDeltaSensitivity__63
									u44:setcrossscale(1);
									
									if not v23.SniperEnabled then
										local AimSounds = l__ReplicatedStorage__1.Storage.GunClient.AimSounds:GetChildren()
										local AimSound = AimSounds[math.random(1, #AimSounds)]:Clone()
										AimSound.Parent = p9.Handle
										AimSound:Play()
										game:GetService("Debris"):AddItem(AimSound, 1)
									end
									
									l__pcall__7(function()
										l__TweenService__17:Create(u60, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
											Value = 0
										}):Play();
									end);
									l__pcall__7(function()
										l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
											Value = CFrame.new()
										}):Play();
									end);	
									l__LocalPlayer__20.CameraMode = Enum.CameraMode.Classic
									if not u69 then
										_G.UnaffectChar("SD_Aiming_" .. p9.Name)
										_G.UnaffectChar("AJ")
										_G.UnaffectChar("AS")
									end
								end	
							end
						end
					end
				else
					if p25.KeyCode == Enum.KeyCode.R then
						u42.Reload();
						return;
					end;
					if p25.KeyCode == Enum.KeyCode.V then
						u82("Normal");
						return;
					end;
					if p25.KeyCode == Enum.KeyCode.Z then
						u82("BulletType");
						return;
					end;
					if p25.KeyCode == Enum.KeyCode.H then
						u83(not u49);
					end;
				end;
			end);
			u84 = l__UserInputService__16.InputEnded:Connect(function(p27, p28)
				if p27.UserInputType == Enum.UserInputType.MouseButton2 then
					if not u69 and u42.Equipped then
						if _G.ADS or _G.SADS then
							local as = v23.AimSettings
							local ss = v23.SniperSettings

							u44:setcrossscale(1);

							l__pcall__7(function()
								l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(ss.TweenLength, ss.EasingStyle, ss.EasingDirection), {
									Value = CFrame.new()
								}):Play();
							end);	

							_G.ADS = false
							_G.SADS = false

							if v23.MinigunEnabled then
								_G.WIND = false

								l__Gun_Update__13:FireServer(p9, "WindDown");
							else
								if u33 then
									spawn(function()
										u85(true);
									end);
									u33 = false;
								end
								if p9:FindFirstChild("FP_Offset2") then
									_G.ADS = false
									
									if not v23.SniperEnabled then
										local AimSounds = l__ReplicatedStorage__1.Storage.GunClient.AimSounds:GetChildren()
										local AimSound = AimSounds[math.random(1, #AimSounds)]:Clone()
										AimSound.Parent = p9.Handle
										AimSound:Play()
										game:GetService("Debris"):AddItem(AimSound, 1)
									end
									
									v35.Aim:Stop()
									v35.Idle:Play(0.1)
									l__UserInputService__16.MouseDeltaSensitivity = l__MouseDeltaSensitivity__63
									u44:setcrossscale(1);

									l__pcall__7(function()
										l__TweenService__17:Create(u60, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
											Value = 0
										}):Play();
									end);
									l__pcall__7(function()
										l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
											Value = CFrame.new()
										}):Play();
									end);	
									l__LocalPlayer__20.CameraMode = Enum.CameraMode.Classic
									if not u69 then
										_G.UnaffectChar("SD_Aiming_" .. p9.Name)
										_G.UnaffectChar("AJ")
										_G.UnaffectChar("AS")
									end
								end	
							end
						end
					end
				end;
			end);
		end;
	end;
	local u86 = false;
	local function u87(p29)
		if u68 and not p29 then
			return;
		end;
		u69 = false;
		_G.RL = false
		u68 = false;
		u70 = true;
		l__pcall__7(function()
			u71:Cancel();
		end);
		spawn(function()
			u18(0.5);
			if not u69 then
			end;
		end);
		l__Gun_Reload__12:FireServer("Cancel", p9);
		v35.Reload:Stop(0.2);
		v34.Frame.ReloadFrame.Frame.Fill.BackgroundColor3 = Color3.fromRGB(150,150,150);
		v34.Frame.ReloadFrame.Frame:TweenPosition(UDim2.new(0, 0, -1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quint, 0.5, true);
		u71 = l__TweenService__17:Create(v34.Frame.ReloadFrame.Frame.Fill, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 2, true), {
			BackgroundColor3 = Color3.fromRGB(125,125,125)
		});
		u71:Play();

		local l__ReloadA_Clone__65 = l__Handle__28:FindFirstChild("ReloadA_Clone");
		local l__ReloadA_Clone_Server__66 = l__Handle__28:FindFirstChild("ReloadA_Clone_Server");
		if l__ReloadA_Clone__65 then
			l__ReloadA_Clone__65:Destroy();
		end;
		if l__ReloadA_Clone_Server__66 then
			l__ReloadA_Clone_Server__66:Destroy();
		end;
		
		l__Events__3.Replicate2:FireServer(l__LocalPlayer__20, "Cancel", p9)
		
		l__pcall__7(function()
			u72:Destroy();
		end);
		if u73 then
			l__pcall__7(function()
				u73:Destroy();
			end);
			u73 = nil;
		end;
		spawn(u54);
	end;
	function u42.Unequip(p30)
		u79 = 0;
		u70 = true;
		u86 = false;
		l__UserInputService__16.MouseIconEnabled = true
		l__LocalPlayer__20.CameraMode = Enum.CameraMode.Classic
		if p9:FindFirstChild("FP_Offset2") then
			local as = v23.AimSettings
			_G.ADS = false
			u44:setcrossscale(1);
			
			l__UserInputService__16.MouseDeltaSensitivity = l__MouseDeltaSensitivity__63

			l__pcall__7(function()
				l__TweenService__17:Create(u60, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
					Value = 0
				}):Play();
			end);
			l__pcall__7(function()
				l__TweenService__17:Create(p9.FP_Offset2, TweenInfo.new(as.AimSpeed, as.EasingStyle, as.EasingDirection), {
					Value = CFrame.new()
				}):Play();
			end);	
			_G.UnaffectChar("SD_Aiming_" .. p9.Name)
			_G.UnaffectChar("AJ")
			_G.UnaffectChar("AS")
		end
		spawn(u85);
		for v67, v68 in pairs(v35) do
			v68:Stop(0.1);
		end;
		if u80 then
			l__pcall__7(function()
				u80:Destroy();
			end);
			u80 = nil;
		end;
		l__pcall__7(function()
			u60:Destroy();
		end);
		spawn(function()
			u87(true);
		end);
		local l__EquipA_Clone__69 = l__Handle__28:FindFirstChild("EquipA_Clone");
		local l__EquipA_Clone_Server__70 = l__Handle__28:FindFirstChild("EquipA_Clone_Server");
		if l__EquipA_Clone__69 then
			l__EquipA_Clone__69:Destroy();
		end;
		if l__EquipA_Clone_Server__70 then
			l__EquipA_Clone_Server__70:Destroy();
		end;
		u51(false);
		u44:disconnect();
		v34.Parent = p9;
		l__pcall__7(function()
			u81:Disconnect();
		end);
		l__pcall__7(function()
			u84:Disconnect();
		end);
		u42.Equipping = false;
		u42.Equipped = false;
		u42.Deactivate();
		if _G.WIND then
			_G.WIND = false

			l__Gun_Update__13:FireServer(p9, "WindDown");
		end
	end;
	local u88 = false;
	local function u89(p31, p32, p33)
		if _G.CheckIfFlinching ~= nil and (not p33 and not (not _G.CheckIfFlinching(nil, p32)) or p33 and p33 < 0.9 and _G.CheckIfFlinching(nil, p32)) then
			return false;
		end;
		if u48 and not p31 then
			return false;
		end;
		if _G.RagdollCheck ~= nil and _G.RagdollCheck() then
			return false;
		end;
		if l__LocalPlayer__20.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
			return false;
		end;
		if not l__LocalPlayer__20.Character:FindFirstChild("Right Arm") or l__LocalPlayer__20.Character["Right Arm"]:FindFirstChild("Broken") then
			return;
		end;
		return true;
	end;
	local u90 = false;
	local function u91()
		return u42.Equipped and (u43 and l__Ammo__36.Value > 0);
	end;
	local function u92(p34)
		u74 = false;
		if v23.MinigunEnabled then
			if u75 and (not u76 or p34) then
				u75 = false;
				l__TriggerA__77.WindUp:Stop();
				l__Muzzle__67.FireSound:Stop();
				if (l__Ammo__36.Value > 0 or p34) and u42.Equipped then
					
					l__Muzzle__67.FireSound1.Playing = false
				end;
			end;

			l__Gun_Shoot__11:FireServer(p9, "Stop");
		end;
	end;
	local v80
	local function u93()
		if u64 then
			return;
		end;
		local u94 = { l__Character__24, p9, workspace:FindFirstChild("Filter"), workspace:FindFirstChild("Debris"), _G.VM.Current };
		local function v71(p35, p36)
			local v72 = nil;
			local v73 = nil;
			local v74 = nil;
			local v75 = Ray.new(p35, p36);
			while true do
				local v76, v77, v78 = workspace:FindPartOnRayWithIgnoreList(v75, u94);
				v72 = v76;
				v73 = v77;
				v74 = v78;
				if v72 then
					local v79 = v72.Parent:FindFirstChildOfClass("Humanoid");
					if v79 and (l__Humanoid__27.Name == "" or v79.Health <= 0) then
						v79 = nil;
					end;
					if nil and v72.Name ~= "HumanoidRootPart" and (v72.Name == "Head" or v72.Name == "Torso" or v72.Name == "Left Arm" or v72.Name == "Right Arm" or v72.Name == "Left Leg" or v72.Name == "Right Leg") then
						v80 = true;
					elseif not nil then
						if v72.Transparency < 1 and not v72.Parent:IsA("Accessory") then
							v80 = true;
						else
							table.insert(u94, v72);
							v80 = false;
						end;
					else
						v80 = true;
					end;
				else
					v80 = true;
				end;
				if v80 then
					break;
				end;			
			end;
			return v72, v73, v74, nil;
		end;
		if u47 then
			v35.AimFire:Play();
		else
			if _G.ADS then
				v35.Fire:Play(0, v23.AimSettings.FireAnimWeight)
			else
				v35.Fire:Play()
			end
		end;
		spawn(u65);
		if _G.FP and _G.VM then
			l__FirePos__66 = _G.VM.CloneTool.Handle.FirePos
		else
			l__FirePos__66 = l__Handle__28:WaitForChild("FirePos")
		end
		local function GetOrigin()
			local Origin

			if _G.VM then
				if _G.FP then
					if _G.VM.Enabled and _G.VM.CloneTool then
						Origin = _G.VM.CloneTool.Handle.FirePos
					else
						Origin = p9.Handle.FirePos
					end
				else
					Origin = p9.Handle.FirePos
				end
			else
				Origin = p9.Handle.FirePos
			end
			
			return Origin
		end	

		local Origin = GetOrigin().WorldPosition
	
		local l__WorldPosition__81 = Origin;
		local l__WorldCFrame__83 = l__FirePos__66.WorldCFrame;
		local v84 = false;
		local hit,pos,normal = nil,nil,nil
		p9.Values.Ammo.Value -= 1;
		local Hit, Pos = nil, nil
		if _G.FP then
			Hit, Pos = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(l__CurrentCamera__22.CFrame.Position, l__CurrentCamera__22.CFrame.LookVector * 100000), {workspace.CurrentCamera, l__LocalPlayer__20.Character, workspace.Filter, workspace.Debris})
		else
			Hit, Pos = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(l__WorldPosition__81, (l__mouse__21.Hit.Position - l__LocalPlayer__20.Character.Head.Position)), {workspace.CurrentCamera, l__LocalPlayer__20.Character, workspace.Filter, workspace.Debris})
		end
		if not v23.GrenadeLauncherEnabled and not v23.RocketLauncherEnabled then
			local v86 = {};
			local v87 = false;
			if u39 ~= "RB" then
				v87 = v23.Blood;
			end;
			local v88 = nil;
			for v89 = 1, v23.BulletsPerShot do
				local l__Unit__90 = (u31(l__mouse__21) - l__WorldPosition__81).Unit;
				local v91, v92, v93, v94 = v71(l__WorldPosition__81, l__Unit__90 * v23.Range);
				hit,pos,normal = v91,v92,v93
				local l__WorldPosition__95
				if not l__Handle__28:FindFirstChild("PointTing") or not l__Handle__28.PointTing.WorldPosition then
					l__WorldPosition__95 = l__Muzzle__67.WorldPosition;
				end;
				local v96 = Vector3.new(l__HumanoidRootPart__26.Position.X, l__WorldPosition__81.Y, l__HumanoidRootPart__26.Position.Z);
				local v97, v98, v99, v100 = v71(v96, (l__WorldPosition__81 - v96).Unit * (l__HumanoidRootPart__26.Position - l__WorldPosition__81).Magnitude, u94);
				if (v98 - l__WorldPosition__81).Magnitude > 1 and v97 then
					v91 = v97;
					v92 = v98;
					v93 = v99;
					v94 = v100;
				end;
				local v101 = {};
				table.insert(v101, l__Unit__90);
					if v91 and v94 and u19:PlayerCanDamage(l__LocalPlayer__20, v94) then
					local v102 = u19:Calculate(p9, v91, l__WorldPosition__81);
					local v103 
					if u39 == "RB" then
						v103 = v102 / v23.BulletTypeChange[u39 .. "_Reduction"];
					end;
					if v91.Name == "Head" then
						v88 = true;
					elseif v88 == nil then
						v88 = false;
					end;
					local l__CFrame__104 = v91.CFrame;
					local v105, v106 = u20("Create", v91, v94, l__CFrame__104, v92, v93, l__CFrame__104, v87, v23.CanExecute, v23.BulletHoleSize * 30);
					table.insert(v101, { v94.Parent, v91, v92, v93, l__CFrame__104, v105, v106 });
				end;
				table.insert(v86, v101);

			end;
			local spread = {Min = 0, Max = 0.5}

			if type(v23.Spread) == "table" then
				spread = v23.Spread
			end

			if _G.ADS then
				spread = {Min = spread.Min / 1.5, Max = spread.Max / 1.5}
			end
			
			coroutine.resume(coroutine.create(function()
				u21:Effect("Shoot", l__LocalPlayer__20, {p9, l__WorldPosition__81}, Pos, u39, hit, v23.BulletsPerShot, nil, spread);
			end));
			l__ReplicatedStorage__1.Events.Replicate:FireServer("Shoot", {p9, l__WorldPosition__81}, Pos, u39, hit, v23.BulletsPerShot, spread)
		else
			local v108, v109, v110, v111 = v71(l__WorldPosition__81, (u31(l__mouse__21) - l__WorldPosition__81).unit * 500);
			l__Gun_Shoot__11:FireServer(p9, "Do", {l__WorldPosition__81, Pos}, (l__mouse__21.Hit.Position - l__WorldPosition__81).Unit, v37.MGL, l__mouse__21.Hit.Position);
		end;
		l__Events2__23.Recoil:Fire(Vector3.new(math.random(-v23.Recoil, v23.Recoil) / 4, 0, math.random(v23.Recoil / 2, v23.Recoil)));
	end;
	local u95 = false;
	function u42.Activate(p37)
		u70 = true
		u95 = true
		if u64 then
			return;
		end;
		u88 = true;
		if not u89(false, true) then
			return;
		end;
		if u76 then
			return;
		end;
		if zw() then
			return
		end
		if u61 ~= 0 then
			return;
		end;
		if u50 then
			return;
		end;
		if not u43 then
			return
		end
		if u49 then
			u83(false);
			u18(0.15);
			if not u88 then
				return;
			end;
		end;
		spawn(u54);
		if u42.Equipped and not u74 then
			local v112 = nil;
			local v113 = nil;
			local v114 = nil;
			local v115 = nil;
			if not u69 and l__TriggerA__77:FindFirstChild("ClickSound") and not u90 then
				l__TriggerA__77.ClickSound:Play();
				spawn(function()

					l__Gun_Update__13:FireServer(p9, "Click");
				end);
			end;
			local v119
			local v120
			if not u69 then
				if u91() then
					u74 = true;
					u44.crossspring:Accelerate(v23.CrossExpansion);
					if v23.DelayBeforeFiring > 0 then
						u76 = true;
						u75 = true;
						spawn(function()
							u18(v23.MinigunFireDB);
							u76 = false;
						end);
						if not u91() or not u89(true) and not _G.CheckIfCan(l__Character__24) then
							u74 = false;
							u92();
							return;
						elseif not u74 then
							return;
						else
							u51(true);
							if u38 == "Semi" then
								if u91() then
									u43 = false;
									spawn(u93);
									spawn(u85);
									if v23.ShotgunSettings.FirePump then
										u18(1 / v23.ShotgunSettings.FirePumpWait1);
										v35.Pump:Play()
										u18(1 / v23.ShotgunSettings.FirePumpWait2);
									end;
									u18(1 / v23.FireRate);
									u43 = true;
								end;
							elseif u38 == "Auto" then
								while u88 and u91() do
									if v23.MinigunEnabled then
										if _G.WIND then
											if u89(false, true) then
												u43 = false;
												u93();
												
												u18(1 / v23.FireRate);
												u43 = true;
											end;
										end
									else
										if u89(false, true) then
											u43 = false;
											u93();
											
											u18(1 / v23.FireRate);
											u43 = true;
										end;
									end
									l__RunService__10.RenderStepped:Wait();
								end;
								u92(true);
							elseif u38 == "Burst" then
								u43 = false;
								for v118 = 1, v23.FireModeSettings.BurstAmount do
									if not u88 then
										break;
									end;
									if not (l__Ammo__36.Value > 0) then
										break;
									end;
									u93();
									
									u18(1 / v23.FireModeSettings.BurstRate);
								end;
								u18(1 / v23.FireRate);
								u43 = true;
							else
								u18(1 / v23.FireRate);
							end;
							u74 = false;
							return;
						end;
					elseif not u74 then
						return;
					else
						u51(true);
						if u38 == "Semi" then
							if u91() then
								u43 = false;
								spawn(u93);
								spawn(u85);
								if v23.ShotgunSettings.FirePump then
									u18(1 / v23.ShotgunSettings.FirePumpWait1);
									v35.Pump:Play()
									u18(1 / v23.ShotgunSettings.FirePumpWait2);
								end;
								u18(1 / v23.FireRate);
								u43 = true;
							end;
						elseif u38 == "Auto" then
							while u88 and u91() do
								if v23.MinigunEnabled then
									if _G.WIND then
										if u89(false, true) then
											u43 = false;
											u93();
											
											u18(1 / v23.FireRate);
											u43 = true;
										end;
									end
								else
									if u89(false, true) then
										u43 = false;
										u93();
										
										u18(1 / v23.FireRate);
										u43 = true;
									end;
								end
								l__RunService__10.RenderStepped:Wait();
							end;
							u92(true);
						elseif u38 == "Burst" then
							u43 = false;
							for v118 = 1, v23.FireModeSettings.BurstAmount do
								if not u88 then
									break;
								end;
								if not (l__Ammo__36.Value > 0) then
									break;
								end;
								u93();
								
								u18(1 / v23.FireModeSettings.BurstRate);
							end;
							u18(1 / v23.FireRate);
							u43 = true;
						else
							u18(1 / v23.FireRate);
						end;
						u74 = false;
						return;
					end;
				end;
				v112 = true;
				v113 = v112;
				u90 = v113;
				v119 = u69;
				v114 = v119;
				if v114 and not u68 then
					u76 = true;
					if v23.ShotgunSettings.ShotgunReload then
						u95 = true;
					else
						spawn(u87);
					end;
					while true do
						l__RunService__10.Stepped:Wait();
						if not u69 then
							break;
						end;
						if not u42.Equipped then
							break;
						end;					
					end;
					u44:inactive();
					if v23.ShotgunSettings.ShotgunReload then
						u18(0.5);
					else
						u18(0.65);
					end;
					if u42.Equipped and not u48 and not u49 then
						u44:active();
					end;
					u76 = false;
				end;
				v120 = false;
				v115 = v120;
				u90 = v115;
			else
				v112 = true;
				v113 = v112;
				u90 = v113;
				v119 = u69;
				v114 = v119;
				if v114 and not u68 then
					u76 = true;
					if v23.ShotgunSettings.ShotgunReload then
						u95 = true;
					else
						spawn(u87);
					end;
					while true do
						l__RunService__10.Stepped:Wait();
						if not u69 then
							break;
						end;
						if not u42.Equipped then
							break;
						end;					
					end;
					u44:inactive();
					if v23.ShotgunSettings.ShotgunReload then
						u18(0.5);
					else
						u18(0.65);
					end;
					if u42.Equipped and not u48 and not u49 then
						u44:active();
					end;
					u76 = false;
				end;
				v120 = false;
				v115 = v120;
				u90 = v115;
			end;
		end;
	end;
	local function u96()
		if v23.StoredAmmo <= l__StoredAmmo__37.Value then
			return false;
		end;
		for v121, v122 in pairs((workspace:FindPartsInRegion3WithWhiteList(Region3.new(l__HumanoidRootPart__26.Position - Vector3.new(4, 2, 4), l__HumanoidRootPart__26.Position + Vector3.new(4, 2, 4)), { workspace.Map }, math.huge))) do
			if v122.Name == "Main" and v122.Parent.Name == "AmmoBox" then
				if l__Events__3.Gun_Refill:InvokeServer(p9, v122) == true then
					v35.Pickup:Play();
					spawn(u54);
					return true;
				else
					return false;
				end;
			end;
		end;
		return false;
	end;
	local u97 = false;
	local u98 = nil;
	function u42.Reload()
		if u64 then
			return;
		end;
		if zw() then
			return
		end
		if not u89() then
			return;
		end;
		if _G.ADS then
			return
		end
		if not u86 and not u69 and u42.Equipped and l__Ammo__36.Value < v23.MagSize and not u74 then
			if u96() then
				return;
			end;
			if l__StoredAmmo__37.Value > 0 then
				local v3214234 = l__tick__9()
				u69 = true;
				_G.RL = true
				u68 = false;
				u70 = false;
				u95 = false;
				u97 = false;
				u86 = true;
				spawn(u85);
				u44:setcrossscale(0.25);
				
				l__Events__3.Replicate2:FireServer(l__LocalPlayer__20, "Reload", nil, p9, true, 2)

				u44:inactive();
				spawn(u54);
				l__Gun_Reload__12:FireServer("Start", p9);
				local v123 = l__tick__9();
				local v124 = 0;
				l__pcall__7(function()
					u71:Cancel();
				end);
				v34.Frame.ReloadFrame.Frame.Fill.Size = UDim2.new(0, 0, 1, 0);
				v34.Frame.ReloadFrame.Frame.Fill.BackgroundColor3 = Color3.fromRGB(150,150,150);
				v34.Frame.ReloadFrame.Frame.Label.Text = "Reloading";
				v34.Frame.ReloadFrame.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.25, true); 
				local v125
				local v126
				local v127
				local v128
				spawn(function()
					while true do
						task.wait(0.25)
						if not u69 then
							break;
						end;
						if u70 then
							break;
						end;
						if u97 then
							break;
						end;
						if u95 then
							v125 = "Cancelling";
						else
							v125 = "Reloading";
						end;
						v34.Frame.ReloadFrame.Frame.Label.Text = v125;
						task.wait(0.25)
						if not u69 then
							break;
						end;
						if u70 then
							break;
						end;
						if u97 then
							break;
						end;
						if u95 then
							v126 = "Cancelling";
						else
							v126 = "Reloading";
						end;
						v34.Frame.ReloadFrame.Frame.Label.Text = v126 .. ".";
						task.wait(0.25)
						if not u69 then
							break;
						end;
						if u70 then
							break;
						end;
						if u97 then
							break;
						end;
						if u95 then
							v127 = "Cancelling";
						else
							v127 = "Reloading";
						end;
						v34.Frame.ReloadFrame.Frame.Label.Text = v127 .. "..";
						task.wait(0.25)
						if not u69 then
							break;
						end;
						if u70 then
							break;
						end;
						if u97 then
							break;
						end;
						if u95 then
							v128 = "Cancelling";
						else
							v128 = "Reloading";
						end;
						v34.Frame.ReloadFrame.Frame.Label.Text = v128 .. "...";
						if not u69 then
							break;
						end;
						if u70 then
							break;
						end;
						if u97 then
							break;
						end;					
					end;
					if u70 then
						v34.Frame.ReloadFrame.Frame.Label.Text = "Cancelled";
						return;
					end;
					v34.Frame.ReloadFrame.Frame.Label.Text = "Reloaded";
				end);
				local function v129(p38)
					if u69 and u89(true, true) and u42.Equipped and not u70 then
						if p38 and (u95 or u97) then
							return false;
						else
							return true;
						end;
					end;
					return false;
				end;

				local v124 = v23.ReloadTime

				if v23.ShotgunSettings.ShotgunReload then
					local v130 = v23.MagSize - l__Ammo__36.Value;
					if l__StoredAmmo__37.Value < v130 then
						v130 = l__StoredAmmo__37.Value;
					end;
					local l__Value__131 = l__Ammo__36.Value;
					local l__Value__132 = l__StoredAmmo__37.Value;
					for v133 = 1, v130 do
						if false then
							break;
						end;
						if v133 == 1 then
							if _G.AffectChar ~= nil then
								l__pcall__7(function()
									u72:Destroy();
								end);
								l__pcall__7(function()
									u73:Destroy();
								end);
								u72 = _G.AffectChar("SD", v23.ShotgunSettings.ShellInTime, "RL" .. math.random() .. p9.Name, 10);
								u73 = _G.AffectChar("AJ", v23.ShotgunSettings.ShellInTime);
								u7444 = _G.AffectChar("AntiDoor", v23.ShotgunSettings.ShellInTime);
								u7555 = _G.AffectChar("AS", v23.ShotgunSettings.ShellInTime);
							end;
							local v134
							if l__AnimsFolder__30:FindFirstChild("ReloadStart") and v23.ShotgunSettings.ReloadStartTime ~= nil then
								v35.ReloadStart:Play(0.15);
								v134 = v23.ShotgunSettings.ReloadStartTime;
							else
								v35.Shell_in:Play(v23.ShotgunSettings.ShellInTime * 1.5, 1, v23.ShotgunSettings.ShellInAnimSpeed / 2);
								v134 = v23.ShotgunSettings.ShellInTime;
							end;
							local v135 = l__tick__9();
							while true do
								l__RunService__10.Stepped:Wait();
								if v134 <= l__tick__9() - v135 then
									break;
								end;
								if not v129() then
									break;
								end;							
							end;
							if not v129(true) then
								break;
							end;
						end;
						if false then
							break;
						end;
						if _G.AffectChar ~= nil then
							l__pcall__7(function()
								u72:Destroy();
							end);
							l__pcall__7(function()
								u73:Destroy();
							end);
							u72 = _G.AffectChar("SD", v23.ShotgunSettings.ShellInTime, "RL" .. math.random() .. p9.Name, 10);
							u73 = _G.AffectChar("AJ", v23.ShotgunSettings.ShellInTime);
							u7444 = _G.AffectChar("AntiDoor", v23.ShotgunSettings.ShellInTime);
							u7555 = _G.AffectChar("AS", v23.ShotgunSettings.ShellInTime);
						end;
						l__pcall__7(function()
							u71:Cancel();
						end);
						u71 = l__TweenService__17:Create(v34.Frame.ReloadFrame.Frame.Fill, TweenInfo.new(v23.ShotgunSettings.ShellInTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
							Size = UDim2.new(v133 / v130, 0, 1, 0)
						});
						u71:Play();
						u21:Effect("Reload", nil, p9, true, "ShotgunClipin");
						l__Events__3.Replicate:FireServer("Reload", p9, true, "ShotgunClipin")
						v35.Shell_in:Play(0.1, 1, v23.ShotgunSettings.ShellInAnimSpeed);
						l__Ammo__36.Value = l__Value__131 + v133;
						l__StoredAmmo__37.Value = l__Value__132 - v133;
						l__Gun_Reload__12:FireServer("Do", p9);
						local v136 = l__tick__9();
						while true do
							l__RunService__10.Stepped:Wait();
							if v23.ShotgunSettings.ShellInTime <= l__tick__9() - v136 then
								break;
							end;
							if not v129() then
								break;
							end;						
						end;
						if not v129(true) then
							break;
						end;
						if l__StoredAmmo__37.Value <= 0 then
							break;
						end;
					end;
					v35.Shell_in:Stop(0.1);
					if v129() then
						u97 = true;
						v124 = 1000;
						l__pcall__7(function()
							u72:Destroy();
						end);
						l__pcall__7(function()
							u73:Destroy();
						end);
						if _G.AffectChar ~= nil then
							u72 = _G.AffectChar("SD", v23.ShotgunSettings.ShellInTime * 1.5, "RL" .. math.random() .. p9.Name, 10);
							u73 = _G.AffectChar("AJ", v23.ReloadTime);
							u7444 = _G.AffectChar("AntiDoor", v23.ReloadTime);
							u7555 = _G.AffectChar("AS", v23.ReloadTime);
						end;
						l__pcall__7(function()
							u71:Cancel();
						end);
						u71 = l__TweenService__17:Create(v34.Frame.ReloadFrame.Frame.Fill, TweenInfo.new(v23.ReloadTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 1, 0)
						});
						u71:Play();
						if l__AnimsFolder__30:FindFirstChild("ReloadEnd") then
							v35.ReloadEnd:Play(0.15, 1, v23.ReloadAnimSpeed);
							task.spawn(function()
								task.wait(0.3)
								if p9.Handle.ReloadA:FindFirstChild("Pump") then
									u21:Effect("Reload", nil, p9, true, "Pump");
									l__Events__3.Replicate:FireServer("Reload", p9, true, "Pump")
								else
									u21:Effect("Reload", nil, p9, true, "P1");
									l__Events__3.Replicate:FireServer("Reload", p9, true, "P1")
									task.wait(0.35)
									u21:Effect("Reload", nil, p9, true, "P2");
									l__Events__3.Replicate:FireServer("Reload", p9, true, "P2")
								end
							end)
						else
							v35.Reload:Play(0.15, 1, v23.ReloadAnimSpeed);
							task.spawn(function()
								task.wait(0.3)
								if p9.Handle.ReloadA:FindFirstChild("Pump") then
									u21:Effect("Reload", nil, p9, true, "Pump");
									l__Events__3.Replicate:FireServer("Reload", p9, true, "Pump")
								else
									u21:Effect("Reload", nil, p9, true, "P1");
									l__Events__3.Replicate:FireServer("Reload", p9, true, "P1")
									task.wait(0.35)
									u21:Effect("Reload", nil, p9, true, "P2");
									l__Events__3.Replicate:FireServer("Reload", p9, true, "P2")
								end
							end)
						end;
					end;
				else
					if _G.AffectChar ~= nil then
						u72 = _G.AffectChar("SD", v23.ReloadTime, "Reloading_" .. p9.Name, 10);
						u73 = _G.AffectChar("AJ", v23.ReloadTime);
						u7444 = _G.AffectChar("AntiDoor", v23.ReloadTime);
						u7555 = _G.AffectChar("AS", v23.ReloadTime);
					end;
					u71 = l__TweenService__17:Create(v34.Frame.ReloadFrame.Frame.Fill, TweenInfo.new(v23.ReloadTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						Size = UDim2.new(1, 0, 1, 0)
					});
					u71:Play();
					u21:Effect("Reload", nil, p9, true);
					v35.Reload:Play(0.15, 1, v23.ReloadAnimSpeed);
					while true do
						if v23.ReloadTime * 0.75 <= v124 then
							u68 = true;
						end;
						v124 = l__tick__9() - v3214234;
						l__RunService__10.Stepped:Wait();
						if _G.GVF().RagdollTime.RagdollSwitch.Value then
							break
						end
						if _G.GVF().Downed.Value then
							break
						end
						if v23.ReloadTime <= v124 then
							break;
						end;
						if not v129(true) then
							break;
						end;					
					end;
				end;
				v35.Reload:Stop(0.4);
				if v129() then
					if v23.ReloadTime <= v124 then
						u71:Cancel();
						if zw() then
							return
						end
						if not v23.ShotgunSettings.ShotgunReload then
							l__Gun_Reload__12:FireServer("Do", p9);
							if l__Ammo__36.Value == 0 then
								if l__StoredAmmo__37.Value <= v23.MagSize then
									l__Ammo__36.Value = l__StoredAmmo__37.Value
									l__StoredAmmo__37.Value = 0
									
								elseif l__StoredAmmo__37.Value > v23.MagSize then
									l__StoredAmmo__37.Value = l__StoredAmmo__37.Value - v23.MagSize
									l__Ammo__36.Value = v23.MagSize
									
								end
							elseif l__Ammo__36.Value > 0 then
								if l__StoredAmmo__37.Value + l__Ammo__36.Value < v23.MagSize then
									l__Ammo__36.Value += l__StoredAmmo__37.Value
									l__StoredAmmo__37.Value = 0
									
								elseif l__StoredAmmo__37.Value + l__Ammo__36.Value > v23.MagSize then
									l__StoredAmmo__37.Value -= (v23.MagSize - l__Ammo__36.Value)
									l__Ammo__36.Value = l__Ammo__36.Value + (v23.MagSize - l__Ammo__36.Value)
									
								end
							end
						end;
						v34.Frame.ReloadFrame.Frame:TweenPosition(UDim2.new(0, 0, -1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.5, true);
						l__pcall__7(function()
							u98:Cancel();
						end);
						u98 = l__TweenService__17:Create(v34.Frame.ReloadFrame.Frame.Fill, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 2, true), {
							BackgroundColor3 = Color3.fromRGB(150,150,150)
						});
						u98:Play();
					end;
					spawn(function()
						for v137 = 1, 3 do
							spawn(u54);
							u18();
						end;
					end);
					if v23.ShotgunSettings.ShotgunReload then
						u18(0.5);
					end;
				else
					spawn(u85);
					spawn(u87);
				end;
				u58();
				u44:setcrossscale(1);

				u69 = false;
				_G.RL = false
				u68 = false;
				u97 = false;
			end;
		end;
		delay(0.25, function()
			u86 = false;
		end);
	end;
	function u42.Deactivate()
		u88 = false;
		if u76 then
			return;
		end;
		u92();
	end;
	spawn(function()
		local l__RightArm__138 = l__Character__24:FindFirstChild("Right Arm");
		local u99 = nil;
		local u100 = nil;
		local u101 = nil;
		local u102 = nil;
		local u103 = nil;
		local u104 = nil;
		local u105 = nil;
		local u106 = nil;
		local u107 = nil;
		local u108 = nil;
		local u109 = nil;
		local u110 = nil;
		local function u111()
			u42:Unequip();
			u42:Disconnect();
			u99:Disconnect();
			if u100 then
				u100:Disconnect();
			end;
			u101:Disconnect();
			u102:Disconnect();
			u103:Disconnect();
			u104:Disconnect();
			u105:Disconnect();
			u106:Disconnect();
			if u107 then
				u107:Disconnect();
			end;
			if u108 then
				u108:Disconnect();
			end;
			if u109 then
				u109:Disconnect();
			end;
			if u110 then
				u110:Disconnect();
			end;
			if u52 then
				u52:Disconnect();
			end;
			if u53 then
				u53:Disconnect();
			end;
		end;
		u99 = p9.AncestryChanged:Connect(function(p39, p40)
			local v139 = true;
			if not p9 or not p9.Parent then
				v139 = false;
			elseif not p39 or not p39.Parent then
				v139 = false;
			elseif not p40 then
				v139 = false;
			end;
			if not v139 then
				u111();
			end;
		end);
		if not l__RightArm__138 then
			u111();
		else
			u100 = l__RightArm__138.Changed:Connect(function()
				if not l__RightArm__138 or not l__RightArm__138.Parent or l__RightArm__138:FindFirstChild("Broken") then
					u111();
				end;
			end);
		end;
		u101 = l__Humanoid__27.Died:Connect(function()
			u111();
		end);
		local u112 = false;
		u102 = l__Humanoid__27.HealthChanged:Connect(function(p41)
			if u112 then
				return;
			end;
			if (p41 < 10 or not _G.CheckIfCan(l__Character__24)) and (u42.Equipped or u42.Equipping) then
				u112 = true;
				u42:Unequip();
				u18(0.25);
				u112 = false;
			end;
		end);
		u103 = l__Character__24.AncestryChanged:Connect(function(p42, p43)
			if not p43 then
				u111();
			end;
		end);
		u104 = l__Ammo__36.Changed:Connect(function()
			spawn(u54);
			u55("S1");
		end);
		u105 = l__StoredAmmo__37.Changed:Connect(function()
			spawn(u54);
		end);
		u106 = l__Handle__28.ChildAdded:Connect(function(p44)
			l__RunService__10.RenderStepped:Wait();
			if p44 and p44.Parent then
				if p44.Name == "TriggerA_Server" or p44.Name == "ReloadA_Clone_Server" or p44.Name == "EquipA_Clone_Server" then
					for v140, v141 in pairs(p44:GetChildren()) do
						if v141:IsA("Sound") then
							v141.Volume = 0;
							v141.Pitch = 0;
						end;
					end;
					return;
				elseif p44.Name == "FakeShell_Server" then
					p44.Transparency = 1;
					p44.Size = Vector3.new(0, 0, 0);
				end;
			end;
		end);
		if l__Handle__28:FindFirstChild("TriggerA_Server") then
			for v142, v143 in pairs(l__Handle__28:FindFirstChild("TriggerA_Server"):GetChildren()) do
				if v143:IsA("Sound") then
					v143.Volume = 0;
					v143.Pitch = 0;
				end;
			end;
		end;
		if _G.GVF ~= nil then
			u107 = _G.GVF().Crouching.Changed:Connect(function(p45)
				if u42.Equipping then
					u56 = p45;
					if p45 == true then
						u25 = v23.CrouchSpreadReduction;
					else
						u25 = 1;
					end;
					spawn(u57);
				end;
			end);
			u108 = _G.GVF().Sprinting.Changed:Connect(function(p46)
				u48 = p46;
				if u42.Equipping then
					u58();
				end;
			end);
			u109 = _G.GVF().RagdollTime.RagdollSwitch.Changed:Connect(function(p47)
				if p47 then
					u51(false);
				end;
			end);
		end;
		u110 = l__Humanoid__27.Running:Connect(function(p48)
			u46 = p48 > 1;
			if u42.Equipping then
				if p48 > 1 and not u69 then
					spawn(u59);
					u26 = v23.WalkSpreadIncrease;
				else
					u28 = 0;
					if v39 and v39.Parent then
						v39.Enabled = false;
					end;
					u26 = 1;
				end;
				spawn(u57);
			end;
		end);
	end);
	function u42.Disconnect(p49)
		u64 = true;
		if u30 then
			u30:Disconnect();
			u30 = nil;
		end;
		spawn(u85);
		u34:disconnect();
		u44:inactive();
		u44:setcrossscale(1);

		if _G.DCH then
			_G.DCH:connect();
		end
		u92(true);
		u51(false);
	end;
	if v23.SniperEnabled then
		u52 = l__RunService__10:BindToRenderStep("Scope", Enum.RenderPriority.First.Value, function(p50)
			if not u33 and u47 then
				spawn(u85);
			end;
			v42.knockback.t = v42.knockback.t:lerp(Vector3.new(), 0.2);
		end);
		local u113 = v41;
		u53 = l__RunService__10:BindToRenderStep("Mouse", Enum.RenderPriority.Input.Value, function()
			local v144 = l__UserInputService__16:GetMouseDelta() / v23.SniperSettings.ScopeSensitive;
			if u47 and l__UserInputService__16.MouseEnabled and l__UserInputService__16.KeyboardEnabled then
				v34.Scope.Position = UDim2.new(0, v42.scope.p.x + v42.knockback.p.y * 1000, 0, v42.scope.p.y + v42.knockback.p.x * 200);
				local v145 = v34.Scope.AbsoluteSize.x * 0.5;
				v42.scope.t = Vector3.new(l__mouse__21.x - v145 - v144.x, l__mouse__21.y - v145 - v144.y, 0);
				u113 = Vector2.new(l__mouse__21.x, l__mouse__21.y);
			elseif u47 and l__UserInputService__16.TouchEnabled and not l__UserInputService__16.MouseEnabled and not l__UserInputService__16.KeyboardEnabled then
				v34.Scope.Position = UDim2.new(0, v42.scope.p.x + v42.knockback.p.y * 1000, 0, v42.scope.p.y + v42.knockback.p.x * 200);
				local v146 = v34.Scope.AbsoluteSize.x * 0.5;
				v42.scope.t = Vector3.new(u44:GCH().AbsolutePosition.X - v146 - v144.x, u44:GCH().AbsolutePosition.Y - v146 - v144.y, 0);
				u113 = Vector2.new(u44:GCH().AbsolutePosition.X, u44:GCH().AbsolutePosition.Y);
			end;
			v34.Scope.Visible = u47;
		end);
	end;
	l__Events2__23.Hitmarker.Event:Connect(function(hit)
		if hit and hit.Parent:FindFirstChild("Humanoid") then
			local hs = (hit.Name == "Head")
			u44.hitmarker(hs, hs)
		end
	end)
	l__Events__3.GH_R.OnClientEvent:Connect(function()
		l__Ammo__36.Value = l__Ammo__36.MaxValue
		l__StoredAmmo__37.Value = l__StoredAmmo__37.MaxValue
	end)
	return u42;
end;

return v5;
