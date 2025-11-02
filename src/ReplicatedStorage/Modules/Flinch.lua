local FlinchModule = {}

local Animations = script:WaitForChild("Animations", 100)

local None = Animations.None:GetChildren()
local Bat = Animations.Bat:GetChildren()
local Katana = Animations.Katana:GetChildren()
local FireAxe = Animations.FireAxe:GetChildren()

local CharStats = game:GetService("ReplicatedStorage"):WaitForChild("CharStats")

function FlinchModule.Flinch(Humanoid, Side)
	if Humanoid then
		if CharStats:FindFirstChild(Humanoid.Parent.Name) then
			if not CharStats:FindFirstChild(Humanoid.Parent.Name).Downed.Value then
				local Tool = Humanoid.Parent:FindFirstChildOfClass("Tool")
				if Tool then
					if Tool.Name == "Katana" then
						pcall(function()
							if Side then
								if Side == "Left Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.Katana:WaitForChild("Right"))
									Animation:Play()
								elseif Side == "Right Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.Katana:WaitForChild("Left"))
									Animation:Play()
								else		
									local Animation = Humanoid:LoadAnimation(Katana[math.random(1, #Katana)])
									Animation:Play()
								end
							else		
								local Animation = Humanoid:LoadAnimation(Katana[math.random(1, #Katana)])
								Animation:Play()
							end
						end)
					elseif Tool.Name == "Bat" or Tool.Name == "Metal Bat" or Tool.Name == "Crowbar" or Tool.Name == "BRUHBAR" then
						pcall(function()
							if Side then
								if Side == "Left Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.Bat:WaitForChild("Right"))
									Animation:Play()
								elseif Side == "Right Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.Bat:WaitForChild("Left"))
									Animation:Play()
								else		
									local Animation = Humanoid:LoadAnimation(Bat[math.random(1, #Bat)])
									Animation:Play()
								end
							else		
								local Animation = Humanoid:LoadAnimation(Bat[math.random(1, #Bat)])
								Animation:Play()
							end
						end)
					elseif Tool.Name == "Rambo" or Tool.Name == "Bayonet" or Tool.Name == "Shiv" or Tool.Name == "Fists" or Tool.Name == "Knuckledusters" then
						pcall(function()
							if Side then
								if Side == "Left Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.None:WaitForChild("Right"))
									Animation:Play()
								elseif Side == "Right Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.None:WaitForChild("Left"))
									Animation:Play()
								else		
									local Animation = Humanoid:LoadAnimation(None[math.random(1, #None)])
									Animation:Play()
								end
							else		
								local Animation = Humanoid:LoadAnimation(None[math.random(1, #None)])
								Animation:Play()
							end
						end)
					elseif Tool.Name == "FireAxe" then
						pcall(function()
							if Side then
								if Side == "Left Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.FireAxe:WaitForChild("Right"))
									Animation:Play()
								elseif Side == "Right Arm" then
									local Animation = Humanoid:LoadAnimation(Animations.FireAxe:WaitForChild("Left"))
									Animation:Play()
								else		
									local Animation = Humanoid:LoadAnimation(FireAxe[math.random(1, #FireAxe)])
									Animation:Play()
								end
							else		
								local Animation = Humanoid:LoadAnimation(FireAxe[math.random(1, #FireAxe)])
								Animation:Play()
							end
						end)
					end
				else
					pcall(function()
						if Side then
							if Side == "Left Arm" then
								local Animation = Humanoid:LoadAnimation(Animations.None:WaitForChild("Right"))
								Animation:Play()
							elseif Side == "Right Arm" then
								local Animation = Humanoid:LoadAnimation(Animations.None:WaitForChild("Left"))
								Animation:Play()
							else		
								local Animation = Humanoid:LoadAnimation(None[math.random(1, #None)])
								Animation:Play()
							end
						else		
							local Animation = Humanoid:LoadAnimation(None[math.random(1, #None)])
							Animation:Play()
						end
					end)
				end
			end
		end
	end
end

return FlinchModule