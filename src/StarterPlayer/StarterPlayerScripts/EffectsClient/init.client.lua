-- Decompiled with the Synapse X Luau decompiler.

local l__UserInputService__1 = game:GetService("UserInputService");
local l__RunService__2 = game:GetService("RunService");
local l__TweenService__3 = game:GetService("TweenService");
local l__ReplicatedStorage__4 = game:GetService("ReplicatedStorage");
local l__Debris__5 = game:GetService("Debris");
local l__Debris__6 = workspace:WaitForChild("Debris");
local l__Events__7 = l__ReplicatedStorage__4:WaitForChild("Events");
local l__Events2__8 = l__ReplicatedStorage__4:WaitForChild("Events2");
local l__Modules__9 = l__ReplicatedStorage__4:WaitForChild("Modules");
local v10 = require(l__Modules__9.Damage);
local v11 = require(l__Modules__9.Effects);
local v12 = require(l__Modules__9:WaitForChild("Config"));
_G.CameraModule = require(l__Modules__9.CMRCM);
local u1 = {};
function Remove(p1)
	if u1[p1] then
		pcall(function()
			u1[p1]:Destroy();
		end);
		u1[p1] = nil;
	end;
end;
local l__Camera__2 = workspace.Camera;
local l__LocalPlayer__3 = game.Players.LocalPlayer;
local l__Storage__4 = l__ReplicatedStorage__4:WaitForChild("Storage");
local l__RunService__5 = game:GetService("RunService");
l__Events__7:WaitForChild("RemoveObject").OnClientEvent:Connect(function(p20)
	Remove(p20);
end);
function ProjectHandle(p21, p22)
	local u15 = nil;
	local u16 = nil;
	u16 = p21.Touched:Connect(function(p23)
		if p23.Transparency < 0.9 then
			if not p23:IsDescendantOf(workspace.Map) then
				if p23:IsDescendantOf(workspace.Characters) then
					p21.Anchored = true;
					u15 = p21.CFrame;
					u16:Disconnect();
				end;
			else
				p21.Anchored = true;
				u15 = p21.CFrame;
				u16:Disconnect();
			end;
		end;
	end);
	while true do
		l__RunService__5.RenderStepped:Wait();
		if p21 then

		else
			break;
		end;
		if p21.Parent then

		else
			break;
		end;
		if not u15 then

		else
			break;
		end;	
	end;
	if p22 then

	else
		return nil;
	end;
	p22:FireServer(p21, u15);
end;
function ExplosionHandle(p24, p25, p26)
	if p24 then
		if not p24.Parent then
			return;
		end;
	else
		return;
	end;
	if p24:FindFirstChild("Attachment") then
		local v37, v38, v39 = pairs(p24.Attachment:GetChildren());
		while true do
			local v40, v41 = v37(v38, v39);
			if v40 then

			else
				break;
			end;
			v39 = v40;
			if v41:IsA("ParticleEmitter") then
				if v41:FindFirstChild("Emit") then
					v41:Emit(v41:FindFirstChild("Emit").Value);
				end;
			end;		
		end;
	end;
	if p25 then
		p25:Play();
		l__Events2__8.MonitorSound:Fire(unpack(p26));
	end;
end;
l__Events__7:WaitForChild("ExplosionEffect").OnClientEvent:Connect(ExplosionHandle);
l__Events__7:WaitForChild("ProjectileHandle").OnClientInvoke = ProjectHandle;
l__Events__7:WaitForChild("ProjectileHandle2").OnClientEvent:Connect(ProjectHandle);
l__Events__7:WaitForChild("Effect").OnClientEvent:connect(function(...)
	v11:Effect(...);
end);
l__ReplicatedStorage__4:WaitForChild("Events").Gun_Shoot.OnClientEvent:Connect(function(plr,data)
	if plr==l__LocalPlayer__3 then
		return
	end
	if data==nil then
		return
	end
	require(l__Modules__9.Effects):Effect(unpack(data))
end)
l__Events__7.Gun_Update.OnClientEvent:Connect(function(l)
	l.Handle.Muzzle.FireSound.Playing = false
	l.Handle.Muzzle.FireStart2.Playing = false
end)
l__Events__7.RL.OnClientEvent:Connect(function(p, t)
	require(l__Modules__9.Effects.Reload)(p, t, true, 2, true)
end)
l__Events__7.Replicate.OnClientEvent:Connect(function(player, key, p2, p3, p4, p5, p6, p7)	
	if p4 == "Pump" or p4 == "ShotgunClipin" then
		require(l__Modules__9.Effects):Effect("Reload", player, p2, p3, p4)	
	elseif player == "Laser" then
		local LaserM = require(key.LaserM)
		LaserM.SetUp(p2, true)
		LaserM.Toggle(nil, false)
		key.RemoteEvent.OnClientEvent:Connect(function(b)
			LaserM.Toggle(nil, b)
		end)
	elseif player == "Equip" then
		if key ~= l__LocalPlayer__3 then
			pcall(function()
				p2.Handle.TriggerA.EquipSound:Play()
			end)
		elseif key == l__LocalPlayer__3 then
			return
		end
		require(l__Modules__9.Effects):Effect("Equip", player, p2, p3, p4)	
	else 
		if player == l__LocalPlayer__3 then
			return
		end
		require(l__Modules__9.Effects):Effect("Shoot", player, p2, p3, p4, p5, p6, nil, p7)	
	end

end)
l__Events__7.Replicate2.OnClientEvent:Connect(function(p1, p2, p3, p4, p5, p6)
	if p1 == l__LocalPlayer__3 then
		return
	end

	if p3 == "Cancel" then
		pcall(function()
			local l__ReloadA_Clone__65 = p4.Handle:FindFirstChild("ReloadA_Clone");
			if l__ReloadA_Clone__65 then
				l__ReloadA_Clone__65:Destroy();
			end;
		end)

		pcall(function()
			local l__ReloadA_Clone_Server__66 = p4.Handle:FindFirstChild("ReloadA_Clone_Server");
			if l__ReloadA_Clone_Server__66 then
				l__ReloadA_Clone_Server__66:Destroy();
			end;
		end)
	elseif p3 == "Reload" then
		require(l__Modules__9.Effects):Effect("Reload", p2, p5, p2, p5, p6)	
	end
end)

local fastcastredux = require(script:WaitForChild("FastCastRedux"))
local fastcast = fastcastredux.new()

function OnRayUpdated(cast, segmentOrigin, segmentDirection, length, segmentVelocity, cosmeticBulletObject, r)
	if cosmeticBulletObject == nil then
		return 
	end
	local bulletLength = cosmeticBulletObject.Size.Z / 2
	local baseCFrame = CFrame.new(segmentOrigin, segmentOrigin + segmentDirection)
	cosmeticBulletObject.CFrame = baseCFrame * CFrame.new(0, 0, -(length - bulletLength))
	r.CFrame = cosmeticBulletObject.CFrame
	r.EffectA.Sound.Playing = true

	if not game:GetService("CollectionService"):HasTag(cosmeticBulletObject, "Debris") then
		game:GetService("CollectionService"):AddTag(cosmeticBulletObject, "Debris")
		game:GetService("Debris"):AddItem(cosmeticBulletObject, 3)
	end
end

fastcast.LengthChanged:Connect(OnRayUpdated)

local function RayHit(a, b, c, d, e, f, g)
	game:GetService("Debris"):AddItem(d, 1)

	l__ReplicatedStorage__4.Events.Gun_Shoot2:FireServer(f, b.Position, e, g)
end

fastcast.RayHit:Connect(RayHit)

local bul = l__ReplicatedStorage__4.Storage.Bullet2:Clone()

l__Events__7.RL.OnClientEvent:Connect(function(Player, a, b, c, d, e, f, Rocket)
	if Player == l__LocalPlayer__3 then
		local function Fire(x)
			local Config = require(a.Config)

			local v35 = { a, a.Parent, workspace.CurrentCamera, workspace:WaitForChild("Camera"), _G.VM.Current, workspace.Debris, workspace.Filter, workspace:WaitForChild("Map"):WaitForChild("ATMz"), workspace:WaitForChild("Map"):WaitForChild("BredMakurz"), workspace:WaitForChild("Map"):WaitForChild("Parts"):WaitForChild("Grinders"), workspace:WaitForChild("Map"):WaitForChild("Shopz") };

			local behaviour = fastcast.newBehavior()

			local rcp = RaycastParams.new()
			rcp.FilterDescendantsInstances = v35
			rcp.FilterType = Enum.RaycastFilterType.Blacklist

			behaviour.CosmeticBulletContainer = workspace:WaitForChild("Camera")
			behaviour.RaycastParams = rcp
			behaviour.CosmeticBulletTemplate = bul
			behaviour.Acceleration = Config.GrenadeAcceleration or Vector3.new(0, -25, 0)

			for i = 1, Config.BulletsPerShot do
				fastcast:Fire(c[1], CFrame.new(c[1], c[2]).LookVector, Config.GrenadeSpeed, behaviour, Rocket, a, a.Values.Type.Value)
			end

			x.Muzzle:FindFirstChildOfClass("ParticleEmitter"):Emit(20)

			local Sound = a.Handle.Muzzle:FindFirstChildOfClass("Sound"):Clone()
			Sound.Parent = x.Muzzle
			Sound.PlaybackSpeed = Sound.PlaybackSpeed + math.random(-100, 100) / 1000
			Sound:Play()
			game:GetService("Debris"):AddItem(Sound, Sound.TimeLength / Sound.PlaybackSpeed)
		end

		local CloneTool = a.Handle
		pcall(function()
			if _G.FP then
				CloneTool = _G.VM.CloneTool.Handle
			end
		end)

		Fire(CloneTool)
	else
		pcall(function()
			a.Handle.Muzzle:FindFirstChildOfClass("ParticleEmitter"):Emit(20)
			local Sound = a.Handle.Muzzle:FindFirstChildOfClass("Sound"):Clone()
			Sound.Parent = a.Handle.Muzzle
			Sound.PlaybackSpeed = Sound.PlaybackSpeed + math.random(-100, 100) / 1000
			Sound:Play()
			game:GetService("Debris"):AddItem(Sound, Sound.TimeLength / Sound.PlaybackSpeed)
		end)
	end
end)
local LocalPlayer = game:GetService("Players").LocalPlayer
local l__CurrentCamera__12 = workspace.CurrentCamera

local u12 = 0;
local u13 = 0;
local u14 = Instance.new("ColorCorrectionEffect", l__CurrentCamera__12);
local l__TweenValue1__15 = script:WaitForChild("TweenValue1");
local l__TweenValue2__16 = script:WaitForChild("TweenValue2");
local u17 = {
	CameraBobbing = true
};
local u18 = 0;
local u19 = 0;
coroutine.resume(coroutine.create(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		u12 = 0;
		u13 = 0;
		u14.Brightness = l__TweenValue1__15.Value;
		l__CurrentCamera__12.CFrame = l__CurrentCamera__12.CFrame * CFrame.Angles(0, 0, math.rad(math.random(-l__TweenValue2__16.Value, l__TweenValue2__16.Value) * 0.01)) + Vector3.new(math.rad(math.random(-l__TweenValue2__16.Value, l__TweenValue2__16.Value)), math.rad(math.random(-l__TweenValue2__16.Value, l__TweenValue2__16.Value)), math.rad(math.random(-l__TweenValue2__16.Value, l__TweenValue2__16.Value)));
		if u17.CameraBobbing and u18 > 0 and u19 > 0 then
			l__CurrentCamera__12.CoordinateFrame = l__CurrentCamera__12.CoordinateFrame * CFrame.Angles(0, 0, math.rad(u18 * math.sin(tick() * u19)));
		end;
	end);
end))

local v80

coroutine.resume(coroutine.create(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		for v49, v50 in pairs(game:GetService("ReplicatedStorage").MonitorSoundsFolder:GetChildren()) do
			local v51 = v50:FindFirstChild("AddedValue");
			local v52 = v50:FindFirstChild("DistanceValue");
			local v53 = v50:FindFirstChild("ShakeMValue");
			local v54 = v50:FindFirstChild("BrightMValue");
			if v51 then
				v51 = v51.Value;
			end;
			if v52 then
				v52 = v52.Value;
			end;
			if v53 then
				v53 = v53.Value;
			end;
			if v54 then
				v54 = v54.Value;
			end;
			MonitorExplosionSound(v50.Value, v51, v52, v53, v54);
		end;
		l__TweenValue2__16.Value = u13 / 15
		l__TweenValue1__15.Value = u12 / 15
	end)
end))

function MonitorExplosionSound(p21, p22, p23, p24, p25)
	pcall(function()
		if not p24 then
			p24 = 1;
		end;
		if not p25 then
			p25 = 1;
		end;
		local u22 = p22;
		local u23 = p23;
		local l__Parent__79 = p21.Parent;
		if l__Parent__79 ~= nil then
			if l__Parent__79:IsA("BasePart") then
				if p21:IsA("Sound") then
					if LocalPlayer.Character ~= nil then
						if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
							if LocalPlayer.Character:FindFirstChild("Torso") then
								v80 = LocalPlayer.Character.Torso.CFrame.Position;
							else
								v80 = l__CurrentCamera__12.CFrame.Position;
							end;
						else
							v80 = l__CurrentCamera__12.CFrame.Position;
						end;
					else
						v80 = l__CurrentCamera__12.CFrame.Position;
					end;
					u22 = u22 and 1;
					u23 = u23 or 1;
					local v81 = p21.EmitterSize * 5 * u22;
					local v82 = (v80 - l__Parent__79.Position).Magnitude;
					if v82 < 3 then
						v82 = 3;
					end;
					u12 = u12 + p21.PlaybackLoudness * 2E-05 * u23 * math.clamp(1 - v82 / v81, 0, 1) * p25;
					u13 = u13 + p21.PlaybackLoudness * 0.0002 * u23 * (v81 / v82) * p24;
				end;
			end;
		end;
	end)
end;

game:GetService("RunService").RenderStepped:Connect(function()
	for _, ATM in pairs(workspace.Map.ATMz:GetChildren()) do
		if ATM:FindFirstChild("Parts") then
			if ATM.Parts:FindFirstChild("Fan") then
				ATM.Parts.Fan.ObjectPart.CFrame = ATM.Parts.Fan.ObjectPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(5, 0, 0)
			end
		end
	end
end)

game:GetService("RunService").Heartbeat:Connect(function(tme)
	for _, v in pairs(workspace:WaitForChild("Filter"):GetChildren()) do
		if v.Name == "Plane" and not v:FindFirstChild("an") and v:FindFirstChild("do") then
			local lol = (tme * 1800) / 1.35
			local inc2 = (tme * v:WaitForChild("inc2").Value) / 1.35
			local inc = (tme * v:WaitForChild("inc").Value) / 1.35
			if v then
				if v.PrimaryPart then
					v:SetPrimaryPartCFrame((v.PrimaryPart.CFrame * CFrame.Angles(math.rad(inc2), 0, math.rad(inc)) * CFrame.new(0, 0, -lol)))
				end
			end
		end
	end
end)

for _, Door in pairs(workspace.Map.Doors:GetChildren()) do
	pcall(function()
		local DoorHitbox = Instance.new("Part", Door)
		DoorHitbox.Name = "DoorBase"
		DoorHitbox.Size = Door.DoorBase.Size
		DoorHitbox.CFrame = Door.DoorBase.CFrame
		DoorHitbox.CanCollide = false
		DoorHitbox.Anchored = true
		DoorHitbox.Transparency = 1
		DoorHitbox.Color = Color3.fromRGB(0, 255, 0)
	end)
	pcall(function()
		local DoorHitbox = Instance.new("Part", Door)
		DoorHitbox.Name = "DoorBase"
		DoorHitbox.Size = Door.DoorBase2.Size
		DoorHitbox.CFrame = Door.DoorBase2.CFrame
		DoorHitbox.CanCollide = false
		DoorHitbox.Anchored = true
		DoorHitbox.Transparency = 1
		DoorHitbox.Color = Color3.fromRGB(0, 255, 0)
	end)
end