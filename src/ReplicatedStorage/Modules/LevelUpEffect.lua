-- Decompiled with the Synapse X Luau decompiler.

local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("ParticleService"));
local l__RunService__2 = game:GetService("RunService");
return function()
	for v1 = 1, 150 do
		local v2 = math.random(-5, 5);
		local v3 = Instance.new("ImageLabel");
		v3.ZIndex = 10;
		v3.Size = UDim2.new(0, 10 + v2, 0, 10 + v2);
		v3.Position = UDim2.new(math.random(0, 1000) / 1000, 0, -0.25, 0);
		v3.AnchorPoint = Vector2.new(0.5, 0.5);
		v3.SizeConstraint = Enum.SizeConstraint.RelativeYY;
		v3.BorderSizePixel = 0;
		local v4 = 255;
		local v5 = 204;
		local v6 = 85;
		local v7 = math.random(650, 1000) / 1000;
		if math.random(1, 2) == 1 then
			v4 = 225;
			v5 = 225;
			v6 = 225;
		end;
		v3.ImageColor3 = Color3.fromRGB(v4 * v7, v5 * v7, v6 * v7);
		v3.Rotation = math.random(0, 90);
		v3.Image = "http://www.roblox.com/asset/?id=5035052992";
		v3.BackgroundTransparency = 1;
		u1.createParticle(v3, 200, UDim2.new(0, 0, math.random(5000, 10000) / 600000, 0), 1, UDim2.new(0, 0, 0, 0), UDim2.new(-0, 0, -0, 0), 0.0075, 0);
		l__RunService__2.RenderStepped:Wait();
	end;
end;
