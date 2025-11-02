-- Decompiled with the Synapse X Luau decompiler.

local u1 = {};
game:GetService("RunService").Stepped:Connect(function()
	local v1 = tick();
	local v2 = nil;
	for v3, v4 in pairs(u1) do
		if v4 - v1 < 0.005 then
			if not v2 then
				v2 = {};
			end;
			table.insert(v2, v3);
		end;
	end;
	if v2 then
		for v5, v6 in pairs(v2) do
			u1[v6] = nil;
			coroutine.resume(v6, v1);
		end;
	end;
end);
return function(p1)
	local v7 = tick();
	u1[coroutine.running()] = v7 + (tonumber(p1) or 0.03333333333333333);
	return coroutine.yield() - v7, elapsedTime();
end;
