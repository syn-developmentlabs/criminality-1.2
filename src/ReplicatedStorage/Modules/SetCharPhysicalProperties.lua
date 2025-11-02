-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2)
	for v1, v2 in pairs(p1:GetChildren()) do
		if v2:IsA("BasePart") then
			if p2 then
				v2.CustomPhysicalProperties = PhysicalProperties.new(p2, 0.3, 0.5, 1, 1);
			else
				v2.CustomPhysicalProperties = PhysicalProperties.new(v2.Material);
			end;
		end;
	end;
end;
