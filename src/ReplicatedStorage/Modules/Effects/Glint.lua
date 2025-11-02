local glint = {}

local function u1(p1, p2)
	if p1 then
		if p1:IsA("BasePart") then
			if p2 then
				p1.CFrame = p2;
			end;
			return p1.CFrame;
		end;
		if not p1:IsA("Attachment") then
			return;
		end;
	else
		return;
	end;
	if p2 then
		p1.WorldCFrame = p2;
	end;
	return p1.WorldCFrame;
end;
local function u2(p3, p4, p5)
	return (1 - p5) * p3 + p5 * p4;
end;
function checkLaser(p6, p7)
	if p6:FindFirstChild("From") then
		if p6:FindFirstChild("To") then
			if p6:IsDescendantOf(game.Players.LocalPlayer.Character) then
				local l__From__1 = p6:FindFirstChild("From");
				local l__To__2 = p6:FindFirstChild("To");
				local v3, v4, v5 = pairs(p6:GetDescendants());
				while true do
					local v6, v7 = v3(v4, v5);
					if v6 then

					else
						break;
					end;
					v5 = v6;
					if not v7:IsA("BillboardGui") then
						if not v7:IsA("Beam") then
							if not v7:IsA("PointLight") then
								if not v7:IsA("SurfaceLight") then
									if v7:IsA("SpotLight") then
										if v7:FindFirstChild("dSG") then
											v7.Enabled = false;
										end;
									end;
								elseif v7:FindFirstChild("dSG") then
									v7.Enabled = false;
								end;
							elseif v7:FindFirstChild("dSG") then
								v7.Enabled = false;
							end;
						elseif v7:FindFirstChild("dSG") then
							v7.Enabled = false;
						end;
					elseif v7:FindFirstChild("dSG") then
						v7.Enabled = false;
					end;				
				end;
				u1(l__To__2, u1(l__From__1));
				return;
			end;
			local l__To__8 = p6:FindFirstChild("To");
			local v9 = u1((p6:FindFirstChild("From")));
			local v10 = u1(l__To__8);
			local v11 = { p6:FindFirstAncestorOfClass("Model") and p6, workspace.Filter, workspace.Debris, workspace.CurrentCamera, game.Players.LocalPlayer.Character };
			local v12 = workspace.CurrentCamera;
			if p6:IsDescendantOf(v12) then
				table.insert(v11, workspace.CurrentCamera);
				v12 = game.Players.LocalPlayer.Character;
				table.insert(v11, v12);
			end;
			local u3 = nil;
			local u4 = nil;
			local u5 = Ray.new(v9.p, v9.LookVector * 500);
			local function u6()
				local v13, v14 = workspace:FindPartOnRayWithIgnoreList(u5, v11, false, true);
				u3 = v13;
				u4 = v14;
				if u3 then
					if not (0.1 < u3.Transparency * (u3.LocalTransparencyModifier + 1)) then
						if u3.Name ~= "HumanoidRootPart" then
							if not u3.Parent:IsA("Tool") then
								if not u3.Parent.Parent:IsA("Tool") then
									if u3:IsDescendantOf(workspace.Characters) then
										if u3.Name ~= "Head" then
											if u3.Name ~= "Torso" then
												if u3.Name ~= "Left Arm" then
													if u3.Name ~= "Right Arm" then
														if u3.Name ~= "Left Leg" then
															if u3.Name == "Right Leg" then
																if not (1 <= u3.Transparency) then
																	if not u3.CanCollide then
																		if u3.CanTouch then
																			if u3.Parent.Name == "Alarm" then
																				if u3.Name ~= "Glare" then
																					table.insert(v11, ((#v11)) + 1, u3);
																					u6();
																				end;
																			end;
																		else
																			table.insert(v11, (#v11) + 1, u3);
																			u6();
																		end;
																	elseif u3.Parent.Name == "Alarm" then
																		if u3.Name ~= "Glare" then
																			table.insert(v11, (#v11) + 1, u3);
																			u6();
																		end;
																	end;
																else
																	table.insert(v11, (#v11) + 1, u3);
																	u6();
																end;
															else
																table.insert(v11, (#v11) + 1, u3);
																u6();
															end;
														elseif not (1 <= u3.Transparency) then
															if not u3.CanCollide then
																if u3.CanTouch then
																	if u3.Parent.Name == "Alarm" then
																		if u3.Name ~= "Glare" then
																			table.insert(v11, (#v11) + 1, u3);
																			u6();
																		end;
																	end;
																else
																	table.insert(v11, (#v11) + 1, u3);
																	u6();
																end;
															elseif u3.Parent.Name == "Alarm" then
																if u3.Name ~= "Glare" then
																	table.insert(v11, (#v11) + 1, u3);
																	u6();
																end;
															end;
														else
															table.insert(v11, (#v11) + 1, u3);
															u6();
														end;
													elseif not (1 <= u3.Transparency) then
														if not u3.CanCollide then
															if u3.CanTouch then
																if u3.Parent.Name == "Alarm" then
																	if u3.Name ~= "Glare" then
																		table.insert(v11, (#v11) + 1, u3);
																		u6();
																	end;
																end;
															else
																table.insert(v11, (#v11) + 1, u3);
																u6();
															end;
														elseif u3.Parent.Name == "Alarm" then
															if u3.Name ~= "Glare" then
																table.insert(v11, (#v11) + 1, u3);
																u6();
															end;
														end;
													else
														table.insert(v11, (#v11) + 1, u3);
														u6();
													end;
												elseif not (1 <= u3.Transparency) then
													if not u3.CanCollide then
														if u3.CanTouch then
															if u3.Parent.Name == "Alarm" then
																if u3.Name ~= "Glare" then
																	table.insert(v11, (#v11) + 1, u3);
																	u6();
																end;
															end;
														else
															table.insert(v11, (#v11) + 1, u3);
															u6();
														end;
													elseif u3.Parent.Name == "Alarm" then
														if u3.Name ~= "Glare" then
															table.insert(v11, (#v11) + 1, u3);
															u6();
														end;
													end;
												else
													table.insert(v11, (#v11) + 1, u3);
													u6();
												end;
											elseif not (1 <= u3.Transparency) then
												if not u3.CanCollide then
													if u3.CanTouch then
														if u3.Parent.Name == "Alarm" then
															if u3.Name ~= "Glare" then
																table.insert(v11, (#v11) + 1, u3);
																u6();
															end;
														end;
													else
														table.insert(v11, (#v11) + 1, u3);
														u6();
													end;
												elseif u3.Parent.Name == "Alarm" then
													if u3.Name ~= "Glare" then
														table.insert(v11, (#v11) + 1, u3);
														u6();
													end;
												end;
											else
												table.insert(v11, (#v11) + 1, u3);
												u6();
											end;
										elseif not (1 <= u3.Transparency) then
											if not u3.CanCollide then
												if u3.CanTouch then
													if u3.Parent.Name == "Alarm" then
														if u3.Name ~= "Glare" then
															table.insert(v11, (#v11) + 1, u3);
															u6();
														end;
													end;
												else
													table.insert(v11, (#v11) + 1, u3);
													u6();
												end;
											elseif u3.Parent.Name == "Alarm" then
												if u3.Name ~= "Glare" then
													table.insert(v11, (#v11) + 1, u3);
													u6();
												end;
											end;
										else
											table.insert(v11, (#v11) + 1, u3);
											u6();
										end;
									elseif not (1 <= u3.Transparency) then
										if not u3.CanCollide then
											if u3.CanTouch then
												if u3.Parent.Name == "Alarm" then
													if u3.Name ~= "Glare" then
														table.insert(v11, (#v11) + 1, u3);
														u6();
													end;
												end;
											else
												table.insert(v11, (#v11) + 1, u3);
												u6();
											end;
										elseif u3.Parent.Name == "Alarm" then
											if u3.Name ~= "Glare" then
												table.insert(v11, (#v11) + 1, u3);
												u6();
											end;
										end;
									else
										table.insert(v11, (#v11) + 1, u3);
										u6();
									end;
								else
									table.insert(v11, (#v11) + 1, u3);
									u6();
								end;
							else
								table.insert(v11, (#v11) + 1, u3);
								u6();
							end;
						else
							table.insert(v11, (#v11) + 1, u3);
							u6();
						end;
					else
						table.insert(v11, (#v11) + 1, u3);
						u6();
					end;
				end;
			end;
			u6();
			u1(l__To__8, CFrame.new(u4) * (v10 - v10.p));
			local v15 = game.Players.LocalPlayer.Character;
			if v15 then
				v15 = game.Players.LocalPlayer.Character:FindFirstChild("Head");
				if v15 then
					v15 = false;
					if u3 == game.Players.LocalPlayer.Character.Head then
						v15 = (workspace.CurrentCamera.CFrame.p - workspace.CurrentCamera.Focus.p).Magnitude < 0.9;
					end;
				end;
			end;

			if p6.From:FindFirstChild("Blind") then
				local v21, v22, v23 = pairs(p6.From:GetChildren());
				while true do
					local v24, v25 = v21(v22, v23);
					if v24 then

					else
						break;
					end;
					v23 = v24;
					if v25.Name == "Blind" then
						local v26 = 0;
						table.insert(v11, workspace.CurrentCamera);
						local u7 = nil;
						local u8 = nil;
						local u9 = Ray.new(p6.From.WorldPosition, workspace.CurrentCamera.CFrame.p - p6.From.WorldPosition);
						local function u10()
							local v27, v28 = workspace:FindPartOnRayWithIgnoreList(u9, v11);
							u7 = v27;
							u8 = v28;
							if u7 then
								if 0 < u7.Transparency + u7.LocalTransparencyModifier then
									table.insert(v11, u7);
									u7 = nil;
									u10();
								end;
							end;
						end;
						u10();
						if not u7 then
							local l__Angle__29 = p7.Angle;
							local v30 = math.deg((math.acos(CFrame.new(p6.From.WorldPosition, workspace.CurrentCamera.CFrame.p).LookVector:Dot(p6.From.WorldCFrame.LookVector))));
							if v30 <= l__Angle__29 then
								v26 = u2(p7.MaxSize, 0, v30 / l__Angle__29);
							end;
						end;
						
						local v31 = 1
						
						if p7.ReverseSize then
							v31 = 1
						else
							v31 = 1 / ((workspace.CurrentCamera.CFrame.p - p6.From.WorldPosition).Magnitude / (p7.DistDiv and 2.8)) ^ 2 * 100;
						end;
						if v25:FindFirstChild("IgnoreShrink") then
							v31 = math.max(v31, 1);
						end;
						if v25:FindFirstChild("IgnoreGrow") then
							v31 = math.min(v31, 1);
						end;
						v25.Size = UDim2.new(v26 * v31, 0, v26 * v31, 0);
					end;				
				end;
			end;
		end;
	end;
end;
local u11 = {};
local function u12(p8)
	u11[p8] = nil;
	local l__From__32 = p8:FindFirstChild("From");
	local l__To__33 = p8:FindFirstChild("To");
	for v34, v35 in pairs(p8:GetDescendants()) do
		if not (not v35:IsA("BillboardGui")) or not (not v35:IsA("Beam")) or not (not v35:IsA("PointLight")) or not (not v35:IsA("SurfaceLight")) or v35:IsA("SpotLight") then
			v35.Enabled = false;
		end;
	end;
end;
game:GetService("RunService"):BindToRenderStep("GLaser", 2000, function()
	for v36, v37 in pairs(u11) do
		checkLaser(v36, v37);
	end;
end);
local v38 = Instance.new("BindableEvent");
local u13 = {};
v38.Event:Connect(function(p9)
	if u13[p9] then
		return;
	end;
	u13[p9] = true;
	if _G.VM then
		local u14 = _G.VM.ChangeEvent.Event:Connect(function(p10)
			if p10 then
				p9.Enabled = false;
				return;
			end;
			if p9.Parent.Parent.Enabled.Value then
				p9.Enabled = true;
			end;
		end);
		local u15 = nil;
		u15 = p9.AncestryChanged:Connect(function()
			if p9:IsDescendantOf(game) then
				u14:Disconnect();
				u15:Disconnect();
				u13[p9] = nil;
			end;
		end);
	end;
end);
glint.u16 = function(p11, p12)
	if not u11[p11] then
		checkLaser(p11, p12);
		u11[p11] = p12;
		local u17 = nil;
		u17 = p11.AncestryChanged:Connect(function()
			if not p11:IsDescendantOf(game) then
				u12(p11);
				u17:Disconnect();
			end;
		end);
	end;
end;
local function u16(p11, p12)
	if not u11[p11] then
		checkLaser(p11, p12);
		u11[p11] = p12;
		local u17 = nil;
		u17 = p11.AncestryChanged:Connect(function()
			if not p11:IsDescendantOf(game) then
				u12(p11);
				u17:Disconnect();
			end;
		end);
	end;
end

local function yea(p13, p14, p15, p16)
	if not p13:IsDescendantOf(game.Players.LocalPlayer.Character) then
		if p14 then
			u16(p13, p15);
		else
			u12(p13);
		end;
	elseif p16 then
		for v39, v40 in pairs(p16) do
			if v40:IsA("ParticleEmitter") then
				v38:Fire(v40);
			end;
		end;
	end;
	if p16 then
		for v41, v42 in pairs(p16) do
			v42.Enabled = p14;
		end;
	end;
end;

return glint