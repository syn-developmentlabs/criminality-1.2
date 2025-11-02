-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	local v1 = nil;
	if p1 == "Create" then
		local v2 = nil;
		local u1 = v1;
		local function v3(p9, p10, p11, p12, p13, p14, p15)
			local v4 = p12.Size.X;
			local v5 = p12.Size.Y;
			local v6 = nil;
			local v7 = nil;
			local v8 = p5:toObjectSpace(CFrame.new(p13)).p.Z / v4;
			if p11 == 1 then
				if p9 == "Front" then
					v6 = "Right";
					v7 = 0;
				elseif p9 == "Right" then
					v6 = "Back";
					v7 = 2;
				elseif p9 == "Left" then
					v6 = "Front";
					v7 = 5;
				elseif p9 == "Back" then
					v6 = "Left";
					v7 = 3;
				end;
			elseif p9 == "Front" then
				v6 = "Left";
				v7 = 3;
			elseif p9 == "Right" then
				v6 = "Front";
				v7 = 5;
			elseif p9 == "Left" then
				v6 = "Back";
				v7 = 2;
			elseif p9 == "Back" then
				v6 = "Right";
				v7 = 0;
			end;
			if v6 == "Right" or v6 == "Left" then
				v4 = p12.Size.Z;
				v5 = p12.Size.Y;
				local v9 = p5:toObjectSpace(CFrame.new(p13)).p.X / v4;
			end;
			local v10 = nil;
			if v6 == nil then
				return u1;
			end;
			for v11, v12 in pairs(p12:GetChildren()) do
				if v12:IsA("SurfaceGui") and v12.Face == Enum.NormalId[v6] then
					u1 = v12;
					v10 = u1.Framey;
				end;
			end;
			if u1 == nil then
				u1 = Instance.new("SurfaceGui");
				u1.CanvasSize = Vector2.new(v4 * 10, v5 * 10);
				u1.Face = v7;
				u1.Parent = p12;
				v10 = Instance.new("Frame");
				v10.Name = "Framey";
				v10.Size = UDim2.new(1, 0, 1, 0);
				v10.ClipsDescendants = true;
				v10.BackgroundTransparency = 1;
				v10.Parent = u1;
				if p8 then
					v10.Rotation = math.random(0, 360);
				end;
			end;
			local v13 = Instance.new("ImageLabel");
			v13.Image = p2;
			v13.Size = UDim2.new(0, p3, 0, p3);
			v13.BackgroundTransparency = 1;
			v13.Parent = v10;
			if p11 == 0 then
				v13.Position = UDim2.new(0, p11 - (p14 - p15), p10.Y.Scale, p10.Y.Offset);
			else
				v13.Position = UDim2.new(1, p15, p10.Y.Scale, p10.Y.Offset);
			end;
			game.Debris:AddItem(u1, 300);
			return u1;
		end;
		local v14 = p4.Size.X;
		local v15 = p4.Size.Y;
		local v16, v17 = (function(p16, p17)
			if p16.lookVector - p17 == Vector3.new(0, 0, 0) then
				return "Front", 5;
			end;
			if p16.lookVector + p17 == Vector3.new(0, 0, 0) then
				return "Back", 2;
			end;
			local v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29 = p16:components();
			if Vector3.new(v22, v25, v28) == p17 then
				return "Top", 1;
			end;
			if Vector3.new(-v22, -v25, -v28) == p17 then
				return "Bottom", 4;
			end;
			if Vector3.new(-v21, -v24, -v27) == p17 then
				return "Left", 3;
			end;
			if Vector3.new(v21, v24, v27) ~= p17 then
				return;
			end;
			return "Right", 0;
		end)(p5, p7);
		if v16 == nil then
			return;
		end;
		if v16 == "Top" or v16 == "Bottom" then
			v14 = p4.Size.Z;
			v15 = p4.Size.X;
		elseif v16 == "Right" or v16 == "Left" then
			v14 = p4.Size.Z;
			v15 = p4.Size.Y;
		end;
		local v30 = nil;
		for v31, v32 in pairs(p4:GetChildren()) do
			if v32:IsA("SurfaceGui") and v32.Face == Enum.NormalId[v16] then
				u1 = v32;
				v30 = u1.Framey;
			end;
		end;
		if u1 == nil then
			u1 = Instance.new("SurfaceGui");
			game.Debris:AddItem(u1, 300);
			u1.CanvasSize = Vector2.new(v14 * 10, v15 * 10);
			u1.Face = v17;
			if workspace:FindFirstChild("Debris") then
				local v33 = workspace.Debris:FindFirstChild("BloodGUIs") or p4;
			else
				v33 = p4;
			end;
			u1.Parent = v33;
			u1.Adornee = p4;
			v30 = Instance.new("Frame");
			v30.Name = "Framey";
			v30.Size = UDim2.new(1, 0, 1, 0);
			v30.ClipsDescendants = true;
			v30.BackgroundTransparency = 1;
			v30.Parent = u1;
		end;
		local v34 = Instance.new("ImageLabel");
		v34.Image = p2;
		v34.Size = UDim2.new(0, p3, 0, p3);
		v34.BackgroundTransparency = 1;
		v34.Parent = v30;
		v2 = -p5:toObjectSpace(CFrame.new(p6)).p;
		if v16 == "Front" then
			v34.Position = UDim2.new(0.5 + v2.X / v14, -p3 / 2, 0.5 + v2.Y / v15, -p3 / 2);
		elseif v16 == "Back" then
			v34.Position = UDim2.new(0.5 + -v2.X / v14, -p3 / 2, 0.5 + v2.Y / v15, -p3 / 2);
		elseif v16 == "Right" then
			v34.Position = UDim2.new(0.5 + v2.Z / v14, -p3 / 2, 0.5 + v2.Y / v15, -p3 / 2);
		elseif v16 == "Left" then
			v34.Position = UDim2.new(0.5 + -v2.Z / v14, -p3 / 2, 0.5 + v2.Y / v15, -p3 / 2);
		elseif v16 == "Top" then
			v34.Position = UDim2.new(0.5 + v2.Z / v14, -p3 / 2, 0.5 + -v2.X / v15, -p3 / 2);
		elseif v16 == "Bottom" then
			v34.Position = UDim2.new(0.5 + v2.Z / v14, -p3 / 2, 0.5 + v2.X / v15, -p3 / 2);
		end;
		if u1.AbsoluteSize.X - p3 < v34.AbsolutePosition.X then
			v3(v16, v34.Position, 0, p4, p6, u1.AbsoluteSize.X, v34.AbsolutePosition.X);
		elseif v34.AbsolutePosition.X < p3 / 2 then
			v3(v16, v34.Position, 1, p4, p6, u1.AbsoluteSize.X, v34.AbsolutePosition.X);
		end;
		u1 = { v16, v34.Position, u1.CanvasSize, v34 };
	elseif p1 == "Place" then
		if p3 then
			if type(p3) ~= "table" or not p3[1] or not p3[2] then
				return;
			end;
			local l__X__35 = p2.Size.X;
			local l__Y__36 = p2.Size.Y;
			local v37 = p3[1];
			local v38 = p3[2];
			local v39 = p3[3];
			local v40 = Vector2.new(math.min(v39.X, 1000), math.min(v39.Y, 1000));
			local v41 = Instance.new("SurfaceGui");
			v41.CanvasSize = v40;
			v41.Face = v37;
			if workspace:FindFirstChild("Debris") then
				local v42 = workspace.Debris:FindFirstChild("BloodGUIs") or p2;
			else
				v42 = p2;
			end;
			v41.Parent = v42;
			v41.Adornee = p2;
			local v43 = Instance.new("Frame");
			v43.Name = "Framey";
			v43.Size = UDim2.new(1, 0, 1, 0);
			v43.ClipsDescendants = true;
			v43.BackgroundTransparency = 1;
			v43.Parent = v41;
			local v44 = Instance.new("ImageLabel");
			v44.Image = p4;
			v44.Size = UDim2.new(0, p5, 0, p5);
			v44.Position = v38;
			v44.BackgroundTransparency = 1;
			v44.Parent = v43;
			game.Debris:AddItem(v41, 300);
			v1 = { v37, v38, v40, v44 };
		else
			return;
		end;
	end;
	return v1;
end;
