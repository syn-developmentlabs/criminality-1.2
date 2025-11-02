-- Decompiled with the Synapse X Luau decompiler.

local l__PhysicsService__1 = game:GetService("PhysicsService");
local l__Workspace__2 = game:GetService("Workspace");
local l__Modules__3 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local v4 = require(l__Modules__3:WaitForChild("Damage"));
local l__CurrentCamera__1 = l__Workspace__2.CurrentCamera;
local function u2(p1, p2, p3)
	local v5 = nil;
	local v6 = math.acos(math.clamp(p2:Dot(p3) / (p2.Magnitude * p3.Magnitude), -1, 1));
	v5 = p2.Magnitude;
	if math.pi / 2 < v6 then
		return v5;
	end;
	return math.sin(v6) * v5;
end;
local u3 = require(script.Parent:WaitForChild("ShellOut"));
local l__LocalPlayer__4 = game.Players.LocalPlayer;
local u5 = require(l__Modules__3:WaitForChild("Config"));
local function u6(p4, p5, p6)
	u3(p4, p5, p6);
end;
local l__Debris__7 = game:GetService("Debris");
local function u8(p7, p8)
	p8 = 100000
	return (l__CurrentCamera__1.CFrame.p - p7).Magnitude < p8;
end;
local BloodTrailEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events2"):WaitForChild("BloodTrailEvent")
local function CreateBloodTrail(Attachment, Amount, Speed, Spread, Size, WidthScale, UpVector, RepeatCount,RepeatTick)
	local Blood = {}
	Blood.Amount = Amount
	Blood.Speed = Speed
	Blood.Spread = Spread
	Blood.Size = Size
	Blood.WidthScale = WidthScale
	Blood.UpVector = UpVector
	Blood.RepeatCount = RepeatCount
	Blood.RepeatTick = RepeatTick
	BloodTrailEvent:Fire(Attachment,Blood,true)
end

local A = {
	Amount = { 1, 1 }, 
	Speed = 1, 
	Spread = { -500, 500 }, 
	Size = 1.4,  
	WidthScale = 1.5, 
	UpVector = Vector3.new(0, -14, 0), 
	RepeatCount = 10, 
	RepeatTick = 1, 
	MaxYAngle = 50
}
local function u9(p9, p10, p11)
	local v7 = nil;
	local v8 = nil;
	local v9 = nil;
	local v10 = Ray.new(p9, p10);
	local v11 = nil;
	table.insert(p11, workspace.Filter);
	table.insert(p11, workspace.Debris);
	local v15
	while true do
		task.wait()
		local v12, v13, v14 = workspace:FindPartOnRayWithIgnoreList(v10, p11);
		v7 = v12;
		v8 = v13;
		v9 = v14;
		if v7 then
			v11 = v7.Parent:FindFirstChildOfClass("Humanoid");
			if v7.Name == "HumanoidRootPart" or v11 and (v11.Name == "" or v11.Health <= 0) then
				v11 = nil;
			end;
			if v11 then
				v15 = true;
			elseif v7.Transparency < 1 and not v7.Parent:IsA("Accessory") then
				v15 = true;
			else
				table.insert(p11, v7);
				v15 = false;
			end;
		else
			v15 = true;
		end;
		if v15 then
			break;
		end;	
	end;
	return v7, v8, v9, v11, u2(p9, p10, v8);
end;
local l__Debris__10 = l__Workspace__2:WaitForChild("Debris");
local l__SoundService__11 = game:GetService("SoundService");
local l__TweenService__12 = game:GetService("TweenService");
local l__RunService__13 = game:GetService("RunService");
local u14 = require(script.Parent:WaitForChild("Damage"));
local fastcastredux = require(l__Modules__3.FastCastRedux)
local fastcast = fastcastredux.new()
local bul = game:GetService("ReplicatedStorage").Storage.Bullet:Clone()
function OnRayUpdated(cast, segmentOrigin, segmentDirection, length, segmentVelocity, cosmeticBulletObject, lp)
	if cosmeticBulletObject == nil then
		return 
	end
	
	local bulletLength = cosmeticBulletObject.Size.Z / 2
	local baseCFrame = CFrame.new(segmentOrigin, segmentOrigin + segmentDirection)
	cosmeticBulletObject.CFrame = baseCFrame * CFrame.new(0, 0, -(length - bulletLength))
	
	if not game:GetService("CollectionService"):HasTag(cosmeticBulletObject, "Debris") then
		game:GetService("CollectionService"):AddTag(cosmeticBulletObject, "Debris")
		game:GetService("Debris"):AddItem(cosmeticBulletObject, 3)
	end
	
	if lp ~= l__LocalPlayer__4 then
		if (cosmeticBulletObject.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 15 and (cosmeticBulletObject.Position - workspace.CurrentCamera.CFrame.Position).Magnitude >= 10 then
			if not game:GetService("CollectionService"):HasTag(cosmeticBulletObject, "Whizzed") then
				game:GetService("CollectionService"):AddTag(cosmeticBulletObject, "Whizzed")

				local Whizzes = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("WhizzSounds"):WaitForChild("Whizz"):GetChildren()
				local Whizz = Whizzes[math.random(1, #Whizzes)]:Clone()
				Whizz.Parent = workspace.Audio
				Whizz:Play()
				game:GetService("Debris"):AddItem(Whizz, Whizz.TimeLength / Whizz.PlaybackSpeed)
			end
		elseif (cosmeticBulletObject.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 10 and (cosmeticBulletObject.Position - workspace.CurrentCamera.CFrame.Position).Magnitude >= 5 then
			if not game:GetService("CollectionService"):HasTag(cosmeticBulletObject, "Crack") then
				game:GetService("CollectionService"):AddTag(cosmeticBulletObject, "Crack")

				local Cracks = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("WhizzSounds"):WaitForChild("BigCrack"):GetChildren()
				local Crack = Cracks[math.random(1, #Cracks)]:Clone()
				Crack.Parent = workspace.Audio
				Crack:Play()
				game:GetService("Debris"):AddItem(Crack, Crack.TimeLength / Crack.PlaybackSpeed)
			end
		elseif (cosmeticBulletObject.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 5 then
			if not game:GetService("CollectionService"):HasTag(cosmeticBulletObject, "Crack2") then
				game:GetService("CollectionService"):AddTag(cosmeticBulletObject, "Crack2")

				local Cracks = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("WhizzSounds"):WaitForChild("SmallCrack"):GetChildren()
				local Crack = Cracks[math.random(1, #Cracks)]:Clone()
				Crack.Parent = workspace.Audio
				Crack:Play()
				game:GetService("Debris"):AddItem(Crack, Crack.TimeLength / Crack.PlaybackSpeed)
			end
		end
	end
end
fastcast.LengthChanged:Connect(OnRayUpdated)
local RNG = Random.new()
local TAU = math.pi * 2	
local l__HitEffects__36 = script.HitEffects;

local bulletholes = 0
local bullets = 0

local function Do(Attachment, v56, v42)
	CreateBloodTrail(Attachment, A.Amount, A.Speed, A.Spread, 1, A.WidthScale,A.UpVector, 3, 0.6)
	local decals = script.Parent.Damage.Decals:GetChildren()
	local decal = decals[math.random(1, #decals)]:Clone()
	decal.Parent = v56

	local pl = game:GetService("Players"):GetPlayerFromCharacter(v42.Parent)
	if pl then
		if v42.Name ~= "Head" then
			local HitSounds = script:WaitForChild("HitSounds"):WaitForChild("Hit"):GetChildren()
			local HitSound = HitSounds[math.random(1, #HitSounds)]:Clone()
			HitSound.Parent = v42
			HitSound:Play()
			game:GetService("Debris"):AddItem(HitSound, 3)
		elseif v42.Name == "Head" then
			local HitSounds = script:WaitForChild("HitSounds"):WaitForChild("Headshot"):GetChildren()
			local HitSound = HitSounds[math.random(1, #HitSounds)]:Clone()
			HitSound.Parent = v42
			HitSound:Play()
			game:GetService("Debris"):AddItem(HitSound, 3)
		end
	end
end

local function Do2(b)
	local v56 = script.BulletHole:Clone();
	local v57 = CFrame.new(b.Position, b.Position + b.Normal) * CFrame.Angles(0, 0, math.rad(math.random(0, 360)));
	v56.CFrame = v57;
	v56.Size = Vector3.new(0.7, 0.7, 0);
	v56.Parent = l__Debris__10;
	local v58 = Instance.new("Attachment", v56);
	v58.WorldCFrame = v57;
	v58.Parent = v56;
	game.Debris:AddItem(v56,5);
	v56.Anchored = false
	v56.Decal:Destroy()

	local Weld = Instance.new("WeldConstraint", b.Instance)
	Weld.Part0 = b.Instance
	Weld.Part1 = v56

	local Attachment = Instance.new("Attachment", b.Instance)
	Attachment.WorldCFrame = v57
	Attachment.Visible = false

	game:GetService("Debris"):AddItem(Attachment, 15)
	
	return Attachment, v56
end

fastcast.RayHit:Connect(function(a, b, c, d, e, f, g)
	pcall(function()
		if g ~= l__LocalPlayer__4 then
			if (b.Position - l__LocalPlayer__4.Character.Torso.Position).Magnitude > 200 then
				return
			end
		end
	end)
	
	local Attachment, v56 = nil, nil
	
	local v42 = b.Instance
	d.Anchored = true
	
	if bulletholes < 25 then
		Attachment, v56 = Do2(b)
		if v42 and (not v42:IsDescendantOf(workspace:FindFirstChild("Characters"))) then
			bulletholes += 1
			local v56 = script.BulletHole:Clone();
			local v57 = CFrame.new(b.Position, b.Position + b.Normal) * CFrame.Angles(0, 0, math.rad(math.random(0, 360)));
			v56.CFrame = v57;
			v56.Size = Vector3.new(0.25, 0.25, 0);
			v56.Parent = l__Debris__10;
			local v58 = Instance.new("Attachment", v56);
			v58.WorldCFrame = v57;
			v58.Parent = v56;
			game.Debris:AddItem(v56, 5);
			task.spawn(function()
				task.wait(5)
				bulletholes -= 1
			end)
			v56.Anchored = false

			local Weld = Instance.new("WeldConstraint", v42)
			Weld.Part0 = v42	
			Weld.Part1 = v56;
			(function(p20)
				local v59 = l__HitEffects__36[p20.Name];
				local v60 = v59:GetChildren();
				for i,v in pairs(v60) do
					if v:IsA("ParticleEmitter") then
						local t = v:Clone()
						t.Parent=v58
						t:Emit(t:FindFirstChild("EmitCount").Value)
					end
				end
				if v59:FindFirstChild("Sounds") and #v59.Sounds:GetChildren() > 0 then
					local v63 = v59.Sounds:GetChildren()[math.random(1, #v59.Sounds:GetChildren())]:Clone();
					v63.Parent = v58;
					v63.PlaybackSpeed = Random.new():NextNumber(v63.PlaybackSpeed * 0.9, v63.PlaybackSpeed * 1.1);
					v63:Play();
					game.Debris:AddItem(v63, 5);
				end;
			end)((function(p21)
				if p21 == Enum.Material.DiamondPlate or p21 == Enum.Material.Metal or p21 == Enum.Material.CorrodedMetal then
					return Enum.Material.Metal;
				end;
				if p21 == Enum.Material.Glass or p21 == Enum.Material.Ice then
					return Enum.Material.Glass;
				end;
				if p21 == Enum.Material.Wood or p21 == Enum.Material.WoodPlanks then
					return Enum.Material.Wood;
				end;
				if p21 == Enum.Material.Grass or p21 == Enum.Material.Fabric then
					return Enum.Material.Grass;
				end;
				if p21 ~= Enum.Material.Sand and p21 ~= Enum.Material.Pebble then
					return Enum.Material.Concrete;
				end;
				return Enum.Material.Sand;
			end)(v42.Material));
		end;
	end
	
	game:GetService("Debris"):AddItem(d, 5)

	if v42 then
		if v42.Name == "RIOTSHIELDHITPART" then
			local v56 = script.BulletHole:Clone();
			local v57 = CFrame.new(b.Position, b.Position + b.Normal) * CFrame.Angles(0, 0, math.rad(math.random(0, 360)));
			v56.CFrame = v57;
			v56.Size = Vector3.new(0.25, 0.25, 0);
			v56.Parent = l__Debris__10;
			local v58 = Instance.new("Attachment", v56);
			v58.WorldCFrame = v57;
			v58.Parent = v56;
			game.Debris:AddItem(v56,15);
			v56.Anchored = false

			local Weld = Instance.new("WeldConstraint", v42)
			Weld.Part0 = v42	
			Weld.Part1 = v56;
			
			local v59 = l__HitEffects__36["RiotShield"];
			local v60 = v59:GetChildren();
			for i,v in pairs(v60) do
				if v:IsA("ParticleEmitter") then
					local t = v:Clone()
					t.Parent=v58
					t:Emit(t:FindFirstChild("EmitCount").Value)
				end
			end
			if v59:FindFirstChild("Sounds") and #v59.Sounds:GetChildren() > 0 then
				local v63 = v59.Sounds:GetChildren()[math.random(1, #v59.Sounds:GetChildren())]:Clone();
				v63.Parent = v58;
				v63.PlaybackSpeed = Random.new():NextNumber(v63.PlaybackSpeed * 0.9, v63.PlaybackSpeed * 1.1);
				v63:Play();
				game.Debris:AddItem(v63, 5);
			end;
		else
			if v42 then
				if v42.Parent:FindFirstChildOfClass("Humanoid") then
					if not v42.Parent then
						return
					end
					if v42.Parent.Humanoid.Health <= 0 then
						return
					end
					if v42.Parent:FindFirstChildOfClass("ForceField") then
						if g == l__LocalPlayer__4 then
							game:GetService("ReplicatedStorage").Events2.ClientWarn:Fire({"Player is protected!", "error"})
						end
						return
					end
					if g.Team and game:GetService("Players"):GetPlayerFromCharacter(v42.Parent).Team then
						if g.Team == game:GetService("Players"):GetPlayerFromCharacter(v42.Parent).Team then
							if g == l__LocalPlayer__4 then
								game:GetService("ReplicatedStorage").Events2.ClientWarn:Fire({"Friendly fire!", "error"})
							end
							return
						end
					end
					if g == l__LocalPlayer__4 then
						if e:IsDescendantOf(l__LocalPlayer__4.Character) then
							game:GetService("ReplicatedStorage").Events2.Hitmarker:Fire(b.Instance)
						end
						game:GetService("ReplicatedStorage").Events.Gun_Shoot:FireServer(e, {b.Instance, b.Position, b.Normal}, f)
					end
					
					if bulletholes < 25 then
						if Attachment and v56 and v42 then
							Do(Attachment, v56, v42)
						end	
					end
				end
			end
		end
	end
end)
return function(plrcheck, p13, p14, p15, p16, p17, p18, spread)
	if p13 then
		if p13[1] then
			if not p13[1]:FindFirstChild("Handle") then
				return
			end
		end
	end
	
	bullets += 1
	
	task.spawn(function()
		task.wait(1.5)
		bullets -= 1				
	end)
	
	if bullets > 30 then
		if plrcheck ~= l__LocalPlayer__4 then
			return
		end
	end
	
	local l__Handle__16 = p13[1].Handle;
	local l__Muzzle__17 = l__Handle__16.Muzzle;
	local l__FirePos__18 = l__Handle__16.FirePos;
	local l__Value__19 = p13[1].Values.Ammo.Value;
	local v20 = require(p13[1].Config)
	local l__Attachments__21 = p13[1]:FindFirstChild("Attachments");
	if l__Handle__16:FindFirstChild("ReloadSound_Clone") then
		l__Handle__16.ReloadSound_Clone:Destroy();
	end;
	if v20.ShotgunSettings.FirePump and l__Handle__16 and l__Handle__16.Parent then
		delay(1 / (v20.ShotgunSettings.FirePumpWait1 * 1.5), function()
			if l__Handle__16 and l__Handle__16.Parent and plrcheck and plrcheck.Parent and plrcheck.Character and plrcheck.Character.Parent and not _G.RagdollCheck(plrcheck.Character) then
				if p13[1]:FindFirstChild("ReloadM") then
					local u9 = require(p13[1].ReloadM)
					spawn(function()
						u9(true, true, "Pump")
					end)
				end
				if l__Handle__16.ReloadA:FindFirstChild("Pump") then
					l__Handle__16.ReloadA.Pump:Play();
				end
				u6(v20, l__Handle__16, p17);
			end;
		end);
	end;
	local v22 = 0;
	for v23, v24 in pairs(l__Muzzle__17:GetChildren()) do
		if string.match(v24.Name, "FireSound%d+") then
			v22 = v22 + 1;
		end;
	end;
	local v25 = nil;
	if v20.MinigunEnabled then
		l__Muzzle__17.FireSound.Playing = true
	else

		v25 = l__Muzzle__17["FireSound" .. tostring(math.random(v22))]:Clone();
		v25.Name = "FireSound_Clone";
		v25.Parent = l__Muzzle__17
		pcall(function()
			if not plrcheck and _G.FP then
				v25.Parent = _G.VM.CloneTool.Handle.Muzzle
			end
		end)
		local v26 = math.floor(v20.MagSize * 0.45);
		if l__Value__19 < v26 then
			local v27 = (v26 - l__Value__19) / v26;
			local v28 = script.AmmoEqualizer:Clone();
			v28.LowGain = -7 * v27;
			v28.HighGain = 7 * v27;
			--v28.Parent = v25;
		end;
		local v29 = math.min(((l__CurrentCamera__1.CFrame.p - p14).Magnitude / 500) ^ 3, 2);
		if v29 >= 0.1 then
			local v30 = script.DistanceEqualizer:Clone();
			v30.HighGain = -10 * v29;
			v30.MidGain = -5 * v29;
			v30.LowGain = -5 * v29;
			--v30.Parent = v25;
		end;
		v25.PlaybackSpeed += math.random(-100, 100) / 1000
		v25:Play();
		l__Debris__7:AddItem(v25, v25.TimeLength / v25.PlaybackSpeed);
	end;
	local l__FlashSettings__31 = v20.FlashSettings;
	if l__FlashSettings__31.Enabled and p18 then
		local v32 = Instance.new("PointLight");
		v32.Brightness = l__FlashSettings__31.Brightness;
		local Color = l__FlashSettings__31.Color
		if p15 == "RB" then
			Color = Color3.fromRGB(150, 255, 150)
		elseif p15 == "HSP" then
			Color = Color3.fromRGB(255, 150, 150)
		end
		v32.Color = Color
		v32.Shadows = l__FlashSettings__31.Shadows;
		v32.Range = l__FlashSettings__31.Range;
		v32.Parent = l__Muzzle__17;
		game.Debris:AddItem(v32, l__FlashSettings__31.Time);
	end;
	if v20.Silenced then
		v25.PlaybackSpeed = v25.PlaybackSpeed * 1.5;
		script.SilencedEqualizer:Clone().Parent = v25;
	else
		local v34 = l__Muzzle__17;
		pcall(function()
			if plrcheck == l__LocalPlayer__4 then
				if _G.FP then
					v34 = _G.VM.CloneTool.Handle.Muzzle
				end	
			end
		end)
		v34.FlashEmitter:Emit(v20.MuzzleFlashEmitCount);
	end;
	if not v20.ShotgunSettings.FirePump and not v20.SniperReload then
		u6(v20, l__Handle__16);
	end;
	if _G.VM then
		if not p18 then
			p18 = 1
		end
		local v35 = { p13[1], p13[1].Parent, l__CurrentCamera__1, workspace:WaitForChild("Camera"), _G.VM.Current, workspace.Debris, workspace.Filter, workspace:WaitForChild("Map"):WaitForChild("ATMz"), workspace:WaitForChild("Map"):WaitForChild("BredMakurz"), workspace:WaitForChild("Map"):WaitForChild("Parts"):WaitForChild("Grinders"), workspace:WaitForChild("Map"):WaitForChild("Shopz") };

		local behaviour = fastcast.newBehavior()

		local rcp = RaycastParams.new()
		rcp.FilterDescendantsInstances = v35
		rcp.FilterType = Enum.RaycastFilterType.Blacklist

		behaviour.CosmeticBulletContainer = workspace:WaitForChild("Camera")
		behaviour.RaycastParams = rcp
		bul.Trail.Lifetime = v20.BulletSettings.TracerLifetime
		bul.Attachment0.Position = v20.BulletSettings.TracerOffset0
		bul.Attachment1.Position = v20.BulletSettings.TracerOffset1
		local Color = v20.BulletSettings.Color
		if p15 == "RB" then
			Color = Color3.fromRGB(150, 255, 150)
		elseif p15 == "HSP" then
			Color = Color3.fromRGB(255, 150, 150)
		end
		bul.Trail.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color), ColorSequenceKeypoint.new(1, Color)}
		behaviour.CosmeticBulletTemplate = bul
		
		local bps = v20.BulletsPerShot
		
		for i = 1, bps do
			local direc = (CFrame.new(p13[2], p14) * CFrame.fromOrientation(0, 0, RNG:NextNumber(0, TAU)) * CFrame.fromOrientation(math.rad(RNG:NextNumber(spread.Min, spread.Max)), 0, 0)).LookVector
			
			fastcast:Fire(p13[2], direc, v20.BulletSettings.Velocity or 1900, behaviour, p13[1], p15, plrcheck)
		end
	end
end;
