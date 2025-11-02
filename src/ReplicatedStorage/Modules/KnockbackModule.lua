-- Decompiled with the Synapse X Luau decompiler.

return {
	Knockback = function(p1, p2, p3, p4, p5, p6, p7, p8)
		local v1 = 0;
		local l__Character__2 = p2.Character;
		local v3 = Instance.new("BodyVelocity", l__Character__2:FindFirstChild("HumanoidRootPart"));
		local v4 = Instance.new("Folder", p2);
		local v5 = Instance.new("NumberValue", v4);
		for v6, v7 in ipairs((l__Character__2:GetDescendants())) do
			if v7:IsA("BasePart") then
				local v8 = v7:GetMass();
				v4.Name = "MassFolder";
				v5.Name = "-- \\MaxMassValue// --";
				local v9 = Instance.new("NumberValue", v4);
				v1 = v1 + 1;
				v9.Name = "MassValue " .. v1;
				v9.Value = v8;
			end;
		end;
		for v10, v11 in ipairs((p2.MassFolder:GetChildren())) do
			v5.Value = v5.Value + v11.Value;
		end;
		v5.Value = math.floor(v5.Value);
		if p8 == nil then
			v3.MaxForce = Vector3.new(100000000000, 100000000000, 100000000000);
			if p6 == Enum.Axis.X then
				if p7 == true then
					v3.Velocity = Vector3.new(-v5.Value * p3, 0, 0);
				else
					v3.Velocity = Vector3.new(v5.Value * p3, 0, 0);
				end;
			end;
			if p6 == Enum.Axis.Y then
				if p7 == true then
					v3.Velocity = Vector3.new(0, -v5.Value * p3, 0);
				else
					v3.Velocity = Vector3.new(0, v5.Value * p3, 0);
				end;
			end;
			if p6 == Enum.Axis.Z then
				if p7 == true then
					v3.Velocity = Vector3.new(0, 0, -v5.Value * p3);
				else
					v3.Velocity = Vector3.new(0, 0, v5.Value * p3);
				end;
			end;
		elseif p7 == true then
			v3.Velocity = Vector3.new(0, 0, p8.Character.HumanoidRootPart.CFrame.LookVector.Z * v5.Value * p3);
		else
			v3.Velocity = Vector3.new(0, 0, -p8.Character.HumanoidRootPart.CFrame.LookVector.Z * v5.Value * p3);
		end;
		v4:Destroy();
		if p4 == true then
			game:GetService("Debris"):AddItem(v3, p5);
		end;
	end, 
	ObjectKnockback = function(p9, p10, p11, p12, p13, p14, p15)
		local v12 = Instance.new("BodyVelocity", p10);
		local v13 = Instance.new("Folder", p10);
		local v14 = Instance.new("NumberValue", v13);
		v13.Name = "MassFolder";
		v14.Name = "-- \\MaxMassValue// --";
		local v15 = Instance.new("NumberValue", v13);
		v15.Name = "MassValue " .. 0 + 1;
		v15.Value = p10:GetMass();
		for v16, v17 in ipairs((p10.MassFolder:GetChildren())) do
			v14.Value = v14.Value + v17.Value;
		end;
		v14.Value = math.floor(v14.Value);
		v12.MaxForce = Vector3.new(100000000000, 100000000000, 100000000000);
		if p14 == Enum.Axis.X then
			if p15 == true then
				v12.Velocity = Vector3.new(-v14.Value * p11, 0, 0);
			else
				v12.Velocity = Vector3.new(v14.Value * p11, 0, 0);
			end;
		end;
		if p14 == Enum.Axis.Y then
			if p15 == true then
				v12.Velocity = Vector3.new(0, -v14.Value * p11, 0);
			else
				v12.Velocity = Vector3.new(0, v14.Value * p11, 0);
			end;
		end;
		if p14 == Enum.Axis.Z then
			if p15 == true then
				v12.Velocity = Vector3.new(0, 0, -v14.Value * p11);
			else
				v12.Velocity = Vector3.new(0, 0, v14.Value * p11);
			end;
		end;
		v13:Destroy();
		if p12 == true then
			game:GetService("Debris"):AddItem(v12, p13);
		end;
	end, 
	ObjectAndDescendantsKnockback = function(p16, p17, p18, p19, p20, p21, p22)
		local v18 = Instance.new("BodyVelocity", p17);
		v18.Velocity = Vector3.new(0, 0, 0);
		v18.MaxForce = Vector3.new(0, 0, 0);
		for v19, v20 in ipairs((p17:GetDescendants())) do
			if v20:IsA("BasePart") then
				local v21 = v20:GetMass();
				local v22 = Instance.new("BodyVelocity", v20);
				v22.MaxForce = Vector3.new(100000000000, 100000000000, 100000000000);
				if p21 == Enum.Axis.X then
					if p22 == true then
						v22.Velocity = Vector3.new(-v21 * p18, 0, 0);
					else
						v22.Velocity = Vector3.new(v21 * p18, 0, 0);
					end;
				end;
				if p21 == Enum.Axis.Y then
					if p22 == true then
						v22.Velocity = Vector3.new(0, -v21 * p18, 0);
					else
						v22.Velocity = Vector3.new(0, v21 * p18, 0);
					end;
				end;
				if p21 == Enum.Axis.Z then
					if p22 == true then
						v22.Velocity = Vector3.new(0, 0, -v21 * p18);
					else
						v22.Velocity = Vector3.new(0, 0, v21 * p18);
					end;
				end;
				if p19 == true then
					game:GetService("Debris"):AddItem(v22, p20);
				end;
				local v23 = p17:GetMass();
				v18.MaxForce = Vector3.new(100000000000, 100000000000, 100000000000);
				if p21 == Enum.Axis.X then
					if p22 == true then
						v18.Velocity = Vector3.new(-v23 * p18, 0, 0);
					else
						v18.Velocity = Vector3.new(v23 * p18, 0, 0);
					end;
				end;
				if p21 == Enum.Axis.Y then
					if p22 == true then
						v18.Velocity = Vector3.new(0, -v23 * p18, 0);
					else
						v18.Velocity = Vector3.new(0, v23 * p18, 0);
					end;
				end;
				if p21 == Enum.Axis.Z then
					if p22 == true then
						v18.Velocity = Vector3.new(0, 0, -v23 * p18);
					else
						v18.Velocity = Vector3.new(0, 0, v23 * p18);
					end;
				end;
				if p19 == true then
					game:GetService("Debris"):AddItem(v18, p20);
				end;
			end;
		end;
	end
};
