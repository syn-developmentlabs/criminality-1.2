-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2)
	local v1 = (p2 - p1) % 6.2831853071796;
	return v1 > 3.1415926535898 and v1 - 6.2831853071796 or v1;
end;
local v2 = {};
v2.__index = v2;
function v2.new()
	return setmetatable({
		MaxSpeed = math.huge, 
		_update = tick(), 
		_velocity = Vector3.new()
	}, v2);
end;
function v2.Update(p3, p4, p5, p6)
	local l___velocity__3 = p3._velocity;
	local v4 = tick();
	local v5 = v4 - p3._update;
	p6 = math.max(0.0001, p6);
	local v6 = 2 / p6;
	local v7 = v6 * v5;
	local v8 = 1 / (1 + v7 + 0.48 * v7 * v7 + 0.235 * v7 * v7 * v7);
	local v9 = p4 - p5;
	local v10 = p3.MaxSpeed * p6;
	local v11 = v10 < v9.Magnitude and v9.Unit * v10 or v9;
	p5 = p4 - v11;
	local v12 = (l___velocity__3 + v6 * v11) * v5;
	local v13 = (l___velocity__3 - v6 * v12) * v8;
	local v14 = p5 + (v11 + v12) * v8;
	if (p5 - p4):Dot(v14 - p5) > 0 then
		v14 = p5;
		v13 = (v14 - p5) / v5;
	end;
	p3._velocity = v13;
	p3._update = v4;
	return v14;
end;
local function u2(p7, p8)
	return Vector3.new(u1(p7.X, p8.X), u1(p7.Y, p8.Y), u1(p7.Z, p8.Z));
end;
function v2.UpdateAngle(p9, p10, p11, p12)
	return p9:Update(p10, p10 + u2(p10, p11), p12);
end;
return v2;
