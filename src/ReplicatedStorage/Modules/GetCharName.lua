-- Decompiled with the Synapse X Luau decompiler.

return function(p1)
	local v1 = p1:FindFirstChildOfClass("Humanoid");
	if p1:FindFirstChild("IsRCU") then
		return "[REDACTED]";
	end;
	if p1:FindFirstChild("IsJONAS") then
		return "JONAS SAVIMBI"
	end
	if p1:FindFirstChild("IsURM") then
		return "FIGHTER"
	end
	if p1:FindFirstChild("IsHazmat") then
		return "[REDACTED]";
	end;
	if not v1 or v1.DisplayName == "" then
		return p1.Name;
	end;
	return v1.DisplayName;
end;
