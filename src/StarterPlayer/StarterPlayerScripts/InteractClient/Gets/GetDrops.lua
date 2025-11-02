-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2, p3, p4, p5)
	if not p1 or not p1.Parent then
		return;
	end;
	local v1 = p1.Position + Vector3.new(0, p5, 0);
	local v2 = workspace:FindPartsInRegion3WithWhiteList(Region3.new(v1 - Vector3.new(p4, p4 / 2, p4), v1 + Vector3.new(p4, p4 / 2, p4)), p2, 30, true);
	if #v2 <= 0 then
		return;
	end;
	local v3 = nil;
	local v4 = math.huge;
	for v5, v6 in pairs(v2) do
		local l__Magnitude__7 = (p1.Position - v6.Position).Magnitude;
		if l__Magnitude__7 < v4 or p3[v6] then
			v4 = l__Magnitude__7;
			v3 = v6;
			if p3[v6] then
				break;
			end;
		end;
	end;
	return v3;
end;
