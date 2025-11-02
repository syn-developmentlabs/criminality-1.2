-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2, p3)
	local function v1(p4, p5)
		if (p4.P.WorldPosition - p1.Position).Magnitude < (p5.P.WorldPosition - p1.Position).Magnitude then
			return p4;
		end;
		return p5;
	end;
	if not p1 or not p1.Parent then
		return;
	end;
	local v2 = workspace:FindPartsInRegion3WithWhiteList(Region3.new(p1.Position - Vector3.new(12.5, 6.25, 12.5), p1.Position + Vector3.new(12.5, 6.25, 12.5)), p2, 25, true);
	if #v2 <= 0 then
		return;
	end;
	local v3 = nil;
	local v4 = math.huge;
	for v5, v6 in pairs(v2) do
		if v6.Name == "DFrame" then
			local l__Magnitude__7 = (p1.Position - v6.Parent.DoorBase.Position).Magnitude;
			if l__Magnitude__7 < v4 or not (not p3[v6.Parent.Knob1]) or v6.Parent:FindFirstChild("Knob2") and p3[v6.Parent.Knob2] then
				v4 = l__Magnitude__7;
				v3 = v6;
				if p3[v6.Parent.Knob1] then
					break;
				end;
				if v6.Parent:FindFirstChild("Knob2") and p3[v6.Parent.Knob2] then
					break;
				end;
			end;
		end;
	end;
	if not v3 then
		return nil;
	end;
	if v3.Parent:FindFirstChild("IsGarageDoor") or v3.Parent:FindFirstChild("IsElevator1") then
		return v3.Parent, v1(v3.Parent.Knob1, v3.Parent.Knob1);
	end;
	if not v3.Parent:FindFirstChild("Knob1") then
		return;
	end;
	return v3.Parent, v1(v3.Parent.Knob1, v3.Parent.Knob2);
end;
