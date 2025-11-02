local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local PhysicsService = game:GetService("PhysicsService")
local DataStoreService = game:GetService("DataStoreService")
local ServerStorage = game:GetService("ServerStorage")

local Events = ReplicatedStorage:WaitForChild("Events")
local Storage = ReplicatedStorage:WaitForChild("Storage")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local CharStats = ReplicatedStorage:WaitForChild("CharStats")
local PlayerbaseData2 = ReplicatedStorage:WaitForChild("PlayerbaseData2")

local MHXU = Events:WaitForChild("MHXU")
local MHXU2 = Events:WaitForChild("MHXU2")
local DeathRespawn = Events:WaitForChild("DeathRespawn")
local MOVZREP = Events:WaitForChild("MOVZREP")

local Resources = ServerStorage:WaitForChild("Resources")

local DataStore = DataStoreService:GetDataStore("7qUJkXKdxEJKNu9dLmvpZ6dxhyyyVdBgM5seZm5x5")

local BloodTrailEvent = Events:WaitForChild("BloodTrailEvent")
local function CreateBloodTrail(Attachment, Blood)
	BloodTrailEvent:FireAllClients(Attachment, Blood, true)
end

local function AddRagdoll(C)
	task.spawn(function()
		local Torso = C:FindFirstChild("Torso")
		local HumanoidRootPart = C:FindFirstChild("HumanoidRootPart")
		local Head = C:FindFirstChild("Head")
		if HumanoidRootPart then
			C.PrimaryPart = HumanoidRootPart
		end

		if Head then
			Head.Size = Vector3.new(1,1,1)	
		end
		if HumanoidRootPart then
			local CTs = ServerStorage:WaitForChild("Ragdoll"):WaitForChild("CTs"):Clone()
			CTs.Parent = HumanoidRootPart
		end
		if Torso then
			for _, RagdollAttachment in pairs(game:GetService("ServerStorage"):WaitForChild("Ragdoll"):WaitForChild("RagdollAttachments"):GetChildren()) do
				if RagdollAttachment:IsA("Attachment") then
					local Clone = RagdollAttachment:Clone()
					Clone.Parent = Torso
				end
			end
			for _, BloodAttachment in pairs(ReplicatedStorage:WaitForChild("Storage"):WaitForChild("BloodStuff"):WaitForChild("BloodAttachments"):GetChildren()) do
				if BloodAttachment:IsA("Attachment") then
					local Clone = BloodAttachment:Clone()
					Clone.Parent = Torso
				end
			end
		end
		for _, v in pairs(game:GetService("ServerStorage"):WaitForChild("Ragdoll"):WaitForChild("Limbs"):GetChildren()) do
			if C:FindFirstChild(v.Name) then
				local Clone = v:WaitForChild(v.Name):WaitForChild("RagdollAttachment"):Clone()
				Clone.Parent = C:FindFirstChild(v.Name)
			end
		end
		for _, bp in pairs(C:GetChildren()) do
			if bp:IsA("BasePart") then
				if bp.Name ~= "HumanoidRootPart" then
					local Collider = Instance.new("Part", bp)
					Collider.CFrame = bp.CFrame
					Collider.Massless = true
					Collider.CanCollide = false
					Collider.Transparency = 1
					Collider.Anchored = false
					Collider.Name = "Collider"

					local Weld = Instance.new("WeldConstraint", bp)
					Weld.Part0 = bp
					Weld.Part1 = Collider

					workspace.DescendantRemoving:Connect(function(d)
						if d == bp then
							Collider:Destroy()
						end
					end)

					if bp.Name == "Head" then
						Collider.Size = Vector3.new(1, 0.5, 0.5)
					elseif bp.Name == "Torso" then
						Collider.Size = Vector3.new(1, 1, 0.5)
					else
						Collider.Size = Vector3.new(0.5, 0.85, 0.5)
					end

					game:GetService("PhysicsService"):SetPartCollisionGroup(Collider, "Ragdolls")
				end
			end
		end

		local CTs = HumanoidRootPart:FindFirstChild("CTs")
		if CTs then 
			for _, v in pairs(CTs:GetChildren()) do
				if v:IsA("BallSocketConstraint") then
					if Torso then
						for _, motor in pairs(Torso:GetChildren()) do
							if motor:IsA("Motor6D") then
								if string.match(v.Name, motor.Name) then
									if motor.Part1 then
										local Part0 = Torso:WaitForChild("Torso_"..motor.Part1.Name)
										local Part1 = motor.Part1:WaitForChild("RagdollAttachment")
										v.Attachment0 = Part0
										v.Attachment1 = Part1

										local HealthValue = CharStats[C.Name]:FindFirstChild("HealthValues"):FindFirstChild(motor.Part1.Name)
										if HealthValue then
											HealthValue.MotorValue.Value = motor.Name
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end)
end

local function Ragdoll(Player, chr, rag, charstats)
	if Player then
		if Player.Character ~= chr then
			return
		end
	end
	local Torso = chr:FindFirstChild("Torso")
	local Humanoid = chr:FindFirstChild("Humanoid")
	local HumanoidRootPart = chr:FindFirstChild("HumanoidRootPart")
	if Humanoid then
		Humanoid.BreakJointsOnDeath = false
		Humanoid.PlatformStand = rag
	end
	for _, L in pairs(chr:GetChildren()) do
		if L:IsA("BasePart") then
			if L:FindFirstChild("Collider") then
				L:FindFirstChild("Collider").CanCollide = rag
			end
		end
	end
	if not rag then
		if Torso then
			Torso.CFrame = CFrame.new(Torso.Position) * CFrame.Angles(0, 90, 0)
		end
	end
	if Torso then
		for _, v in pairs(Torso:GetChildren()) do
			if v:IsA("Motor6D") then
				if charstats then
					if charstats:FindFirstChild("HealthValues") then
						if v.Part1 then
							if charstats:FindFirstChild("HealthValues"):FindFirstChild(v.Part1.Name) then
								if charstats:FindFirstChild("HealthValues"):FindFirstChild(v.Part1.Name).Value > 0 then
									if charstats:FindFirstChild("HealthValues"):FindFirstChild(v.Part1.Name).Destroyed.Value or charstats:FindFirstChild("HealthValues"):FindFirstChild(v.Part1.Name).Broken.Value then
										v.Enabled = false
									else
										v.Enabled = not rag
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

local function init(Player, Character, PlayerbaseData, CharStat)
	for ArmNumber = 1, 3 do
		local Arm = Character:FindFirstChild("Right Arm")
		if ArmNumber == 2 then
			Arm = Character:FindFirstChild("Left Arm")
		elseif ArmNumber == 3 then
			Arm = Character:FindFirstChild("Right Leg")
		end
		if Arm then
			for _, FistPoint in pairs(Storage.FistPoints:GetChildren()) do
				FistPoint:Clone().Parent = Arm
			end
		end
	end

	for _, BP in pairs(Character:GetChildren()) do
		if BP:IsA("BasePart") and BP.Name ~= "Collider" then
			if ReplicatedStorage.CharStats[Character.Name].HealthValues:FindFirstChild(BP.Name) then
				if not ReplicatedStorage.CharStats[Character.Name].HealthValues:FindFirstChild(BP.Name).Broken.Value and not ReplicatedStorage.CharStats[Character.Name].HealthValues:FindFirstChild(BP.Name).Destroyed.Value then
					PhysicsService:SetPartCollisionGroup(BP, "Characters")
				end
			else
				PhysicsService:SetPartCollisionGroup(BP, "Characters")
			end
		end
	end

	local Creator = Instance.new("ObjectValue", Character.Humanoid)
	Creator.Name = "Creator"

	local Assist = Instance.new("ObjectValue", Character.Humanoid)
	Assist.Name = "Assist"
end

local function r(Pl, t)
	pcall(function()
		local C = Pl.Character

		if C then 
			local CharStat = ReplicatedStorage.CharStats:FindFirstChild(Pl.Name)
			CharStat.RagdollTime.RagdollSwitch.Value = true
			CharStat.RagdollTime.RagdollSwitch2.Value = true
			local seed = math.random()
			CharStat.RagdollTime.RagdollSwitch.Code.Value = seed
			
			task.spawn(function()
				Ragdoll(Pl, C, true, CharStat)

				for _, BP in pairs(C:GetChildren()) do
					if BP:IsA("BasePart") then
						PhysicsService:SetPartCollisionGroup(BP, "Ragdolls")
					end
				end

				task.wait(CharStat.RagdollTime.Value + t)

				if CharStat.RagdollTime.RagdollSwitch.Code.Value == seed then
					if C then
						if C.Humanoid.Health > 0 and not game:GetService("CollectionService"):HasTag(Pl.Character, "BleedingOut") then
							Ragdoll(Pl, C, false, CharStat)

							CharStat.RagdollTime.RagdollSwitch.Value = false
							CharStat.RagdollTime.RagdollSwitch2.Value = false
							CharStat.RagdollTime.Value = 0

							for _, BP in pairs(C:GetChildren()) do
								if BP:IsA("BasePart") and BP.Name ~= "Collider" then
									PhysicsService:SetPartCollisionGroup(BP, "Characters")
								end
							end
						end
					end
				end

				CharStat.RagdollTime.Value -= t
			end)
			
			CharStat.RagdollTime.Value += t
		end
	end)
end

Events.Ragdoll.OnServerEvent:Connect(function(Pl, t)
	r(Pl, t)
end)

ReplicatedStorage.Events2.Ragdoll.Event:Connect(function(Pl, t)
	r(Pl, t)
end)

local function tag(th, p)
	if th:IsDescendantOf(p.Character) then
		return
	end
	
	if th:FindFirstChild("Creator") and th:FindFirstChild("Assist") then
		if th.Creator.Value and not th.Creator.Value == th.Assist.Value then
			th.Assist.Value = th.Creator.Value
			th.Creator.Value = p
		else
			th.Creator.Value = p
		end
	end
end

_G.tag = tag

local function Format1(Stat)
	local String = tostring(Stat)
	return #String % 3 == 0 and String:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or String:reverse():gsub("(%d%d%d)", "%1,"):reverse()
end

local LimbBlood = {
	Amount = { 6, 15 }, 
	Speed = 5, 
	Spread = { -55, 95 }, 
	Size = 5, 
	WidthScale = 2, 
	UpVector = Vector3.new(0, -5, 0), 
	RepeatCount = 1, 
	RepeatTick = 0.1, 
	MaxYAngle = nil
} 

local LimbBlood2 = {
	Amount = { 25, 30 }, 
	Speed = 5, 
	Spread = { -360, 360 }, 
	Size = 2, 
	WidthScale = 2, 
	UpVector = Vector3.new(0, 10, 0), 
	RepeatCount = 1, 
	RepeatTick = 0.1, 
	MaxYAngle = nil
} 

local BleedBlood = {
	Amount = { 1, 1 }, 
	Speed = 1, 
	Spread = { -55, 95 }, 
	Size = 0.5, 
	WidthScale = 2, 
	UpVector = Vector3.new(0, -5, 0), 
	RepeatCount = 8, 
	RepeatTick = 0.25, 
	MaxYAngle = nil
} 

Players.PlayerAdded:Connect(function(Player)
	task.wait()

	if Player.Name ~= "Player1" and Player.Name ~= "Player2" then
		if not Player:IsInGroup(15626206) then
			Player:Kick("Must be in the group.")
			return
		end

		if not Player:GetRankInGroup(15626206, 255) then
			if Player.AccountAge <= 14 then
				Player:Kick("Account must be older than 14 days.")
				return
			end
		end
	end

	if CharStats:FindFirstChild(Player.Name) then
		return
	end
	if PlayerbaseData2:FindFirstChild(Player.Name) then
		return
	end

	local CharStat = Resources:WaitForChild("CharStat"):Clone()
	CharStat.Name = Player.Name
	CharStat.Parent = CharStats

	local PlayerbaseData = Resources:WaitForChild("PlayerbaseData"):Clone()
	PlayerbaseData.Name = Player.Name
	PlayerbaseData.Parent = PlayerbaseData2

	local Char = nil

	Player.CharacterAdded:Connect(function(Character)
		task.wait()

		repeat
			Character.Parent = workspace.Characters 
			task.wait()
		until Character.Parent == workspace.Characters

		for _, HealthValue in pairs(CharStat.HealthValues:GetChildren()) do
			HealthValue.MaxValue = 100
			HealthValue.Value = HealthValue.MaxValue
			HealthValue.Destroyed.Value = false
			HealthValue.Broken.Value = false
			HealthValue.Broken.Heal.Value = 0
		end

		local Weapons = ServerStorage.SpawnWithRandomly:GetChildren()

		local Tool = Weapons[math.random(1, #Weapons)]

		ServerStorage.AdonisWeapons:WaitForChild(Tool.Name):Clone().Parent = Player.Backpack
		
		local Weapons2 = ServerStorage.SpawnWithRandomly2:GetChildren()

		local Tool2 = Weapons2[math.random(1, #Weapons2)]

		ServerStorage.AdonisWeapons:WaitForChild(Tool2.Name):Clone().Parent = Player.Backpack

		Char = Character
		Character.Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff

		CharStat.InventorySlots.Value = CharStat.InventorySlots.MinValue
		CharStat.RagdollTime.RagdollSwitch.Value = false
		CharStat.RagdollTime.RagdollSwitch2.Value = false
		CharStat.RagdollTime.Value = 0
		CharStat.Downed.Value = false
		CharStat.Downed.Resisting.Value = false

		if Character then
			Character:WaitForChild("Humanoid").MaxHealth = 115
			Character:WaitForChild("Humanoid").Health = 115
			Character:WaitForChild("Humanoid").BreakJointsOnDeath = false

			AddRagdoll(Character)

			init(Player, Character, PlayerbaseData, CharStat)

			task.spawn(function()
				local function Hat(Child)
					if Child:IsA("Accessory") then
						local Handle = Child:WaitForChild("Handle", math.huge)
						Handle.Size = Vector3.new(0.05, 0.05, 0.05)
						Handle.CanQuery = false
					end
				end

				for _, Child in pairs(Character:GetChildren()) do
					Hat(Child)
				end

				Character.ChildAdded:Connect(function(Child)
					task.wait()
					Hat(Child)
				end)
			end)

			Events.UpdateClient:FireClient(Player, _G[Player.Name].Bank, _G[Player.Name].Cash)

			Character.Humanoid.Died:Connect(function()
				if Character.Humanoid.Health <= 0 and not game:GetService("CollectionService"):HasTag(Character, "Dead") then
					game:GetService("CollectionService"):AddTag(Character, "Dead")

					pcall(function()
						Character.Head.Face.Texture = "rbxassetid://15426038"
					end)
					pcall(function()
						Character.Head.face.Texture = "rbxassetid://15426038"
					end)

					local DeadLight = Instance.new("PointLight", Character.Torso)
					DeadLight.Color = Color3.fromRGB(255, 0, 0)
					DeadLight.Brightness = 5
					DeadLight.Shadows = true
					DeadLight.Range = 7
					DeadLight.Name = "DeadLight"

					local DeadUI = ReplicatedStorage.Storage:WaitForChild("DeadGUI"):Clone()
					DeadUI.Parent = Character.Torso
					DeadUI.PlayerToHideFrom = Player

					local deaths = script:WaitForChild("Deaths"):GetChildren()
					local death = deaths[math.random(1, #deaths)]:Clone()
					if Character:FindFirstChild("Head") then
						death.Parent = Character:WaitForChild("Head")
						death:Play()
						game.Debris:AddItem(death, death.TimeLength / death.PlaybackSpeed)
					end

					if Character:FindFirstChild("Head") then
						for _, v in pairs(Character.Head:GetChildren()) do
							if v:FindFirstChild("Vocal") then
								v:Destroy()
							end
						end
						Character.Head.ChildAdded:Connect(function(v)
							task.wait()
							if v:FindFirstChild("Vocal") then
								v:Destroy()
							end
						end)
					end

					CharStat.Downed.Value = false

					local Head = Character:FindFirstChild("Head")
					if Head then
						Character.PrimaryPart = Head
					end

					coroutine.wrap(r)(Player, 1)

					local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
					if HumanoidRootPart then
						PhysicsService:SetPartCollisionGroup(HumanoidRootPart, "RagdollNoCollide")
					end

					pcall(function()
						Character.Torso["DownedLight"]:Destroy()
					end)

					pcall(function()
						Character.Torso["DownedBreathing"]:Destroy()
					end)

					pcall(function()
						Character.Torso["ReviveGUI"]:Destroy()
					end)
					
					pcall(function()
						Character.Torso["BleedOutGUI"]:Destroy()
					end)

					CharStat.Downed.Resisting.Value = false

					local Humanoid = Character:FindFirstChildOfClass("Humanoid")
					if Humanoid then
						local Creator = Humanoid:FindFirstChild("Creator")
						local Assist = Humanoid:FindFirstChild("Assist")
						if Creator.Value then
							local Cash = 40 + PlayerbaseData2[Player.Name].Bounty.Amount.Value
							local Exp = 50 + (PlayerbaseData2[Player.Name].Bounty.Amount.Value / 2)

							Creator.Value.XP.Value += Exp
							
							_G[Creator.Value.Name].Bounty += 120
							PlayerbaseData2[Creator.Value.Name].Bounty.Amount.Value = _G[Creator.Value.Name].Bounty
							Creator.Value.leaderstats.Bounty.Value = "$".._G[Creator.Value.Name].Bounty
							
							Events.XP:FireClient(Creator.Value, Exp)

							Events.KillEvent:FireClient(Creator.Value, "Killed", Player, Cash, Exp)

							_G[Creator.Value.Name].Cash += Cash

							Events.UpdateClient:FireClient(Creator.Value, _G[Creator.Value.Name].Bank, _G[Creator.Value.Name].Cash)
						end
						if Assist.Value then
							local Cash = 25 + (PlayerbaseData2[Assist.Value.Name].Bounty.Amount.Value / 1.5)
							local Exp = 20 + (PlayerbaseData2[Assist.Value.Name].Bounty.Amount.Value / 2.5)

							Assist.Value.XP.Value += Exp
							
							_G[Assist.Value.Name].Bounty += 120
							PlayerbaseData2[Assist.Value.Name].Bounty.Amount.Value = _G[Assist.Value.Name].Bounty
							Assist.Value.leaderstats.Bounty.Value = "$".._G[Assist.Value.Name].Bounty			
							
							Events.XP:FireClient(Assist.Value, Exp)

							Events.KillEvent:FireClient(Assist.Value, "Assist", Player, Cash, Exp)

							_G[Assist.Value.Name].Cash += Cash

							Events.UpdateClient:FireClient(Assist.Value, _G[Assist.Value.Name].Bank, _G[Assist.Value.Name].Cash)
						end
					end
					
					_G[Player.Name].Bounty = 0
					PlayerbaseData.Bounty.Amount.Value = 0
					Player.leaderstats.Bounty.Value = "$".._G[Player.Name].Bounty
				end
			end)
			
			Character.Humanoid.HealthChanged:Connect(function()
				CharStat.Downed.Value = (Character:FindFirstChild("Humanoid").Health < 15 and Character:FindFirstChild("Humanoid").Health > 0)
			end)
		end
	end)

	CharStat.Downed.Changed:Connect(function()
		local Character = Player.Character
		if Character then
			if CharStat.Downed.Value then
				if Character:FindFirstChild("Torso") then
					if not game:GetService("CollectionService"):HasTag(Character, "Downed") and not game:GetService("CollectionService"):HasTag(Character, "BleedingOut") then
						if Character.Humanoid.Health > 0 then
							if not Character.Torso:FindFirstChild("DownedLight") then
								game:GetService("CollectionService"):AddTag(Character, "Downed")

								if Character:FindFirstChildOfClass("Humanoid") then 
									if Character.Humanoid:FindFirstChild("Creator") then
										if Character.Humanoid.Creator.Value then
											Character.Humanoid.Creator.Value.XP.Value += 35
											Events.XP:FireClient(Character.Humanoid.Creator.Value, 35)
										end
									end
									if Character.Humanoid:FindFirstChild("Assist") then
										if Character.Humanoid.Assist.Value then
											Character.Humanoid.Assist.Value.XP.Value += 35
											Events.XP:FireClient(Character.Humanoid.Assist.Value, 35)
										end
									end
								end

								local DownedLight = Instance.new("PointLight", Character.Torso)
								DownedLight.Color = Color3.fromRGB(255, 170, 127)
								DownedLight.Brightness = 5
								DownedLight.Shadows = true
								DownedLight.Range = 5
								DownedLight.Name = "DownedLight"

								r(Player, 2)

								repeat
									task.wait()
								until not CharStat.RagdollTime.RagdollSwitch.Value

								if Character:FindFirstChild("Torso") and Character.Humanoid.Health > 0 and CharStat.Downed.Value and not game:GetService("CollectionService"):HasTag(Character, "BleedingOut") then
									local ReviveUI = ReplicatedStorage.Storage:WaitForChild("ReviveGUI"):Clone()
									ReviveUI.Parent = Character.Torso

									local DownedBreathing = script:WaitForChild("DownedBreathing"):Clone()
									DownedBreathing.Parent = Character.Torso
									DownedBreathing:Play()

									local function C()
										pcall(function()
											if Character.Humanoid.Health > 0 then
												if ReviveUI:FindFirstChild("Frame") then
													if game:GetService("CollectionService"):HasTag(Character, "Revived") or Character:FindFirstChild("Bandaging") then
														ReviveUI.Frame.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
													else
														local Color1 = Color3.fromRGB(255, 213, 0)
														local Color2 = Color3.fromRGB(75, 0, 0)

														local Color = Color1:Lerp(Color2, 1 - Character.Humanoid.Health / 15)

														ReviveUI.Frame.ImageLabel.ImageColor3 = Color
													end
												end
											end
										end)
									end

									game:GetService("RunService").Heartbeat:Connect(C)

									ReviveUI.PlayerToHideFrom = Player
								end
							end
						end
					end
				end
			else
				if Character:FindFirstChild("Torso") then
					if game:GetService("CollectionService"):HasTag(Character, "Downed") then
						game:GetService("CollectionService"):RemoveTag(Character, "Downed")

						pcall(function()
							Character.Torso["DownedLight"]:Destroy()
						end)

						pcall(function()
							Character.Torso["DownedBreathing"]:Destroy()
						end)

						pcall(function()
							Character.Torso["ReviveGUI"]:Destroy()
						end)

						CharStat.Downed.Resisting.Value = false
					end
				end
			end
		end
	end)
	
	local function BleedOut(Character, Stub, HealthValue)
		if Character.Humanoid.Health > 0 and not game:GetService("CollectionService"):HasTag(Character, "BleedingOut") then
			local Motor6D = Instance.new("Motor6D", Character.Torso)
			Motor6D.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
			Motor6D.C1 = CFrame.new(0, -0.499984622, 0, -1, 0, 0, 0, 1, -2.08616257e-07, 0, -2.08616257e-07, -1)
			Motor6D.Name = "NeckBreakMotor6D"

			Motor6D.Part0 = Character.Torso
			Motor6D.Part1 = Character.Head

			game:GetService("CollectionService"):AddTag(Character, "BleedingOut")

			task.spawn(function()
				r(Player, 1)
			end)

			Character.Humanoid.Health = 14

			if Character then
				if Character:FindFirstChild("Torso") then
					if Character.Humanoid.Health < 15 and Character.Humanoid.Health > 0 then
						local BleedOutGui = ReplicatedStorage.Storage.BleedOutGUI:Clone()
						BleedOutGui.Parent = Character.Torso
						BleedOutGui.PlayerToHideFrom = Player

						local DownedLight = Instance.new("PointLight", Character.Torso)
						DownedLight.Color = Color3.fromRGB(255, 170, 127)
						DownedLight.Brightness = 5
						DownedLight.Shadows = true
						DownedLight.Range = 5
						DownedLight.Name = "DownedLight"

						while Character.Humanoid.Health > 0 and Character.Humanoid.Health < 15 do
							task.wait(2)
							Character.Humanoid:TakeDamage(2)
							game:GetService("TweenService"):Create(BleedOutGui.Frame.Bar, TweenInfo.new(0.5), {Size = UDim2.new(1, 0, 1 - (Character.Humanoid.Health / 15), 0)}):Play()
						end

						BleedOutGui:Destroy()
						game:GetService("CollectionService"):RemoveTag(Character, "BleedingOut")

						if Character.Humanoid.Health >= 15 and HealthValue.Name == "Head" then
							Motor6D:Destroy()

							CharStat.RagdollTime.Counting.Value = false
							
							HealthValue.Broken.Value = false
							HealthValue.Broken.Heal.Value = 0
							HealthValue.Value = HealthValue.MaxValue

							task.spawn(function()
								task.wait(0.3)
								if Character.Humanoid.Health >= 15 and not HealthValue.Broken.Value then
									CharStat.RagdollTime.RagdollSwitch.Value = false
									CharStat.RagdollTime.RagdollSwitch2.Value = false
									CharStat.RagdollTime.Value = 0
									Ragdoll(Player, Character, false, CharStat)
								end
							end)
							
							if Stub then
								Stub:Destroy()
							end
							DownedLight:Destroy()
						end
					end	
				end
			end
		end	
	end

	for _, HealthValue in pairs(CharStat.HealthValues:GetChildren()) do
		HealthValue.Changed:Connect(function()
			local Character = Player.Character
			if Character:FindFirstChild(HealthValue.Name) then
				if HealthValue.Value <= 0 then
					if Character:FindFirstChild("Torso") and Character:FindFirstChild("Head") and Character:FindFirstChild(HealthValue.Name) then
						if Character:FindFirstChild("Head") then
							if not Character["Head"]:FindFirstChild("scream") then
								if Character.Humanoid.Health > 0 then
									local Screams = ServerStorage.Resources:WaitForChild("Screams"):GetChildren()
									local Scream = Screams[math.random(1, #Screams)]:Clone()
									Scream.Parent = Character["Head"]
									Scream:Play()
									game:GetService("Debris"):AddItem(Scream, 5)
								end
							end
						end

						local gores = ServerStorage.Resources:WaitForChild("GoreSounds"):GetChildren()
						local gore = gores[math.random(1, #gores)]:Clone()
						gore.Parent = Char["Head"]
						gore:Play()
						game:GetService("Debris"):AddItem(gore, gore.TimeLength / gore.PlaybackSpeed)

						local Stub

						if ServerStorage.Resources.BloodStubs:FindFirstChild(HealthValue.Name) then
							Stub = ServerStorage.Resources.BloodStubs:FindFirstChild(HealthValue.Name).Main:Clone()
							if Stub then
								if Character.Torso then
									Stub.Parent = Character
									Stub:SetPrimaryPartCFrame(Character.Torso.CFrame)

									local WeldConstraint = Instance.new("WeldConstraint", Character.Torso)
									WeldConstraint.Part0 = Character.Torso
									WeldConstraint.Part1 = Stub.PrimaryPart

									ReplicatedStorage.Events.GorePart:FireAllClients(Stub)
								end
							end
						end

						if Character:FindFirstChild("Torso") then
							for _, motor in pairs(Character:WaitForChild("Torso"):GetChildren()) do
								if motor:IsA("Motor6D") then
									if motor.Part1 then
										if motor.Part1.Name == HealthValue.Name then
											motor.Enabled = false
										end
									end
								end
							end
						end

						if not HealthValue.Destroyed.Value and not HealthValue.Broken.Value then
							if HealthValue.Name == "Head" then
								Character.Humanoid.Health = 0
							end
							if Character:FindFirstChild("HumanoidRootPart") then
								if Character.HumanoidRootPart:FindFirstChild("CTs") then
									if HealthValue.Name == "Head" then
										Character:FindFirstChild("HumanoidRootPart"):WaitForChild("CTs"):WaitForChild("RGCT_Neck").Enabled = false
									elseif HealthValue.Name == "Left Arm" then
										Character:FindFirstChild("HumanoidRootPart"):WaitForChild("CTs"):WaitForChild("RGCT_Left Shoulder").Enabled = false
									elseif HealthValue.Name == "Right Arm" then
										Character:FindFirstChild("HumanoidRootPart"):WaitForChild("CTs"):WaitForChild("RGCT_Right Shoulder").Enabled = false
									elseif HealthValue.Name == "Left Leg" then
										Character:FindFirstChild("HumanoidRootPart"):WaitForChild("CTs"):WaitForChild("RGCT_Left Hip").Enabled = false
									elseif HealthValue.Name == "Right Leg" then
										Character:FindFirstChild("HumanoidRootPart"):WaitForChild("CTs"):WaitForChild("RGCT_Right Hip").Enabled = false
									end
								end
							end
							
							if Character:FindFirstChild("Torso") then
								local attachment = nil
								if HealthValue.Name == "Head" then
									attachment = Character.Torso:FindFirstChild("RGAB_Neck")
								elseif HealthValue.Name == "Left Arm" then
									attachment = Character.Torso:FindFirstChild("RGAB_Left Shoulder")
								elseif HealthValue.Name == "Right Arm" then
									attachment = Character.Torso:FindFirstChild("RGAB_Right Shoulder")
								elseif HealthValue.Name == "Left Leg" then
									attachment = Character.Torso:FindFirstChild("RGAB_Left Hip")
								elseif HealthValue.Name == "Right Leg" then
									attachment = Character.Torso:FindFirstChild("RGAB_Right Hip")
								end
								CreateBloodTrail(attachment, LimbBlood)
							end

							Character:FindFirstChild(HealthValue.Name).Velocity = Vector3.new(math.random(-1, 1), 1, math.random(-1, 1)) * 5
							
							if HealthValue.Name == "Left Leg" or HealthValue.Name == "Right Leg" then
								if CharStat.HealthValues["Left Leg"].Value <= 0 and CharStat.HealthValues["Right Leg"].Value then
									BleedOut(Character, Stub, HealthValue)
								end
							end
						elseif HealthValue.Broken.Value and not HealthValue.Destroyed.Value then
							task.spawn(function()
								if HealthValue.Name ~= "Head" then
									game:GetService("PhysicsService"):SetPartCollisionGroup(Character[HealthValue.Name], "Ragdolls")
									
									for i = 1, HealthValue.Broken.Heal.Heal.Value do
										if HealthValue:FindFirstChild("Broken") then
											HealthValue.Broken.Heal.Value += 1

											task.wait(1)

											if not HealthValue:FindFirstChild("Broken") or HealthValue.Broken.Heal.Value >= HealthValue.Broken.Heal.Heal.Value or not Character or HealthValue.Broken.Heal.Value <= 0 then
												break
											end
										end
									end
									
									if Character:FindFirstChild(HealthValue.Name) then
										if HealthValue:FindFirstChild("Broken") then
											if HealthValue.Broken.Heal.Value >= HealthValue.Broken.Heal.Heal.Value or HealthValue.Broken.Heal.Value <= 0 then
												HealthValue.Broken.Heal.Value = 0
												HealthValue.Broken.Value = false
												HealthValue.Value = HealthValue.MaxValue

												game:GetService("PhysicsService"):SetPartCollisionGroup(Character[HealthValue.Name], "Characters")

												pcall(function()
													Character[HealthValue.Name].Collider:Destroy()
												end)

												pcall(function()
													Stub:Destroy()
												end)

												if Character:FindFirstChild("Torso") then
													for _, motor in pairs(Character:WaitForChild("Torso"):GetChildren()) do
														if motor:IsA("Motor6D") then
															if motor.Part1 then
																if motor.Part1.Name == HealthValue.Name then
																	motor.Enabled = true
																end
															end
														end
													end
												end
											end
										end
									end
								elseif HealthValue.Name == "Head" then
									BleedOut(Character, Stub, HealthValue)
								end
							end)
						elseif HealthValue.Destroyed.Value then
							Character.Humanoid:RemoveAccessories()
							task.wait()
							Character.Head.Transparency = 1
							Character.Humanoid.Health = 0
							for _, Helmet in pairs(Character:GetDescendants()) do
								if Helmet.Name == "Helmet" then
									Helmet:Destroy()
								end
							end
						end

						if not HealthValue.Destroyed.Value then
							local col = Instance.new("Part", Character[HealthValue.Name])
							if col then
								if HealthValue.Name == "Head" then
									col.Size = Vector3.new(1, 0.5, 0.5)
								else
									col.Size = Vector3.new(0.5, 0.85, 0.5)
								end

								col.Transparency = 1
								col.Massless = true
								col.Anchored = false
								col.CanCollide = true
								col.CFrame = Character:FindFirstChild(HealthValue.Name).CFrame

								local colwel = Instance.new("WeldConstraint", Character:FindFirstChild(HealthValue.Name))
								colwel.Part0 = Character:FindFirstChild(HealthValue.Name)
								colwel.Part1 = col
								
								game:GetService("PhysicsService"):SetPartCollisionGroup(col, "Ragdolls")
								game:GetService("PhysicsService"):SetPartCollisionGroup(Character[HealthValue.Name], "Ragdolls")
							end
						end
					end
				end
			end
		end)
	end

	local bank
	local cash
	local bounty
	local level
	local xp
	local xp2
	local Data

	pcall(function()
		Data = DataStore:GetAsync(Player.UserId .. "-Bank")
		bank = Data
	end)
	pcall(function()
		Data = DataStore:GetAsync(Player.UserId .. "-Cash")
		cash = Data
	end)
	pcall(function()
		Data = DataStore:GetAsync(Player.UserId .. "-Bounty")
		bounty = Data
	end)
	pcall(function()
		Data = DataStore:GetAsync(Player.UserId .. "-Level")
		level = Data
	end)
	pcall(function()
		Data = DataStore:GetAsync(Player.UserId .. "-XP")
		xp = Data
	end)
	pcall(function()
		Data = DataStore:GetAsync(Player.UserId .. "-XP2")
		xp2 = Data or 1500
	end)

	_G[Player.Name] = {
		Bank = bank or 5000,
		Cash = cash or 0,
		Bounty = bounty or 0,
		Level = level or 1
	}

	task.spawn(function()
		PlayerbaseData:WaitForChild("NextAllowance", math.huge)
		PlayerbaseData.NextAllowance.Value = 600
		while true do
			task.wait()
			for i = 1, 600 do
				task.wait(1)
				if PlayerbaseData:FindFirstChild("NextAllowance") then
					PlayerbaseData.NextAllowance.Value -= 1
					if PlayerbaseData.NextAllowance.Value <= 0 then
						break
					end
				end
			end
		end
	end)

	Player.DescendantAdded:Connect(function(Tool)
		task.wait()

		if Tool:IsA("Tool") then
			if not game:GetService("CollectionService"):HasTag(Tool, "SlotsTaken") then
				game:GetService("CollectionService"):AddTag(Tool, "SlotsTaken") 

				Tool:WaitForChild("Config", math.huge)
				
				if require(Tool.Config).SlotUsage then
					local Slots = require(Tool.Config).SlotUsage or 1

					CharStat.InventorySlots.Value = CharStat.InventorySlots.Value + Slots
				end
			end
		end
	end)

	Player.DescendantRemoving:Connect(function(Tool)
		task.wait()
		if Tool:IsA("Tool") then
			if not Player.Character:FindFirstChild(Tool.Name) then
				if game:GetService("CollectionService"):HasTag(Tool, "SlotsTaken") then
					game:GetService("CollectionService"):RemoveTag(Tool, "SlotsTaken") 

					Tool:WaitForChild("Config", math.huge)

					local Slots = require(Tool.Config).SlotUsage or 1

					CharStat.InventorySlots.Value = CharStat.InventorySlots.Value - Slots
				end
			end
		end
	end)

	Events.ClaimAllowance.OnServerEvent:Connect(function(Plr)
		if Plr == Player then
			if PlayerbaseData.NextAllowance.Value <= 0 then
				Events.Notification:FireClient(Player, "Allowance Paid", "You were paid $350.", false)
				_G[Player.Name].Bank += 350
				Events.UpdateClient:FireClient(Player, _G[Player.Name].Bank, _G[Player.Name].Cash)
				PlayerbaseData.NextAllowance.Value = 600
			end
		end
	end)

	local leaderstats = Instance.new("Folder", Player)
	leaderstats.Name = "leaderstats"

	local Level = Instance.new("StringValue", leaderstats)
	Level.Name = "Level"
	Level.Value = "-"
	Level.Value = _G[Player.Name].Level

	local Bounty = Instance.new("StringValue", leaderstats)
	Bounty.Name = "Bounty"
	Bounty.Value = "-"

	local XP = Instance.new("DoubleConstrainedValue", Player)
	XP.Name = "XP"
	XP.MaxValue = xp2
	XP.Value = xp
	
	XP.Changed:Connect(function()
		if XP.Value >= XP.MaxValue then
			if _G[Player.Name].Level < 100 then
				_G[Player.Name].Level += 1
				Level.Value = _G[Player.Name].Level
				XP.Value = 0
				XP.MaxValue = 1000 + (500 * _G[Player.Name].Level)
			end
		end
	end)

	Level.Changed:Connect(function()
		if _G[Player.Name].Level > 100 then
			_G[Player.Name].Level = 100
			Level.Value = _G[Player.Name].Level
		end
	end)

	Bounty.Changed:Connect(function()
		pcall(function()	
			local Number = tonumber(Player.leaderstats.Bounty.Value)
			if Number >= 1000 then
				Events.Notification:FireAllClients("Bounty Alert", Player.DisplayName .. ": $" .. f(Player.leaderstats.Bounty.Value), true)
			end
		end)
	end)

	Events.UpdateClient:FireClient(Player, _G[Player.Name].Bank, _G[Player.Name].Cash)

	task.spawn(function()
		task.wait(5)

		if Player then
			Player:LoadCharacter()
		end
	end)
end)

Players.PlayerRemoving:Connect(function(Player)
	local Character = Player.Character

	local Name = Player.Name

	pcall(function()
		ReplicatedStorage.CharStats[Name]:Destroy()
	end)
	pcall(function()
		ReplicatedStorage.PlayerbaseData2[Name]:Destroy()
	end)

	if ReplicatedStorage:WaitForChild("Values").DataSaving.Value then
		pcall(function()
			DataStore:SetAsync(Player.UserId .. "-Bank", _G[Player.Name].Bank)
		end)
		pcall(function()
			DataStore:SetAsync(Player.UserId .. "-Cash", _G[Player.Name].Cash)
		end)
		pcall(function()
			DataStore:SetAsync(Player.UserId .. "-Bounty", _G[Player.Name].Bounty)
		end)
		pcall(function()
			DataStore:SetAsync(Player.UserId .. "-Level", _G[Player.Name].Level)
		end)
		pcall(function()
			DataStore:SetAsync(Player.UserId .. "-XP", Player.XP.Value)
		end)
		pcall(function()
			DataStore:SetAsync(Player.UserId .. "-XP2", Player.XP.MaxValue)
		end)
	end
end)

MHXU.OnServerInvoke = function(Player, t, tool, key, key2, combo)
	if not tool:IsDescendantOf(Player.Character) then
		return
	end
	if CharStats[Player.Name].RagdollTime.RagdollSwitch.Value then 
		return
	end
	if CharStats[Player.Name].Downed.Value then 
		return
	end
	if key == "GBFD9239" then
		if tool.Values.SlashDB.Value then
			return
		end
		if tool.Values.Reviving.Value then
			return
		end
		if tool.Values.Executing.Value then
			return
		end

		tool.Values.SlashDB.Value = true
		tool.Values.Slashing1.Value = true
		
		local Config = require(tool.Config)
		
		if Config.TrailsEnabled then
			local Trail = tool.Handle:FindFirstChildOfClass("Trail")
			if Trail then
				Trail.Enabled = true
			end
		end
		
		local seed = math.random()
		tool.seed.Value = seed

		coroutine.wrap(function()
			if type(combo) == "number" then
				task.wait(require(tool.Config).Mains["S"..combo].DebounceTime)
				tool.Values.SlashDB.Value = false
				task.spawn(function()
					task.wait(require(tool.Config).Mains["S"..combo].DebounceTime)
					if tool.seed.Value == seed then
						tool.Values.Slashing1.Value = false
					end
				end)
				
				if Config.TrailsEnabled then
					local Trail = tool.Handle:FindFirstChildOfClass("Trail")
					if Trail then
						Trail.Enabled = false
					end
				end
			end
		end)()

		return true
	elseif key == "EXEVUZA" then
		tool.Values.SlashDB.Value = true
		tool.Values.Slashing1.Value = true
		tool.Values.Executing.Value = true

		local Slash = tool.Sounds:WaitForChild("ExecuteSound") 
		if Slash and Player.Character:FindFirstChild("Torso") then
			local newSlash = Slash:Clone()
			newSlash.Parent = Player.Character["Torso"]
			newSlash:Play()
			game.Debris:AddItem(newSlash, newSlash.TimeLength / newSlash.PlaybackSpeed)
		end
		
		local seed = math.random()
		tool.seed.Value = seed

		coroutine.wrap(function()
			task.wait(require(tool.Config).Mains["E"].DebounceTime)
			task.spawn(function()
				task.wait(require(tool.Config).Mains["E"].DebounceTime)
				if tool.seed.Value == seed then
					tool.Values.Slashing1.Value = false
				end
			end)
			tool.Values.SlashDB.Value = false
			tool.Values.Executing.Value = false
		end)()

		return true
	elseif key == "BLSTAZ1" then
		if tool.Values.Reviving.Value then
			return
		end
		if tool.Values.Executing.Value then
			return
		end
		if not require(tool.Config).BlockSettings.Enabled then
			return
		end

		tool.Values.Blocking.Value = true

		return true
	elseif key == "BZLZSTO2" then
		tool.Values.Blocking.Value = false

		return true
	elseif key == "DZDRRRKI" then
		if tool.Values.SlashDB.Value then
			return
		end
		if tool.Values.Executing.Value then
			return
		end
		if tool.Values.Reviving.Value then
			return
		end
		if key2.Values.Broken.Value then
			return
		end
		
		if combo == "Door" then
			tool.Values.SlashDB.Value = true
			tool.Values.Slashing1.Value = true

			game:GetService("CollectionService"):AddTag(tool, "DoorKicking")

			coroutine.wrap(function()
				task.wait(require(tool.Config).Customs.DoorKick.DebounceTime)

				tool.Values.SlashDB.Value = false
				tool.Values.Slashing1.Value = false

				game:GetService("CollectionService"):RemoveTag(tool, "DoorKicking")
			end)()

			return true
		else
			tool.Values.SlashDB.Value = true
			tool.Values.Slashing1.Value = true

			game:GetService("CollectionService"):AddTag(tool, "Register")

			coroutine.wrap(function()
				task.wait(require(tool.Config).Customs.RegisterHit.DebounceTime)

				tool.Values.SlashDB.Value = false
				tool.Values.Slashing1.Value = false

				game:GetService("CollectionService"):RemoveTag(tool, "Register")
			end)()

			return true
		end
	elseif key == "REV1" then
		local Character = Player.Character
		if Character then
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if HumanoidRootPart then
				if tool.Values.Reviving.Value then
					return
				end

				local v75 = (function()
					for v76, v77 in pairs(workspace:FindPartsInRegion3(Region3.new(HumanoidRootPart.Position - Vector3.new(2, 3, 2), HumanoidRootPart.Position + Vector3.new(2, 2, 2)), nil, math.huge)) do
						local l__Parent__78 = v77.Parent
						if l__Parent__78 ~= Character and v77.Name == "Torso" and l__Parent__78:FindFirstChildOfClass("Humanoid") and (l__Parent__78:FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and ReplicatedStorage.CharStats:FindFirstChild(l__Parent__78.Name).Downed.Value and ReplicatedStorage.CharStats:FindFirstChild(l__Parent__78.Name) and ReplicatedStorage.CharStats:FindFirstChild(l__Parent__78.Name).Grabbed.Value == false) and (not ReplicatedStorage.CharStats:FindFirstChild(l__Parent__78.Name).Currents:FindFirstChild("Reviving")) then
							return l__Parent__78
						end
					end
					return false
				end)()
				if not v75 then
					return
				end
				if game:GetService("CollectionService"):HasTag(v75, "Revived") then
					return
				end
				if game:GetService("CollectionService"):HasTag(Player.Character, "Revived") then
					return
				end
				if game:GetService("CollectionService"):HasTag(v75, "BleedingOut") then
					return
				end

				game:GetService("CollectionService"):AddTag(Player.Character, "Revived")
				game:GetService("CollectionService"):AddTag(v75, "Revived")

				tool.Values.Reviving.Value = true

				local BeingRevived = ReplicatedStorage.Storage.GUIs.BeingHealed:Clone()
				BeingRevived.Parent = Players:GetPlayerFromCharacter(v75).PlayerGui

				local Config = require(tool.Config)
				local Time = Config.Customs.Revive.Time

				local SD = Instance.new("NumberValue", ReplicatedStorage:WaitForChild("CharStats")[Player.Name].Currents)
				SD.Name = "SD_Reviving"
				SD.Value = 16

				local AJ = Instance.new("BoolValue", ReplicatedStorage:WaitForChild("CharStats")[Player.Name].Currents)
				AJ.Name = "AJ"

				local pl = Players:GetPlayerFromCharacter(v75)

				task.spawn(function()
					local CurrentTime = 0
					local CurrentTick = tick()
					
					local ToolCheck = Character:FindFirstChildOfClass("Tool")
					local Config = require(ToolCheck.Config)
					
					if Config.Customs.Revive then

						while true do
							game:GetService("RunService").Heartbeat:Wait()
							CurrentTime = tick() - CurrentTick
							if CurrentTime >= Time or not tool.Values.Reviving.Value or not ToolCheck:IsDescendantOf(Character) or pl.Character ~= v75 or Player.Character ~= Character or v75.Humanoid.Health <= 0 or Character.Humanoid.Health <= 0 or (Character.Torso.Position - v75.Torso.Position).Magnitude > 5 or CharStats[v75.Name].Downed.Value == false then
								break
							end 
						end

						if CurrentTime >= Time then
							v75.Humanoid.Health = 35
							
							Player.XP.Value += 15
							Events.XP:FireClient(Player, 15)

							if v75:FindFirstChild("Torso") then
								local Sound = Instance.new("Sound", v75.Torso)
								Sound.Volume = 1
								Sound.SoundId = "rbxassetid://4720445506"
								Sound.PlaybackSpeed = 1
								Sound:Play()

								game:GetService("Debris"):AddItem(Sound, 5)
							end
						end

						BeingRevived:Destroy()

						game:GetService("CollectionService"):RemoveTag(Player.Character, "Revived")
						game:GetService("CollectionService"):RemoveTag(v75, "Revived")

						tool.Values.Reviving.Value = false

						pcall(function()
							ReplicatedStorage:WaitForChild("CharStats")[Player.Name].Currents["SD_Reviving"]:Destroy()
						end)
					end
				end)

				return true, Time
			end
		end
	end
end

local Flinch = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Flinch"))

MHXU2.OnServerEvent:Connect(function(Player, t, Tool, Key, bool1, bool2, Hitter, HitPart, Combo, TargetChar, Vector, Vector1)
	if TargetChar then
		if HitPart then
			if CharStats:FindFirstChild(TargetChar.Name) then
				if CharStats[TargetChar.Name].HealthValues:FindFirstChild(HitPart.Name) then
					if CharStats[TargetChar.Name].HealthValues[HitPart.Name].Value <= 0 then
						return
					end
				end
			end
		end
	end
	if CharStats[Player.Name].RagdollTime.RagdollSwitch.Value then 
		return
	end
	if CharStats[Player.Name].Downed.Value then 
		return
	end
	if Tool:FindFirstChild("Values") then
		if Tool.Values:FindFirstChild("Slashing1") then
			if not Tool.Values.Slashing1.Value then
				return
			end
		end
	end
	if Player.Team and Players:GetPlayerFromCharacter(TargetChar).Team then
		if Player.Team == Players:GetPlayerFromCharacter(TargetChar).Team then
			ReplicatedStorage.Events.ClientWarn:FireClient(Player, {"Friendly fire!", "error"})
			return
		end
	end
	if TargetChar then
		if TargetChar:FindFirstChildOfClass("Humanoid") then
			if TargetChar:FindFirstChildOfClass("ForceField") then
				ReplicatedStorage.Events.ClientWarn:FireClient(Player, {"Player is protected!", "error"})
				return
			end
			if TargetChar.Humanoid.Health <= 0 then
				return
			end
		end
	end
	if HitPart then
		if TargetChar:FindFirstChild("Torso") then
			if Player.Character then
				if Player.Character:FindFirstChild("Torso") then
					local MMag = require(Tool.Config).MMag or 10
					if HitPart:IsDescendantOf(Player.Character) then
						return
					end
					if (TargetChar.Torso.Position - Player.Character.Torso.Position).Magnitude > MMag then
						return
					end
				else
					return
				end
			else
				return
			end
		end
	end
	if CharStats:FindFirstChild(TargetChar.Name) then
		if CharStats[TargetChar.Name].HealthValues:FindFirstChild(HitPart.Name) then
			if CharStats[TargetChar.Name].HealthValues[HitPart.Name].Value <= 0 and not CharStats[TargetChar.Name].HealthValues[HitPart.Name].Broken.Value then
				return
			end
		end
	end
	if TargetChar then
		if TargetChar:FindFirstChildOfClass("Humanoid") then
			local hum = TargetChar.Humanoid
			if TargetChar:FindFirstChild("DamageReflection") then
				hum = Player.Character:FindFirstChildOfClass("Humanoid")
				TargetChar = Player.Character
				if Player.Character:FindFirstChild(HitPart.Name) then
					HitPart = Player.Character:FindFirstChild(HitPart.Name)
				else
					HitPart = Player.Character:FindFirstChild("Torso")
					if not HitPart then
						return
					end
				end
			end
		end
	end
	if Tool:IsDescendantOf(Player.Character) then
		if Key == "2389ZFX33" then
			if TargetChar:IsDescendantOf(workspace.Map.BredMakurz) then
				if game:GetService("CollectionService"):HasTag(Tool, "Register") then
					if TargetChar:FindFirstChild("MainPart") then
						if Player.Character then
							if Player.Character:FindFirstChild("Torso") then
								if (TargetChar.MainPart.Position - Player.Character.Torso.Position).Magnitude < 10 then
									local Config = require(Tool.Config)

									TargetChar.Events.Damage:Fire(Player, Tool, Config.Customs.RegisterHit.Damage)	
								end
							end
						end
					end
				end
			elseif TargetChar:IsDescendantOf(workspace.Map.Doors) then
				if game:GetService("CollectionService"):HasTag(Tool, "DoorKicking") then
					if TargetChar:FindFirstChild("DoorBase") then
						if Player.Character then
							if Player.Character:FindFirstChild("Torso") then
								local Config = require(Tool.Config)

								TargetChar.Events.Damage:Fire(Player, Tool, Config.Customs.DoorKick.Damage)	
							end
						end
					end
				end
			else
				if not game:GetService("CollectionService"):HasTag(Tool, "Register") and not game:GetService("CollectionService"):HasTag(Tool, "DoorKicking") then
					if Player.Character then
						local TargetHumanoid = HitPart.Parent:FindFirstChildOfClass("Humanoid")
						local Config = require(Tool.Config)

						if Tool.Values.Executing.Value then
							if CharStats[TargetChar.Name].Downed.Value then
								tag(TargetHumanoid, Player)

								TargetHumanoid.Health = 0

								local ActualHitSound = Tool:WaitForChild("Sounds").ExecuteHit:Clone()
								ActualHitSound.Parent = HitPart
								ActualHitSound:Play()
								Debris:AddItem(ActualHitSound, 2) 

								Tool.Event:FireClient(Player, "Hitmarker", (HitPart.Name == "Head"))
								
								Player.Character.Humanoid.Health += 65
								
								if Config.MultipleHits == nil then
									Tool.Values.Slashing1.Value = false
								end
								
								if Config.Customs.ExplodeFinish then
									local Explosion = ServerStorage.Resources.Effects.GodExplosion:Clone()
									Explosion.Creator.Value = Player
									Explosion.Parent = workspace.Debris
									Explosion.Position = Vector
									Explosion.Main.Disabled = false
									Explosion.Attachment.Emitter.Disabled = false
									game.Debris:AddItem(Explosion, 3)
								end
								
								local Effect = Instance.new("Part", workspace:WaitForChild("Debris"))
								Effect.Size = Vector3.new(0.1, 0.1, 0.1)
								Effect.Anchored = true
								Effect.CanCollide = false
								Effect.Position = Vector
								Effect.Transparency = 1

								Debris:AddItem(Effect, 2)

								Events:WaitForChild("BloodHitEvent"):FireAllClients(Effect)
								
								if Config.ExecuteSettings.CanBreak then
									local LookFor = "Head"

									if HitPart.Name == "Left Arm" then
										LookFor = "LArm"
									elseif HitPart.Name == "Right Arm" then
										LookFor = "RArm"
									elseif HitPart.Name == "Left Leg" then
										LookFor = "LLeg"
									elseif HitPart.Name == "Right Leg" then
										LookFor = "RLeg"
									end

									if CharStats[TargetChar.Name].HealthValues:FindFirstChild(HitPart.Name) then
										if HitPart.Name == "Head" then
											CharStats[TargetChar.Name].HealthValues[HitPart.Name].Destroyed.Value = Config.BreakSettings.ExplodeHead
											Player.XP.Value += 35
											ReplicatedStorage.Events.XP:FireClient(Player, 35)
											task.wait()
										end

										CharStats[TargetChar.Name].HealthValues[HitPart.Name].Value = 0
									end
									
									if TargetChar:FindFirstChild("Torso") then
										local attachment = nil
										if HitPart.Name == "Head" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Neck")
										elseif HitPart.Name == "Left Arm" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Shoulder")
										elseif HitPart.Name == "Right Arm" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Right Shoulder")
										elseif HitPart.Name == "Left Leg" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Hip")
										elseif HitPart.Name == "Right Leg" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Right Hip")
										end
										CreateBloodTrail(attachment, Config.Blood.B)
									end
								end
							end
						else
							local t = TargetChar:FindFirstChildOfClass("Tool")
							if t then
								local v = t:FindFirstChild("Values")
								if v then
									local b = v:FindFirstChild("Blocking")
									if b then
										if b.Value then
											if (require(TargetChar:FindFirstChildOfClass("Tool").Config).BlockHitStrength >= Config.BlockHitStrength) then
												if Player.Character then
													if TargetChar:FindFirstChild("Torso") then
														local Raycast = Ray.new(TargetChar.Torso.Position, TargetChar.Torso.CFrame.LookVector * 100)
														local Result = workspace:FindPartOnRayWithWhitelist(Raycast, {Player.Character})
														if Result then
															if Result:IsDescendantOf(Player.Character) then
																t:FindFirstChild("Event"):FireClient(game:GetService("Players"):GetPlayerFromCharacter(TargetChar), "BS", true)
																t:FindFirstChild("Event"):FireClient(game:GetService("Players"):GetPlayerFromCharacter(TargetChar), "BH", true)
																Tool:FindFirstChild("Event"):FireClient(Player, "Stun")

																local BlockHitSound = TargetChar:FindFirstChildOfClass("Tool").Sounds.BlockHit:Clone()
																BlockHitSound.Parent = TargetChar.Torso
																BlockHitSound:Play()
																BlockHitSound.PlaybackSpeed += math.random(-100, 100) / 1000
																game:GetService("Debris"):AddItem(BlockHitSound, BlockHitSound.TimeLength / BlockHitSound.PlaybackSpeed)

																b.Value = false

																pcall(function()
																	b.Handle.Spark.Sparks:Emit(20)
																end)

																return
															end
														end
													end
												end
											end
										end
									end
								end
							end

							if TargetHumanoid then	
								Tool.Event:FireClient(Player, "Hitmarker", (HitPart.Name == "Head"))

								local div = 1
								local headshot = 1
								local reduction = 1
								if ReplicatedStorage.CharStats:FindFirstChild(TargetChar.Name).Downed.Value then
									div = Config.DownedDiv or 3
								end
								if TargetChar:FindFirstChild("reduction") then
									reduction = TargetChar:FindFirstChild("reduction").Value
									div = div + TargetChar:FindFirstChild("reduction").Value
								end
								if HitPart.Name == "Head" then
									headshot = Config.HeadshotMultiplier or 1.5
								end

								tag(TargetHumanoid, Player)

								local dmg = ((Config.Damage / headshot) / div) / reduction
								
								if TargetHumanoid.Health - dmg <= 0 then
									if Tool.Name == "ERADICATOR" then
										if TargetChar:FindFirstChild("Torso") then
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), TargetChar.Torso, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 100, 0.18)	
										end
									end
								end
								
								if Config.MultipleHits == nil then
									Tool.Values.Slashing1.Value = false
								end

								if TargetHumanoid.Health - dmg < 15 then
									if ReplicatedStorage.CharStats:FindFirstChild(TargetChar.Name).Downed.Value == false then
										TargetHumanoid.Health = 14

										if Tool.Name == "Bat" then
											if Combo == 1 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
											elseif Combo == 2 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
											elseif Combo == 3 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Vector3.new(0, -1, 0)) * 2500, 0.18)
											end
										elseif Tool.Name == "Metal Bat" then
											if Combo == 1 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1000, 0.18)
											elseif Combo == 2 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1000, 0.18)
											elseif Combo == 3 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Vector3.new(0, -1, 0)) * 2500, 0.18)
											end
										elseif Tool.Name == "BRUHBAR" then
											if Combo == 1 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 35000, 0.18)
											elseif Combo == 2 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 35000, 0.18)
											elseif Combo == 3 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Vector3.new(math.random(-1, 1), 1, math.random(-1, 1))) * 35000, 0.18)
											end
										elseif Tool.Name == "BlackBayonet" or Tool.Name == "Bayonet" or Tool.Name == "Shiv" or Tool.Name == "Rambo" then
											if Combo == 1 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
											elseif Combo == 2 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
											elseif Combo == 3 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, -1, 0)) * 1500, 0.18)
											end
										elseif Tool.Name == "Fists" then
											if Combo == 1 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 1, 0)) * 1500, 0.18)
											elseif Combo == 2 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 1, 0)) * 1500, 0.18)
											end
										end
									else
										TargetHumanoid:TakeDamage(dmg)
									end
								else
									TargetHumanoid:TakeDamage(dmg)
								end

								local SoundsFolder = Tool:WaitForChild("Sounds")
								local HitSounds = SoundsFolder:WaitForChild("HitSounds"):GetChildren()
								local HitSound = HitSounds[math.random(1, #HitSounds)]
								if Combo == 3 then
									if not Tool:FindFirstChild("Handle") then
										if game:GetService("CollectionService"):HasTag(Player, "C1") and game:GetService("CollectionService"):HasTag(Player, "C2") then
											if SoundsFolder:FindFirstChild("ComboHit") then
												HitSound = SoundsFolder.ComboHit
											end
										end
									else
										if SoundsFolder:FindFirstChild("ComboHit") then
											HitSound = SoundsFolder.ComboHit
										end
									end
								end

								local ActualHitSound = HitSound:Clone()
								ActualHitSound.PlaybackSpeed = HitSound.PlaybackSpeed + math.random(-100, 100) / 10000
								ActualHitSound.Parent = HitPart
								ActualHitSound:Play()
								Debris:AddItem(ActualHitSound, 2) 

								Flinch.Flinch(TargetHumanoid, HitPart.Name)

								local Effect = Instance.new("Part", workspace:WaitForChild("Debris"))
								Effect.Size = Vector3.new(0.1, 0.1, 0.1)
								Effect.Anchored = true
								Effect.CanCollide = false
								Effect.Position = Vector
								Effect.Transparency = 1

								Debris:AddItem(Effect, 2)

								Events:WaitForChild("BloodHitEvent"):FireAllClients(Effect)
								
								local SD = Instance.new("NumberValue", CharStats[TargetChar.Name])
								SD.Name = "SD"
								SD.Value = 7
								game.Debris:AddItem(SD, 0.75)

								if Tool.Name == "RCU_RiotShield" then
									coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S1"].KnockTime)
									Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
									Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S1"].ConcussionEffect.Time, Config.Mains["S1"].ConcussionEffect.Multi)
								elseif Tool.Name == "BRUHBAR" then
									if Combo == 3 then
										coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
										Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Vector3.new(math.random(-1, 1), 1, math.random(-1, 1))) * 35000, 0.18)
										Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
									else
										if CharStats[TargetChar.Name].RagdollTime.RagdollSwitch.Value then
											if Combo == 1 then
												coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 0.25, 0)) * 35000, 0.18)
												Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
											elseif Combo == 2 then
												coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 0.25, 0)) * 35000, 0.18)
												Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
											end
										else
											if Combo == 1 then
												coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 2500, 0.18)
												Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S1"].ConcussionEffect.Time, Config.Mains["S1"].ConcussionEffect.Multi)
											elseif Combo == 2 then
												coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 2500, 0.18)
												Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S1"].ConcussionEffect.Multi)
											end
										end
									end
								elseif Tool.Name == "Bat" then
									if HitPart.Name == "Head" then
										if Combo == 1 then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
											Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
										elseif Combo == 2 then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1500, 0.18)
											Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
										elseif Combo == 3 then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Vector3.new(0, -1, 0)) * 1500, 0.18)
											Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
										end
									end
								elseif Tool.Name == "Metal Bat" then
									if HitPart.Name == "Head" then
										if Combo == 1 then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1600, 0.18)
											Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
										elseif Combo == 2 then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 2, 0)) * 1600, 0.18)
											Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
										elseif Combo == 3 then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Vector3.new(0, -1, 0)) * 1500, 0.18)
											Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S"..Combo].ConcussionEffect.Time, Config.Mains["S"..Combo].ConcussionEffect.Multi)
										end
									end
								elseif Tool.Name == "Fists" then
									if Combo == 1 then
										game:GetService("CollectionService"):AddTag(Player, "C1")
										task.spawn(function()
											task.wait(2)
											game:GetService("CollectionService"):RemoveTag(Player, "C1")
										end)
									elseif Combo == 2 then
										game:GetService("CollectionService"):AddTag(Player, "C2")
										task.spawn(function()
											task.wait(2)
											game:GetService("CollectionService"):RemoveTag(Player, "C2")
										end)
									elseif Combo == 3 then
										if game:GetService("CollectionService"):HasTag(Player, "C1") and game:GetService("CollectionService"):HasTag(Player, "C2") then
											coroutine.wrap(r)(Players:GetPlayerFromCharacter(TargetChar), Config.Mains["S3"].KnockTime)
											Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 700, 0.18)	
										end
									end
								end
								
								if TargetChar:FindFirstChild("Torso") then
									local attachment = nil
									if Tool.Name == "ERADICATOR" then
										attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Shoulder")
									else
										if HitPart.Name == "Head" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Neck")
										elseif HitPart.Name == "Left Arm" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Shoulder")
										elseif HitPart.Name == "Right Arm" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Right Shoulder")
										elseif HitPart.Name == "Left Leg" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Hip")
										elseif HitPart.Name == "Right Leg" then
											attachment = TargetChar.Torso:FindFirstChild("RGAB_Right Hip")
										end
									end
									CreateBloodTrail(attachment, Config.Blood.A)
								end
								
								if not CharStats[TargetChar.Name].Downed.Value then
									if Config.BreakSettings.Enabled then
										local LookFor = "Head"

										if HitPart.Name == "Left Arm" then
											LookFor = "LArm"
										elseif HitPart.Name == "Right Arm" then
											LookFor = "RArm"
										elseif HitPart.Name == "Left Leg" then
											LookFor = "LLeg"
										elseif HitPart.Name == "Right Leg" then
											LookFor = "RLeg"
										end

										if CharStats[TargetChar.Name].HealthValues:FindFirstChild(HitPart.Name) then
											local ComboConfig = Config.Mains["S"..Combo] or Config.Mains.S1
											if ComboConfig then
												local h = ComboConfig.DmgMulti2

												if CharStats[TargetChar.Name].HealthValues[HitPart.Name].Value - ((Config.BreakSettings[LookFor].Dmg * h) / reduction) <= 0 then
													if HitPart.Name == "Right Arm" then
														CharStats[TargetChar.Name].HealthValues[HitPart.Name].Broken.Value = true
													else												
														if Tool.Name == "ERADICATOR" then
															Events.FT_:FireClient(Players:GetPlayerFromCharacter(TargetChar), HitPart, (-Player.Character.HumanoidRootPart.CFrame.RightVector + Vector3.new(0, 1, 0)) * 150, 0.18)
														end
														CharStats[TargetChar.Name].HealthValues[HitPart.Name].Broken.Value = Config.BreakSettings.CanBreak
													end
													if HitPart.Name == "Head" then
														CharStats[TargetChar.Name].HealthValues[HitPart.Name].Destroyed.Value = Config.BreakSettings.ExplodeHead
														Player.XP.Value += 35
														ReplicatedStorage.Events.XP:FireClient(Player, 35)
														task.wait()
													end
												end 
																		
												if HitPart.Name == "Head" then
													if Config.BreakSettings.ExplodeHead then
														if reduction >= 5 then
															task.spawn(function()
																Events.CONC_EF:FireClient(Players:GetPlayerFromCharacter(TargetChar), 1.5, 1)
																r(Players:GetPlayerFromCharacter(TargetChar), ComboConfig.KnockTime or 1)
															end)
														end
													end
												end

												CharStats[TargetChar.Name].HealthValues[HitPart.Name].Value = CharStats[TargetChar.Name].HealthValues[HitPart.Name].Value - ((Config.BreakSettings[LookFor].Dmg * h) / reduction)
											end
										end
									end
									
									if reduction < 5 then
										if Config.Mains["S"..Combo] then
											if Config.Mains["S"..Combo].BleedTime > 0 and not game:GetService("CollectionService"):HasTag(TargetChar, "Bleeding") then
												local CurrentTick = tick()
												local CurrentTime = 0
												local Bleeding = true

												if TargetChar:FindFirstChild("Torso") then
													local attachment = nil
													if HitPart.Name == "Head" then
														attachment = TargetChar.Torso:FindFirstChild("RGAB_Neck")
													elseif HitPart.Name == "Left Arm" then
														attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Shoulder")
													elseif HitPart.Name == "Right Arm" then
														attachment = TargetChar.Torso:FindFirstChild("RGAB_Right Shoulder")
													elseif HitPart.Name == "Left Leg" then
														attachment = TargetChar.Torso:FindFirstChild("RGAB_Left Hip")
													elseif HitPart.Name == "Right Leg" then
														attachment = TargetChar.Torso:FindFirstChild("RGAB_Right Hip")
													end
													CreateBloodTrail(attachment, BleedBlood)
												end

												task.spawn(function()
													game:GetService("CollectionService"):AddTag(TargetChar, "Bleeding")													
													
													for i = 1, Config.Mains["S"..Combo].BleedTime do
														task.wait(Config.Mains["S"..Combo].BleedTick)
														TargetHumanoid:TakeDamage(0.5 / reduction)
													end
													
													game:GetService("CollectionService"):RemoveTag(TargetChar, "Bleeding")
												end)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		elseif Key == "REV2" then
			if not Tool.Values.Reviving.Value then
				return
			end

			Tool.Values.Reviving.Value = false

			pcall(function()
				ReplicatedStorage:WaitForChild("CharStats")[Player.Name].Currents["SD_Reviving"]:Destroy()
			end)
			pcall(function()
				for _, v in pairs(ReplicatedStorage:WaitForChild("CharStats")[Player.Name].Currents:GetChildren()) do
					if v.Name == "AJ" then
						v:Destroy()
					end
				end
			end)
		end
	end
end)

DeathRespawn.OnServerInvoke = function(Player)
	if game:GetService("CollectionService"):HasTag(Player, "Respawning") then
		return false
	end
	game:GetService("CollectionService"):AddTag(Player, "Respawning")
	coroutine.wrap(function()
		for _, Character in pairs(workspace.Characters:GetChildren()) do
			if Character.Name == Player.Name then
				Character:Destroy()
			end
		end
		task.wait(2)
		Player:LoadCharacter()
		game:GetService("CollectionService"):RemoveTag(Player, "Respawning")
	end)()
	return true
end

MOVZREP.OnServerEvent:Connect(function(Player, t, tool, key, key2, combo, a6)
	MOVZREP:FireAllClients(Player.Character, t, tool, key, key2, combo, a6)
end)

local function zw()
	return game:GetService("Lighting"):FindFirstChild("ADONIS_ZAWARUDO")
end

local function GetHum(x)
	if x == nil then
		return
	end
	if x.Parent==nil then
		return
	end
	if x.Parent.Parent==nil then
		return
	end
	if x.Parent:FindFirstChild("Humanoid") then
		return x.Parent:FindFirstChild("Humanoid") 
	end
	if x.Parent.Parent:FindFirstChild("Humanoid") then
		return x.Parent.Parent:FindFirstChild("Humanoid") 
	end
end

Events.Gun_Shoot.OnServerEvent:Connect(function(Player, a, b, c, d, e, f)
	if typeof(b) == "table" then
		local HitPart, Pos, Normal = unpack(b)
		if HitPart then
			if HitPart.Parent then
				if CharStats:FindFirstChild(HitPart.Parent.Name) then
					if CharStats[HitPart.Parent.Name].HealthValues:FindFirstChild(HitPart.Name) then
						if CharStats[HitPart.Parent.Name].HealthValues[HitPart.Name].Value <= 0 then
							return
						end
					end
				end
			end
		end
		if Player.Character then
			if HitPart:IsDescendantOf(Player.Character) then
				return
			end
			if Player.Character:FindFirstChild("Torso") then
				local Raycast = Ray.new(Player.Character.Torso.Position, Pos - Player.Character.Torso.Position)
				local Result = workspace:FindPartOnRayWithWhitelist(Raycast, {workspace.Map})

				if Result then
					return
				end
			end
		end
	end
	if CharStats[Player.Name].RagdollTime.RagdollSwitch.Value then 
		return
	end
	if CharStats[Player.Name].Downed.Value then 
		return
	end
	if b~=nil and type(b)=="table" then
		local hit,pos,normal = unpack(b)
		if Player.Team and Players:GetPlayerFromCharacter(hit.Parent).Team then
			if Player.Team == Players:GetPlayerFromCharacter(hit.Parent).Team then
				Events.FF:FireClient(Player, "Friendly fire!")
				return
			end
		end
		if hit.Parent:FindFirstChildOfClass("ForceField") then
			Events.FF:FireClient(Player, "Player is protected!")
			return
		end
	end
	if a:IsDescendantOf(Player.Character) then
		repeat 
			task.wait()
		until not zw()

		local Config = nil

		if (a~=nil and a:IsA("Tool")) then
			if not pcall(function()
					Config = require(a:FindFirstChild("Config"))
				end) then
				return
			end
		end

		if Config.RocketLauncherEnabled then
			local Rocket = ServerStorage.Resources.Effects:WaitForChild(Config.RocketName):Clone()
			Rocket.Parent = workspace.Debris
			Rocket:SetNetworkOwner(Player)

			Events.RL:FireAllClients(Player, a, b, c, d, e, f, Rocket)
		else
			if b~=nil and type(b)=="table" and Config~=nil then
				local hit,pos,normal = unpack(b)


				if hit~=nil and not hit:IsDescendantOf(Player.Character) then
					if hit.Parent:FindFirstChild("DamageReflection") then
						hit = Player.Character:FindFirstChild(hit.Name)
					end
					if not hit then
						return
					end
					local hum = GetHum(hit)
					if hit.Parent:FindFirstChild("DamageReflection") then
						hum = Player.Character:FindFirstChildOfClass("Humanoid")
					end
					if hum then
						if hum.Health <= 0 then
							return
						end
					end
					if hum then
						if hum.Parent:FindFirstChildOfClass("ForceField") then
							return
						end

						tag(hum, Player)

						Events.BloodHitEvent:FireAllClients(hit)

						if not CharStats:FindFirstChild(hum.Parent.Name).Downed.Value then
							tag(hum, Player)
						end

						local dist = (hum.Parent.Torso.Position - hit.Position).Magnitude
						local dividedistance = 1 - (dist / 100)

						local div = 1
						local headshot = 1
						local reduction = 1
						if ReplicatedStorage.CharStats:FindFirstChild(hit.Parent.Name).Downed.Value then
							div = Config.DownedDiv or 3
						end
						if hit.Parent:FindFirstChild("reduction") then
							reduction = hit.Parent:FindFirstChild("reduction").Value
							div = div + hit.Parent:FindFirstChild("reduction").Value
						end
						if hit.Name == "Head" then
							headshot = Config.HeadshotMultiplier or 1.5
						end

						local dmg = ((Config.Damage / dividedistance) * headshot) / reduction

						if div ~= 1 then
							dmg = Config.Damage / div
						end

						local function damage(d)
							hum:TakeDamage(d)
						end

						Flinch.Flinch(hum, hit.Name)

						local Effect = Instance.new("Part", workspace:WaitForChild("Debris"))
						Effect.Size = Vector3.new(0.1, 0.1, 0.1)
						Effect.Anchored = true
						Effect.CanCollide = false
						Effect.Position = pos
						Effect.Transparency = 1

						Debris:AddItem(Effect, 2)

						Events:WaitForChild("BloodHitEvent"):FireAllClients(Effect)
						
						if Config.Customs then
							if Config.Customs.LimbDamage2 then
								if hit.Name == "Head" then
									local CharStat = CharStats[hit.Parent.Name]
									local Damage = Config.Customs.LimbDamage2.Dmg / reduction
									if CharStat.HealthValues.Head.Value - Damage <= 0 then
										CharStat.HealthValues.Head.Destroyed.Value = (Config.Customs.LimbDamage2.HeadBreakType == "Explode")
										Player.XP.Value += 35
										ReplicatedStorage.Events.XP:FireClient(Player, 35)
										task.wait()
									end
									CharStat.HealthValues.Head.Value -= Damage
								else
									local CharStat = CharStats[hit.Parent.Name]
									local Damage = Config.Customs.LimbDamage2.Dmg / reduction
									if CharStat.HealthValues:FindFirstChild(hit.Name) then
										if CharStat.HealthValues[hit.Name].Value - Damage <= 0 then
											CharStat.HealthValues[hit.Name].Destroyed.Value = (Config.Customs.LimbDamage2.LimbBreakType == "Explode")
											Player.XP.Value += 35
											ReplicatedStorage.Events.XP:FireClient(Player, 35)
										end
										CharStat.HealthValues[hit.Name].Value -= Damage
									end
								end
							end
						end
						
						local CharStat = CharStats[hit.Parent.Name]
						local Damage = 10 / reduction
						if CharStat.HealthValues:FindFirstChild(hit.Name) then
							if not (CharStat.HealthValues[hit.Name].Value - Damage <= 50) then
								CharStat.HealthValues[hit.Name].Value -= Damage
							end
						end
						
						if c == "RB" then
							if hum.Health - dmg < 15 then
								if ReplicatedStorage.CharStats:FindFirstChild(hum.Parent.Name).Downed.Value == false then
									hum.Health = 14

									pcall(function()
										local part = hit
										if part.Name == "Torso" or part.Name == "Head" then
											part = hit.Parent["Left Leg"] or hit.Parent["Right Leg"] or hit.Parent["Left Arm"] or hit.Parent["Right Arm"]
										end
										if CharStats[hit.Parent.Name].HealthValues:FindFirstChild(hit.Name) then
											if CharStats[hit.Parent.Name].HealthValues[hit.Name].Value > 0 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(hum.Parent), hit, (Player.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 2, 0)) * (Config.Knockback * 100), 0.18)
											end
										end
									end)
								else
									dmg = 2
									if hum.Health - dmg <= 0 then
										damage(dmg)
									end
								end
							else
								damage(dmg / Config.BulletTypeChange.RB_Reduction)
							end
						else
							if hum.Health - dmg < 15 then
								if ReplicatedStorage.CharStats:FindFirstChild(hum.Parent.Name).Downed.Value == false then
									hum.Health = 14

									pcall(function()
										if CharStats[hit.Parent.Name].HealthValues:FindFirstChild(hit.Name) then
											if CharStats[hit.Parent.Name].HealthValues[hit.Name].Value > 0 then
												Events.FT_:FireClient(Players:GetPlayerFromCharacter(hum.Parent), hit, (Player.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 2, 0)) * (Config.Knockback * 100), 0.18)
											end
										end
									end)
								else
									damage(dmg)
								end
							else
								damage(dmg)
							end
						end
					end
				end
			end
		end
	end
end)

Events.Gun_Shoot2.OnServerEvent:Connect(function(Player, a, b, e, f)
	if not e then
		return
	end
	if CharStats[Player.Name].RagdollTime.RagdollSwitch.Value then 
		return
	end
	if CharStats[Player.Name].Downed.Value then 
		return
	end
	if a:IsDescendantOf(Player.Character) or a:IsDescendantOf(Player.Backpack) then
		if require(a.Config).RocketLauncherEnabled or require(a.Config).GrenadeLauncherEnabled then
			repeat 
				task.wait()
			until not zw()

			e.Anchored = true
			e.EffectA.Smoke.Enabled = false
			e.EffectA.Sound.Playing = false
			e:Destroy()

			local Explosion = nil

			if f == 1 then
				Explosion = ServerStorage.Resources.Effects:FindFirstChild(require(a.Config).ExplosionName):Clone()
				Explosion.Creator.Value = Player
				game:GetService("Debris"):AddItem(Explosion, 3)
			elseif f == 2 then
				Explosion = ServerStorage.Resources.Effects:FindFirstChild("SmokeExplosion"):Clone()
			elseif f == 3 then
				Explosion = ServerStorage.Resources.Effects:FindFirstChild("MustardGasExplosion"):Clone()
				Explosion.Creator.Value = Player
			elseif f == 4 then
				--	Explosion = ServerStorage.Resources.Effects:FindFirstChild():Clone()
			end

			if Explosion then
				Explosion.Parent = workspace.Debris
				Explosion.Position = b

				Explosion.Main.Disabled = false
			end
		end
	end
end)

Events.Replicate.OnServerEvent:Connect(function(Player, key, dir, pos, bt, hit, bps, spread)
	if typeof(dir) == "table" then
		if typeof(dir[1]) == "Tool" then
			if not dir[1]:IsDescendantOf(Player.Character) then
				return
			end
		end
	end
	Events.Replicate:FireAllClients(Player, key, dir, pos, bt, hit, bps, spread)
end)

Events.ATM.OnServerInvoke = function(A, B, C, D)
	if CharStats[A.Name].RagdollTime.RagdollSwitch.Value then 
		return
	end
	if CharStats[A.Name].Downed.Value then 
		return
	end
	if DataStore:GetAsync(A.UserId.."-Frameworked") then
		return false, "YOU ARE TOO INJURED TO DO THIS RIGHT NOW"
	end
	if D.Values.Busy.Value then
		return
	end
	if B == "WI" then
		if _G[A.Name].Bank < C or (A.Character.Torso.Position - D.posA.WorldPosition).Magnitude > 8 or C <= 0 then
			D.Parts.Screen.PointLight.Color = Color3.fromRGB(255, 0, 0)
			D.Parts.Screen.Color = Color3.fromRGB(255, 100, 100)
			D.error:Play()
			D.Values.Busy.Value = true
			task.spawn(function()
				task.wait(1)
				D.Values.Busy.Value = false

				D.Parts.Screen.PointLight.Color = Color3.fromRGB(222, 216, 183)
				D.Parts.Screen.Color = Color3.fromRGB(222, 216, 183)
			end)
			return false, "NOT ENOUGH CASH"
		else
			D.process:Play()
			D.Values.Busy.Value = true

			D.Parts.Screen.PointLight.Color = Color3.fromRGB(255, 255, 0)
			D.Parts.Screen.Color = Color3.fromRGB(255, 255, 100)

			task.wait(1.5)

			task.spawn(function()
				task.wait(2)

				D.Values.Busy.Value = false
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(222, 216, 183)
				D.Parts.Screen.Color = Color3.fromRGB(222, 216, 183)
			end)

			if _G[A.Name].Bank >= C and (A.Character.Torso.Position - D.posA.WorldPosition).Magnitude <= 8 or C <= 0 then
				_G[A.Name].Bank -= C
				_G[A.Name].Cash += C
				D.withdraw:Play()
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(0, 255, 0)
				D.Parts.Screen.Color = Color3.fromRGB(100, 255, 100)
				Events.UpdateClient:FireClient(A, _G[A.Name].Bank, _G[A.Name].Cash)
				return true, "YOUR REQUEST WAS COMPLETED"
			else
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(255, 0, 0)
				D.Parts.Screen.Color = Color3.fromRGB(255, 100, 100)
				D.error:Play()
				return false
			end
		end	
	elseif B == "DP" then
		if _G[A.Name].Cash < C or (A.Character.Torso.Position - D.posA.WorldPosition).Magnitude > 8 or C <= 0 then
			D.Parts.Screen.PointLight.Color = Color3.fromRGB(255, 0, 0)
			D.Parts.Screen.Color = Color3.fromRGB(255, 100, 100)
			D.error:Play()
			D.Values.Busy.Value = true
			task.spawn(function()
				task.wait(1)
				D.Values.Busy.Value = false
				D.Parts.Screen.Color = Color3.fromRGB(222, 216, 183)
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(222, 216, 183)
			end)
			return false, "NOT ENOUGH CASH"
		else
			D.process:Play()
			D.Values.Busy.Value = true

			D.Parts.Screen.PointLight.Color = Color3.fromRGB(255, 255, 0)
			D.Parts.Screen.Color = Color3.fromRGB(255, 255, 100)

			task.wait(1.5)

			task.spawn(function()
				task.wait(2)

				D.Values.Busy.Value = false
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(222, 216, 183)
				D.Parts.Screen.Color = Color3.fromRGB(222, 216, 183)
			end)

			D.Values.Busy.Value = false

			if _G[A.Name].Cash >= C and (A.Character.Torso.Position - D.posA.WorldPosition).Magnitude <= 8 or C <= 0 then
				_G[A.Name].Bank += C
				_G[A.Name].Cash -= C
				D.deposit:Play()
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(0, 255, 0)
				D.Parts.Screen.Color = Color3.fromRGB(100, 255, 100)
				Events.UpdateClient:FireClient(A, _G[A.Name].Bank, _G[A.Name].Cash)
				return true, "YOUR REQUEST WAS COMPLETED"
			else
				D.Parts.Screen.PointLight.Color = Color3.fromRGB(255, 0, 0)
				D.Parts.Screen.Color = Color3.fromRGB(255, 100, 100)
				D.error:Play()
				return false
			end
		end
	end
end

Events.Replicate2.OnServerEvent:Connect(function(Player, lp, rl, n, t, b, o)
	Events.Replicate2:FireAllClients(Player, lp, rl, n, t, b, o)
end)

local Safes = 1

for _, Safe in pairs(workspace.Map.BredMakurz:GetChildren()) do
	Safe.Name = Safe.Name.."_"..Safes
	Safes += 1

	local DoorCF 
	if Safe:FindFirstChild("BreakM") then
		DoorCF = Safe.Parts.Door.CFrame	
	end

	Safe.Events.Damage.Event:Connect(function(Player, Tool, Dmg)
		pcall(function()
			if not Safe.Values.Broken.Value and Tool.Values.Slashing1.Value and (Player.Character.Torso.Position - Safe.MainPart.Position).Magnitude < 20 then
				if (Safe.Values.Health.Value - Dmg) <= Safe.Values.Health.MinValue then
	
					for i = 1, math.random(4, 5) do
						_G[Player.Name].Cash += math.random(Safe.Values.DropA.MinValue, Safe.Values.DropA.Value)
						Events.UpdateClient:FireClient(Player, _G[Player.Name].Bank, _G[Player.Name].Cash)
						task.wait(0.1)
					end
				end
				Safe.Values.Health.Value = Safe.Values.Health.Value - Dmg
				Tool.Values.Slashing1.Value = false
			end
		end)
	end)

	Safe.Values.Health.Changed:Connect(function()
		pcall(function()
			if Safe.Values.Health.Value <= 0 and not Safe.Values.Broken.Value then
				if Safe:FindFirstChild("BreakM") then
					require(Safe.BreakM)()
				end

				Safe.Values.Broken.Value = true

				Safe.MainPart.EffectA.Sound:Play()

				Safe.MainPart.EffectA.Smoke.Enabled = true
				Safe.MainPart.EffectA.Spark.Enabled = true
				Safe.MainPart.EffectA.Sparkle.Enabled = false

				for _, v in pairs(Safe.MainPart.EffectA:GetChildren()) do
					if v:IsA("ParticleEmitter") then
						v.Enabled = true
					end
				end

				for _, Part in pairs(Safe.Parts:GetChildren()) do
					if Part.Name ~= "DoorBlock" and Part.Name ~= "DoorBlack" then
						Part.Material = Enum.Material.CorrodedMetal
					end
				end

				task.wait(300 * Safe.Type.Value)

				Safe.MainPart.EffectA.Smoke.Enabled = false
				Safe.MainPart.EffectA.Spark.Enabled = false
				Safe.MainPart.EffectA.Sparkle.Enabled = true

				for _, Part in pairs(Safe.Parts:GetChildren()) do
					if Part.Name ~= "DoorBlock" then
						Part.Material = Enum.Material.Metal
					end
				end

				Safe.Values.Broken.Value = false
				Safe.Values.Health.Value = Safe.Values.Health.MaxValue

				if Safe:FindFirstChild("BreakM") then
					Safe.Parts.Door.CFrame = DoorCF
				end
			end
		end)
	end)
end

local function MapPart(Part)
	if Part:IsA("BasePart") or Part:IsA("MeshPart") or Part:IsA("Union") then
		PhysicsService:SetPartCollisionGroup(Part, "Map")
	end
end

for _, Part in pairs(workspace.Map.Parts:GetDescendants()) do
	MapPart(Part)
end

workspace.Map.Parts.DescendantAdded:Connect(function(Part)
	MapPart(Part)
end)

for _, Door in pairs(workspace.Map.Doors:GetChildren()) do
	local DoorEvents = Door:FindFirstChild("Events")
	local DoorValues = Door:FindFirstChild("Values")
	local DoorParts = Door:FindFirstChild("Parts")
	local DoorConstraints = Door:FindFirstChild("Constraints")

	local Config = require(Door.Config)

	local function FixDoor()
		if DoorConstraints then
			DoorConstraints.MainHinge.AngularSpeed = Config.DoorSpeed
			DoorValues.Health.MaxValue = Config.Health
			DoorValues.Health.Value = DoorValues.Health.MaxValue
			DoorValues.CanLock.Value = Config.CanLock

			for _, Part in pairs(Door:GetDescendants()) do
				if Part:IsA("BasePart") or Part:IsA("MeshPart") or Part:IsA("Union") then
					if Part.Name ~= "DFrame" then
						Part.Anchored = false	
						if Part.Name ~= "Knob1" and Part.Name ~= "Knob2" and Part.Name ~= "Lock" then
							PhysicsService:SetPartCollisionGroup(Part, "Doors")
						end
					end
				end
			end
		end
	end

	FixDoor()

	local function AutoLock(d)
		if DoorValues.CanLock.Value then
			if not DoorValues.Open.Value and not DoorValues.Locked.Value then
				DoorValues.Busy.Value = true
				DoorValues.Locked.Value = true
				DoorConstraints.LockHinge.TargetAngle = 90

				Door.DoorBase.sPos.Lock:Play()

				task.spawn(function()
					task.wait(d or 0.5)
					DoorValues.Busy.Value = false
				end)
			end
		end
	end

	if Config.AutoLock then
		AutoLock(2)
	end

	DoorEvents.Toggle.OnServerEvent:Connect(function(Player, Key, Knob)
		if DoorValues.Busy.Value or DoorValues.Busy2.Value or DoorValues.Busy2_5.Value or DoorValues.Busy3.Value or DoorValues.Busy4.Value then
			return
		end

		local DoorToChar = Player.Character.HumanoidRootPart.Position - Door.DoorBase.Position

		if (DoorToChar).Magnitude > ((Config.MaxDistance or 5.5) * 2) then
			return
		end

		if Key == "Open" then
			if not DoorValues.Open.Value and not DoorValues.Locked.Value then	
				DoorValues.Busy.Value = true
				DoorValues.Open.Value = true

				local DoorLookVect = Door.DoorBase.CFrame.LookVector
				local DoorAngle = 0
				if DoorToChar:Dot(DoorLookVect) > 0 then
					DoorAngle = Config.TargetAngle
				else
					DoorAngle = -Config.TargetAngle
				end

				Door.DoorBase.sPos.OpenS:Play()

				if DoorConstraints:FindFirstChild("Main2Hinge") then
					DoorConstraints.Main2Hinge.TargetAngle = -DoorAngle
				end

				DoorConstraints.MainHinge.TargetAngle = DoorAngle

				task.spawn(function()
					task.wait(2.5 / Config.DoorSpeed)
					DoorValues.Busy.Value = false
				end)
			elseif not DoorValues.Open.Value and DoorValues.Locked.Value then
				DoorValues.Busy3.Value = true

				Door.DoorBase.sPos.Jiggle:Play()

				task.spawn(function()
					task.wait(0.75)
					DoorValues.Busy3.Value = false
				end)
			end
		elseif Key == "Close" then
			if DoorValues.Open.Value then
				DoorValues.Busy.Value = true
				DoorValues.Open.Value = false
				DoorConstraints.MainHinge.TargetAngle = 0

				Door.DoorBase.sPos.CloseS:Play()

				if DoorConstraints:FindFirstChild("Main2Hinge") then
					DoorConstraints.Main2Hinge.TargetAngle = 0
				end

				task.spawn(function()
					task.wait(2.5 / Config.DoorSpeed)
					DoorValues.Busy.Value = false
				end)
			end
		elseif Key == "Lock" then
			if DoorValues.CanLock.Value then
				if not DoorValues.Open.Value and not DoorValues.Locked.Value then
					DoorValues.Busy.Value = true
					DoorValues.Locked.Value = true
					DoorConstraints.LockHinge.TargetAngle = 90

					Door.DoorBase.sPos.Lock:Play()

					task.spawn(function()
						task.wait(0.5)
						DoorValues.Busy.Value = false
					end)
				end
			end
		elseif Key == "Unlock" then
			if DoorValues.CanLock.Value then
				DoorValues.Busy.Value = true
				DoorValues.Locked.Value = false
				DoorConstraints.LockHinge.TargetAngle = 0

				Door.DoorBase.sPos.Unlock:Play()

				task.spawn(function()
					task.wait(0.5)
					DoorValues.Busy.Value = false
				end)
			end
		elseif Key == "Knock" then
			DoorValues.Busy4.Value = true
			DoorValues.Busy.Value = true

			Door.DoorBase.Knock:Play()

			task.spawn(function()
				task.wait(1)
				DoorValues.Busy4.Value = false
				DoorValues.Busy.Value = false
			end)
		end
	end)

	DoorEvents.Damage.Event:Connect(function(Player, Tool, Damage)
		DoorValues.Health.Value -= Damage

		if DoorValues.Health.Value <= DoorValues.Health.MinValue then
			if not DoorValues.Broken.Value then
				DoorValues.Broken.Value = true

				local DoorBase = Door.DoorBase:Clone()
				local CF = Door.DoorBase.CFrame

				local DoorBase2 = nil
				local CF2 = nil

				DoorConstraints.MainHinge.Enabled = false

				if DoorConstraints:FindFirstChild("MainHinge2") then
					DoorConstraints.MainHinge2.Enabled = false
					DoorBase2 = Door.DoorBase2:Clone()
					CF2 = Door.DoorBase2.CFrame
				end

				local DoorLookVect = Door.DoorBase.CFrame.LookVector
				Door.DoorBase.Velocity = Door.DoorBase.CFrame.LookVector * -30
				if Door:FindFirstChild("DoorBase2") then
					Door.DoorBase2.Velocity = Door.DoorBase2.CFrame.LookVector * -30
				end

				local Break1 = ServerStorage.Resources.DoorKickSounds[Config.Type].Break1:Clone()
				Break1.Parent = Door.DoorBase.sPos
				Break1.PlaybackSpeed += math.random(-50, 50) / 1000
				Break1:Play()
				game:GetService("Debris"):AddItem(Break1, 1)

				task.wait(120)

				if Config.AutoLock then
					AutoLock(2)
				end

				Door.DoorBase:Destroy()
				DoorBase.Parent = Door
				DoorBase.CFrame = CF
				DoorConstraints.MainHinge.Attachment1 = DoorBase.DBase_A

				if DoorBase2 then
					Door.DoorBase2:Destroy()
					DoorBase2.Parent = Door
					DoorBase2.CFrame = CF2
					DoorConstraints.Main2Hinge.Attachment1 = DoorBase2.DBase_A
				end

				DoorConstraints.MainHinge.Enabled = true
				if DoorConstraints:FindFirstChild("MainHinge2") then
					DoorConstraints.MainHinge2.Enabled = true
				end

				DoorValues.Broken.Value = false

				FixDoor()	
			end
		else
			local HitS = ServerStorage.Resources.DoorKickSounds[Config.Type].HitS:Clone()
			HitS.Parent = Door.DoorBase.sPos
			HitS.PlaybackSpeed += math.random(-100, 100) / 1000
			HitS:Play()
			game:GetService("Debris"):AddItem(HitS, 1)
		end
	end)
end

Events.DownResist.OnServerInvoke = function(Player, a)
	if a then
		if game:GetService("CollectionService"):HasTag(Player.Character, "Revived") or CharStats[Player.Name].RagdollTime.RagdollSwitch.Value then
			ReplicatedStorage.CharStats[Player.Name].Downed.Resisting.Value = false
			return
		end
	end

	if ReplicatedStorage.CharStats[Player.Name].Downed.Value then
		ReplicatedStorage.CharStats[Player.Name].Downed.Resisting.Value = a
	end

	return true
end

Events.Gun_Reload.OnServerEvent:Connect(function()

end)

Events.__DASFXD.OnServerEvent:Connect(function(Player, a, b, c, d)
	local Character = Player.Character
	if a == "FlllD" then
		if b >10 and b < 20 and not d then
			pcall(function()
				local FallSmall = ServerStorage.Resources.FallDamage.Small.FallSmall:Clone()
				FallSmall.Parent = Player.Character.Torso
				FallSmall:Play()
				game.Debris:AddItem(FallSmall, FallSmall.TimeLength / FallSmall.PlaybackSpeed)
			end)
		elseif b > 15 and b < 30 and not d then
			Player.Character.Humanoid:TakeDamage(b / math.random(4, 9))

			pcall(function()
				local Sounds = ServerStorage.Resources.FallDamage.Medium:GetChildren()
				local Sound = Sounds[math.random(1, #Sounds)]:Clone()
				Sound.Parent = Player.Character.Torso
				Sound:Play()
				game:GetService("Debris"):AddItem(Sound, 3)
			end)
		end
	elseif a == "RZXCKIRLL" then
		if Character:FindFirstChild("Head") then
			if not Character["Head"]:FindFirstChild("scream") then
				if Character.Humanoid.Health > 0 then
					local Screams = ServerStorage.Resources:WaitForChild("Screams"):GetChildren()
					local Scream = Screams[math.random(1, #Screams)]:Clone()
					Scream.Parent = Character["Head"]
					Scream:Play()
					game:GetService("Debris"):AddItem(Scream, 2)
					
					r(Player, 2)
				end
			end
		end
	elseif a == "FllH" then
		local reduction = 1

		if Character:FindFirstChild("reduction") then
			reduction = Character:FindFirstChild("reduction").Value
		end

		if d > 5 and d < 125 then
			local FallSmall = ServerStorage.Resources.FallDamage.Small.FallSmall:Clone()
			FallSmall.Parent = b
			FallSmall:Play()
			game.Debris:AddItem(FallSmall, FallSmall.TimeLength / FallSmall.PlaybackSpeed)
		elseif d > 125 and d < 225 then
			local hv = CharStats[Player.Name].HealthValues:FindFirstChild(b.Name)
			if hv and hv.Value > 0 then
				if hv.Value - (d / reduction) <= 0 then
					hv.Broken.Value = true
					task.wait()
				end
				hv.Value -= (d / reduction)
				
				local Effect = Instance.new("Part", workspace:WaitForChild("Debris"))
				Effect.Size = Vector3.new(0.1, 0.1, 0.1)
				Effect.Anchored = true
				Effect.CanCollide = false
				Effect.Position = b.Position
				Effect.Transparency = 1

				Debris:AddItem(Effect, 2)

				Events:WaitForChild("BloodHitEvent"):FireAllClients(Effect)
				
				Character.Humanoid:TakeDamage((d / 10) / reduction)
			end
		elseif d > 200 then
			local hv = CharStats[Player.Name].HealthValues:FindFirstChild(b.Name)
			if hv and hv.Value > 0 then
				hv.Value -= (d / reduction)

				local Effect = Instance.new("Part", workspace:WaitForChild("Debris"))
				Effect.Size = Vector3.new(0.1, 0.1, 0.1)
				Effect.Anchored = true
				Effect.CanCollide = false
				Effect.Position = b.Position
				Effect.Transparency = 1

				Debris:AddItem(Effect, 2)

				Events:WaitForChild("BloodHitEvent"):FireAllClients(Effect)
				
				if Character:FindFirstChild("Torso") then
					local attachment = nil
					if b.Name == "Head" then
						attachment = Character.Torso:FindFirstChild("RGAB_Neck")
					elseif b.Name == "Left Arm" then
						attachment = Character.Torso:FindFirstChild("RGAB_Left Shoulder")
					elseif b.Name == "Right Arm" then
						attachment = Character.Torso:FindFirstChild("RGAB_Right Shoulder")
					elseif b.Name == "Left Leg" then
						attachment = Character.Torso:FindFirstChild("RGAB_Left Hip")
					elseif b.Name == "Right Leg" then
						attachment = Character.Torso:FindFirstChild("RGAB_Right Hip")
					end
					CreateBloodTrail(attachment, LimbBlood2)
				end
				
				local Sounds = ServerStorage.Resources.GoreSounds2:GetChildren()
				local Sound = Sounds[math.random(1, #Sounds)]:Clone()
				Sound.Parent = b
				Sound:Play()
				game:GetService("Debris"):AddItem(Sound, 3)
				
				Character.Humanoid:TakeDamage(d / reduction)
			end
		end
	end
end)

while true do
	task.wait(0.1)
	if not zw() and script.Time.Enabled.Value then
		game:GetService("Lighting").ClockTime = script.Time.Value
		script.Time.Value += 0.002
	end
end