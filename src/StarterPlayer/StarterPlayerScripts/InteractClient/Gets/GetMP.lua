-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2, p3)
	if not p1 or not p1.Parent then
		return;
	end;
	local v1 = workspace:FindPartsInRegion3WithWhiteList(Region3.new(p1.Position - Vector3.new(4, 2, 4), p1.Position + Vector3.new(4, 2, 4)), p2, 5, true);
	if #v1 <= 0 then
		return;
	end;
	local v2 = nil;
	local v3 = math.huge;
	for v4, v5 in pairs(v1) do
		local l__Magnitude__6 = (p1.Position - v5.Position).Magnitude;
		if l__Magnitude__6 < v3 or p3[v5] then
			v3 = l__Magnitude__6;
			v2 = v5;
			if p3[v5] then
				break;
			end;
		end;
	end;
	return v2;
end;
