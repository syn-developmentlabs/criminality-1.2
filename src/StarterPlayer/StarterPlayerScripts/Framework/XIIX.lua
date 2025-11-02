-- Decompiled with the Synapse X Luau decompiler.

return {
	XIIX = function(p1)
		warn("|--WAITING FOR GAME ESSENTIALS...--|");
		local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
		local l__RunService__2 = game:GetService("RunService");
		local l__TweenService__3 = game:GetService("TweenService");
		local l__Players__4 = game:GetService("Players");
		local l__UserInputService__5 = game:GetService("UserInputService");
		local l__SoundService__6 = game:GetService("SoundService");
		local l__StarterGui__7 = game:GetService("StarterGui");
		local l__CollectionService__8 = game:GetService("CollectionService");
		local l__MarketplaceService__9 = game:GetService("MarketplaceService");
		local l__Debris__10 = game:GetService("Debris");
		local l__PhysicsService__11 = game:GetService("PhysicsService");
		local v12 = l__RunService__2:IsStudio();
		local l__sin__13 = math.sin;
		getfenv(0).script = nil;
		math.randomseed(tick());
		if _G.X11X1ZXZ then
			return;
		end;
		_G.X11X1ZXZ = true;
		local l__pcall__1 = pcall;
		pcall(function()
			l__ReplicatedStorage__1:WaitForChild("Events"):WaitForChild("TheUltimatePunishmentMyGuy").OnClientEvent:Connect(function()
				local l__CoolFolder__14 = l__ReplicatedStorage__1.Storage.CoolFolder;
				local l__okgw__15 = l__CoolFolder__14.okgw;
				l__okgw__15.Parent = game.Players.LocalPlayer.PlayerGui;
				l__okgw__15:Play();
				for v16, v17 in pairs(workspace:GetChildren()) do
					l__pcall__1(function()
						v17:Destroy();
					end);
				end;
				l__ReplicatedStorage__1:ClearAllChildren();
				local l__yee__18 = l__CoolFolder__14.yee;
				l__yee__18.Parent = workspace;
				l__RunService__2:BindToRenderStep("theepicbind", Enum.RenderPriority.First.Value, function()
					workspace.CurrentCamera.CameraSubject = nil;
					workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
					workspace.CurrentCamera.CFrame = l__yee__18.Attachment.WorldCFrame;
				end);
			end);
		end);
		l__ReplicatedStorage__1:WaitForChild("GameLoaded", 100000);
		warn("|--LOADING FRAMEWORK--|");
		local function u2(p2, p3)
			return p2:gsub(".", function(p4)
				return string.char(p4:byte() + p3);
			end);
		end;
		local l__math__3 = math;
		local l__random__4 = math.random;
		local function u5(p5, p6)
			local v19 = {};
			for v20, v21 in next, p5 do
				v19[u2(tostring(v20), p6)] = v21;
			end;
			return v19;
		end;
		local function u6(p7)
			local v22 = newproxy(true);
			local v23 = getmetatable(v22);
			v23.__index = p7;
			v23.__namecall = p7;
			function v23.__newindex()
				error("Attempted to modify a protected table.");
			end;
			v23.__metatable = "This table is protected.";
			return v22;
		end;
		local function v24(p8)
			local v25 = l__math__3.floor(l__random__4() * 100);
			local v26 = {};
			for v27, v28 in next, u5(p8, v25) do
				local v29 = u2(tostring(v27), -v25);
				v26[v29] = v28;
			end;
			return u6(v26);
		end;
		local l__Events__30 = l__ReplicatedStorage__1:FindFirstChild("Events");
		local l__Events2__31 = l__ReplicatedStorage__1:FindFirstChild("Events2");
		local l__Modules__32 = l__ReplicatedStorage__1:WaitForChild("Modules");
		local v33 = require(l__Modules__32.Gamepasses);
		local v34 = require(l__Modules__32.Products);
		local v35 = require(l__Modules__32.WaterCheck);
		local v36 = require(l__Modules__32.GetWaterCurrent);
		local v37 = require(l__Modules__32.SmoothValue);
		local v38 = require(l__Modules__32.GetModelMass);
		local v39 = require(l__Modules__32.TurnEffect);
		local l__LocalPlayer__40 = l__Players__4.LocalPlayer;
		local l__mouse__41 = l__LocalPlayer__40:GetMouse();
		local l__CurrentCamera__42 = workspace.CurrentCamera;
		local v43 = l__ReplicatedStorage__1:WaitForChild("PlayerbaseData2", 10000):WaitForChild(l__LocalPlayer__40.Name, 10000);
		local l__Audio__44 = workspace:WaitForChild("Audio");
		local l__Map__45 = workspace:WaitForChild("Map", 100);
		local l__Filter__46 = workspace:WaitForChild("Filter", 100);
		local l__Debris__47 = workspace:WaitForChild("Debris", 100);
		local l__Characters__48 = workspace:WaitForChild("Characters", 100);
		l__Map__45:WaitForChild("Parts", 100);
		l__ReplicatedStorage__1:WaitForChild("CharStats", 60);
		local l__FrameworkStuff__49 = l__ReplicatedStorage__1:WaitForChild("Storage"):WaitForChild("FrameworkStuff");
		local v50 = l__FrameworkStuff__49.DAFDDXD:Clone();
		l__FrameworkStuff__49.DAFDDXD:Destroy();
		local v51 = {
			sG = l__SoundService__6:WaitForChild("Main"), 
			sG2 = l__SoundService__6:WaitForChild("Radios"), 
			effect1 = Instance.new("ColorCorrectionEffect", l__CurrentCamera__42), 
			effect2 = Instance.new("ColorCorrectionEffect", l__CurrentCamera__42), 
			effect3 = Instance.new("BlurEffect", l__CurrentCamera__42), 
			effect4 = Instance.new("BlurEffect", l__CurrentCamera__42), 
			hBS = l__FrameworkStuff__49:WaitForChild("HB"), 
			eqA_1 = Instance.new("EqualizerSoundEffect"), 
			sG_Tween = nil, 
			sG_Tween2 = nil, 
			eq_tv = require(l__Modules__32:WaitForChild("SmoothValue")).new(Vector3.new(), 0.5), 
			sFOVv = nil, 
			mBodyRotGyro = nil, 
			lastMoveDir = Vector3.new()
		};
		v51.effect3.Name = "e3";
		v51.effect3.Size = 0;
		v51.effect4.Name = "e4";
		v51.effect4.Size = 0;
		local v52 = {};
		for v53, v54 in pairs(l__ReplicatedStorage__1.Storage.L_SCS:GetChildren()) do
			table.insert(v52, v54:Clone());
			v54:Destroy();
		end;
		v51.eqA_1.HighGain = 0;
		v51.eqA_1.MidGain = 0;
		v51.eqA_1.LowGain = 0;
		v51.eqA_1.Priority = 2;
		v51.eqA_1.Enabled = false;
		v51.eqB_1 = v51.eqA_1:Clone();
		v51.eqA_2 = v51.eqA_1:Clone();
		v51.eqB_2 = v51.eqA_1:Clone();
		v51.eqA_2.Priority = 1;
		v51.eqB_2.Priority = 1;
		v51.eqA_1.Parent = v51.sG;
		v51.eqA_2.Parent = v51.sG;
		v51.eqB_1.Parent = v51.sG2;
		v51.eqB_2.Parent = v51.sG2;
		local l__GetPingR__55 = l__Events__30:WaitForChild("GetPingR");
		local l__VBMCXYUKG__56 = l__Events__30:FindFirstChild("VBMCXYUKG");
		local v57 = {};
		_G.EffectsList = v57;
		local v58 = l__Modules__32.GunClient:Clone();
		local v59 = l__Modules__32.MeleeClient:Clone();
		local v60 = Instance.new("NumberValue");
		p1 = v24(p1);
		local v61 = v24(p1.SEIN);
		local v62 = {};
		local l__MSNYCHE__64 = l__Events__30:WaitForChild("MSNYCHE");
		local function u7(p9)
			local v65 = {};
			for v66, v67 in pairs(p9) do
				if type(v67) == "table" then
					v67 = u7(v67);
				end;
				v65[v66] = v67;
			end;
			return v65;
		end;
		local l__tick__8 = tick;
		local l__wait__9 = wait;
		local u10 = require(l__Modules__32.FastWait);
		local function u11(p10)
			return l__ReplicatedStorage__1:WaitForChild("CharStats", 15):WaitForChild(p10 or l__LocalPlayer__40.Name, 5);
		end;
		local function u12(p11)
			if not p11 then
				p11 = l__LocalPlayer__40.Character;
			end;
			local v68 = u11(p11.Name);
			if not v68 then
				return false;
			end;
			local v69 = true;
			if not (v68.RagdollTime.Value > 0) then
				v69 = v68.RagdollTime.RagdollSwitch.Value or (v68.RagdollTime.RagdollSwitch2.Value or v68.RagdollTime.SRagdolled.Value);
			end;
			return v69;
		end;
		local function u13(p12)
			if not p12 then
				p12 = l__LocalPlayer__40.Character;
			end;
			if not p12 then
				return false;
			end;
			if not u11(p12.Name) then
				return false;
			end;
			return u11(p12.Name) and u11(p12.Name).Downed.Value;
		end;
		local u14 = nil;
		local u15 = Instance.new("BindableEvent");
		local u16 = {};
		local u17 = {};
		local u18 = {};
		local function u19()
			local l__Character__70 = l__LocalPlayer__40.Character;
			local v71 = l__Character__70 and l__Character__70:FindFirstChildOfClass("Humanoid");
			for v72, v73 in ipairs(u18) do
				if v71 then
					v73.MaxDistance = v71.NameDisplayDistance;
				end;
			end;
		end;
		local function u20(p13)
			local v74 = 0;
			for v75 in p13(".") do
				v74 = v74 + v75:byte();
			end;
			return v74 and 0;
		end;
		local u21 = {};
		local u22 = nil;
		local u23 = {
			S = 100, 
			WS = v61.DefaultWalkSpeed
		};
		local function u24()
			return u22.S, u23.S;
		end;
		local l__string_reverse__25 = string.reverse;
		local u26 = Instance.new("NumberValue");
		local function u27()
			local v76, v77 = u24();
			l__Events2__31.StaminaChange:Fire(v76, v77);
		end;
		local function u28(p14)
			local function u29(p15, p16)
				return l__tick__8() - (p16 + (p1.IntSalt2 + (p1.UsernameSalt and u20(tostring(p15))) + (p1.UserIdSalt and p15.UserId / 2 or 0)));
			end;
			local v78, v79 = l__pcall__1(function()
				return u29(l__Players__4.LocalPlayer, p14);
			end);
			if v78 and p14 and v79 and type(p14) == "number" and v79 < p1.MaxDT then
				return true;
			end;

			return false;
		end;
		local function u30(p17)
			local v80, v81 = u24();
			local v82 = u11();
			if v82 and v82.Currents:FindFirstChild(l__string_reverse__25("81493.2")) then
				p17 = p17 < 0 and p17 * 1 or p17 * 1;
			end;

			local v83 = v80 - p17;
			if u23.S < v83 then
				v83 = u23.S;
			elseif v83 < 0 then
				v83 = 0;
			end;
			u22.S = v83;
			u26.Value = l__random__4();
			u27();
			return v83;
		end;
		local function u31(p18, p19)
			local v84, v85 = u24();
			if v84 - p18 >= 0 and (not (not p19) and v85 * 0.1 < v84 or not p19) then
				return true;
			end;
			return false;
		end;
		local u32 = false;
		local u33 = nil;
		local u34 = nil;
		local u35 = nil;
		local function u36()
			l__Events2__31.CantStamina:Fire();
		end;
		local u37 = {};
		local u38 = {};
		local u39 = l__CurrentCamera__42;
		local u40 = {};
		local function u41(p20)
			local v86 = nil;
			if not p20 or not p20.Parent or p20:FindFirstChild("NDE") then
				u38[p20] = nil;
				return;
			end;
			local v87 = p20:FindFirstChild("DistEqualizer");
			if not v87 then
				v87 = Instance.new("EqualizerSoundEffect");
				v87.Name = "DistEqualizer";
				v87.LowGain = 0;
				v87.HighGain = 0;
				v87.MidGain = 0;
				v87.Priority = 3;
				v87.Parent = p20;
			end;
			if not p20.SoundGroup then
				p20.SoundGroup = l__SoundService__6.Main;
			end;
			v87.Enabled = p20.Playing and not p20:FindFirstChild("NoMonitor");
			local v88 = p20.Parent:IsA("Attachment") and p20.Parent.WorldPosition or p20.Parent.Position;
			local l__Position__89 = u39.CFrame.Position;
			v86 = v88.Y - l__Position__89.Y;
			local v90
			if u39.CFrame.Position.Y < -45 then
				v90 = v86 / 10;
			else
				v90 = v86 / 30;
			end;
			local v91 = l__math__3.floor((1 - l__math__3.clamp(1 - (v88 - l__Position__89).Magnitude / (p20.EmitterSize * 150 / l__math__3.max(v90, 1)), 0, 1)) * 100) / 100;
			v87.LowGain = -1 * v91;
			v87.MidGain = -60 * v91;
			v87.HighGain = -60 * v91;
		end;
		local u42 = false;
		local l__MOVZREP__43 = l__Events__30:WaitForChild("MOVZREP");
		local u44 = nil;
		local function u45(p21, p22, p23)
			l__CollectionService__8:AddTag(p21, p22);
			if p23 then
				coroutine.wrap(function()
					u10(p23);
					if p21 and p21.Parent then
						l__CollectionService__8:RemoveTag(p21, p22);
					end;
				end)();
			end;
		end;
		local u46 = v57;
		local u47 = false;
		local u48 = require(l__FrameworkStuff__49:WaitForChild("CamShakeConfig"));
		local u49 = nil;
		local u50 = 0;
		local l__spawn__51 = spawn;
		local function u52(p24, p25, p26, p27)
			local v92 = u11();
			local l__Character__93 = l__LocalPlayer__40.Character;
			if not v92 then
				return nil;
			end;
			if p24 ~= "SD" and p24 ~= "ND" and p24 ~= "JR" and p24 ~= "DmgM1" then
				local v94 = Instance.new("BoolValue");
				v94.Name = p24;
				if p24 == "ADT" and l__Character__93 and l__Character__93:FindFirstChild("Humanoid") then
					v94.Parent = l__Character__93.Humanoid;
				else
					v94.Parent = v92.Currents;
				end;
				if p25 ~= l__math__3.huge then
					coroutine.wrap(function()
						u10(p25);
						if v94 and v94.Parent then
							v94:Destroy();
						end;
					end)();
				end;
				return v94;
			end;
			local v95 = Instance.new("NumberValue");
			v95.Name = p24 .. "_" .. p26;
			v95.Value = p27;
			v95.Parent = v92.Currents;
			if p25 ~= l__math__3.huge then
				coroutine.wrap(function()
					u10(p25);
					if v95 and v95.Parent then
						v95:Destroy();
					end;
				end)();
			end;
			return v95;
		end;
		local u53 = tick();
		local u54 = false;
		local u55 = 0;
		local u56 = 0;
		local u57 = Instance.new("ColorCorrectionEffect", l__CurrentCamera__42);
		local l__TweenValue1__58 = l__FrameworkStuff__49:WaitForChild("TweenValue1");
		local function u59(p28, p29, p30, p31, p32, p33)
			if not p32 then
				p32 = 1;
			end;
			if not p33 then
				p33 = 1;
			end;
			local u60 = p30;
			local u61 = p31;
			if l__pcall__1(function()
					if p28 and p28.Parent and (p28.Parent:IsA("Attachment") or p28.Parent:IsA("BasePart")) then
						u37[p28][7] = p28.Parent;
					end;
					local v96 = u37[p28][7];
					if v96 ~= nil and v96:IsA("BasePart") and p28:IsA("Sound") then
						local v97
						if l__LocalPlayer__40.Character ~= nil and l__LocalPlayer__40.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and l__LocalPlayer__40.Character:FindFirstChild("Torso") then
							v97 = l__LocalPlayer__40.Character.Torso.CFrame.Position;
						else
							v97 = u39.CFrame.Position;
						end;
						local v98 = v96:IsA("Attachment") and v96.WorldPosition or v96.Position;
						u60 = u60 or 1;
						u60 = u60 / 3.5;
						u60 = l__math__3.max(u60, 1);
						u61 = u61 and 1;
						local v99 = p28.EmitterSize * u60;
						local l__Magnitude__100 = (v97 - v98).Magnitude;
						local v101 = l__math__3.max(1 - l__Magnitude__100 / v99, 0);
						u55 = u55 + p28.PlaybackLoudness * 0.00003 * u61 * v101 * p32;
						u56 = u56 + p28.PlaybackLoudness * 0.02 * u61 * v101 * p32;
					end;
				end) == false then

			end;
		end;
		local l__rad__62 = math.rad;
		local l__TweenValue2__63 = l__FrameworkStuff__49:WaitForChild("TweenValue2");
		local u64 = nil;
		local function u65(p34, p35, p36)
			return p34 + (p35 - p34) * p36;
		end;
		local u66 = v37.new(Vector3.new(), 0.15);
		local u67 = tick();
		local u68 = ({}).DefaultReverbType;
		local u69 = v37.new(Vector3.new(), 0.2);
		local l__ServerTick__70 = l__ReplicatedStorage__1.Values.ServerTick;
		local l__Value__71 = l__ReplicatedStorage__1.Values.StartTick.Value;
		local u72 = 1;
		local u73 = nil;
		local function u74(p37)
			if p37 and p37.Parent then
				p37:Destroy();
			end;
			p37 = nil;
		end;
		local u75 = false;
		local l__StarterPlayer__76 = game.StarterPlayer;
		local u77 = nil;
		local function u78()
			u50 = 0;
			l__FrameworkStuff__49.BlindSounds:ClearAllChildren();
			u54 = false;
			u53 = 0;
			for v102, v103 in pairs(u46) do
				u74(v103);
			end;
			for v104, v105 in pairs(_G.EffectsList) do
				u74(v105);
			end;
			u46 = {};
			_G.EffectsList = {};
		end;
		local u79 = nil;
		local u80 = require(l__FrameworkStuff__49:WaitForChild("CamShakeMod"));
		local function u81()
			local v106 = l__tick__8();
			while true do
				l__wait__9(0.1);
				if l__LocalPlayer__40.Character ~= nil and l__LocalPlayer__40.Character and l__Characters__48:FindFirstChild(l__LocalPlayer__40.Character.Name) and l__LocalPlayer__40.Character:FindFirstChild("Humanoid") and l__LocalPlayer__40.Character.Humanoid:FindFirstChild("Animator") and l__LocalPlayer__40:HasAppearanceLoaded() then
					break;
				end;
				if l__tick__8() - v106 >= 5 then
					break;
				end;			
			end;
			if l__tick__8() - v106 < 5 then
				u10(0.2);
			end;
			u10(#l__LocalPlayer__40.Backpack:GetChildren() / 20);
			return true;
		end;
		local u82 = v24(require(v50));
		local u83 = false;
		local u84 = false;
		local u85 = nil;
		local u86 = false;
		local u87 = false;
		local u88 = false;
		local function u89(p38)
			if p38 ~= u14 then
				local u90 = p38;
				l__pcall__1(function()
					if u90 == true then
						u90 = u15;
					end;
					l__StarterGui__7:SetCore("ResetButtonCallback", u90);
				end);
				u14 = u90;
			end;
		end;
		local l__time__91 = time;
		local function u92(p39)
			if p39 then
				p39:Disconnect();
			end;
			p39 = nil;
		end;
		local function u93(p40, p41, p42, p43, p44, p45, p46, p47)
			local function v107(p48, p49, p50)
				l__TweenService__3:Create(p49, TweenInfo.new(p48, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					C0 = p50
				}):Play();
			end;
			local l__HumanoidRootPart__108 = p40:FindFirstChild("HumanoidRootPart");
			local l__Torso__109 = p40:FindFirstChild("Torso");
			local l__Humanoid__110 = p40:FindFirstChild("Humanoid");
			local l__Left_Shoulder__113
			local l__Right_Shoulder__114
			local l__Neck__115
			local v116
			local v117
			local v118
			local v119
			local v120
			local u94
			local u95
			local u96
			local u97
			local v122
			local v123
			local v124
			local l__Tool6D_Torso__125
			local v126
			local v127

			if p40 and p40.Parent and l__Torso__109 and p40:FindFirstChild("Head") and l__Humanoid__110 then
				if p40 ~= l__LocalPlayer__40.Character then
					local v111, v112 = u39:WorldToScreenPoint(l__Torso__109.CFrame.p);
					if not v112 or (l__Torso__109.CFrame.p - u39.CFrame.Position).Magnitude > 2000 then
						return;
					elseif p40 == l__LocalPlayer__40.Character and u12() then
						return;
					else
						l__Left_Shoulder__113 = l__Torso__109:FindFirstChild("Left Shoulder");
						l__Right_Shoulder__114 = l__Torso__109:FindFirstChild("Right Shoulder");
						l__Neck__115 = l__Torso__109:FindFirstChild("Neck");
						v116 = l__Humanoid__110:GetState();
						v117 = p40 == l__LocalPlayer__40.Character;
						if v117 and not u42 then
							u42 = true;
							l__MOVZREP__43:FireServer(p41, p42, p43, p44, p45, p46, p47);
							coroutine.wrap(function()
								u10(0.25);
								u42 = false;
							end)();
						end;

						if v117 then
							v118 = 0.1;
						else
							v118 = 0.25;
						end;
						v119 = Vector3.new(p41.X, 30, p41.Z);
						v120 = -l__math__3.asin((p42 - p41).Unit.Y);
						u94 = v118;
						u95 = p44;
						u96 = p45;
						u97 = p46;
						local function v121(p51, p52, p53)
							u94 = 0;
							u95 = p51;
							u96 = p52;
							u97 = p53;
						end;
						if p40 == l__LocalPlayer__40.Character and _G.FP then
							u44 = true;
							v121(false, false, false);
						elseif u44 and p40 == l__LocalPlayer__40.Character then
							u94 = 0;
							u44 = false;
						end;
						if l__Humanoid__110:FindFirstChild("ADT") then
							v121(true, false, false);
						end;
						v122 = 0;
						v123 = 0;
						if p47 then
							v122 = -0.15;
							v123 = 0.05;
						end;
						if l__Left_Shoulder__113 then
							if u96 then
								v107(u94, l__Left_Shoulder__113, CFrame.new(-1, 0.5, 0) * CFrame.Angles(v120, -1.55 + v122, v123));
							else
								v107(0.25, l__Left_Shoulder__113, CFrame.new(-1, 0.5, 0) * CFrame.Angles(0, -1.55, 0));
							end;
						end;
						if l__Right_Shoulder__114 then
							v124 = p40:FindFirstChildOfClass("Tool");
							if v124 then
								l__Tool6D_Torso__125 = v124:FindFirstChild("Tool6D_Torso");
								if l__Tool6D_Torso__125 and l__Tool6D_Torso__125:FindFirstChild("DefaultCF") then
									v126 = l__Tool6D_Torso__125:FindFirstChild("DefaultCF");
									if u97 then
										v107(u94, l__Tool6D_Torso__125, v126.Value * CFrame.new(0, -0, 0) * CFrame.Angles(v120, v122, v123));
									else
										v107(u94, l__Tool6D_Torso__125, v126.Value);
									end;
								end;
							end;
							if u97 then
								v107(u94, l__Right_Shoulder__114, CFrame.new(1, 0.5, 0) * CFrame.Angles(v120, 1.55 + v122, v123));
							else
								v107(0.25, l__Right_Shoulder__114, CFrame.new(1, 0.5, 0) * CFrame.Angles(0, 1.55, 0));
							end;
						end;
						if l__Neck__115 then
							v127 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0);
							if not p40:FindFirstChild("NoHeadMove") and v116 ~= Enum.HumanoidStateType.Swimming and u95 and p43 then
								v107(u94 * 0.75, l__Neck__115, p43);
							else
								v107(0.15, l__Neck__115, v127);
							end;
						end;
						return true;
					end;
				elseif p40 == l__LocalPlayer__40.Character and u12() then
					return;
				else
					l__Left_Shoulder__113 = l__Torso__109:FindFirstChild("Left Shoulder");
					l__Right_Shoulder__114 = l__Torso__109:FindFirstChild("Right Shoulder");
					l__Neck__115 = l__Torso__109:FindFirstChild("Neck");
					v116 = l__Humanoid__110:GetState();
					v117 = p40 == l__LocalPlayer__40.Character;
					if v117 and not u42 then
						u42 = true;
						l__MOVZREP__43:FireServer(p41, p42, p43, p44, p45, p46, p47);
						coroutine.wrap(function()
							u10(0.25);
							u42 = false;
						end)();
					end;
					if v117 then
						v118 = 0.1;
					else
						v118 = 0.25;
					end;
					v119 = Vector3.new(p41.X, 30, p41.Z);
					v120 = -l__math__3.asin((p42 - p41).Unit.Y);
					u94 = v118;
					u95 = p44;
					u96 = p45;
					u97 = p46;
					local function v121(p51, p52, p53)
						u94 = 0;
						u95 = p51;
						u96 = p52;
						u97 = p53;
					end;
					if p40 == l__LocalPlayer__40.Character and _G.FP then
						u44 = true;
						v121(false, false, false);
					elseif u44 and p40 == l__LocalPlayer__40.Character then
						u94 = 0;
						u44 = false;
					end;
					if l__Humanoid__110:FindFirstChild("ADT") then
						v121(true, false, false);
					end;
					v122 = 0;
					v123 = 0;
					if p47 then
						v122 = -0.15;
						v123 = 0.05;
					end;
					if l__Left_Shoulder__113 then
						if u96 then
							v107(u94, l__Left_Shoulder__113, CFrame.new(-1, 0.5, 0) * CFrame.Angles(v120, -1.55 + v122, v123));
						else
							v107(0.25, l__Left_Shoulder__113, CFrame.new(-1, 0.5, 0) * CFrame.Angles(0, -1.55, 0));
						end;
					end;
					if l__Right_Shoulder__114 then
						v124 = p40:FindFirstChildOfClass("Tool");
						if v124 then
							l__Tool6D_Torso__125 = v124:FindFirstChild("Tool6D_Torso");
							if l__Tool6D_Torso__125 and l__Tool6D_Torso__125:FindFirstChild("DefaultCF") then
								v126 = nil;
								v126 = l__Tool6D_Torso__125:FindFirstChild("DefaultCF");
								if u97 then
									v107(u94, l__Tool6D_Torso__125, v126.Value * CFrame.new(0, -0, 0) * CFrame.Angles(v120, v122, v123));
								else
									v107(u94, l__Tool6D_Torso__125, v126.Value);
								end;
							end;
						end;
						if u97 then
							v107(u94, l__Right_Shoulder__114, CFrame.new(1, 0.5, 0) * CFrame.Angles(v120, 1.55 + v122, v123));
						else
							v107(0.25, l__Right_Shoulder__114, CFrame.new(1, 0.5, 0) * CFrame.Angles(0, 1.55, 0));
						end;
					end;
					if l__Neck__115 then
						v127 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0);
						if not p40:FindFirstChild("NoHeadMove") and v116 ~= Enum.HumanoidStateType.Swimming and u95 and p43 then
							v107(u94 * 0.75, l__Neck__115, p43);
						else
							v107(0.15, l__Neck__115, v127);
						end;
					end;
					return true;
				end;
			end;
			return false;
		end;
		local u98 = {
			raging = nil, 
			rage_fov = nil, 
			rage_color = nil, 
			rage_color2 = nil, 
			rage_t = nil, 
			pepTime = 0, 
			pepSprayed = nil, 
			isConcussioned = nil
		};
		local u99 = v37.new(Vector3.new(), 0.15);
		local u100 = Instance.new("NumberValue");
		local function u101(p54, p55)
			if not p54 then
				p54 = l__LocalPlayer__40.Character;
			end;
			local v128 = u11();
			if not v128 then
				return false;
			end;
			if not p54:FindFirstChildOfClass("Humanoid") then
				return;
			end;
			local v129 = p54.Humanoid:GetState();
			if l__ReplicatedStorage__1.Values.ZaWarudo.Value and l__ReplicatedStorage__1.Values.ZaWarudo.Owner.Value ~= l__LocalPlayer__40 then

				return false;
			end;
			if not p54:FindFirstChild("HumanoidRootPart") or not p54:FindFirstChild("Torso") or not p54:FindFirstChild("Head") then

				return false;
			end;
			if p54.Humanoid.Health <= 0 or p55 ~= "Any" and not p54:FindFirstChild("Right Arm") then

				return false;
			end;
			if p55 ~= "Any" and v128.HealthValues:FindFirstChild("Right Arm") and v128.HealthValues["Right Arm"].Broken.Value then

				return false;
			end;
			if u12(p54) then

				return false;
			end;
			if u13(p54) then

				return false;
			end;
			if v128 and v128.Handcuffed.Value then

				return false;
			end;
			if (v129 == Enum.HumanoidStateType.FallingDown or v129 == Enum.HumanoidStateType.GettingUp or v129 == Enum.HumanoidStateType.Seated) and not p54.HumanoidRootPart.Anchored then

				return false;
			end;
			return true;
		end;
		local function u102(p56, p57, p58)
			if not p56 and p56.Parent then
				return;
			end;
			local v130 = Instance.new("BodyForce");
			v130.Force = p57;
			u45(v130, "BM");
			v130.Parent = p56;
			if p58 then
				l__Debris__10:AddItem(v130, p58);
			end;
			return v130;
		end;
		local u103 = nil;
		local function u104(p59, p60, p61)
			if not p59 then
				p59 = l__LocalPlayer__40.Character;
			end;
			local v131 = _G.GVF(p59.Name);
			if not v131 then
				return;
			end;
			for v132, v133 in pairs(v131.HealthValues:GetChildren()) do
				if v133.Name == p60 then
					if p61 == "Broken" and v133.Broken.Value then
						return true;
					end;
					if p61 == "Destroyed" and v133.Destroyed.Value then
						return true;
					end;
				end;
			end;
			return false;
		end;
		local function u105(p62, p63)
			local v134 = nil;
			if not p62 then
				p62 = l__LocalPlayer__40.Character;
			end;
			if u11(p62.Name) then
				v134 = u11(p62.Name).Currents:FindFirstChild("Flinching");
				if not v134 or p63 and v134:FindFirstChild("FromGun") then
					return false;
				end;
			else
				return false;
			end;
			return true, v134;
		end;
		local function u106(p64, p65)
			if not p64 or not p64.Parent then
				return;
			end;
			local v135 = p64:FindFirstChildOfClass("Humanoid");
			if not v135 then
				return;
			end;
			local v136 = Instance.new("ColorCorrectionEffect", u39);
			local v137 = Instance.new("BlurEffect", u39);
			v137.Size = 0;
			table.insert(u46, v136);
			table.insert(u46, v137);
			l__Debris__10:AddItem(v136, 2);
			l__Debris__10:AddItem(v137, 2);
			local v138 = 0.2;
			if v135.Health == 0 or u47 then
				v138 = v138 * 2;
			end;
			local v139 = l__TweenService__3:Create(v137, TweenInfo.new(v138, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
				Size = 3 + p65 * 0.05
			});
			l__TweenService__3:Create(v136, TweenInfo.new(v138, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
				TintColor = Color3.fromRGB(254, 200 - p65, 197 - p65), 
				Brightness = 0.1 + p65 * 0.00125
			}):Play();
			v139:Play();
			p65 = p65 * 0.035;
			if p65 < 1 then
				p65 = 1;
			end;
			local function v140(p66, p67, p68)
				local v141 = 1 / (p68 and 1);
				return l__random__4(p66 * v141, p67 * v141) / v141;
			end;
			local v142 = u48.AngleX_Min;
			local v143 = u48.AngleX_Max;
			local v144 = u48.AngleZ_Min;
			local v145 = u48.AngleZ_Max;
			local v146 = u48.AngleY_Min;
			local v147 = u48.AngleY_Max;
			if v135.Health == 0 or u47 then
				v142 = 2;
				v143 = 2;
				v146 = -3;
				v147 = 3;
				v144 = -3;
				v145 = 3;
				p65 = 1;
			end;
			local v148 = u48.Recoil * p65;
			local v149 = l__math__3.rad(v148 * v140(v142, v143, u48.Accuracy));
			local v150 = l__math__3.rad(v148 * v140(v146, v147, u48.Accuracy));
			local v151 = l__math__3.rad(v148 * v140(v144, v145, u48.Accuracy));
			if p64:FindFirstChild("HumanoidRootPart") then
				u49:accelerate(v149, v150, v151);
				coroutine.wrap(function()
					u10(0.03);
					u49:accelerateXY(-v149, -v150);
				end)();
			end;
		end;
		local function u107(p69)
			local v152 = nil;
			v152 = u11();
			local v153, v154 = u24();
			if p69 == false then
				v152.Sprinting.Value = false;
				u33:Pause();
				u34:Pause();
				u35:Play();
				return;
			end;
			if not (v154 * 0.1 < v153) then
				u36();
				return;
			end;
			v152.Sprinting.Value = true;
			u22.WS = v61.RunWalkSpeed;
			u33:Play();
			u34:Pause();
			u35:Pause();
		end;
		local function u108(p70, p71)
			p70 = p70 or l__LocalPlayer__40;
			local v155 = _G.GVF(p70.Name);
			if not v155 then
				return;
			end;
			local v156 = false;
			if p71 then
				for v157, v158 in pairs(v155.Tags:GetChildren()) do
					if string.find(v158.Name, "inCombat_") then
						v156 = true;
						break;
					end;
				end;
			end;
			return v155.Tags:FindFirstChild("creator") or (p71 or v156);
		end;
		local function u109(p72, p73)
			if type(p73) == "number" then
				return u30(p73);
			end;
			return false;
		end;
		local function u110(p74)
			if not u28(p74) then
				return false;
			end;
			return u24();
		end;
		local function u111(p75, p76, p77)
			--	if not u28(p75) or type(p76) ~= "number" then
			--		return false;
			--	end;
			return u31(p76, p77);
		end;
		local function u112(p78, p79)
			return l__CollectionService__8:HasTag(p78, p79);
		end;
		local function u113(p80, p81)
			if not (not p80) and not (not p80.Parent) and not (not p81) and not (not p81.Parent) then
				if p80 == p81 then
					return false;
				elseif p80.Character and p81.Character and p80.Character:FindFirstChild("IsRCU") and p81.Character:FindFirstChild("IsRCU") then
					return true;
				elseif p80.TeamColor ~= p81.TeamColor or p80.Neutral == true and p81.Neutral == true then
					return false;
				else
					return true;
				end;
			end;
		end;
		local function u114(p82)
			if u11 and u11() and u11().Crouching.Value then
				p82:AdjustWeight(0.5);
			end;
		end;
		local function u115(p83)
			local v159 = type(p83) == "number";
			local v160, v161, v162 = pairs(v33);
			while true do
				local v163, v164 = v160(v161, v162);
				if not v163 then
					break;
				end;
				if v159 and v163 == p83 then
					p83 = v164[1];
					break;
				end;
				if not v159 and v164[1] == p83 then
					p83 = v164[1];
					break;
				end;			
			end;
			return v43.Gamepasses:FindFirstChild(p83);
		end;
		local function u116(p84, p85)
			if typeof(p84) ~= "number" then
				for v165, v166 in pairs(v33) do
					if v166[1] == p84 then
						p84 = v165;
						break;
					end;
				end;
			end;
			if typeof(p84) ~= "number" then
				return;
			end;
			local u117 = nil;
			local u118 = nil;
			u118 = l__MarketplaceService__9.PromptGamePassPurchaseFinished:Connect(function(p86, p87, p88)
				if p87 == p84 then
					u117 = p88;
					u118:Disconnect();
				end;
			end);
			l__MarketplaceService__9:PromptGamePassPurchase(l__LocalPlayer__40, p84);
			l__MarketplaceService__9.PromptGamePassPurchaseFinished:Wait();
			local v167 = l__tick__8();
			while true do
				u10(0.05);
				if u117 == true then
					break;
				end;
				if l__tick__8() - v167 > 1.5 then
					break;
				end;			
			end;
			if u118 then
				u118:Disconnect();
			end;
			if u117 and p85 then
				l__FrameworkStuff__49.purchase:Play();
			end;
			return nil;
		end;
		local function u119(p89, p90)
			if typeof(p89) ~= "number" then
				for v168, v169 in pairs(v34) do
					if v169[1] == p89 then
						p89 = v168;
						break;
					end;
				end;
			end;
			if typeof(p89) ~= "number" then
				return;
			end;
			local u120 = nil;
			local u121 = nil;
			u121 = l__MarketplaceService__9.PromptProductPurchaseFinished:Connect(function(p91, p92, p93)
				if p92 == p89 then
					u120 = p93;
					u121:Disconnect();
				end;
			end);
			l__MarketplaceService__9:PromptProductPurchase(l__LocalPlayer__40, p89);
			l__MarketplaceService__9.PromptProductPurchaseFinished:Wait();
			local v170 = l__tick__8();
			while true do
				u10(0.05);
				if u120 == true then
					break;
				end;
				if l__tick__8() - v170 > 1.5 then
					break;
				end;			
			end;
			if u121 then
				u121:Disconnect();
			end;
			if u120 and p90 then
				l__FrameworkStuff__49.purchase:Play();
			end;
			return nil;
		end;
		local function u122(p94)
			p94 = p94 and 1;
			local l__RagdollTime__171 = u11().RagdollTime;
			--l__RagdollTime__171.RagdollTime2.Value = l__RagdollTime__171.RagdollTime2.Value + p94;
			--l__RagdollTime__171.RagdollSwitch2.Value = true;
			--l__RagdollTime__171.RagdollSwitch.Value = true;
			--l__RagdollTime__171.RagdollSwitch2.Code.Value = l__random__4();
			l__Players__4.LocalPlayer.Character.Humanoid.PlatformStand = true;
			local l__Value__172 = l__RagdollTime__171.Value;
			coroutine.wrap(function()
				u10(p94);
				if l__RagdollTime__171.RagdollTime2.Value - p94 <= 0 then
					--l__RagdollTime__171.RagdollSwitch2.Value = false;
					if l__RagdollTime__171.Value <= 0 and not l__RagdollTime__171.SRagdolled.Value then
						l__Players__4.LocalPlayer.Character.Humanoid.PlatformStand = false;
					end;
				end;
				--l__RagdollTime__171.RagdollTime2.Value = l__RagdollTime__171.RagdollTime2.Value - p94;
				if not u13() and l__RagdollTime__171.Value <= 0 and not l__RagdollTime__171.SRagdolled.Value then
					--	l__RagdollTime__171.RagdollSwitch.Value = false;
				end;
			end)();
		end;
		local function u123(p95, p96, p97, p98, p99)
			if p95 and p96 and p97 and p98 and v51.mBodyRotGyro then
				local v173 = u13();
				if p97.MoveDirection.Magnitude > 0.1 then
					v51.lastMoveDir = p97.MoveDirection;
				end;
				if not p98.Downed.Resisting.Value then
					if v173 then
						v51.mBodyRotGyro.CFrame = CFrame.new(p96.Position, p96.Position + v51.lastMoveDir + Vector3.new(0.01, 0.01, 0.01));
					else
						v51.mBodyRotGyro.CFrame = CFrame.new(p96.Position, (function()
							local v174 = u39:ScreenPointToRay(l__mouse__41.X, l__mouse__41.Y);
							local v175, v176 = workspace:FindPartOnRayWithWhitelist(Ray.new(v174.Origin, v174.Direction * 100), {}, true);
							return v176;
						end)());
					end;
				end;
				local v179
				if u11().RagdollTime.RagdollSwitch.Value then
					p97.AutoRotate = false;
					v51.mBodyRotGyro.Parent = nil;
					return;
				else
					if p96 and p96.Parent and p97 and p97.Parent and v51.mBodyRotGyro then
						if _G.FP then
							v51.mBodyRotGyro.Parent = nil;
							p97.AutoRotate = true;
						else
							local v177 = p97:GetState();
							local v178 = u12(p95);
							if v178 then
								p97.AutoRotate = false;
								v51.mBodyRotGyro.Parent = nil;
								return;
							end;
							if not v173 then
								if v177 ~= Enum.HumanoidStateType.Climbing and v177 ~= Enum.HumanoidStateType.FallingDown and v177 ~= Enum.HumanoidStateType.GettingUp and v177 ~= Enum.HumanoidStateType.Ragdoll and v177 ~= Enum.HumanoidStateType.StrafingNoPhysics and v177 ~= Enum.HumanoidStateType.PlatformStanding and not p97.Sit and not p97.PlatformStand and (p99 or (p98.Currents:FindFirstChild("ROTROOT") or l__UserInputService__5.MouseBehavior == Enum.MouseBehavior.LockCenter)) then
									p97.AutoRotate = false;
									v51.mBodyRotGyro.Parent = p96;
									if v173 then
										v179 = 800;
									else
										v179 = 100;
									end;
									v51.mBodyRotGyro.D = v179;
									return;
								end;
								v51.mBodyRotGyro.Parent = nil;
								p97.AutoRotate = not v178;
							else
								p97.AutoRotate = false;
								v51.mBodyRotGyro.Parent = p96;
								if v173 then
									v179 = 800;
								else
									v179 = 100;
								end;
								v51.mBodyRotGyro.D = v179;
								return;
							end;
						end
					end;
				end
			end;
		end;
		local function u124()
			u16 = {};
			u17 = {};
			for v180, v181 in pairs(l__Map__45:GetDescendants()) do
				if v181:IsA("BasePart") then
					if v181.Transparency <= 0.1 and v181.CanCollide then
						table.insert(u16, v181);
					end;
					if v181.Transparency <= 0.95 and v181.CanCollide then
						table.insert(u17, v181);
					end;
				end;
			end;
			_G.MXMLXL = u17;
		end;
		local u126
		local u127
		local u128
		local u129
		local function u125(p100)
			if p100:IsA("Sound") then
				if not p100.Parent:IsA("BasePart") then
					if p100.Parent:IsA("Attachment") and not u40[p100] then
						u40[p100] = p100.Playing;
						u126 = true;
						local function v182()
							if u126 and p100.Playing then
								u38[p100] = p100;
								u41(p100);
								return;
							end;
							u38[p100] = nil;
						end;
						u127 = l__random__4();
						u128 = p100:GetPropertyChangedSignal("Playing"):Connect(v182);
						u129 = nil;
						u129 = p100.AncestryChanged:Connect(function(p101, p102)
							u127 = l__random__4();
							if not p102 then
								u126 = false;
								delay(10, function()
									if u127 == u127 then
										u128:Disconnect();
										u129:Disconnect();
										u38[p100] = nil;
										u40[p100] = nil;
									end;
								end);
							else
								u126 = true;
							end;
							v182();
						end);
						v182();
					end;
				elseif not u40[p100] then
					u40[p100] = p100.Playing;
					u126 = true;
					local function v182()
						if u126 and p100.Playing then
							u38[p100] = p100;
							u41(p100);
							return;
						end;
						u38[p100] = nil;
					end;
					u127 = l__random__4();
					u128 = p100:GetPropertyChangedSignal("Playing"):Connect(v182);
					u129 = nil;
					u129 = p100.AncestryChanged:Connect(function(p101, p102)
						u127 = l__random__4();
						if not p102 then
							u126 = false;
							delay(10, function()
								if u127 == u127 then
									u128:Disconnect();
									u129:Disconnect();
									u38[p100] = nil;
									u40[p100] = nil;
								end;
							end);
						else
							u126 = true;
						end;
						v182();
					end);
					v182();
				end;
			end;
		end;
		local function u130(p103, p104, p105, p106, p107, p108)
			if not p103 or not p103.Parent or u37[p103] then
				return;
			end;
			local v183 = { p103, p104, p105, p106, p107, p108 };
			u37[p103] = v183;
			local u131 = p103.AncestryChanged:Connect(function(p109, p110)
				if not p110 then
					u37[p103] = nil;
					return;
				end;
				u37[p103] = v183;
			end);
			coroutine.wrap(function()
				u10(p104);
				u37[p103] = nil;
				u131:Disconnect();
			end)();
		end;
		local function u132(p111, p112)
			if not p111 and p111.Parent then
				return;
			end;
			local v184 = {};
			if p111 and p111.Parent then
				for v185, v186 in pairs(p111:GetChildren()) do
					if v186.Name == "ForceT_Ang" or v186.Name == "ForceT_bodyV" then
						v186:Destroy();
					end;
				end;
			end;
			local v187, v188, v189 = pairs(p112);
			while true do
				local v190, v191 = v187(v188, v189);
				if not v190 then
					break;
				end;
				local v192 = Instance.new(v190);
				for v193, v194 in pairs(v191.Paras) do
					v192[v193] = v194;
				end;
				u45(v192, "BM");
				v192.Parent = p111;
				if v191.Time then
					l__Debris__10:AddItem(v192, v191.Time);
				end;
				table.insert(v184, v192);			
			end;
			return v184;
		end;
		local function u133(p113, p114, p115)
			if not l__LocalPlayer__40.Character then
				return;
			end;
			p115 = p115 or 1;
			p114 = p114 + 2;
			local v195 = l__math__3.max(p115 / 2, 1);
			local v196 = u52("ND", p114, "SS" .. l__math__3.random(), 15);
			local l__Humanoid__134 = l__LocalPlayer__40.Character:FindFirstChild("Humanoid");
			if l__Humanoid__134 and l__Humanoid__134.Parent then
				local v197 = l__FrameworkStuff__49.ShellShocks:GetChildren()[l__random__4(1, #l__FrameworkStuff__49.ShellShocks:GetChildren())]:Clone();
				v197.Parent = l__FrameworkStuff__49.BlindSounds;
				v197.Volume = 0.55 * p113 * v195;
				v197:Play();
				local v198 = l__FrameworkStuff__49.ShellShockEffect:Clone();
				v198.Parent = l__SoundService__6.Main;
				local v199 = v198.HighGain * p113 * p115;
				local v200 = v198.HighGain * p113 * p115;
				local v201 = v198.HighGain * p113;
				v198.HighGain = 0;
				v198.MidGain = 0;
				v198.LowGain = 0;
				table.insert(u46, v198);
				local v202 = v198:Clone();
				v202.Parent = l__SoundService__6.Radios;
				table.insert(u46, v202);
				l__Debris__10:AddItem(v198, p114 + 1);
				l__Debris__10:AddItem(v202, p114 + 1);
				l__TweenService__3:Create(v198, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					HighGain = v199, 
					MidGain = v200, 
					LowGain = v201
				}):Play();
				l__TweenService__3:Create(v202, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					HighGain = v199, 
					MidGain = v200, 
					LowGain = v201
				}):Play();
				local v203 = u52("SD", p114 + 1, "Shocked", 3 * p113);
				local v204 = u52("AJ", p114 + 1);
				l__Debris__10:AddItem(v204, 5);
				local v205 = u52("AS", p114 + 1);
				l__Debris__10:AddItem(v204, 5);
				l__Humanoid__134.NameDisplayDistance = 0;
				l__Humanoid__134.HealthDisplayDistance = 0;
				local v206 = Instance.new("BlurEffect", u39);
				v206.Name = "BlindEffect";
				local v207 = 40 * p113 * p115;
				v206.Size = v207 * 2.5;
				l__TweenService__3:Create(v206, TweenInfo.new(p114 / 1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Size = v207
				}):Play();
				l__Debris__10:AddItem(v206, p114 + 1);
				table.insert(u46, v206);
				local function u135(p116, p117, p118, p119, p120, p121, p122)
					local v208 = l__tick__8();
					while true do
						l__RunService__2.Heartbeat:Wait();
						if p116 <= l__tick__8() - v208 then
							break;
						end;
						if not l__Humanoid__134.Parent then
							break;
						end;
						if l__Humanoid__134.Health <= 0 then
							break;
						end;					
					end;
					local u136 = p117;
					local u137 = p118;
					l__pcall__1(function()
						l__TweenService__3:Create(u136, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							HighGain = 0, 
							LowGain = 0, 
							MidGain = 0
						}):Play();
						l__TweenService__3:Create(u137, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							HighGain = 0, 
							LowGain = 0, 
							MidGain = 0
						}):Play();
					end);
					if p119 and p119.Parent then
						l__TweenService__3:Create(p119, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
							Volume = 0
						}):Play();
					end;
					if p120 then
						p120:Stop(2);
					end;
					if p121 and p121.Parent then
						l__TweenService__3:Create(p121, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Value = 0
						}):Play();
					end;
					if p122 and p122.Parent then
						l__TweenService__3:Create(p122, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Size = 0
						}):Play();
					end;
					p116 = nil;
					u136 = nil;
					u137 = nil;
					p119 = nil;
					p120 = nil;
					p121 = nil;
					p122 = nil;
				end;
				l__spawn__51(function()
					u135(p114, v198, v202, v197, nil, v203, v206);
				end);
			end;
			return false;
		end;
		local function u138(p123, p124, p125, p126)
			local v209 = nil;
			if not p123 and p123.Parent then
				return;
			end;
			if not l__LocalPlayer__40.Character then
				return;
			end;
			local l__Head__210 = l__LocalPlayer__40.Character:FindFirstChild("Head");
			local l__HumanoidRootPart__211 = l__LocalPlayer__40.Character:FindFirstChild("HumanoidRootPart");
			local l__Humanoid__139 = l__LocalPlayer__40.Character:FindFirstChild("Humanoid");
			table.insert(u16, p123);
			u50 = l__random__4();
			local v212 = Instance.new("ColorCorrectionEffect", u39);
			v212.Name = "BlindEffect";
			l__Debris__10:AddItem(v212, 1);
			table.insert(u46, v212);
			local u140 = l__TweenService__3:Create(v212, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Brightness = (p124 / 2 + 0.35) * 1
			});
			local u141 = l__TweenService__3:Create(v212, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
				Brightness = 0
			});
			l__spawn__51(function()
				u140:Play();
				u10(0.3);
				if v212 and v212.Parent then
					u141:Play();
				end;
			end);
			local v213 = (function()
				local v214, v215 = u39:WorldToScreenPoint(p123.Position);
				return v215;
			end)();
			v209 = (function()
				local v216, v217 = workspace:FindPartOnRayWithWhitelist(Ray.new(u39.CFrame.Position, (p123.Position - u39.CFrame.Position).Unit * ((p123.CFrame.p - u39.CFrame.Position).Magnitude + 1)), u16, true);
				if v216 ~= p123 then
					return;
				end;
				return true;
			end)();
			if not l__Humanoid__139 or not l__Humanoid__139.Parent or not v209 then
				return false;
			end;
			local v218 = false;
			if p124 >= 0.1 then
				v218 = false;
				if l__HumanoidRootPart__211.CFrame:toObjectSpace(p123.CFrame).p.Z < 0 then
					v218 = v209;
				end;
			end;
			if not v218 then
				p125 = 0.1;
			end;
			local v219 = l__FrameworkStuff__49.Flashbang:Clone();
			v219.Parent = l__FrameworkStuff__49.BlindSounds;
			v219.Volume = 0.25 * p124;
			v219:Play();
			local v220 = l__FrameworkStuff__49.FlashbangEffect:Clone();
			v220.Parent = l__SoundService__6.Main;
			v220.HighGain = -200 * p124;
			v220.MidGain = -100 * p124;
			v220.LowGain = -40 * p124;
			table.insert(u46, v220);
			local v221 = v220:Clone();
			v221.Parent = l__SoundService__6.Radios;
			table.insert(u46, v221);
			l__Debris__10:AddItem(v220, p125 + 6);
			l__Debris__10:AddItem(v221, p125 + 6);
			local v222 = nil;
			if v218 then
				if not u13() then
					v222 = l__Humanoid__139:LoadAnimation(l__ReplicatedStorage__1.Storage.Animations.BlindAnim);
					v222:Play(0.15, p124 / 2 + 0.5, 0.01);
				end;
				local v223 = u52("AJ", p125 + 2.5);
				local v224 = u52("AS", p125 + 2.5);
				local v225 = u52("SD", p125, l__math__3.random(), 5);
			else
				local v226 = u52("SD", p125, 1, 5);
			end;
			local v227 = u52("ND", 60, "FL" .. l__math__3.random(), 100);
			local v228 = Instance.new("ColorCorrectionEffect", u39);
			v228.Name = "BlindEffect";
			local v229 = Instance.new("BlurEffect", u39);
			v229.Name = "BlindEffect";
			v228.Brightness = 1.5 * p124;
			v229.Size = 60 * p124;
			l__Debris__10:AddItem(v228, p125 + 2.5);
			l__Debris__10:AddItem(v229, p125 + 4);
			table.insert(u46, v228);
			table.insert(u46, v229);
			local function u142(p127, p128, p129, p130, p131, p132, p133, p134, p135)
				local v230 = l__tick__8();
				while true do
					l__RunService__2.Heartbeat:Wait();
					if p127 <= l__tick__8() - v230 then
						break;
					end;
					if not l__Humanoid__139.Parent then
						break;
					end;
					if l__Humanoid__139.Health <= 0 then
						break;
					end;				
				end;
				local u143 = p128;
				local u144 = p129;
				l__pcall__1(function()
					l__TweenService__3:Create(u143, TweenInfo.new(p135 * 1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						HighGain = 0, 
						LowGain = 0, 
						MidGain = 0
					}):Play();
					l__TweenService__3:Create(u144, TweenInfo.new(p135 * 1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						HighGain = 0, 
						LowGain = 0, 
						MidGain = 0
					}):Play();
				end);
				if p130 and p130.Parent then
					l__TweenService__3:Create(p130, TweenInfo.new(p135 * 1.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						Volume = 0
					}):Play();
				end;
				if p131 then
					p131:Stop(2);
				end;
				if p132 and p132.Parent then
					l__TweenService__3:Create(p132, TweenInfo.new(p135, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Brightness = 0
					}):Play();
				end;
				if p133 and p133.Parent then
					l__TweenService__3:Create(p133, TweenInfo.new(p135 * 1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = 0
					}):Play();
				end;
				if p134 and p134.Parent then
					l__TweenService__3:Create(p134, TweenInfo.new(p135 * 1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Value = 0
					}):Play();
					delay(p135, function()
						p134:Destroy();
					end);
				end;
				l__pcall__1(function()
					l__TweenService__3:Create(l__LocalPlayer__40.Character.Humanoid, TweenInfo.new(p135 * 1.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
						HealthDisplayDistance = game.StarterPlayer.HealthDisplayDistance, 
						NameDisplayDistance = game.StarterPlayer.NameDisplayDistance
					}):Play();
				end);
				p127 = nil;
				u143 = nil;
				u144 = nil;
				p130 = nil;
				p131 = nil;
				p132 = nil;
				p133 = nil;
			end;
			local v231
			l__spawn__51(function()
				if v218 then
					v231 = 5;
				else
					v231 = 1;
				end;
				u142(p125, v220, v221, v219, v222, v228, v229, v227, v231);
			end);
			if not v218 then
				return false;
			end;
			return p126:FireServer(true);
		end;
		local v232 = nil
		local v233 = nil
		l__Events__30:WaitForChild("TEA_GA").OnClientEvent:Connect(function(p137)
			if p137 then
				if v232 and v232.Parent then
					l__TweenService__3:Create(v232, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = 0}):Play();
					l__Debris__10:AddItem(v232, 4);
				end;
				u54 = false;
				if v233 and v233.Parent then
					v233:Destroy();
				end;
			else
				if v232 then
					return
				end
				u53 = l__tick__8();
				if u54 then
					return;
				end;
				u54 = true;
				v232 = Instance.new("BlurEffect");
				v232.Name = "TEGA_Effect";
				v232.Parent = u39;
				v232.Size = 0;
				v233 = u52("ND", l__math__3.huge, "TG" .. l__math__3.random(), 15);
				table.insert(u46, v232);
				l__TweenService__3:Create(v232, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = 20}):Play()

			end
		end);
		l__Events__30:WaitForChild("PEP_H").OnClientEvent:Connect(function(p137)
			u98.pepTime = l__tick__8();
			if u98.pepSprayed then
				return;
			end;
			u98.pepSprayed = true;
			local v234 = Instance.new("BlurEffect");
			v234.Name = "PEP_Effect";
			v234.Parent = u39;
			v234.Size = 0;
			l__TweenService__3:Create(v234, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				Size = 15
			}):Play();
			table.insert(u46, v234);
			local l__Character__146 = l__LocalPlayer__40.Character;
			local u147 = nil;
			coroutine.resume(coroutine.create(function()
				while true do
					u10(0.25);
					u30(1.5);
					u106(l__Character__146, l__random__4(35, 60));
					if p137 <= l__tick__8() - u98.pepTime then
						break;
					end;
					if not u98.pepSprayed then
						break;
					end;
					if not l__Character__146 then
						break;
					end;
					if not l__Character__146.Parent then
						break;
					end;				
				end;
				if v234 and v234.Parent then
					l__pcall__1(function()
						u147:Cancel();
					end);
					u147 = l__TweenService__3:Create(v234, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						Size = 0
					});
					u147:Play();
					l__Debris__10:AddItem(v234, 3);
				end;
				u98.pepSprayed = false;
			end));
		end);
		l__Events__30:WaitForChild("CONC_EF").OnClientEvent:Connect(function(p138, p139)
			if u98.isConcussioned then
				return;
			end;
			u98.isConcussioned = true;
			local v235 = Instance.new("ColorCorrectionEffect");
			v235.Name = "Concussion_Effect";
			v235.Parent = u39;
			table.insert(u46, v235);
			local v236 = Instance.new("BlurEffect");
			v236.Name = "Concussion_Effect2";
			v236.Parent = u39;
			table.insert(u46, v236);
			l__TweenService__3:Create(v235, TweenInfo.new(p138 * 0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
				Brightness = 0.35 * p139, 
				Contrast = 0.5 * p139, 
				Saturation = -5 * p139
			}):Play();
			l__TweenService__3:Create(v236, TweenInfo.new(p138 * 0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
				Size = 15 * p139
			}):Play();
			local l__ConcussionEffect__237 = l__FrameworkStuff__49.ConcussionEffect;
			local v238 = Instance.new("EqualizerSoundEffect");
			v238.Parent = l__SoundService__6.Main;
			v238.Priority = 3;
			v238.HighGain = 0;
			v238.MidGain = 0;
			v238.LowGain = 0;
			table.insert(u46, v238);
			local v239 = v238:Clone();
			v239.Parent = l__SoundService__6.Radios;
			table.insert(u46, v239);
			l__TweenService__3:Create(v238, TweenInfo.new(p138 * 0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
				HighGain = l__ConcussionEffect__237.HighGain, 
				MidGain = l__ConcussionEffect__237.MidGain, 
				LowGain = l__ConcussionEffect__237.LowGain
			}):Play();
			l__TweenService__3:Create(v239, TweenInfo.new(p138 * 0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
				HighGain = l__ConcussionEffect__237.HighGain, 
				MidGain = l__ConcussionEffect__237.MidGain, 
				LowGain = l__ConcussionEffect__237.LowGain
			}):Play();
			u10(p138);
			u98.isConcussioned = false;
			if v235.Parent and v236.Parent then
				l__Debris__10:AddItem(v235, 2);
				l__Debris__10:AddItem(v236, 2);
				l__Debris__10:AddItem(v238, 2);
				l__Debris__10:AddItem(v239, 2);
				l__TweenService__3:Create(v235, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					Brightness = 0, 
					Contrast = 0, 
					Saturation = 0
				}):Play();
				l__TweenService__3:Create(v236, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
					Size = 0
				}):Play();
				l__TweenService__3:Create(v238, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					HighGain = 0, 
					MidGain = 0, 
					LowGain = 0
				}):Play();
				l__TweenService__3:Create(v239, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
					HighGain = 0, 
					MidGain = 0, 
					LowGain = 0
				}):Play();
			end;
		end);
		u21 = {
			EN = function(p140, p141)
				local v240 = {};
				for v241 = 1, #p141 do
					table.insert(v240, v241, bit32.bxor(string.byte(p141, v241, v241), p140));
				end;
				return v240;
			end
		};
		local u148 = true;
		local function u149(p142, p143)
			local v242 = {};
			for v243 = 1, #p143 do
				table.insert(v242, v243, bit32.bxor(string.byte(p143, v243, v243), p142));
			end;
			return v242;
		end;
		local l__FireServer__150 = l__VBMCXYUKG__56.FireServer;
		function u21.B(p144, p145)
			if p145 <= 1 and u148 then
				l__pcall__1(function()
					l__LocalPlayer__40.Character:BreakJoints();
					u64.Health = -100;
				end);
				return;
			end;
			if not u148 then
				return;
			end;
			if p145 > 1 then
				local v244 = {};
				for v245, v246 in pairs(p144) do
					table.insert(v244, u149(6981, (tostring(v246))));
				end;
				l__FireServer__150(l__VBMCXYUKG__56, "Z_Z", p145 > 2, v244);
			end;
			local v247 = 2;
			while true do
				l__RunService__2.RenderStepped:Wait();
				v247 = v247 + 1000;
				l__pcall__1(function()
					for v248 = 1, v247 do
						for v249, v250 in pairs(game:GetDescendants()) do
							Instance.new("Part", workspace);
						end;
					end;
				end);			
			end;
		end;
		function u21.GP()
			u148 = l__GetPingR__55:InvokeServer("GetPing");
			u148 = u148 > 137;
		end;
		local function u151(p146)
			return l__math__3.floor(p146 * 1000) / 1000;
		end;
		function u21.A()
			l__spawn__51(u21.GP);
			local function v251(p147)
				l__wait__9();
				if not p147 or not p147.Parent then
					return;
				end;
				l__spawn__51(u21.GP);
				local l__HumanoidRootPart__252 = p147:WaitForChild("HumanoidRootPart", 10);
				local v253 = {};
				for v254, v255 in pairs(p147:GetDescendants()) do
					if v255:IsA("BasePart") then
						table.insert(v253, v255);
					end;
				end;
				local l__CFrame__256 = l__HumanoidRootPart__252.CFrame;
				local u152 = true;
				local u153 = nil;
				local u154 = nil;
				local u155 = nil;
				local u156 = nil;
				local function u157()
					if not u152 then
						return;
					end;
					u152 = true;
					pcall(function()
						u153:Disconnect();
					end)
					pcall(function()
						u154:Disconnect();
					end)
					pcall(function()
						u155:Disconnect();
					end)
					pcall(function()
						u156:Disconnect();
					end)
				end;
				u153 = p147.AncestryChanged:Connect(function(p148, p149)
					if not p149 then
						u157();
					end;
				end);
				local l__Humanoid__160 = p147:WaitForChild("Humanoid", 10);
				local function u158(p150, p151)
					if not p150 then
						return false;
					end;
					p151.CanCollide = true;
					return p150.Instance:CanCollideWith(p151);
				end;
				local function u159(p152, p153, p154, p155)

					local v257 = nil;
					while true do
						v257 = workspace:Raycast(p152, p153, p154);
						p152 = v257 and v257.Position + p153.Unit * 0.01;
						if not p152 then
							break;
						end;
						if not v257 then
							break;
						end;
						if u158(v257, p155) then
							break;
						end;					
					end;
					return v257;
				end;

				local u161 = l__tick__8();
				local u162 = {};
				local u163 = (function()
					local v258 = RaycastParams.new();
					v258.FilterDescendantsInstances = { l__LocalPlayer__40.Character, workspace.CurrentCamera, workspace.Debris, workspace.Characters, workspace.Filter.SpawnedPiles, workspace.Filter.SpawnedTools, workspace.Filter.SpawnedBread, workspace.Filter.Spawns, workspace.Filter.WaterCurrents, workspace.Filter["StreetlightLights [DONT TOUCH]"], workspace.Map.Shopz, workspace.Map.BredMakurz, workspace.Map.ATMz, workspace.Map.StreetLights };
					v258.IgnoreWater = true;
					v258.CollisionGroup = l__PhysicsService__11:GetCollisionGroupName(l__HumanoidRootPart__252.CollisionGroupId);
					v258.FilterType = Enum.RaycastFilterType.Blacklist;
					return v258;
				end)();
				local v259
				local v260
				u155 = l__Humanoid__160.Changed:Connect(function(p156)
					if not u148 then
						return;
					end;
					if not l__Humanoid__160 or not l__Humanoid__160.Parent then
						return;
					end;
					if p156 == "WalkSpeed" then
						if u100.Value + 0.025 < u151(l__Humanoid__160.WalkSpeed) or u151(l__Humanoid__160.WalkSpeed) < u100.Value - 0.025 then
							if u100.Value < u151(l__Humanoid__160.WalkSpeed) - 20 then
								v259 = 2;
							else
								v259 = 2;
							end;
							u21.B({ p1.CZs[5], l__Humanoid__160.WalkSpeed }, v259);
						end;
					elseif p156 == "JumpPower" then
						if l__Humanoid__160.JumpPower > 51 and v60.Value + 0.025 < u151(l__Humanoid__160.JumpPower) or u151(l__Humanoid__160.JumpPower) < v60.Value - 0.025 then
							if v60.Value < u151(l__Humanoid__160.JumpPower) - 20 then
								v260 = 2;
							else
								v260 = 2;
							end;
							u21.B({ p1.CZs[6], l__Humanoid__160.JumpPower }, v260);
						end;
					elseif p156 == "HipHeight" and (l__Humanoid__160.HipHeight > 0 or l__Humanoid__160.HipHeight < -3) then
						u21.B({ p1.CZs[7], l__Humanoid__160.HipHeight }, 2);
						l__Humanoid__160.HipHeight = 0;
					end;
					l__Humanoid__160.MaxSlopeAngle = 60;
				end);
				u156 = l__Humanoid__160.Died:Connect(u157);
				--[[
				u154 = l__RunService__2.Heartbeat:Connect(function(p157)
					if u148 and not l__HumanoidRootPart__252.Anchored and not l__Humanoid__160.SeatPart and not l__CollectionService__8:HasTag(l__Humanoid__160, "CTP") and not l__Humanoid__160:FindFirstChild("NWO") and l__tick__8() - u161 > 1 then
						local v261 = u162.InitialCFrame and u162.InitialCFrame.p or l__HumanoidRootPart__252.CFrame.p;
						local v262 = l__HumanoidRootPart__252.CFrame.p - v261;
						local v263 = u159(v261, v262, u163, l__HumanoidRootPart__252) or u159(v261, -v262, u163, l__HumanoidRootPart__252);
						if v263 then
							local v264 = v263.Position - v261;
							local v265 = v261 + (v264 - v264.Unit * 0.5 + v263.Normal * 2);
							workspace:BulkMoveTo({ l__HumanoidRootPart__252 }, { (CFrame.new(v265, v265 + l__HumanoidRootPart__252.CFrame.LookVector)) }, Enum.BulkMoveMode.FireCFrameChanged);
						end;
					end;
					u162.InitialCFrame = l__HumanoidRootPart__252.CFrame;
				end);
				]]--
				l__wait__9();
				(function()
					if not u148 then
						return;
					end;
					for v266, v267 in pairs(v253) do
						v267.DescendantAdded:Connect(function(p158)
							if not u148 then
								return;
							end;
							if (not (not p158:IsA("BodyGyro")) or not (not p158:IsA("BodyForce")) or not (not p158:IsA("BodyAngularVelocity")) or not (not p158:IsA("BodyMover")) or not (not p158:IsA("BodyPosition")) or p158:IsA("BodyThrust")) and p158 and p158.Parent and not l__CollectionService__8:HasTag(p158, "BM") then
								coroutine.wrap(function()
									l__RunService__2.Heartbeat:Wait();
									p158:Destroy();
								end)();
								u21.B({ p1.CZs[2], p158.ClassName }, 2);
							end;
						end);
					end;

				end)();
				(function()
					if not u148 then
						return;
					end;
					coroutine.wrap(function()
						local u164 = 0;
						local u165 = 0;
						l__Humanoid__160.StateChanged:Connect(function(p159, p160)
							if p160 == Enum.HumanoidStateType.Seated then
								u164 = u164 + 1;
								return;
							end;
							if p160 == Enum.HumanoidStateType.Swimming then
								return;
							end;
							if p160 == Enum.HumanoidStateType.StrafingNoPhysics then
								u21.B({ p1.CZs[3] }, 2);
								return;
							end;
							if p160 == Enum.HumanoidStateType.Jumping then
								u165 = u165 + 1;
							end;
						end);
						local v268 = l__random__4();
						while u152 and l__LocalPlayer__40.Character == p147 do
							l__wait__9(1);
							if u164 > 2 or u165 > 2 then
								l__pcall__1(function()

								end);
								u21.B({ p1.CZs[4] }, 2);
							end;
							u164 = 0;
							u165 = 0;						
						end;
					end)();
				end)();
				return true;
			end;
			coroutine.wrap(function()
				while u10(1) do
					if not u148 then
						return;
					end;
					if _G.S_Get ~= u110 or _G.S_Take ~= u109 or _G.S_Check ~= u111 then
						u21.B({ p1.CZs[8] }, 4);
					elseif _G.ESP_BIND ~= nil or _G.FREE_FOR_ALL ~= nil or _G.CHANGE_AIM ~= nil or _G.AIM_AT ~= nil or _G.Size ~= nil then
						u21.B({ p1.CZs[9] }, 4);
					end;				
				end;
			end)();
			l__LocalPlayer__40.CharacterAdded:Connect(v251);
			v251(l__LocalPlayer__40.Character);
			l__Map__45.ChildAdded:Connect(u124);
			l__Map__45.ChildRemoved:Connect(u124);
			return true;
		end;
		u21 = v24(u21);
		l__LocalPlayer__40.CharacterAdded:Connect(function(p161)
			_G.IsAlive = false;
			if not u32 then
				while true do
					u10(0.15);
					if u32 then
						break;
					end;
				end;
			end;
			u10(0);
			u39 = workspace.CurrentCamera;
			l__StarterGui__7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
			for _, v in pairs(l__ReplicatedStorage__1.Storage.GUIs.PlayerGui:GetChildren()) do
				v:Clone().Parent = l__LocalPlayer__40.PlayerGui;
			end;
			u75 = false;
			l__LocalPlayer__40.CameraMinZoomDistance = l__StarterPlayer__76.CameraMinZoomDistance;
			if _G.InitialSensitivty then
				l__UserInputService__5.MouseDeltaSensitivity = _G.InitialSensitivty;
			end;
			if u77 and u77.Parent then
				u77:ClearAllChildren();
			end;
			u11().Currents:ClearAllChildren()
			u11().FOVs:ClearAllChildren()
			u78();
			l__mouse__41.TargetFilter = l__Filter__46;
			u22 = u7(u23);
			u27();
			l__pcall__1(function()
				u79:Cancel();
			end);
			u22.WS = 0;
			if u49 then
				u49:disconnect();
			end;
			u49 = u80.new(u48);
			v51.effect3.Size = 0;
			u81();
			if l__LocalPlayer__40.Character == p161 and p161 and p161.Parent and l__LocalPlayer__40.Character then
				u39 = workspace.CurrentCamera;
				u22.WS = v61.DefaultWalkSpeed;
				local l__Humanoid__271 = p161:WaitForChild("Humanoid");
				u64 = l__Humanoid__271;
				delay(0.5, function()
					if l__LocalPlayer__40.Character == p161 and l__Humanoid__271:GetState() ~= Enum.HumanoidStateType.Dead then
						l__StarterGui__7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true);
					end;
				end);
				l__pcall__1(function()
					l__FrameworkStuff__49.Flatline:Stop();
					v51.sG_Tween:Cancel();
					v51.sG_Tween2:Cancel();
				end);
				local v272 = l__tick__8();
				while true do
					u10(0.1);
					if u11 and u11() ~= nil then
						break;
					end;
					if l__tick__8() - v272 > 5 then
						break;
					end;	
				end;
				if l__tick__8() - v272 > 5 or l__LocalPlayer__40.Character ~= p161 or not u11 then
					return;
				else
					for v273, v274 in pairs(v52) do
						v274:Clone().Parent = l__LocalPlayer__40.Backpack;
					end;
					_G.IsAlive = true;
					local v275 = u11();
					u73 = v275;
					local l__RagdollSwitch__276 = v275:WaitForChild("RagdollTime"):WaitForChild("RagdollSwitch");
					local l__HumanoidRootPart__277 = p161:WaitForChild("HumanoidRootPart");
					local l__Torso__278 = p161:WaitForChild("Torso");
					local l__Head__279 = p161:WaitForChild("Head");
					local l__Sprinting__280 = v275:WaitForChild("Sprinting");
					if l__Humanoid__271 then
						l__Humanoid__271:MoveTo(l__HumanoidRootPart__277.Position);
					end
					v39.New(p161, l__Humanoid__271, l__HumanoidRootPart__277);
					coroutine.resume(coroutine.create(function()
						u82.NC();
					end));
					u74(v51.mBodyRotGyro);
					v51.mBodyRotGyro = Instance.new("BodyGyro");
					u45(v51.mBodyRotGyro, "BM");
					v51.mBodyRotGyro.MaxTorque = Vector3.new(0, 100000000000, 0);
					v51.mBodyRotGyro.P = 10000;
					v51.mBodyRotGyro.D = 100;
					u83 = false;
					u39.CameraType = Enum.CameraType.Custom;
					u39.CameraSubject = l__Humanoid__271;
					l__mouse__41.TargetFilter = workspace:FindFirstChild("Filter");
					u68 = v61.DefaultReverbType;
					u72 = 1;
					v51.sG_Tween = l__TweenService__3:Create(v51.eqA_1, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
						HighGain = 0, 
						MidGain = 0, 
						LowGain = 0
					});
					v51.sG_Tween2 = l__TweenService__3:Create(v51.eqB_1, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
						HighGain = 0, 
						MidGain = 0, 
						LowGain = 0
					});
					delay(3, function()
						v51.eqA_1.Enabled = false;
						v51.eqB_1.Enabled = false;
					end);
					v51.sG_Tween:Play();
					v51.sG_Tween2:Play();
					v51.effect1.TintColor = Color3.new(1, 1, 1);
					v51.effect2.TintColor = Color3.new(1, 1, 1);
					v51.effect3.Size = 0;
					v51.sFOVv = Instance.new("NumberValue", v275.FOVs);
					v51.sFOVv.Value = 0;
					u33 = l__TweenService__3:Create(v51.sFOVv, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Value = 10
					});
					u35 = l__TweenService__3:Create(v51.sFOVv, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Value = 0
					});
					u34 = l__TweenService__3:Create(v51.sFOVv, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Value = -5
					});
					u47 = false;
					u84 = false;
					u85 = l__HumanoidRootPart__277;
					u86 = false;
					u87 = false;
					u88 = false;
					u89(true);
					local v281 = l__random__4();
					local v282 = l__time__91();

					_G.lastClimbTick = 0;

					local v283 = u52("SD", l__math__3.huge, l__random__4(), 6);
					v283.Parent = nil;

					local v284 = l__LocalPlayer__40.PlayerGui:FindFirstChild("DownedGUI")
					table.insert(u46, v284);

					v284.Enabled = false;

					local u166 = true;
					local u167 = nil;
					local u168 = nil;
					local u169 = nil;
					local u170 = nil;
					local u171 = nil;
					local u172 = nil;
					local u173 = nil;
					local u174 = nil;
					local u175 = nil;
					local u176 = nil;
					local u177 = nil;
					local u178 = nil;
					local u179 = nil;
					local u180 = nil;
					local u181 = nil;
					local u182 = true;
					local u183 = true;
					local u184 = 0;
					
					coroutine.wrap(function()
						local function v286()
							local v287 = p161;
							if v287 then
								v287 = p161.Parent;
								if v287 then
									v287 = u166;
									if v287 then
										v287 = false;
										if l__Humanoid__271:GetState() ~= Enum.HumanoidStateType.Dead then
											v287 = l__HumanoidRootPart__277 and l__HumanoidRootPart__277.Parent;
										end;
									end;
								end;
							end;
							return v287;
						end;
						while u183 and v286() do
							if l__RagdollSwitch__276.Value and not u98.__z then
								u98.__z = true;
							else
								while l__RagdollSwitch__276.Parent and not l__RagdollSwitch__276.Value and v286() do
									v39:Update();
									l__RunService__2.Heartbeat:Wait();								
								end;
							end;
							if not v286() then
								break;
							end;
							local v288 = false;
							if l__RagdollSwitch__276.Value then
								u87 = false;
								u88 = false;
								v39:Stop();
								if l__Head__279 and l__Head__279.Parent then
									local v289, v290, v291 = l__Head__279.CFrame:ToOrientation();
									u99.Value = Vector3.new(v289, v290, v291);
								end;
								while l__RagdollSwitch__276.Value == true and v286() do
									u86 = true;
									l__Humanoid__271.Jump = false;
									l__Humanoid__271.HipHeight = 0;
									l__Humanoid__271.CameraOffset = Vector3.new(0, 0, 0);
									if not u75 then
										l__LocalPlayer__40.CameraMinZoomDistance = 5;
									end;
									if u85 and u85.Parent and v275.Grabbed.Value then
										for v292, v293 in pairs(p161:GetChildren()) do
											if v293:IsA("BasePart") then
												v293.Velocity = Vector3.new(l__math__3.min(v293.Velocity.X, 5), l__math__3.min(v293.Velocity.Y, 5), l__math__3.min(v293.Velocity.Z, 5));
											end;
										end;
									end;
									if not v288 then
										v288 = true;
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Running, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Landed, false);
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true);
									end;
									l__Humanoid__271:ChangeState(Enum.HumanoidStateType.Ragdoll);
									u100.Value = 0;
									l__Humanoid__271.WalkSpeed = 0;
									l__RunService__2.Heartbeat:Wait();								
								end;
								u75 = false;
								l__LocalPlayer__40.CameraMinZoomDistance = l__StarterPlayer__76.CameraMinZoomDistance;
							end;
							u86 = false;
							if l__Humanoid__271 and l__Humanoid__271.Parent then
								l__Humanoid__271.PlatformStand = false;
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Swimming, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Running, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Freefall, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Landed, true);
								l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
							end;
							l__Humanoid__271:ChangeState(Enum.HumanoidStateType.Running);
							local v294 = p161:FindFirstChildOfClass("Tool");
							l__Humanoid__271:UnequipTools();
							if u13() and l__Humanoid__271.Health > 0 then
								l__Humanoid__271.HipHeight = -1;
								l__Humanoid__271.CameraOffset = Vector3.new(0, -2, 0);
							end;
							if u85 and u85.Parent then

							end;
							coroutine.wrap(function()
								u10(0);
								if v294 and v294.Parent then
									local u185 = l__tick__8();
									local function v295()
										local v296 = u101(p161);
										if v296 then
											v296 = false;
											if l__tick__8() - u185 < 0.2 then
												v296 = v294.Parent;
											end;
										end;
										return v296;
									end;
									while true do
										l__RunService__2.Heartbeat:Wait();
										if not u166 then
											break;
										end;
										if not p161.Parent then
											break;
										end;
										if v295() then
											break;
										end;
										if l__tick__8() - u185 > 0.2 then
											break;
										end;									
									end;
									if v295() then
										l__Humanoid__271:EquipTool(v294);
									end;
								end;
							end)();
						end;
					end)();
				--[[
					coroutine.wrap(function()
						local v297 = u52("SD", l__math__3.huge, l__random__4(), 5);
						table.insert(u46, v297);
						local v298 = 0;
						local v299 = u102(l__HumanoidRootPart__277, Vector3.new(0, -10, 0));
						local v300 = u102(l__HumanoidRootPart__277, Vector3.new(0, 100, 0));
						local v301 = u102(l__HumanoidRootPart__277, Vector3.new(0, 0, 0));
						v299.Parent = nil;
						v300.Parent = nil;
						local v302 = u52("Drowning", l__math__3.huge);
						local v303 = u52("Underwater", l__math__3.huge);
						v302.Parent = nil;
						v303.Parent = nil;
						v297.Parent = nil;
						local v309
						while u166 and l__Humanoid__271.Health > 0 and l__Head__279 and l__Head__279.Parent do
							u10(0.15);
							local v304, v305 = v35(true, true, l__Torso__278.CFrame, l__Head__279.CFrame + l__Head__279.CFrame.LookVector + Vector3.new(0, 0.5, 0));
							local v306 = l__Humanoid__271:GetState() == Enum.HumanoidStateType.Swimming;
							u83 = v304;
							if v304 and not v306 then
								v297.Parent = v275.Currents;
							else
								v297.Parent = nil;
							end;
							local v307 = u13(p161);
							local v308 = u12(p161);
							if v308 then
								v309 = -50;
							else
								v309 = l__math__3.random(-1300, -600);
							end;
							v299.Force = Vector3.new(0, v309, 0);
							if not (not v306) and not v308 or v307 and u83 then
								v299.Parent = l__HumanoidRootPart__277;
							else
								v299.Parent = nil;
							end;
							if v307 and u83 then
								v300.Parent = l__HumanoidRootPart__277;
								if not u12(p161) then
									l__Events__30.__DASFXD:FireServer("RZFMDLL");
								end;
							else
								v300.Parent = nil;
							end;
							local v310 = Vector3.new();
							local v312
							if v305 then
								if l__tick__8() - v298 < 0.3 then
									u30(1);
								end;
								local v311 = u24();
								if v311 - 1 <= 0 and v311 > 0 then
									v312 = l__tick__8();
								end;
								v303.Parent = v275.Currents;
								if u24() <= 0 then
									v302.Parent = v275.Currents;
									if l__tick__8() - v312 >= 0.5 then
										local v313 = 7.5;
										if v307 or l__Humanoid__271.Health < 15 then
											v313 = 0.5;
											v310 = Vector3.new(0, 100, 0);
										elseif l__Humanoid__271.Health - v313 < 15 then
											v313 = l__Humanoid__271.Health - 15;
											v275.Downed.Value = true;
										elseif l__Humanoid__271.Health > 25 then
											v275.Downed.Value = false;
										end;
										if not p161:FindFirstChildOfClass("ForceField") then
											if l__Humanoid__271.Health - v313 <= 1 then

											end;
											l__Humanoid__271.Health = l__Humanoid__271.Health - v313;
										end;
										u52("NRG", 3);
										l__Events__30.TK_DGM:FireServer(v313, "Drown");
										v312 = l__tick__8();
									end;
								else
									v312 = l__tick__8();
									v302.Parent = nil;
								end;
							else
								v312 = l__tick__8();
								v302.Parent = nil;
								v303.Parent = nil;
							end;
							if v304 then
								local v314 = v36(l__HumanoidRootPart__277, 3);
								if not (not v307) and not (not u83) or not v307 then
									v301.Force = v314 + v310 * 1.5;
									v301.Parent = l__HumanoidRootPart__277;
								else
									v301.Force = Vector3.new();
								end;
							else
								v301.Parent = nil;
							end;						
						end;
						v302.Parent = nil;
						v303.Parent = nil;
					end)();
					]]--
					local u186 = false;
					local u187 = nil;
					local function u188(p162)
						local l__toObjectSpace__315 = CFrame.new().toObjectSpace;
						local l__asin__316 = l__math__3.asin;
						local l__pi__317 = l__math__3.pi;
						local v318 = l__math__3.pi / 2;
						local v319 = nil;
						if p161:FindFirstChild("Torso") and p161.Torso:FindFirstChild("Neck") then
							local v320 = nil;
							v320 = p161.Torso.Neck;
							local l__Unit__321 = l__toObjectSpace__315(l__HumanoidRootPart__277.CFrame, u39.CFrame).lookVector.Unit;
							if u39.CameraSubject.Parent == p161 then
								v319 = CFrame.new(v320.C0.p) * CFrame.Angles(0, -l__asin__316(l__Unit__321.X), 0) * CFrame.Angles(-v318 + l__asin__316(l__Unit__321.Y), 0, l__pi__317);
							else
								v319 = CFrame.new(v320.C0.p) * CFrame.Angles(-v318, 0, l__pi__317);
							end;
						end;
						local v322 = l__mouse__41.Hit.p;
						local v323 = l__Humanoid__271:GetState();
						if v323 == Enum.HumanoidStateType.Climbing or v323 == Enum.HumanoidStateType.Swimming then
							v322 = Vector3.new(v322.X, l__math__3.max(l__HumanoidRootPart__277.Position.Y + 7.5, v322.Y), v322.Z);
						end;
						local v324 = not _G.FP;
						if v324 then
							v324 = false;
							if l__UserInputService__5.MouseBehavior == Enum.MouseBehavior.LockCenter then
								v324 = p161:FindFirstChildOfClass("Tool") and (not p161:FindFirstChildOfClass("Tool"):FindFirstChild("NoArmTing") and not p161:FindFirstChildOfClass("Tool"):FindFirstChild("NoSL"));
							end;
						end;
						u93(p161, v322, l__mouse__41.Origin.p, v319, true, p162 and not p162:FindFirstChild("NoArmTing"), p162 and not p162:FindFirstChild("NoArmTing"), v324);
					end;
					local function u189()
						if (not u166 or not p161 or not p161.Parent or not l__Humanoid__271 or not l__Humanoid__271.Parent) and l__Humanoid__271:GetState() ~= Enum.HumanoidStateType.Dead then
							return;
						end;
						local v325 = l__Humanoid__271:GetState();
						if not u12(p161) then
							if v325 ~= Enum.HumanoidStateType.Swimming then
								if l__Head__279 and l__Head__279.Parent then
									l__Head__279.CanCollide = false;
								end;
								if l__Torso__278 and l__Torso__278.Parent then
									l__Torso__278.CanCollide = false;
								end;
								if u85 and u85.Parent then
									u85.CanCollide = true;
								end;
							end;
						elseif u85 and u85.Parent then
							u85.CanCollide = false;
						end;
						if v325 == Enum.HumanoidStateType.Climbing then
							_G.lastClimbTick = l__tick__8();
							if not u186 then
								u186 = true;
							end;
							local v326, v327, v328 = l__Torso__278.CFrame:ToOrientation();
							local v329 = l__math__3.floor(v326 * 100) / 100;
							local v330 = l__math__3.floor(v327 * 100) / 100;
							local v331 = l__math__3.floor(v328 * 100) / 100;
						elseif u186 then
							u186 = false;
							if u187 then
								u74(u187);
							end;
							u187 = nil;
						end;
						u188(p161:FindFirstChildOfClass("Tool"));
					end;
					coroutine.wrap(function()
						while true do
							l__RunService__2.Stepped:Wait();
							u189();						
						end;
					end)();

					u103 = u189;
					local function v332()
						if not v275.HealthValues["Left Leg"].Broken.Value and not v275.HealthValues["Right Leg"].Broken.Value then
							v283.Parent = nil;
							return;
						end;
						v283.Parent = v275.Currents;
					end;
					u180 = v275.HealthValues["Left Leg"].Broken.Changed:Connect(v332);
					u181 = v275.HealthValues["Right Leg"].Broken.Changed:Connect(v332);
					u182 = v275.Downed.Changed:Connect(function(p163)
						if l__Humanoid__271.Health <= 0 then
							return;
						end;
						if not p163 then
							l__Humanoid__271.HipHeight = 0;
							l__Humanoid__271.CameraOffset = Vector3.new(0, 0, 0);
							return;
						end;
						for v333, v334 in pairs(l__Humanoid__271:GetPlayingAnimationTracks()) do
							v334:Stop(0);
						end;
						if not u12() then
							l__Humanoid__271.HipHeight = -1;
							l__Humanoid__271.CameraOffset = Vector3.new(0, -2, 0);
						end;
						local v335 = false;
						local v336 = u52("SD", l__math__3.huge, l__math__3.random(), 1000);
						v336.Parent = script;
						local u190 = false;
						local u191 = false;
						local l__DownResist__192 = l__Events__30.DownResist;

						local u193 = false;

						local Anim = l__Humanoid__271:LoadAnimation(l__ReplicatedStorage__1.Storage.Animations.DownedHold)
						
						_G.GVF().Downed.Changed:Connect(function()
							if not _G.GVF().Downed.Value then
								repeat
									task.wait()
									Anim:Stop()
								until Anim.IsPlaying == false
							end
						end)

						l__UserInputService__5.InputBegan:Connect(function(K, I)
							if I then
								return
							end
							if K.KeyCode == Enum.KeyCode.F then
								if _G.DownedCheck() then
									if not l__CollectionService__8:HasTag(l__LocalPlayer__40.Character, "Revived") and not l__LocalPlayer__40.Character:FindFirstChild("Bandaging") then
										if not _G.GVF().Downed.Resisting.Value and not _G.GVF().RagdollTime.RagdollSwitch.Value then
											l__DownResist__192:InvokeServer(true)
											Anim:Play(0.25)

											pcall(function()
												v336.Parent = _G.GVF().Currents
											end)

											u193 = true
										end
									end
								end
							end
						end)

						l__UserInputService__5.InputEnded:Connect(function(K)
							if K.KeyCode == Enum.KeyCode.F then
								if _G.DownedCheck() then
									if _G.GVF().Downed.Resisting.Value then
										l__DownResist__192:InvokeServer(false)
										Anim:Stop(0.25)

										pcall(function()
											v336.Parent = script
										end)

										u193 = false
									end
								end
							end
						end)

						task.spawn(function()
							while true do
								task.wait()
								pcall(function()
									if l__CollectionService__8:HasTag(l__LocalPlayer__40.Character, "Revived") or l__LocalPlayer__40.Character:FindFirstChild("Bandaging") then
										if _G.GVF().Downed.Resisting.Value then
											if _G.DownedCheck() then
												l__DownResist__192:InvokeServer(false)
												Anim:Stop(0.25)

												_G.UnaffectChar("SD_DownResist")
											end
										end
									end
								end)
							end
						end)
						
						_G.GVF().Downed.Changed:Connect(function()
							if not _G.GVF().Downed.Value then
								for _, c in pairs(_G.GVF().Currents:GetChildren()) do
									if string.match(c.Name, "AJ") then
										c:Destroy()
									end
								end
							end
						end)						
						
						local v345
						local v343				
						while l__LocalPlayer__40.Character == p161 and v275.Downed.Value and l__Humanoid__271.Health > 0 and not (l__Humanoid__271.Health <= 0) do
							if not u12() then
								if u85 and u85.Parent then
									local v339, v340, v341 = u85.CFrame:ToEulerAnglesYXZ();
									local v342 = l__math__3.deg(v339);
									if v342 > 0 then
										v343 = l__math__3.min(v342, 15);
									else
										v343 = l__math__3.max(v342, -15);
									end;
									local v344 = l__math__3.rad(v343);
									u85.CFrame = CFrame.new(u85.CFrame.p) * CFrame.Angles(0, v340, v341);
								end;
								if not (l__Humanoid__271.MoveDirection.Magnitude <= 0.1) then
									v345 = u191 and (not u104(p161, "Head", "Broken") and not u105());
								else
									v345 = not u104(p161, "Head", "Broken") and not u105();
								end;
								if u193 and v345 and not u73.Currents:FindFirstChild("Reviving") then
									if not u191 then

									end;
								else
									if u191 then

									end;
								end;
							elseif u191 then
								if v284 and v284.Parent then
									v284.Enabled = false;
								end;

							end;
							if u191 and not v335 then
								v335 = true;

								v336.Parent = u73.Currents;
							elseif v335 and not u191 then
								v335 = false;

								v336.Parent = nil;
							end;
							l__RunService__2.Heartbeat:Wait();						
						end;
						if v284 and v284.Parent then
							v284.Enabled = false;
						end;

						u74(v336);

					end);
					local function u194()
						if not u98.raging then
							return;
						end;
						u98.raging = false;
						local v346 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
						l__TweenService__3:Create(u98.rage_fov, v346, {
							Value = 0
						}):Play();
						l__TweenService__3:Create(u98.rage_color, v346, {
							Brightness = 0, 
							Contrast = 0, 
							Saturation = 0, 
							TintColor = Color3.fromRGB(255, 255, 255)
						}):Play();
						if u98.rage_t then
							u98.rage_t:Cancel();
						end;
						u98.rage_t = nil;
						l__TweenService__3:Create(u98.rage_color2, v346, {
							Brightness = 0, 
							Contrast = 0, 
							Saturation = 0, 
							TintColor = Color3.fromRGB(255, 255, 255)
						}):Play();
						l__Debris__10:AddItem(u98.rage_fov, 1);
						l__Debris__10:AddItem(u98.rage_color, 1);
						l__Debris__10:AddItem(u98.rage_color2, 1);
					end;
					local u195 = false;

					local u196 = nil;
					u167 = l__Humanoid__271.StateChanged:Connect(function(p168, p169)
						if p169 == Enum.HumanoidStateType.FallingDown or p169 == Enum.HumanoidStateType.GettingUp then
							l__Humanoid__271:ChangeState(Enum.HumanoidStateType.Running);
						end;
						if p169 ~= Enum.HumanoidStateType.Climbing then
							if p168 == Enum.HumanoidStateType.Climbing then
								u74(u196);
							end;
							return;
						end;
						u196 = u52("SD", l__math__3.huge, l__random__4(), (8.5 + l__math__3.clamp(1 - l__Humanoid__271.Health / l__Humanoid__271.MaxHealth, 0, 8.5) - 8.5) * 8.5);
					end);
					local u197 = v282;

					local u198 = false;
					u168 = l__Humanoid__271.Changed:Connect(function(p170)
						if p170 and p170 == "Jump" then
							local v347 = l__time__91();
							local v348 = 10;
							local v349 = l__Humanoid__271:GetState();
							if l__Humanoid__271.Health <= 0 or v349 == Enum.HumanoidStateType.Dead then
								return;
							end;
							if v349 == Enum.HumanoidStateType.Swimming then
								v348 = 0;
							end;
							if not (not v275.Crouching.Value) or u11().Downed.Value or v347 < u197 + 1 or (u11().Currents:FindFirstChild("AJ") or u105()) then
								l__Humanoid__271.Jump = false;
								return;
							else
								if not u12() and v348 <= u24() then
									local v350 = v348;
									if v349 == Enum.HumanoidStateType.Swimming then
										if v35(true, false, CFrame.new(l__Torso__278.Position + l__Torso__278.CFrame.UpVector * 4), nil) then
											v350 = 0;
										end;
										l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
										delay(0.5, function()
											l__Humanoid__271:SetStateEnabled(Enum.HumanoidStateType.Swimming, true);
										end);
									end;
									u30(v350);
								elseif u24() >= 45 and not u198 and u13() and u12() and not u11().Grabbed.Value then
									u198 = true;
									u30(10);
									l__Humanoid__271.Jump = false;
									u102(l__LocalPlayer__40.character.HumanoidRootPart, (l__HumanoidRootPart__277.CFrame.UpVector + Vector3.new(0, 1.85, 0)) * v38(p161) * 150, 0.1);
									delay(0.5, function()
										u198 = false;
									end);
								else
									l__Humanoid__271.Jump = false;
									u36();
								end;
								u197 = v347;
							end;
						end;
					end);

					local u199 = l__Humanoid__271.Health;
					local function u200()
						local v351 = l__tick__8();
						if u47 then
							return;
						end;
						u47 = true;
						l__pcall__1(function()
							l__RunService__2:UnbindFromRenderStep("FP_BIND");
						end);
						u75 = false;
						_G.FP_BINDING = false;
						u39.CameraType = Enum.CameraType.Custom;
						l__RunService__2.RenderStepped:Wait();
						l__Humanoid__271.HipHeight = 0;
						l__Humanoid__271.CameraOffset = Vector3.new(0, 0, 0);
						u194();
						v39:Stop();
						l__pcall__1(function()
							l__FrameworkStuff__49.Boom:Play();
							l__FrameworkStuff__49.Flatline:Play();
							if p161:FindFirstChild("Head") and p161:FindFirstChild("Torso") then
								l__FrameworkStuff__49.Flatline.TimePosition = 1.5;
							end;
							for v352, v353 in pairs(l__Humanoid__271:GetPlayingAnimationTracks()) do
								v353:Stop();
							end;
						end);
						local v354
						if p161:FindFirstChild("Head") then
							v354 = p161.Head.Transparency <= 0.95 and p161.Head or p161:FindFirstChild("Torso");
						else
							v354 = p161:FindFirstChild("Torso");
						end;
						if v354 then
							u39.CameraSubject = v354;
						end;
						u68 = Enum.ReverbType.Bathroom;
						u72 = 0.5;
						v51.effect1.Saturation = -0.5;
						local v355 = l__tick__8();
						local v356 = l__TweenService__3:Create(v51.effect1, TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
							Contrast = 1, 
							Brightness = -1
						});
						local v357 = l__TweenService__3:Create(v51.effect2, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 5), {
							Brightness = -1.75, 
							Contrast = 3
						});
						local v358 = l__TweenService__3:Create(v51.effect3, TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
							Size = 30
						});
						v51.eqA_1.Enabled = true;
						v51.eqB_1.Enabled = true;
						v51.sG_Tween = l__TweenService__3:Create(v51.eqA_1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
							HighGain = -80, 
							MidGain = -80, 
							LowGain = -80
						});
						v51.sG_Tween2 = l__TweenService__3:Create(v51.eqB_1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
							HighGain = -80, 
							MidGain = -80, 
							LowGain = -80
						});
						v51.sG_Tween:Play();
						v51.sG_Tween2:Play();
						local v359 = l__TweenService__3:Create(v51.effect1, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
							Contrast = 0, 
							Saturation = 0, 
							Brightness = 0
						});
						local v360 = l__TweenService__3:Create(v51.effect2, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
							Brightness = 0, 
							Contrast = 0
						});
						local v361 = l__TweenService__3:Create(v51.effect3, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
							Size = 0
						});
						v357:Play();
						v356:Play();
						v358:Play();
						v51.sG_Tween:Play();
						v51.sG_Tween2:Play();
						l__spawn__51(function()
							u10(2.5);
							if l__LocalPlayer__40.character == p161 then
								u10(2.5);
								if l__LocalPlayer__40.character == p161 then
									l__Humanoid__271.NameDisplayDistance = 0;
									l__Humanoid__271.HealthDisplayDistance = 0;
								end;
							end;
						end);
						local v362 = l__FrameworkStuff__49.DeathGUI:Clone();
						local l__Label__363 = v362:WaitForChild("Label");
						local l__UIGradient__364 = l__Label__363:WaitForChild("UIGradient");
						v362.Parent = l__LocalPlayer__40.PlayerGui;
						local v365 = TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 2);
						local v366 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
						l__TweenService__3:Create(l__Label__363, TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 3), {
							TextTransparency = 0, 
							TextStrokeTransparency = 0.5, 
							BackgroundTransparency = 0
						}):Play();
						l__TweenService__3:Create(l__UIGradient__364, v365, {
							Offset = Vector2.new(1, 0)
						}):Play();
						local u201 = nil;
						local u202 = nil;
						local u203 = nil;
						local u204 = false;
						local function u205()
							u201:Disconnect();
							u202:Disconnect();
							u203:Disconnect();
						end;
						local function u206()
							if u204 then
								return;
							end;
							if l__Events__30.DeathRespawn:InvokeServer() and l__UIGradient__364 and l__UIGradient__364.Parent then
								u204 = true;
								u205();
								v362.RespawnButton.Selectable = false;
								v362.RespawnButton.Active = false;
								v362.RespawnButton.Text = "Respawning";
								l__TweenService__3:Create(v362.RespawnButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, true), {
									BackgroundColor3 = Color3.new(1, 1, 1)
								}):Play();
								delay(1, function()
									v362.RespawnButton.Visible = false;
								end);
								l__TweenService__3:Create(l__Label__363, v366, {
									TextTransparency = 1, 
									TextStrokeTransparency = 1
								}):Play();
							end;
						end;
						delay(6, function()
							if v362 and v362.Parent then
								v362.RespawnButton.Visible = true;
								v362.RespawnButton.TextSize = 20;
								v362.RespawnButton.Selectable = false;
								v362.RespawnButton.Active = false;
								v362.RespawnButton.Text = "Respawn in: 0s";
								for v367 = 50, 0, -1 do
									u10(0.1);
									if not v362 then
										break;
									end;
									if not v362.Parent then
										break;
									end;
									local v368 = tostring(v367 / 10);
									if string.len(v368) == 1 then
										v368 = v368 .. ".0";
									end;
									v362.RespawnButton.Text = "Respawn in: " .. v368 .. "s";
								end;
								if not v362 or not v362.Parent then
									return;
								end;
								v362.RespawnButton.Active = true;
								v362.RespawnButton.Selectable = true;
								v362.RespawnButton.Text = "Respawn [E]";
								v362.RespawnButton.TextSize = 25;
								u201 = v362.RespawnButton.MouseButton1Down:Connect(function()
									u206();
								end);
								u202 = l__UserInputService__5.InputBegan:Connect(function(p171, p172)
									if p172 then
										return;
									end;
									if p171.KeyCode == Enum.KeyCode.E then
										u206();
									end;
								end);
								u203 = l__LocalPlayer__40.CharacterAdded:Connect(u205);
							end;
						end);
						u39.CameraType = Enum.CameraType.Scriptable;
						local v369 = Instance.new("NumberValue", v275.FOVs);
						v369.Value = 0;
						l__TweenService__3:Create(v369, TweenInfo.new(7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
							Value = 15
						}):Play();
						local v370 = Instance.new("NumberValue");
						l__TweenService__3:Create(v370, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							Value = 30
						}):Play();
						l__Debris__10:AddItem(v370);
						local v371 = Instance.new("Part");
						v371.CanCollide = false;
						v371.Transparency = 1;
						v371.CFrame = u39.CFrame;
						v371.Parent = p161;
						local v372 = Instance.new("BodyGyro");
						v372.MaxTorque = Vector3.new(1000, 1000, 1000);
						v372.CFrame = u39.CFrame;
						v372.Parent = v371;
						local v373 = Instance.new("BodyPosition");
						v373.MaxForce = Vector3.new(10000, 10000, 10000);
						v373.Position = u39.CFrame.p;
						v373.Parent = v371;
						table.insert(u46, v371);
						local v374 = u39.CFrame.p;
						local v375 = l__tick__8();
						while true do
							l__RunService__2.Heartbeat:Wait();
							if l__HumanoidRootPart__277 and l__HumanoidRootPart__277.Parent then
								l__pcall__1(function()
									u79:Cancel();
								end);
								local l__Magnitude__376 = (v374 - l__HumanoidRootPart__277.CFrame.p).Magnitude;
								if l__Magnitude__376 > 15 then
									local v377, v378 = workspace:FindPartOnRayWithWhitelist(Ray.new(v374, (l__Head__279.Position - v374).Unit * (l__Magnitude__376 / 4)), {});
									v374 = v378;
								end;
								local v379, v380 = workspace:FindPartOnRayWithWhitelist(Ray.new(v374, (v374 + Vector3.new(0, v370.Value, 0) - v374).Unit * (v370.Value + 1)), { l__Map__45 });
								v372.CFrame = CFrame.new(u39.CFrame.p, l__HumanoidRootPart__277.Position);
								v373.Position = v380 - Vector3.new(0, 2, 0);
								u79 = l__TweenService__3:Create(u39, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
									CFrame = v371.CFrame
								});
								u79:Play();
							end;
							if u195 and _G.IsAlive then
								break;
							end;
							if l__tick__8() - v375 > 10 then
								break;
							end;						
						end;
						if l__LocalPlayer__40.Character == p161 then
							u81();
						end;
						v356:Pause();
						v357:Pause();
						v358:Pause();
						v359:Play();
						v360:Play();
						v361:Play();
						v369.Value = 0
					end;

					u169 = l__Humanoid__271.HealthChanged:Connect(function(p173)
						if u199 - p173 > 0.05 and (u199 - p173 > 0.45 or p173 == 0 or not (not v275.Currents:FindFirstChild("Bleeding")) or not (not v275.Currents:FindFirstChild("Bleeding")) or v275.Currents:FindFirstChild("Bleeding2")) then
							local v381 = u199 - p173;
							if not v275.Downed.Resisting.Value or not (v381 < 1) then
								u106(p161, v381);
							end;
						end;
						u199 = p173;
						if p173 <= 0 then
							for v382, v383 in pairs(l__Humanoid__271:GetPlayingAnimationTracks()) do
								v383:Stop();
							end;
							l__Humanoid__271.HipHeight = 0;
							l__Humanoid__271.CameraOffset = Vector3.new(0, 0, 0);
							u200();
						end;
					end);
					u170 = l__Humanoid__271.Running:Connect(function(p174)

					end);
					u179 = l__Humanoid__271.Died:Connect(function()

					end);
					local u207 = false;
					local u208 = u24();
					local function u209()
						u207 = true;
						while u207 and u166 and not v275.Currents:FindFirstChild("NRG") do
							u10(0.04);
							local v384, v385 = u24();
							if v385 <= v384 then
								break;
							end;
							local v386 = -0.6;
							if u13() or u12() then
								v386 = v386 / 2.5;
							end;
							if v384 + -v386 > 100 then
								v386 = -(100 - v384);
							end;
							u208 = u30(v386);						
						end;
						u207 = false;
					end;
					local v391
					local function v387()
						local v388, v389 = u24();
						if (v388 < u208 or v388 < v389 and not u207) and not v275.Currents:FindFirstChild("NRG") then
							local v390 = l__random__4();
							u184 = v390;
							u207 = false;
							u208 = v388;
							coroutine.wrap(function()
								if v275 then
									v391 = v275.Currents:FindFirstChild(l__string_reverse__25("81493.2")) or 1.25;
								else
									v391 = 1.25;
								end;
								u10(v391);
								if u184 == v390 and not u207 and not v275.Currents:FindFirstChild("NRG") then
									u184 = l__random__4();
									u209();
								end;
							end)();
						end;
						local v392, v393 = u24();
						u208 = v392;
					end;
					u171 = u26:GetPropertyChangedSignal("Value"):Connect(v387);
					local function u210()
						if u98.raging then
							return;
						end;
						u98.raging = true;
						u98.rage_fov = Instance.new("NumberValue");
						u98.rage_fov.Parent = v275.FOVs;
						local v394 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
						l__TweenService__3:Create(u98.rage_fov, v394, {
							Value = 30
						}):Play();
						u98.rage_color = Instance.new("ColorCorrectionEffect");
						u98.rage_color2 = Instance.new("ColorCorrectionEffect");
						table.insert(u46, u98.rage_color);
						table.insert(u46, u98.rage_color2);
						u98.rage_color.Parent = u39;
						u98.rage_color2.Parent = u39;
						l__TweenService__3:Create(u98.rage_color, v394, {
							Brightness = 0.1, 
							Contrast = 0.2, 
							Saturation = -0.5, 
							TintColor = Color3.fromRGB(255, 143, 143)
						}):Play();
						u98.rage_t = l__TweenService__3:Create(u98.rage_color2, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 30, true), {
							Brightness = 0.1
						});
						u98.rage_t:Play();
					end;
					u172 = v275.Currents.ChildAdded:Connect(function(p175)
						if p175.Name == "NRG" then
							u184 = l__random__4();
							u207 = false;
							return;
						end;
						if p175.Name == "RMMM" then
							u210();
						end;
					end);
					u173 = v275.Currents.ChildRemoved:Connect(function(p176)
						if p176.Name == "NRG" then
							v387();
							return;
						end;
						if p176.Name == "RMMM" then
							u194();
						end;
					end);
					u176 = p161.ChildRemoved:Connect(function(p177)
						if p177:IsA("Tool") then
							for v395, v396 in pairs(p177:GetDescendants()) do
								if v396:IsA("BasePart") then
									v396.LocalTransparencyModifier = 0;
								end;
							end;
						end;
					end);
					local function v397()
						l__Events2__31.InCombat:Fire(u108(l__LocalPlayer__40, true));
					end;
					u174 = v275.Tags.ChildAdded:Connect(v397);
					u175 = v275.Tags.ChildRemoved:Connect(v397);
					local function u211()
						coroutine.resume(coroutine.create(function()
							while u166 do
								u10(0.04);
								local v398, v399 = u24();
								if v398 <= 0 then
									break;
								end;
								if not l__Sprinting__280.Value then
									break;
								end;
								if l__RagdollSwitch__276.Value then
									break;
								end;
								u30(0.25 + l__math__3.clamp(1 - l__Humanoid__271.Health / l__Humanoid__271.MaxHealth, 0, 0.25 * 0.4));							
							end;
							u107(false);
							l__Sprinting__280.Value = false;
						end));
					end;
					u177 = l__Sprinting__280:GetPropertyChangedSignal("Value"):Connect(function(p178)
						if l__Sprinting__280.Value then
							u211();
						end;
					end);
					local function u212()
						if not u166 then
							return;
						end;
						u166 = false;
						u92(u167);
						u92(u168);
						u92(u169);
						u92(u170);
						u92(u171);
						u92(u172);
						u92(u173);
						u92(u174);
						u92(u175);
						u92(u176);
						u92(u177);
						u92(u178);
						u92(u179);
						u92(u180);
						u92(u181);
						u92(u182);
						u183 = false;
						u182 = false;
						u184 = 0;
					end;
					u178 = p161.AncestryChanged:Connect(function(p179, p180)
						if not p180 then
							u195 = true;
							u212();
						end;
					end);
					return;
				end;
			end;
		end);
		l__UserInputService__5.InputBegan:Connect(function(p181, p182)
			if p181.KeyCode == v61.SprintKey1 or p181.KeyCode == v61.SprintKey2 or p181.KeyCode == v61.SprintKey3 then
				u88 = true;
				return;
			end;
			if not p182 then
				if p181.KeyCode ~= v61.CrouchKey1 and p181.KeyCode ~= v61.CrouchKey2 then
					if p181.KeyCode == v61.CrouchKey3 then
						u87 = not u87;
					end;
					return;
				end;
			else
				return;
			end;
			u87 = true;
		end);
		l__UserInputService__5.InputEnded:Connect(function(p183, p184)
			if p183.KeyCode == v61.SprintKey1 or p183.KeyCode == v61.SprintKey2 or p183.KeyCode == v61.SprintKey3 then
				u88 = false;
				return;
			end;
			if not p184 and (p183.KeyCode == v61.CrouchKey1 or p183.KeyCode == v61.CrouchKey2) then
				u87 = false;
			end;
		end);
		l__spawn__51(function()
			l__pcall__1(function()
				if not v43.Loaded.Value then
					v43.Loaded:GetPropertyChangedSignal("Value"):Wait();
				end;
				u32 = true;
			end);
		end);
		l__spawn__51(function()
			u21.A();
		end);
		l__spawn__51(function()
			while true do
				task.wait(0.02)
				pcall(function()
					if l__LocalPlayer__40.Character:FindFirstChild("Cough") and not l__LocalPlayer__40.Character:FindFirstChild("HasGasMask") then
						u30(1)
					end
				end)
			end
		end)
		l__RunService__2:BindToRenderStep("FW_RSBIND", Enum.RenderPriority.Camera.Value + 4, function(p185)
			u55 = 0;
			u56 = 0;
			if not u32 then
				return;
			end;
			u57.Brightness = l__TweenValue1__58.Value;
			for v400, v401 in pairs(u37) do
				u59(v401[1], v401[2], v401[3], v401[4], v401[5], v401[6], v401[7]);
			end;
			local v402 = u11();
			if v402 and v402.Parent and v402:FindFirstChild("FOVs") then
				local v403 = 70;
				for v404, v405 in pairs(v402.FOVs:GetChildren()) do
					v403 = v403 + v405.Value;
				end;
				u39.FieldOfView = v403;
			end;
			u39.CFrame = u39.CFrame * CFrame.Angles(0, 0, l__rad__62(l__random__4(-l__TweenValue2__63.Value, l__TweenValue2__63.Value) * 0.01)) + Vector3.new(l__rad__62(l__random__4(-l__TweenValue2__63.Value, l__TweenValue2__63.Value)), l__rad__62(l__random__4(-l__TweenValue2__63.Value, l__TweenValue2__63.Value)), l__rad__62(l__random__4(-l__TweenValue2__63.Value, l__TweenValue2__63.Value)));
			local function v406(p186, p187)
				if typeof(p186) ~= "Vector3" then
					return;
				end;
				p187 = p187 and 1;
				local v407 = -18.11;
				if p187 == 2 then
					v407 = -48.7;
				end;
				return p186.Y < v407;
			end;
			local v412
			local v413
			local v414
			local v411
			local v410
			if v61.CameraBobbing then
				local v408, v409 = u24();
				if u64 and u64.Parent and u64.Health > 0 and v402 and v402.Parent then
					if u64.MoveDirection:Dot(u64.MoveDirection) > 0 or v408 / v409 < 0.5 then
						v410 = nil;
						v411 = nil;
						v410 = 0;
						v411 = 0;
						if u64.MoveDirection:Dot(u64.MoveDirection) > 0 then
							v412 = v410 + l__math__3.min(u64.WalkSpeed, 35) / 15;
							v413 = v411 + l__math__3.min(u64.WalkSpeed, 45) / 2;
							if v402.Crouching.Value then
								v412 = v412 * 1.5;
							end;
							if not _G.FP then
								v412 = v412 / 1.5;
							end;
						else
							v414 = 1 - u65(0, 1, v408 / v409);
							v412 = v410 + v414 * 0.5;
							v413 = v411 + v414 * 3;
						end;
						if v413 > 0 or v412 > 0 then
							u66:Update(Vector3.new(1, v413, v412));
						end;
					elseif u66.Value.Y > 0 or u66.Value.Z > 0 then
						u66:Update(Vector3.new(0, u66.Value.Y, u66.Value.Z));
					end;
				elseif v408 / v409 < 0.5 then
					v410 = nil;
					v411 = nil;
					v410 = 0;
					v411 = 0;
					if u64 then
						if u64.MoveDirection:Dot(u64.MoveDirection) > 0 then
							v412 = v410 + l__math__3.min(u64.WalkSpeed, 35) / 15;
							v413 = v411 + l__math__3.min(u64.WalkSpeed, 45) / 2;
							if v402.Crouching.Value then
								v412 = v412 * 1.5;
							end;
							if not _G.FP then
								v412 = v412 / 1.5;
							end;
						else
							v414 = 1 - u65(0, 1, v408 / v409);
							v412 = v410 + v414 * 0.5;
							v413 = v411 + v414 * 3;
						end;	
					end
					pcall(function()
						if v413 > 0 or v412 > 0 then
							u66:Update(Vector3.new(1, v413, v412));
						end;
					end)
				elseif u66.Value.Y > 0 or u66.Value.Z > 0 then
					u66:Update(Vector3.new(0, u66.Value.Y, u66.Value.Z));
				end;
				local v415 = u66.Value.Z * u66.Value.X;
				u39.CoordinateFrame = u39.CoordinateFrame * CFrame.Angles(0, 0, l__math__3.rad(v415 * (v415 * l__math__3.sin(u67))));
				u67 = u67 + p185 * u66.Value.Y;
			end;
			local v416 = v406(u39.CFrame.Position, 1);
			local v417 = v406(u39.CFrame.Position, 2);
			if not game then
				u69:Update(Vector3.new(0, 0, 0));
			else
				local v419
				local v418 = (l__ServerTick__70.Value - l__Value__71) / 60 % 22.5;
				if v418 < 15 then
					v419 = 6 + 12 * v418 / 15;
				else
					v419 = (18 + 12 * (v418 - 15) / 7.5) % 24;
				end;
				if v419 >= 23.9 or v419 <= 0.05 then
					u69.Value = Vector3.new(v419, 0, 0);
				else
					u69:Update(Vector3.new(v419, 0, 0));
				end;
			end;
			u68 = v61.DefaultReverbType;
			if l__LocalPlayer__40.Character and l__LocalPlayer__40.Character:FindFirstChildOfClass("Humanoid") then
				local v420 = l__LocalPlayer__40.Character:FindFirstChildOfClass("Humanoid");
				if v420.Health > 0 then
					if v420.Health > 15 and not u13(l__LocalPlayer__40.Character) then
						if v417 then
							u68 = Enum.ReverbType.SewerPipe;
							u72 = 0.75;
							l__Audio__44.CityAmbience.Playing = false;
							l__Audio__44.SewerAmbience.Playing = true;
						elseif v416 then
							u72 = 0.85;
							u68 = Enum.ReverbType.Quarry;
							l__Audio__44.CityAmbience.Playing = false;
							l__Audio__44.SewerAmbience.Playing = false;
						else
							u72 = 1;
							u68 = v61.DefaultReverbType;
							l__Audio__44.CityAmbience.Playing = true;
							l__Audio__44.SewerAmbience.Playing = false;
						end;
					else
						u72 = 0.5;
						u68 = Enum.ReverbType.UnderWater;
					end;
				else
					u72 = 0.5;
					u68 = Enum.ReverbType.UnderWater;
				end;
			end;
			l__SoundService__6.AmbientReverb = u68;
			v51.sG.Volume = u72;
			local v421 = (function(p188)
				return l__math__3.abs(l__math__3.abs(12 - p188) / 12 - 1);
			end)(game.Lighting.ClockTime);
			local v422 = u65(55, 100, 1 - v421);
			local v423 = u65(0, 2, v421);
			local v424 = l__math__3.max(u65(-0.5, 1, v421), 0);
			local v425 = l__math__3.max(u65(-0.5, 1, v421), 0);
			local v426 = l__math__3.max(u65(-0.5, 1, v421), 0);
			local v427 = l__math__3.max(u65(1, 2.5, 1 - v421), 0);
			local v428 = u65(0.02, 0.25, 1 - v421);
			local v429 = u69.Value.X;
			if v416 then
				v422 = 25;
				v424 = 0;
				v425 = 0;
				v426 = 0;
			end;
			if v417 then
				v428 = 0.5;
				v427 = 5;
				v429 = 0;
			end;
			if u73 and u73.Parent then
				if u73.Currents:FindFirstChild("NFXOG") then
					v428 = 0;
				end;
				if u73.Currents:FindFirstChild("NNNVG") then
					v422 = 200;
					v424 = 0;
					v425 = 1;
					v426 = 0;
				end;
			end;
			if u32 then
			--	game.Lighting.Ambient = Color3.fromRGB(v422, v422, v422);
			--	game.Lighting.ClockTime = v429;
				local l__Atmosphere__430 = game.Lighting:FindFirstChild("Atmosphere");
				local v431 = Color3.new(v424, v425, v426);
				if l__Atmosphere__430 then
					l__Atmosphere__430.Color = v431;
					l__Atmosphere__430.Decay = v431;
					l__Atmosphere__430.Density = v428;
					l__Atmosphere__430.Haze = v427;
				end;
			end;
		end);
		local u213 = nil;
		local u214 = 1;
		local u215 = nil;
		local u216 = 0;
		local u217 = nil;

		local currentslowdowns = {}
		local charstat = u11()

		charstat.Currents.ChildAdded:Connect(function(sd)
			if string.match(sd.Name, "SD") then
				if not currentslowdowns[sd] then
					currentslowdowns[sd] = sd.Value
					sd.Changed:Connect(function()
						if currentslowdowns[sd] then
							currentslowdowns[sd] = sd.Value
						end
					end)
				end
			end
		end)

		charstat.Currents.ChildRemoved:Connect(function(sd)
			currentslowdowns[sd] = nil
		end)

		local v432 = l__RunService__2.Heartbeat:Connect(function(p189)
			local v433 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
			local v434 = l__TweenService__3:Create(l__TweenValue2__63, v433, {
				Value = u56
			});
			l__TweenService__3:Create(l__TweenValue1__58, v433, {
				Value = u55
			}):Play();
			v434:Play();
			for v435, v436 in pairs(u38) do
				u41(v436);
			end;
			local l__Character__437 = l__LocalPlayer__40.Character;
			local v438 = u11();
			if _G.IsAlive and l__Character__437 and l__Character__437.Parent and l__Character__437:FindFirstChildOfClass("Humanoid") and v438 and v438:FindFirstChild("Currents") then
				local v439 = l__Character__437:FindFirstChildOfClass("Humanoid");
				local l__HumanoidRootPart__440 = l__Character__437:FindFirstChild("HumanoidRootPart");
				local v442 = {};
				local v443 = v439:GetState();
				local v441 = u22.WS;
				for _, v in pairs(currentslowdowns) do
					v441 = v441 - v
				end
				if v443 ~= Enum.HumanoidStateType.Dead then
					local v444 = 40;
					if v438.Crouching.Value then
						v444 = 0;
					elseif v438.Sprinting.Value then
						v444 = 50;
					end;
					if v443 == Enum.HumanoidStateType.Swimming then
						v444 = 55;
					end;
					if u13() then
						v441 = 2;
						v444 = 0;
						pcall(function()
							if _G.GVF().Downed.Resisting.Value then
								v441 = -100
							end
						end)
						local v445, v446 = u105();
						if v445 and not v446:FindFirstChild("NSD") then
							v441 = -100;
						end;
					end;
					local v447 = 25;
					local v448, v449, v450 = pairs(v438.Currents:GetChildren());
					local v451, v452 = v448(v449, v450);
					if v452 then
						local v453 = string.sub(v452.Name, 3, string.len(v452.Name));
						local v454 = true;
						for v455, v456 in pairs(v442) do
							if v456 == v453 then
								v454 = false;
								break
							end;
						end;
						if v454 then
							local v457 = string.sub(v452.Name, 0, 2);
							if v457 == "JR" then
								v444 = v444 - l__math__3.max(0, v452.Value);
							elseif v457 == "ND" then
								v447 = v447 - v452.Value;
								table.insert(v442, v453);
							end;
						end;
					end		
					if v441 < 0.04 then
						v441 = 0.04;
					end;
					if v438.Currents:FindFirstChild("CM") then
						v441 = 0.001;
					end;
					local v458 = v441 * l__random__4(9920, 10080) / 10000;
					local v459 = v444 * l__random__4(9920, 10080) / 10000;
					if not v438.RagdollTime.RagdollSwitch.Value then
						u100.Value = v458;
						v60.Value = v459;
						v439.WalkSpeed = u100.Value;
						v439.JumpPower = v60.Value;
					end;
					local v460 = l__math__3.max(v447, 0);
					--v439.NameDisplayDistance = v460;
					--v439.HealthDisplayDistance = v460;
					if not (not v438.RagdollTime.RagdollSwitch.Value) or (not (not v438.Currents:FindFirstChild("B")) or not l__Character__437:FindFirstChild("Right Arm") or not (not v438.HealthValues["Right Arm"].Broken.Value) or not (not v438.HealthValues["Right Arm"].Destroyed.Value) or not (not v438.Grabbed.Value) or not (not v438.Handcuffed.Value) or not (not v438.Downed.Value)) or (not (not l__ReplicatedStorage__1.Values.ZaWarudo.Value) and l__ReplicatedStorage__1.Values.ZaWarudo.Owner.Value ~= l__LocalPlayer__40 or not (not _G.Shop_Active) or not (not _G.ATM_Active) or not (not l__Character__437:FindFirstChild("ProtectionFF")) or l__Character__437:FindFirstChild("SafeZoneFF")) then
						l__StarterGui__7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
					else
						l__StarterGui__7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true);
					end;
					if not (not v438.RagdollTime.RagdollSwitch.Value) and l__ServerTick__70.Value - v438.RagdollTime.Tick.Value < 30 or not (not v438.Handcuffed.Value) or not (not v438.Jailed.Value) or v438.Downed.Value then
						u89(false);
					else
						u89(true);
					end;
					u123(l__Character__437, l__HumanoidRootPart__440, v439, v438);
				end;
				local l__HealthValues__461 = v438.HealthValues;
				local function u218(p190, p191)
					v51.hBS.Volume = 0.85 - l__math__3.clamp(v439.Health / v439.MaxHealth, 0, 1) * 1.5;
					v51.hBS.PlaybackSpeed = 1 - -0.75 * (v439.Health / v439.MaxHealth);
					if p190 == "On" then
						if v51.hBS.Playing ~= false then
							return;
						end;
					else
						if p190 == "Off" then
							v51.hBS.Looped = false;
						end;
						return;
					end;
					v51.hBS.Looped = true;
					v51.hBS:Play();
				end;
				l__pcall__1(function()
					l__pcall__1(function()
						u213:Cancel();
					end);
					u213 = l__TweenService__3:Create(v51.effect4, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Size = 0
					});
					if not v439 or v439.Parent == nil or not _G.IsAlive then
						u213 = l__TweenService__3:Create(v51.effect4, TweenInfo.new(0, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = 100000
						});
						u213:Play();
						return;
					end;
					local l__MoveDirection__462 = v439.MoveDirection;
					local v463 = v439.RootPart.CFrame.lookVector:Dot(l__MoveDirection__462);
					local v464 = v439.RootPart.CFrame.rightVector:Dot(l__MoveDirection__462);
					u22.WS = v61.DefaultWalkSpeed;
					local v465
					if not l__Character__437:FindFirstChild("Left Leg") then
						v465 = l__Character__437:FindFirstChild("Right Leg");
						if v465 then
							v465 = not v438.HealthValues["Right Leg"].Broken.Value or not v438.HealthValues["Left Leg"].Broken.Value;
							if v465 then
								v465 = not v438.Currents:FindFirstChild("AC");
								if v465 then
									v465 = false;
									if v439:GetState() ~= Enum.HumanoidStateType.Swimming then
										v465 = false;
										if v439:GetState() ~= Enum.HumanoidStateType.Climbing then
											v465 = l__math__3.abs(l__HumanoidRootPart__440.Velocity.Y) < 21;
										end;
									end;
								end;
							end;
						end;
					else
						v465 = not v438.HealthValues["Right Leg"].Broken.Value or not v438.HealthValues["Left Leg"].Broken.Value;
						if v465 then
							v465 = not v438.Currents:FindFirstChild("AC");
							if v465 then
								v465 = false;
								if v439:GetState() ~= Enum.HumanoidStateType.Swimming then
									v465 = false;
									if v439:GetState() ~= Enum.HumanoidStateType.Climbing then
										v465 = l__math__3.abs(l__HumanoidRootPart__440.Velocity.Y) < 21;
									end;
								end;
							end;
						end;
					end;
					local v466
					if not l__Character__437:FindFirstChild("Left Leg") then
						v466 = l__Character__437:FindFirstChild("Right Leg") and ((not v438.HealthValues["Right Leg"].Broken.Value or not v438.HealthValues["Left Leg"].Broken.Value) and not v438.Currents:FindFirstChild("AS"));
					else
						v466 = (not v438.HealthValues["Right Leg"].Broken.Value or not v438.HealthValues["Left Leg"].Broken.Value) and not v438.Currents:FindFirstChild("AS");
					end;
					if u88 and not u13() and not v438.Crouching.Value and v438.RagdollTime.Value <= 0 and v466 then
						if v438.Sprinting.Value == true and l__math__3.abs(v463) and v463 < 0.1 then
							u107(false);
						elseif l__math__3.abs(v463) and v463 > 0.1 then
							u214 = 1;
							u107(true);
						end;
					elseif v438.Sprinting.Value == true then
						u107(false);
					end;
					if (u87 or v438.Currents:FindFirstChild("FORCEC")) and not v438.Sprinting.Value and not u13() and ((not u215 and l__tick__8() - u216 > 0.3 or u215) and v438.RagdollTime.Value <= 0) and (not v438.Currents:FindFirstChild("AC") and v465) then
						u214 = 2;
						v438.Crouching.Value = true;
						u22.WS = v61.CrouchWalkSpeed;
						if not u215 then
							u216 = l__tick__8();
							u34:Play();
							u33:Pause();
							u35:Pause();
							if _G.WalkAnim then
								_G.WalkAnim:AdjustWeight(0.5);
							end;
							l__pcall__1(function()
								u217:Pause();
							end);
							u215 = v439:LoadAnimation(l__ReplicatedStorage__1.Storage.Animations.Crouch);
							u215.Priority = Enum.AnimationPriority.Idle;
							u215:Play(0.175);
							u215:AdjustWeight(0.5);
							u217 = l__TweenService__3:Create(l__Players__4.LocalPlayer.Character.Humanoid, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
								HipHeight = -1.5
							});
							u217:Play();
						end;
					else
						u214 = 1;
						v438.Crouching.Value = false;
						if u215 then
							u33:Pause();
							u34:Pause();
							u35:Play();
							l__pcall__1(function()
								u217:Pause();
							end);
							u215:Stop(0.175);
							u215:Destroy();
							u215 = nil;
							if _G.WalkAnim then
								_G.WalkAnim:AdjustWeight(1);
							end;
							u217 = l__TweenService__3:Create(l__Players__4.LocalPlayer.Character.Humanoid, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
								HipHeight = 0
							});
							u217:Play();
						end;
					end;
					if v439.Health > 0 then
						if v439.Health < v439.MaxHealth / v439.MaxHealth * 65 then
							u218("On", "Stage1");
						elseif v439.MaxHealth / v439.MaxHealth * 65 < v439.Health then
							u218("Off");
						end;
					else
						u218("Off");
					end;
					local v467 = 1;
					local v468 = 1;
					local v469 = v439.MaxHealth / v439.MaxHealth * 65;
					local v470 = v439.MaxHealth / v439.MaxHealth * 30;
					local v471 = Vector3.new();
					if v469 < v439.Health and not u13(l__Character__437) then
						v467 = 1;
						v468 = 0;
					elseif v439.Health <= v469 and v470 < v439.Health and not u13(l__Character__437) then
						v467 = 1.25;
						v468 = 3.5;
					elseif v439.Health <= v470 and v439.Health > 25 and not u13(l__Character__437) then
						v467 = 1.5;
						v468 = 5;
					elseif (v439.Health <= 25 or u13(l__Character__437)) and v439.Health > 0 then
						v467 = 2;
						v468 = 7.5;
						v471 = Vector3.new(-35, -20, 0);
					elseif v439.Health <= 0 then
						v467 = 3.5;
						v468 = 5;
						v471 = Vector3.new(-80, -5, 0);
					end;
					v51.eq_tv:Update(v471);
					v51.eqA_2.HighGain = v51.eq_tv.Value.X;
					v51.eqA_2.MidGain = v51.eq_tv.Value.Y;
					v51.eqA_2.LowGain = v51.eq_tv.Value.Z;
					v51.eqB_2.HighGain = v51.eq_tv.Value.X;
					v51.eqB_2.MidGain = v51.eq_tv.Value.Y;
					v51.eqB_2.LowGain = v51.eq_tv.Value.Z;
					local v472 = (1 - v51.hBS.PlaybackLoudness * 0.0005) / v467;
					local v473 = Color3.new(1, v472, v472);
					if u47 then
						v473 = Color3.new(1, 1, 1);
					end;
					l__TweenService__3:Create(v51.effect1, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						TintColor = v473, 
						Contrast = 0.25 - v472 / 4, 
						Brightness = l__math__3.max((0.25 - v472 / 4) / 3, 0)
					}):Play();
					v51.effect3.Size = v51.hBS.PlaybackLoudness * 0.002 * v467;
					if v439:GetState() ~= Enum.HumanoidStateType.Dead or not (not u84) then
						u213 = l__TweenService__3:Create(v51.effect4, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = v468
						});
						u213:Play();
						return;
					end;
					u84 = true;
					u213 = l__TweenService__3:Create(v51.effect4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = 30
					});
					u213:Play();
					u10(0.35);
					u213 = l__TweenService__3:Create(v51.effect4, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
						Size = 3
					});
					u213:Play();
				end);
			end;
		end);
		coroutine.wrap(function()
			while true do
				u10(p1.RequestRate);
				l__MSNYCHE__64:FireServer(l__tick__8() - (p1.IntSalt + (p1.UsernameSalt and u20(tostring(l__LocalPlayer__40)) or 0) + (p1.UserIdSalt and l__LocalPlayer__40.UserId / 2 or 0)));			
			end;
		end)();
		(function()
			u22 = u7(u23);
			if not l__LocalPlayer__40.Parent or not l__Players__4:FindFirstChild(l__LocalPlayer__40.Name) then
				script:Destroy();
			end;
			u15.Event:Connect(function()
				if l__LocalPlayer__40.Character and l__LocalPlayer__40.Character:FindFirstChildOfClass("Humanoid") then
					l__LocalPlayer__40.Character:FindFirstChildOfClass("Humanoid").Health = -10;
				end;
			end);
			l__LocalPlayer__40.AncestryChanged:Connect(function(p192, p193)
				if not p193 then
					if workspace:FindFirstChild("Map") then
						l__Map__45:Destroy();
					end;
					if workspace:FindFirstChild("Filter") then
						l__Filter__46:Destroy();
					end;
					if workspace:FindFirstChild("Characters") then
						l__Characters__48:Destroy();
					end;
					if workspace:FindFirstChild("Debris") then
						l__Debris__47:Destroy();
					end;
					l__ReplicatedStorage__1:ClearAllChildren();
					script:Destroy();
				end;
			end);
			u77 = Instance.new("Folder", l__Debris__47);
			u77.Name = "ToClear";
			_G.FolderToClear = u77;
			_G.S_Take = u109;
			_G.S_Get = u110;
			_G.S_Check = u111;
			_G.DownedCheck = u13;
			_G.RagdollCheck = u12;
			_G.AffectChar = u52;
			_G.UnaffectChar = function(m)
				pcall(function()
					_G.GVF().Currents[m]:Destroy()
				end)
			end

			_G.CheckIfCan = u101;
			_G.cTag = u45;
			_G.gTag = u112;
			_G.CheckIfFlinching = u105;
			_G.TeamCheck = u113;
			_G.WaitForChar = u81;
			_G.GVF = u11;
			_G.WalkAnimFunc = u114;
			_G.GamepassCheck = u115;
			_G.PromptGamepass = u116;
			_G.PromptProductPurchase = u119;
			_G.InCombatCheck = u108;
			_G.LimbCheck = u104;
			_G.RagdollChar = u122;
			_G.ForceChar = u102;
			_G.IsAlive = false;
			_G.GSettings = {
				Debug = true
			}
			l__Events__30:WaitForChild("FT_").OnClientEvent:Connect(_G.ForceChar)
			function _G.DoBodyGyroFunc(p194)
				local l__Character__474 = l__LocalPlayer__40.Character;
				u123(l__Character__474, l__Character__474 and l__Character__474:FindFirstChild("HumanoidRootPart"), l__Character__474 and l__Character__474:FindFirstChild("Humanoid"), u11(), p194);
			end;
			l__ReplicatedStorage__1:WaitForChild("Values", 5);
			l__ReplicatedStorage__1.Values.ServerTick.Changed:Connect(function()
				l__ReplicatedStorage__1.Values.ClientServerTick.Value = l__tick__8();
			end);
			l__ReplicatedStorage__1.Values.ClientServerTick.Value = l__tick__8();
			u124();
			l__Events__30:WaitForChild("ChangeState").OnClientEvent:Connect(function(p195, p196, p197)
				if l__LocalPlayer__40.Character then
					local v475 = l__LocalPlayer__40.Character:FindFirstChildOfClass("Humanoid");
					if v475 then
						for v476 = 1, p196 do
							v475:ChangeState(p195, true);
							l__RunService__2.Heartbeat:Wait();
						end;
					end;
				end;
			end);
			l__Events__30:WaitForChild("PurchaseFinished").OnClientEvent:Connect(function(p198, p199, p200)
				if p200 then
					local v477 = Instance.new("BoolValue");
					v477.Name = p199;
					v477.Parent = v43.Gamepasses;
				end;
			end);
			l__Events__30:WaitForChild("GetGamepasses").OnClientEvent:Connect(function(p201)
				for v478, v479 in pairs(p201) do
					if not v43.Gamepasses:FindFirstChild(v479) then
						local v480 = Instance.new("BoolValue");
						v480.Name = v479;
						v480.Parent = v43.Gamepasses;
					end;
				end;
			end);
			l__Events__30:WaitForChild("UN_DWNTING").OnClientEvent:Connect(function(p202, p203)
				local l__Character__481 = l__LocalPlayer__40.Character;
				local v482 = l__Character__481 and l__Character__481:FindFirstChild("HumanoidRootPart");
				if l__Character__481 and v482 then
					for v483 = 1, 2 do
						v482.CFrame = p202;
						l__RunService__2.Heartbeat:Wait();
					end;
				end;
			end);
			l__Events__30:WaitForChild("SyncDoor").onClientEvent:Connect(function(p204)
				for v484 = 1, 3 do
					for v485, v486 in pairs(p204) do
						local v487 = v486[1];
						if v487 and v487.Parent and v487.Anchored then
							v487.CFrame = v486[2];
						end;
					end;
					l__RunService__2.Heartbeat:Wait();
				end;
			end);
			l__MOVZREP__43.OnClientEvent:Connect(function(p205, p206, p207, p208, p209, p210, p211, p212)
				if p205 == l__LocalPlayer__40.Character then
					return;
				end;
				pcall(function()
					if (p205.Torso.Position - l__LocalPlayer__40.Character.Torso.Position).Magnitude then
						return
					end
				end)
				u93(p205, p206, p207, p208, p209, p210, p211, p212);
			end);
			for v488, v489 in pairs(workspace:GetDescendants()) do
				u125(v489);
			end;
			workspace.DescendantAdded:Connect(u125);

			l__Events__30:WaitForChild("MonitorSound").OnClientEvent:Connect(u130);
			l__Events2__31:WaitForChild("MonitorSound").Event:Connect(u130);
			l__Events__30:WaitForChild("MonitorSound2").OnClientEvent:Connect(u130);
			l__Events2__31:WaitForChild("MonitorSound2").Event:Connect(u130);
			l__Events__30:WaitForChild("FKZUJV").OnClientEvent:Connect(u102);
			l__Events__30:WaitForChild("CFRCE").OnClientEvent:Connect(u132);
			l__Events__30:WaitForChild("ShellShock").OnClientEvent:Connect(u133);
			l__Events__30:WaitForChild("Flash").OnClientEvent:Connect(u138);
		end)();
		warn("|--FRAMEWORK LOADED--|");
		_G.ClientLoaded = true;
	end
};
