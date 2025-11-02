-- Decompiled with the Synapse X Luau decompiler.

local l__UserInputService__1 = game:GetService("UserInputService");
local l__LocalPlayer__2 = game.Players.LocalPlayer;
local l__Modules__1 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
return function(p1)
	if not p1:FindFirstChild("__Loaded") then
		local v3 = tick();
		while true do
			wait();
			if l__Modules__1:FindFirstChild("GunClient") and _G.WaitForChar and _G.GVF and _G.GVF() ~= nil then
				break;
			end;
			if tick() - v3 > 10 then
				break;
			end;		
		end;
		_G.WaitForChar();
		local v4 = Instance.new("BoolValue");
		v4.Name = "__Loaded";
		v4.Parent = p1;
	end;
	if p1:FindFirstChild("GunClient") then
		p1.GunClient:Destroy();
	end;
	local v5 = l__Modules__1.GunClient:Clone();
	v5.Parent = p1;
	local u2 = require(v5).new(p1);
	p1.Equipped:Connect(function()
		u2.Equip();
	end);
	p1.Unequipped:Connect(function()
		u2.Unequip();
	end);
	p1.Activated:Connect(function()
		u2.Activate();
	end);
	p1.Deactivated:Connect(function()
		u2.Deactivate();
	end)
end;
