
local Character = script.Parent
local Humanoid = Character:WaitForChild'Humanoid'

while true do
	while Humanoid.Health < Humanoid.MaxHealth do
		task.wait()
		if (Humanoid.Health < 15) and not game:GetService("CollectionService"):HasTag(Character, "Revived") and not game:GetService("CollectionService"):HasTag(Character, "BleedingOut") and not Character:FindFirstChild("Bandaging") and not game:GetService("ReplicatedStorage"):WaitForChild("CharStats")[Character.Name].RagdollTime.RagdollSwitch.Value then
			task.wait(3)
			if (Humanoid.Health < 15) and not game:GetService("CollectionService"):HasTag(Character, "Revived") and not game:GetService("CollectionService"):HasTag(Character, "BleedingOut") and not Character:FindFirstChild("Bandaging") and not game:GetService("ReplicatedStorage"):WaitForChild("CharStats")[Character.Name].RagdollTime.RagdollSwitch.Value then
				local dmg = 1
				if game:GetService("ReplicatedStorage"):WaitForChild("CharStats")[Character.Name].Downed.Resisting.Value then
					dmg = 0.5
				end
				Humanoid.Health = math.min(Humanoid.Health - dmg, Humanoid.MaxHealth)
			end
		else
			if not Character:FindFirstChild("Cough") and not game:GetService("CollectionService"):HasTag(Character, "Bleeding") then
				task.wait(1) 
				if not (Humanoid.Health < 15) and not Character:FindFirstChild("Cough") and not game:GetService("CollectionService"):HasTag(Character, "Bleeding") then
					Humanoid.Health = math.min(Humanoid.Health + 1, Humanoid.MaxHealth)
				end
			end
		end
	end
	Humanoid.HealthChanged:Wait()
end