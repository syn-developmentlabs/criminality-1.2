-- Decompiled with the Synapse X Luau decompiler.

return function(p1)
	local v1 = 0;
	for v2, v3 in pairs(p1:GetChildren()) do
		if v3:IsA("BasePart") then
			v1 = v1 + v3:GetMass();
		end;
	end;
	return v1;
end;
