-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__RunService__2 = game:GetService("RunService");
local u1 = require(game:GetService("ReplicatedStorage").Modules.SmoothValue).new(Vector3.new(), 0.075);
local u2 = nil;
local u3 = nil;
function v1.Stop(p1)
	u1:Update(Vector3.new());
	u1.Value = Vector3.new();
	if u2 and u2.Parent then
		u2.C0 = u3;
	end;
end;
local u4 = nil;
local u5 = nil;
local u6 = nil;
local u7 = false;
function v1.New(p2, p3, p4)
	u4 = p2;
	u5 = p3;
	u6 = p4;
	u2 = p4:WaitForChild("RootJoint", 1000);
	u3 = u2.C0;
	local u8 = nil;
	local u9 = nil;
	local function v3()
		u7 = false;
		u8:Disconnect();
		u9:Disconnect();
		v1:Stop();
	end;
	u8 = p3.Died:Connect(v3);
	u9 = p2.AncestryChanged:Connect(function(p5, p6)
		if not p6 then
			v3();
		end;
	end);
	u7 = true;
	u1.Value = Vector3.new();
end;
local u10 = nil;
local u11 = nil;
local u12 = 0;
local u13 = 0;
function v1.Update(p7)
	if not u7 then
		return;
	end;
	u10 = u6.Velocity * Vector3.new(1, 0, 1);
	if u10.Magnitude > 1 and not _G.DownedCheck(u4) and not _G.RagdollCheck(u4) then
		u11 = u10.Unit;
		u12 = u6.CFrame.RightVector:Dot(u11) * 0.1;
		u13 = u6.CFrame.LookVector:Dot(u11) * 0.2;
		u13 = math.min(u13, 0);
	else
		u12 = 0;
		u13 = 0;
	end;
	u1:Update(Vector3.new(u13, -u12, 0));
	u2.C0 = u3 * CFrame.Angles(u1.Value.X, u1.Value.Y, u1.Value.Z);
end;
return v1;
