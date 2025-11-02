while true do
	task.wait()
	
	if _G.WaitForChar and _G.GVF then
		break
	end
end

local l__RunService__1 = game:GetService("RunService");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__Events__3 = l__ReplicatedStorage__2:WaitForChild("Events");
local l__Character__4 = game:GetService("Players").LocalPlayer.Character;
local l__Torso__5 = l__Character__4:WaitForChild("Torso");
local l__Right_Shoulder__6 = l__Torso__5:WaitForChild("Right Shoulder");
local l__Left_Shoulder__7 = l__Torso__5:WaitForChild("Left Shoulder");
local l__Right_Hip__8 = l__Torso__5:WaitForChild("Right Hip");
local l__Left_Hip__9 = l__Torso__5:WaitForChild("Left Hip");
local l__Neck__10 = l__Torso__5:WaitForChild("Neck");
local l__Humanoid__11 = l__Character__4:WaitForChild("Humanoid");
local l__OnFlinched__12 = l__ReplicatedStorage__2:WaitForChild("Events"):WaitForChild("OnFlinched");
_G.WaitForChar();
local v13 = _G.GVF and _G.GVF();
local v14 = _G.AffectChar("B", math.huge);
v14.Parent = script;
local u1 = {
	wave = false, 
	point = false, 
	dance1 = true, 
	dance2 = true, 
	dance3 = true, 
	laugh = false, 
	cheer = false
};
local u2 = {
	idle1 = { {
		id = "http://www.roblox.com/asset/?id=180435571", 
		weight = 9
	}, {
		id = "http://www.roblox.com/asset/?id=180435792", 
		weight = 1
	} }, 
	idle2 = { {
		id = "http://www.roblox.com/asset/?id=180435571", 
		weight = 9
	}, {
		id = "http://www.roblox.com/asset/?id=180435792", 
		weight = 1
	} }, 
	idle3 = { {
		id = "http://www.roblox.com/asset/?id=180435571", 
		weight = 9
	}, {
		id = "http://www.roblox.com/asset/?id=180435792", 
		weight = 1
	} }, 
	walk1 = { {
		id = "http://www.roblox.com/asset/?id=180426354", 
		weight = 10
	} }, 
	walk2 = { {
		id = "http://www.roblox.com/asset/?id=180426354", 
		weight = 10
	} }, 
	walk3 = { {
		id = "http://www.roblox.com/asset/?id=180426354", 
		weight = 10
	} }, 
	run1 = { {
		id = "run.xml", 
		weight = 10
	} }, 
	run2 = { {
		id = "run.xml", 
		weight = 10
	} }, 
	run3 = { {
		id = "run.xml", 
		weight = 10
	} }, 
	swim = { {
		id = "http://www.roblox.com/asset/?id=180426354", 
		weight = 10
	} }, 
	swimidle = { {
		id = "http://www.roblox.com/asset/?id=180426354", 
		weight = 10
	} }, 
	jump = { {
		id = "http://www.roblox.com/asset/?id=125750702", 
		weight = 10
	} }, 
	fall = { {
		id = "http://www.roblox.com/asset/?id=180436148", 
		weight = 10
	} }, 
	climb = { {
		id = "http://www.roblox.com/asset/?id=180436334", 
		weight = 10
	} }, 
	sitState = { {
		id = "http://www.roblox.com/asset/?id=178130996", 
		weight = 10
	} }, 
	toolnone = { {
		id = "http://www.roblox.com/asset/?id=182393478", 
		weight = 10
	} }, 
	toolslash = { {
		id = "http://www.roblox.com/asset/?id=129967390", 
		weight = 10
	} }, 
	toollunge = { {
		id = "http://www.roblox.com/asset/?id=129967478", 
		weight = 10
	} }, 
	wave = { {
		id = "http://www.roblox.com/asset/?id=128777973", 
		weight = 10
	} }, 
	point = { {
		id = "http://www.roblox.com/asset/?id=128853357", 
		weight = 10
	} }, 
	dance1 = { {
		id = "http://www.roblox.com/asset/?id=10577329638", 
		weight = 10
	}, {
		id = "http://www.roblox.com/asset/?id=10577329638", 
		weight = 10
	}, {
		id = "http://www.roblox.com/asset/?id=182491065", 
		weight = 10
	} }, 
	dance2 = { {
		id = "http://www.roblox.com/asset/?id=10577340003", 
		weight = 10
	}, {
		id = "http://www.roblox.com/asset/?id=10577340003", 
		weight = 10
	}, {
		id = "http://www.roblox.com/asset/?id=10577340003", 
		weight = 10
	} }, 
	dance3 = { {
		id = "http://www.roblox.com/asset/?id=10577345611", 
		weight = 10
	}, {
		id = "http://www.roblox.com/asset/?id=10577345611", 
		weight = 10
	}, {
		id = "http://www.roblox.com/asset/?id=10577345611", 
		weight = 10
	} }, 
	laugh = { {
		id = "http://www.roblox.com/asset/?id=129423131", 
		weight = 10
	} }, 
	cheer = { {
		id = "http://www.roblox.com/asset/?id=129423030", 
		weight = 10
	} }, 
	didle = { {
		id = "http://www.roblox.com/asset/?id=5864485399", 
		weight = 10
	} }, 
	dmove = { {
		id = "http://www.roblox.com/asset/?id=5864490504", 
		weight = 10
	} }
};
local function v15(p1)
	for v16, v17 in pairs(p1) do
		local v18 = nil;
		for v19, v20 in pairs(v17) do
			u1[v16] = v20[1];
			v18 = v20.id;
		end;
		local v21 = Instance.new("StringValue");
		v21.Name = v16;
		local v22 = Instance.new("Animation", v21);
		v22.Name = v16 .. "Anim";
		v21.Parent = script;
		v22.AnimationId = v18;
		u2[v16] = v17;
	end;
end;
local l__script__3 = script;
coroutine.resume(coroutine.create(function()
	for v23, v24 in pairs(l__script__3:GetDescendants()) do
		if v24.ClassName == "Animation" then
			local v25 = _G.VM.Current:FindFirstChild("Humanoid"):LoadAnimation(v24);
			v25:Play(0, 0, 10000);
			l__RunService__1.Heartbeat:Wait();
			v25:Stop();
		end;
	end;
end));
local u4 = {};

function configureAnimationSet(p2, p3)
	if u4[p2] ~= nil then
		local v26, v27, v28 = pairs(u4[p2].connections);
		while true do 
			local v29, v30 = v26(v27, v28);
			if v29 then

			else
				break;
			end;
			v28 = v29;
			v30:disconnect();		
		end;
	end;
	u4[p2] = {};
	u4[p2].count = 0;
	u4[p2].totalWeight = 0;
	u4[p2].connections = {};
	local v31 = l__script__3:FindFirstChild(p2);
	if v31 ~= nil then
		table.insert(u4[p2].connections, v31.ChildAdded:connect(function(p4)
			configureAnimationSet(p2, p3);
		end));
		table.insert(u4[p2].connections, v31.ChildRemoved:connect(function(p5)
			configureAnimationSet(p2, p3);
		end));
		local v32 = 1;
		local v33, v34, v35 = pairs(v31:GetChildren());
		while true do 
			local v36, v37 = v33(v34, v35);
			if v36 then

			else
				break;
			end;
			v35 = v36;
			if v37:IsA("Animation") then
				table.insert(u4[p2].connections, v37.Changed:connect(function(p6)
					configureAnimationSet(p2, p3);
				end));
				u4[p2][v32] = {};
				u4[p2][v32].anim = v37;
				local l__Weight__38 = v37:FindFirstChild("Weight");
				if l__Weight__38 == nil then
					u4[p2][v32].weight = 1;
				else
					u4[p2][v32].weight = l__Weight__38.Value;
				end;
				u4[p2].count = u4[p2].count + 1;
				u4[p2].totalWeight = u4[p2].totalWeight + u4[p2][v32].weight;
				v32 = v32 + 1;
			end;		
		end;
	end;
	if u4[p2].count <= 0 then
		local v39, v40, v41 = pairs(p3);
		while true do 
			local v42, v43 = v39(v40, v41);
			if v42 then

			else
				break;
			end;
			v41 = v42;
			u4[p2][v42] = {};
			u4[p2][v42].anim = Instance.new("Animation");
			u4[p2][v42].anim.Name = p2;
			u4[p2][v42].anim.AnimationId = v43.id;
			u4[p2][v42].weight = v43.weight;
			u4[p2].count = u4[p2].count + 1;
			u4[p2].totalWeight = u4[p2].totalWeight + v43.weight;		
		end;
	end;
end;
function scriptChildModified(p7)
	local v44 = u2[p7.Name];
	if v44 ~= nil then
		configureAnimationSet(p7.Name, v44);
	end;
end;
l__script__3.ChildAdded:connect(scriptChildModified);
l__script__3.ChildRemoved:connect(scriptChildModified);
for v45, v46 in pairs(l__script__3:GetChildren()) do
	scriptChildModified(v46);
end;
for v47, v48 in pairs(u2) do
	configureAnimationSet(v47, v48);
end;
local u5 = "";
local u6 = nil;
local u7 = nil;
local u8 = nil;

function stopAllAnimations()
	local v49 = u5;
	if u1[v49] ~= nil then
		if u1[v49] == false then
			v49 = "idle";
		end;
	end;
	u5 = "";
	u6 = nil;
	if u7 ~= nil then
		u7:disconnect();
	end;
	if u8 ~= nil then
		u8:Stop();
		u8:Destroy();
		u8 = nil;
	end;
	return v49;
end;
local u9 = 1;
function setAnimationSpeed(p8)
	if u8 then
		if p8 ~= u9 then
			u9 = p8;
			pcall(function()
				u8:AdjustSpeed(u9);
			end);
		end;
	end;
end;
local u10 = 1;
function setAnimationWeight(p9)
	if u8 then
		if p9 ~= u10 then
			u10 = p9;
			pcall(function()
				u8:AdjustWeight(math.max(p9, 0.1));
			end);
		end;
	end;
end;
function keyFrameReachedFunc(p10)
	if p10 == "End" then
		local v50 = u5;
		if u1[v50] ~= nil then
			if u1[v50] == false then
				v50 = "idle";
			end;
		end;
		playAnimation(v50, 0, l__Humanoid__11);
		setAnimationSpeed(u9);
	end;
end;
local u11 = 0;
local u12 = nil;
local u13 = false;
local u14 = 1;
local u15 = "Standing";
local u16 = {};

function playAnimation(p11, p12, p13, p14)
	if u4[p11] == nil then
		return;
	end;
	if not (p13.Health <= 0) then
		if v13 then
			if not v13.Grabbed.Value then
				if _G.RagdollCheck(l__Character__4) then

				else
					local v51 = math.random(1, u4[p11].totalWeight);
					local v52 = 1;
					while true do 
						if u4[p11][v52].weight < v51 then

						else
							break;
						end;
						v51 = v51 - u4[p11][v52].weight;
						v52 = v52 + 1;					
					end;
					local l__anim__53 = u4[p11][v52].anim;
					if l__anim__53 ~= u6 then
						if u8 ~= nil then
							u8:Stop(p12);
							u8:Destroy();
						end;
						local v54 = math.random();
						u11 = v54;
						if u12 then
							if not p14 then
								u12:Destroy();
								u12 = nil;
							end;
						end;
						u13 = p14;
						if p14 then
							v14.Parent = v13.Currents;
							p13:UnequipTools();
						else
							v14.Parent = script;
						end;
						u9 = 1;
						u8 = p13:LoadAnimation(l__anim__53);
						u8.Priority = Enum.AnimationPriority.Core;
						u8:Play(p12);
						u5 = p11;
						coroutine.resume(coroutine.create(function()
							u8.Stopped:wait();
							l__RunService__1.RenderStepped:Wait();
							if u11 == v54 then
								local v55 = "idle" .. u14;
								if _G.DownedCheck then
									if _G.DownedCheck() then
										v55 = "didle";
									end;
								end;
								playAnimation(v55, 0.1, l__Humanoid__11);
								u15 = "Standing";
							end;
						end));
						u6 = l__anim__53;
						if _G.WalkAnim then
							if _G.WalkAnimFunc then
								if p11 ~= "walk1" then
									if p11 ~= "walk2" then
										if l__anim__53 ~= "walk3" then
											if p11 ~= "run1" then
												if p11 ~= "run2" then
													if l__anim__53 == "run3" then
														_G.WalkAnim = u8;
														_G.WalkAnimFunc(u8);
													end;
												else
													_G.WalkAnim = u8;
													_G.WalkAnimFunc(u8);
												end;
											else
												_G.WalkAnim = u8;
												_G.WalkAnimFunc(u8);
											end;
										else
											_G.WalkAnim = u8;
											_G.WalkAnimFunc(u8);
										end;
									else
										_G.WalkAnim = u8;
										_G.WalkAnimFunc(u8);
									end;
								else
									_G.WalkAnim = u8;
									_G.WalkAnimFunc(u8);
								end;
							elseif p11 ~= "walk2" then
								if l__anim__53 ~= "walk3" then
									if p11 ~= "run1" then
										if p11 ~= "run2" then
											if l__anim__53 == "run3" then
												_G.WalkAnim = u8;
												_G.WalkAnimFunc(u8);
											end;
										else
											_G.WalkAnim = u8;
											_G.WalkAnimFunc(u8);
										end;
									else
										_G.WalkAnim = u8;
										_G.WalkAnimFunc(u8);
									end;
								else
									_G.WalkAnim = u8;
									_G.WalkAnimFunc(u8);
								end;
							else
								_G.WalkAnim = u8;
								_G.WalkAnimFunc(u8);
							end;
						elseif p11 ~= "walk2" then
							if l__anim__53 ~= "walk3" then
								if p11 ~= "run1" then
									if p11 ~= "run2" then
										if l__anim__53 == "run3" then
											_G.WalkAnim = u8;
											_G.WalkAnimFunc(u8);
										end;
									else
										_G.WalkAnim = u8;
										_G.WalkAnimFunc(u8);
									end;
								else
									_G.WalkAnim = u8;
									_G.WalkAnimFunc(u8);
								end;
							else
								_G.WalkAnim = u8;
								_G.WalkAnimFunc(u8);
							end;
						else
							_G.WalkAnim = u8;
							_G.WalkAnimFunc(u8);
						end;
						if u7 ~= nil then
							u7:disconnect();
						end;
						u7 = u8.KeyframeReached:connect(keyFrameReachedFunc);
						local v56, v57, v58 = pairs(u16);
						while true do 
							local v59, v60 = v56(v57, v58);
							if v59 then

							else
								break;
							end;
							v58 = v59;
							if u16[v59] then
								v60[1]:Stop(v60[2] * 2);
								v60[1]:Destroy();
								local v61 = l__Humanoid__11:LoadAnimation(v59);
								v61:Play(v60[2], v60[3], v60[4]);
								u16[v59][1] = v61;
							end;						
						end;
					end;
					return;
				end;
			end;
		elseif _G.RagdollCheck(l__Character__4) then

		else
			local v51 = math.random(1, u4[p11].totalWeight);
			local v52 = 1;
			while true do 
				if u4[p11][v52].weight < v51 then

				else
					break;
				end;
				v51 = v51 - u4[p11][v52].weight;
				v52 = v52 + 1;			
			end;
			local l__anim__53 = u4[p11][v52].anim;
			if l__anim__53 ~= u6 then
				if u8 ~= nil then
					u8:Stop(p12);
					u8:Destroy();
				end;
				local v54 = math.random();
				u11 = v54;
				if u12 then
					if not p14 then
						u12:Destroy();
						u12 = nil;
					end;
				end;
				u13 = p14;
				if p14 then
					v14.Parent = v13.Currents;
					p13:UnequipTools();
				else
					v14.Parent = script;
				end;
				u9 = 1;
				u8 = p13:LoadAnimation(l__anim__53);
				u8.Priority = Enum.AnimationPriority.Core;
				u8:Play(p12);
				u5 = p11;
				coroutine.resume(coroutine.create(function()
					u8.Stopped:wait();
					l__RunService__1.RenderStepped:Wait();
					if u11 == v54 then
						local v55 = "idle" .. u14;
						if _G.DownedCheck then
							if _G.DownedCheck() then
								v55 = "didle";
							end;
						end;
						playAnimation(v55, 0.1, l__Humanoid__11);
						u15 = "Standing";
					end;
				end));
				u6 = l__anim__53;
				if _G.WalkAnim then
					if _G.WalkAnimFunc then
						if p11 ~= "walk1" then
							if p11 ~= "walk2" then
								if l__anim__53 ~= "walk3" then
									if p11 ~= "run1" then
										if p11 ~= "run2" then
											if l__anim__53 == "run3" then
												_G.WalkAnim = u8;
												_G.WalkAnimFunc(u8);
											end;
										else
											_G.WalkAnim = u8;
											_G.WalkAnimFunc(u8);
										end;
									else
										_G.WalkAnim = u8;
										_G.WalkAnimFunc(u8);
									end;
								else
									_G.WalkAnim = u8;
									_G.WalkAnimFunc(u8);
								end;
							else
								_G.WalkAnim = u8;
								_G.WalkAnimFunc(u8);
							end;
						else
							_G.WalkAnim = u8;
							_G.WalkAnimFunc(u8);
						end;
					elseif p11 ~= "walk2" then
						if l__anim__53 ~= "walk3" then
							if p11 ~= "run1" then
								if p11 ~= "run2" then
									if l__anim__53 == "run3" then
										_G.WalkAnim = u8;
										_G.WalkAnimFunc(u8);
									end;
								else
									_G.WalkAnim = u8;
									_G.WalkAnimFunc(u8);
								end;
							else
								_G.WalkAnim = u8;
								_G.WalkAnimFunc(u8);
							end;
						else
							_G.WalkAnim = u8;
							_G.WalkAnimFunc(u8);
						end;
					else
						_G.WalkAnim = u8;
						_G.WalkAnimFunc(u8);
					end;
				elseif p11 ~= "walk2" then
					if l__anim__53 ~= "walk3" then
						if p11 ~= "run1" then
							if p11 ~= "run2" then
								if l__anim__53 == "run3" then
									_G.WalkAnim = u8;
									_G.WalkAnimFunc(u8);
								end;
							else
								_G.WalkAnim = u8;
								_G.WalkAnimFunc(u8);
							end;
						else
							_G.WalkAnim = u8;
							_G.WalkAnimFunc(u8);
						end;
					else
						_G.WalkAnim = u8;
						_G.WalkAnimFunc(u8);
					end;
				else
					_G.WalkAnim = u8;
					_G.WalkAnimFunc(u8);
				end;
				if u7 ~= nil then
					u7:disconnect();
				end;
				u7 = u8.KeyframeReached:connect(keyFrameReachedFunc);
				local v56, v57, v58 = pairs(u16);
				while true do 
					local v59, v60 = v56(v57, v58);
					if v59 then

					else
						break;
					end;
					v58 = v59;
					if u16[v59] then
						v60[1]:Stop(v60[2] * 2);
						v60[1]:Destroy();
						local v61 = l__Humanoid__11:LoadAnimation(v59);
						v61:Play(v60[2], v60[3], v60[4]);
						u16[v59][1] = v61;
					end;				
				end;
			end;
			return;
		end;
	end;
	stopAllAnimations();
end;
local u17 = "";
function toolKeyFrameReachedFunc(p15)
	if p15 == "End" then
		playToolAnimation(u17, 0, l__Humanoid__11);
	end;
end;
local u18 = nil;
local u19 = nil;
local u20 = nil;

function playToolAnimation(p16, p17, p18, p19)
	local v62 = math.random(1, u4[p16].totalWeight);
	local v63 = 1;
	while true do 
		if u4[p16][v63].weight < v62 then

		else
			break;
		end;
		v62 = v62 - u4[p16][v63].weight;
		v63 = v63 + 1;	
	end;
	local l__anim__64 = u4[p16][v63].anim;
	if u18 ~= l__anim__64 then
		if u19 ~= nil then
			u19:Stop();
			u19:Destroy();
			p17 = 0;
		end;
		u19 = p18:LoadAnimation(l__anim__64);
		if p19 then
			u19.Priority = p19;
		end;
		u19:Play(p17);
		u17 = p16;
		u18 = l__anim__64;
		u20 = u19.KeyframeReached:connect(toolKeyFrameReachedFunc);
	end;
end;
function stopToolAnimations()
	if u20 ~= nil then
		u20:disconnect();
	end;
	u17 = "";
	u18 = nil;
	if u19 ~= nil then
		u19:Stop();
		u19:Destroy();
		u19 = nil;
	end;
	return u17;
end;
local u21 = 0;
function onRunning(p20)
	u21 = p20;
	local v65
	if u13 then
		v65 = 4;
	elseif _G.DownedCheck() then
		v65 = 1;
	else
		v65 = 0.1;
	end;
	if v65 < p20 then
		if 0.5 <= l__Humanoid__11.MoveDirection.Magnitude then

		else
			if u1[u5] == nil then
				local v66 = "idle" .. u14;
				if _G.DownedCheck then
					if _G.DownedCheck() then
						v66 = "didle";
					end;
				end;
				playAnimation(v66, 0.1, l__Humanoid__11);
				u15 = "Standing";
			end;
			return;
		end;
	else
		if u1[u5] == nil then
			local v66 = "idle" .. u14;
			if _G.DownedCheck then
				if _G.DownedCheck() then
					v66 = "didle";
				end;
			end;
			playAnimation(v66, 0.1, l__Humanoid__11);
			u15 = "Standing";
		end;
		return;
	end;
	if v13 then
		if v13.Sprinting.Value then
			local v67 = "run" .. u14;
			local v68 = 1;
			local v69 = 0.25;
			if _G.DownedCheck then
				if _G.DownedCheck() then
					v67 = "dmove";
					v68 = 5;
					v69 = 1;
				end;
			end;
			playAnimation(v67, v69, l__Humanoid__11);
			setAnimationSpeed(u21 / 20 * v68);
		else
			local v70 = "walk" .. u14;
			local v71 = 0.15;
			local v72 = 1;
			local v73 = 1;
			if _G.DownedCheck then
				if _G.DownedCheck() then
					v70 = "dmove";
					v71 = 1;
					v72 = 5;
				else
					v73 = math.max(math.min(l__Humanoid__11.WalkSpeed / 16, 1), 0.1);
				end;
			else
				v73 = math.max(math.min(l__Humanoid__11.WalkSpeed / 16, 1), 0.1);
			end;
			playAnimation(v70, v71, l__Humanoid__11);
			setAnimationSpeed(u21 / 14.5 * v72);
			setAnimationWeight(v73);
		end;
	else
		local v70 = "walk" .. u14;
		local v71 = 0.15;
		local v72 = 1;
		local v73 = 1;
		if _G.DownedCheck then
			if _G.DownedCheck() then
				v70 = "dmove";
				v71 = 1;
				v72 = 5;
			else
				v73 = math.max(math.min(l__Humanoid__11.WalkSpeed / 16, 1), 0.1);
			end;
		else
			v73 = math.max(math.min(l__Humanoid__11.WalkSpeed / 16, 1), 0.1);
		end;
		playAnimation(v70, v71, l__Humanoid__11);
		setAnimationSpeed(u21 / 14.5 * v72);
		setAnimationWeight(v73);
	end;
	if u6 then

	end;
	u15 = "Running";
end;
function onDied()
	u15 = "Dead";
end;
local u22 = 0;
function onJumping()
	if not _G.DownedCheck() then
		playAnimation("jump", 0.1, l__Humanoid__11);
	end;
	u22 = 0.3;
	u15 = "Jumping";
end;
function onClimbing(p21)
	if not _G.DownedCheck() then
		playAnimation("climb", 0.1, l__Humanoid__11);
	end;
	setAnimationSpeed(p21 / 12);
	u15 = "Climbing";
end;
function onGettingUp()
	u15 = "GettingUp";
end;
function onFreeFall()
	if u22 <= 0 then
		if not _G.DownedCheck() then
			playAnimation("fall", 0.3, l__Humanoid__11);
		end;
	end;
	u15 = "FreeFall";
end;
function onFallingDown()
	u15 = "FallingDown";
end;
function onSeated()
	u15 = "Seated";
end;
function onPlatformStanding()
	u15 = "PlatformStanding";
end;
function onSwimming(p22)
	u21 = p22;
	if 1 < p22 then
		if 0 < l__Humanoid__11.MoveDirection.Magnitude then
			u15 = "Swimming";
			return;
		end;
	end;
	u15 = "SwimIdle";
end;
function getTool()
	local v74, v75, v76 = ipairs(l__Character__4:GetChildren());
	while true do 
		local v77, v78 = v74(v75, v76);
		if v77 then

		else
			break;
		end;
		v76 = v77;
		if v78.className == "Tool" then
			return v78;
		end;	
	end;
	return nil;
end;
function getToolAnim(p23)
	local v79, v80, v81 = ipairs(p23:GetChildren());
	while true do 
		local v82, v83 = v79(v80, v81);
		if v82 then

		else
			break;
		end;
		v81 = v82;
		if v83.Name == "toolanim" then
			if v83.className == "StringValue" then
				return v83;
			end;
		end;	
	end;
	return nil;
end;
local u23 = "None";
function animateTool()
	if u23 == "None" then
		return;
	end;
	if u23 == "Slash" then
		playToolAnimation("toolslash", 0, l__Humanoid__11, Enum.AnimationPriority.Action);
		return;
	end;
	if u23 == "Lunge" then

	else
		return;
	end;
	playToolAnimation("toollunge", 0, l__Humanoid__11, Enum.AnimationPriority.Action);
end;
function moveSit()
	l__Right_Shoulder__6.MaxVelocity = 0.15;
	l__Left_Shoulder__7.MaxVelocity = 0.15;
	l__Right_Shoulder__6:SetDesiredAngle(1.57);
	l__Left_Shoulder__7:SetDesiredAngle(-1.57);
	l__Right_Hip__8:SetDesiredAngle(1.57);
	l__Left_Hip__9:SetDesiredAngle(-1.57);
end;
local u24 = 0;
local u25 = 0;
function move(p24)
	u24 = p24;
	if 0 < u22 then
		u22 = u22 - (p24 - u24);
	end;
	if l__Humanoid__11.Parent then
		if not (l__Humanoid__11.Health <= 0) then
			if u15 ~= "Dead" then
				if u15 ~= "GettingUp" then
					if u15 ~= "FallingDown" then
						if u15 ~= "Seated" then
							if u15 ~= "PlatformStanding" then
								if v13 then
									if v13.Grabbed.Value then
										stopAllAnimations();
									elseif _G.RagdollCheck() then
										if u15 ~= "Standing" then
											playAnimation("idle" .. u14, 0.1, l__Humanoid__11);
											u15 = "Standing";
										end;
									elseif u15 == "FreeFall" then
										if u22 <= 0 then
											if not _G.DownedCheck() then
												playAnimation("fall", 0.3, l__Humanoid__11);
											else
												if u15 == "Seated" then
													if not _G.DownedCheck() then
														playAnimation("sitState", 0.5, l__Humanoid__11);
														return;
													end;
												end;
												if u15 == "Running" then
													if v13 then
														if v13.Sprinting.Value then
															local v84 = "run" .. u14;
															local v85 = 1;
															if _G.DownedCheck then
																if _G.DownedCheck() then
																	v84 = "dmove";
																	v85 = 5;
																end;
															end;
															playAnimation(v84, 0.25, l__Humanoid__11);
															setAnimationSpeed(u21 / 20 * v85);
														else
															local v86 = "walk" .. u14;
															local v87 = 1;
															if _G.DownedCheck then
																if _G.DownedCheck() then
																	v86 = "dmove";
																	v87 = 5;
																end;
															end;
															playAnimation(v86, 0.2, l__Humanoid__11);
															setAnimationSpeed(u21 / 14.5 * v87);
														end;
													else
														local v86 = "walk" .. u14;
														local v87 = 1;
														if _G.DownedCheck then
															if _G.DownedCheck() then
																v86 = "dmove";
																v87 = 5;
															end;
														end;
														playAnimation(v86, 0.2, l__Humanoid__11);
														setAnimationSpeed(u21 / 14.5 * v87);
													end;
												elseif u15 == "Swimming" then
													local v88 = "swim";
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v88 = "dmove";
														end;
													end;
													playAnimation(v88, 0.2, l__Humanoid__11);
													setAnimationSpeed(u21 / 14.5);
												elseif u15 == "SwimIdle" then
													local v89 = "swimidle";
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v89 = "didle";
														end;
													end;
													playAnimation(v89, 0.2, l__Humanoid__11);
													setAnimationSpeed(0.9);
												end;
											end;
										else
											if u15 == "Seated" then
												if not _G.DownedCheck() then
													playAnimation("sitState", 0.5, l__Humanoid__11);
													return;
												end;
											end;
											if u15 == "Running" then
												if v13 then
													if v13.Sprinting.Value then
														local v84 = "run" .. u14;
														local v85 = 1;
														if _G.DownedCheck then
															if _G.DownedCheck() then
																v84 = "dmove";
																v85 = 5;
															end;
														end;
														playAnimation(v84, 0.25, l__Humanoid__11);
														setAnimationSpeed(u21 / 20 * v85);
													else
														local v86 = "walk" .. u14;
														local v87 = 1;
														if _G.DownedCheck then
															if _G.DownedCheck() then
																v86 = "dmove";
																v87 = 5;
															end;
														end;
														playAnimation(v86, 0.2, l__Humanoid__11);
														setAnimationSpeed(u21 / 14.5 * v87);
													end;
												else
													local v86 = "walk" .. u14;
													local v87 = 1;
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v86 = "dmove";
															v87 = 5;
														end;
													end;
													playAnimation(v86, 0.2, l__Humanoid__11);
													setAnimationSpeed(u21 / 14.5 * v87);
												end;
											elseif u15 == "Swimming" then
												local v88 = "swim";
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v88 = "dmove";
													end;
												end;
												playAnimation(v88, 0.2, l__Humanoid__11);
												setAnimationSpeed(u21 / 14.5);
											elseif u15 == "SwimIdle" then
												local v89 = "swimidle";
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v89 = "didle";
													end;
												end;
												playAnimation(v89, 0.2, l__Humanoid__11);
												setAnimationSpeed(0.9);
											end;
										end;
									else
										if u15 == "Seated" then
											if not _G.DownedCheck() then
												playAnimation("sitState", 0.5, l__Humanoid__11);
												return;
											end;
										end;
										if u15 == "Running" then
											if v13 then
												if v13.Sprinting.Value then
													local v84 = "run" .. u14;
													local v85 = 1;
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v84 = "dmove";
															v85 = 5;
														end;
													end;
													playAnimation(v84, 0.25, l__Humanoid__11);
													setAnimationSpeed(u21 / 20 * v85);
												else
													local v86 = "walk" .. u14;
													local v87 = 1;
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v86 = "dmove";
															v87 = 5;
														end;
													end;
													playAnimation(v86, 0.2, l__Humanoid__11);
													setAnimationSpeed(u21 / 14.5 * v87);
												end;
											else
												local v86 = "walk" .. u14;
												local v87 = 1;
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v86 = "dmove";
														v87 = 5;
													end;
												end;
												playAnimation(v86, 0.2, l__Humanoid__11);
												setAnimationSpeed(u21 / 14.5 * v87);
											end;
										elseif u15 == "Swimming" then
											local v88 = "swim";
											if _G.DownedCheck then
												if _G.DownedCheck() then
													v88 = "dmove";
												end;
											end;
											playAnimation(v88, 0.2, l__Humanoid__11);
											setAnimationSpeed(u21 / 14.5);
										elseif u15 == "SwimIdle" then
											local v89 = "swimidle";
											if _G.DownedCheck then
												if _G.DownedCheck() then
													v89 = "didle";
												end;
											end;
											playAnimation(v89, 0.2, l__Humanoid__11);
											setAnimationSpeed(0.9);
										end;
									end;
								elseif _G.RagdollCheck() then
									if u15 ~= "Standing" then
										playAnimation("idle" .. u14, 0.1, l__Humanoid__11);
										u15 = "Standing";
									end;
								elseif u15 == "FreeFall" then
									if u22 <= 0 then
										if not _G.DownedCheck() then
											playAnimation("fall", 0.3, l__Humanoid__11);
										else
											if u15 == "Seated" then
												if not _G.DownedCheck() then
													playAnimation("sitState", 0.5, l__Humanoid__11);
													return;
												end;
											end;
											if u15 == "Running" then
												if v13 then
													if v13.Sprinting.Value then
														local v84 = "run" .. u14;
														local v85 = 1;
														if _G.DownedCheck then
															if _G.DownedCheck() then
																v84 = "dmove";
																v85 = 5;
															end;
														end;
														playAnimation(v84, 0.25, l__Humanoid__11);
														setAnimationSpeed(u21 / 20 * v85);
													else
														local v86 = "walk" .. u14;
														local v87 = 1;
														if _G.DownedCheck then
															if _G.DownedCheck() then
																v86 = "dmove";
																v87 = 5;
															end;
														end;
														playAnimation(v86, 0.2, l__Humanoid__11);
														setAnimationSpeed(u21 / 14.5 * v87);
													end;
												else
													local v86 = "walk" .. u14;
													local v87 = 1;
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v86 = "dmove";
															v87 = 5;
														end;
													end;
													playAnimation(v86, 0.2, l__Humanoid__11);
													setAnimationSpeed(u21 / 14.5 * v87);
												end;
											elseif u15 == "Swimming" then
												local v88 = "swim";
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v88 = "dmove";
													end;
												end;
												playAnimation(v88, 0.2, l__Humanoid__11);
												setAnimationSpeed(u21 / 14.5);
											elseif u15 == "SwimIdle" then
												local v89 = "swimidle";
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v89 = "didle";
													end;
												end;
												playAnimation(v89, 0.2, l__Humanoid__11);
												setAnimationSpeed(0.9);
											end;
										end;
									else
										if u15 == "Seated" then
											if not _G.DownedCheck() then
												playAnimation("sitState", 0.5, l__Humanoid__11);
												return;
											end;
										end;
										if u15 == "Running" then
											if v13 then
												if v13.Sprinting.Value then
													local v84 = "run" .. u14;
													local v85 = 1;
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v84 = "dmove";
															v85 = 5;
														end;
													end;
													playAnimation(v84, 0.25, l__Humanoid__11);
													setAnimationSpeed(u21 / 20 * v85);
												else
													local v86 = "walk" .. u14;
													local v87 = 1;
													if _G.DownedCheck then
														if _G.DownedCheck() then
															v86 = "dmove";
															v87 = 5;
														end;
													end;
													playAnimation(v86, 0.2, l__Humanoid__11);
													setAnimationSpeed(u21 / 14.5 * v87);
												end;
											else
												local v86 = "walk" .. u14;
												local v87 = 1;
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v86 = "dmove";
														v87 = 5;
													end;
												end;
												playAnimation(v86, 0.2, l__Humanoid__11);
												setAnimationSpeed(u21 / 14.5 * v87);
											end;
										elseif u15 == "Swimming" then
											local v88 = "swim";
											if _G.DownedCheck then
												if _G.DownedCheck() then
													v88 = "dmove";
												end;
											end;
											playAnimation(v88, 0.2, l__Humanoid__11);
											setAnimationSpeed(u21 / 14.5);
										elseif u15 == "SwimIdle" then
											local v89 = "swimidle";
											if _G.DownedCheck then
												if _G.DownedCheck() then
													v89 = "didle";
												end;
											end;
											playAnimation(v89, 0.2, l__Humanoid__11);
											setAnimationSpeed(0.9);
										end;
									end;
								else
									if u15 == "Seated" then
										if not _G.DownedCheck() then
											playAnimation("sitState", 0.5, l__Humanoid__11);
											return;
										end;
									end;
									if u15 == "Running" then
										if v13 then
											if v13.Sprinting.Value then
												local v84 = "run" .. u14;
												local v85 = 1;
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v84 = "dmove";
														v85 = 5;
													end;
												end;
												playAnimation(v84, 0.25, l__Humanoid__11);
												setAnimationSpeed(u21 / 20 * v85);
											else
												local v86 = "walk" .. u14;
												local v87 = 1;
												if _G.DownedCheck then
													if _G.DownedCheck() then
														v86 = "dmove";
														v87 = 5;
													end;
												end;
												playAnimation(v86, 0.2, l__Humanoid__11);
												setAnimationSpeed(u21 / 14.5 * v87);
											end;
										else
											local v86 = "walk" .. u14;
											local v87 = 1;
											if _G.DownedCheck then
												if _G.DownedCheck() then
													v86 = "dmove";
													v87 = 5;
												end;
											end;
											playAnimation(v86, 0.2, l__Humanoid__11);
											setAnimationSpeed(u21 / 14.5 * v87);
										end;
									elseif u15 == "Swimming" then
										local v88 = "swim";
										if _G.DownedCheck then
											if _G.DownedCheck() then
												v88 = "dmove";
											end;
										end;
										playAnimation(v88, 0.2, l__Humanoid__11);
										setAnimationSpeed(u21 / 14.5);
									elseif u15 == "SwimIdle" then
										local v89 = "swimidle";
										if _G.DownedCheck then
											if _G.DownedCheck() then
												v89 = "didle";
											end;
										end;
										playAnimation(v89, 0.2, l__Humanoid__11);
										setAnimationSpeed(0.9);
									end;
								end;
							else
								stopAllAnimations();
							end;
						else
							stopAllAnimations();
						end;
					else
						stopAllAnimations();
					end;
				else
					stopAllAnimations();
				end;
			else
				stopAllAnimations();
			end;
		else
			stopAllAnimations();
		end;
	else
		stopAllAnimations();
	end;
	local v90 = getTool();
	if v90 then
		if v90:FindFirstChild("Handle") then

		else
			stopToolAnimations();
			u23 = "None";
			u18 = nil;
			u25 = 0;
			return;
		end;
	else
		stopToolAnimations();
		u23 = "None";
		u18 = nil;
		u25 = 0;
		return;
	end;
	local v91 = getToolAnim(v90);
	if v91 then
		u23 = v91.Value;
		v91.Parent = nil;
		u25 = p24 + 0.3;
	end;
	if u25 < p24 then
		u25 = 0;
		u23 = "None";
	end;
	animateTool();
end;
l__Humanoid__11.Died:connect(onDied);
l__Humanoid__11.Running:connect(onRunning);
l__Humanoid__11.Jumping:connect(onJumping);
l__Humanoid__11.Climbing:connect(onClimbing);
l__Humanoid__11.GettingUp:connect(onGettingUp);
l__Humanoid__11.FreeFalling:connect(onFreeFall);
l__Humanoid__11.FallingDown:connect(onFallingDown);
l__Humanoid__11.Seated:connect(onSeated);
l__Humanoid__11.PlatformStanding:connect(onPlatformStanding);
l__Humanoid__11.Swimming:connect(onSwimming);
local u26 = { "dance1", "dance2", "dance3" };
game:GetService("Players").LocalPlayer.Chatted:connect(function(p25)
	if not _G.CheckIfFlinching() and not _G.RagdollCheck() and not _G.DownedCheck() and l__Humanoid__11.Parent and not (l__Humanoid__11.Health <= 0) and not v13.Handcuffed.Value then
		local v92 = "";
		if p25 == "/e dance" then
			v92 = u26[math.random(1, #u26)];
		elseif string.sub(p25, 1, 3) == "/e " then
			v92 = string.sub(p25, 4);
		elseif string.sub(p25, 1, 7) == "/emote " then
			v92 = string.sub(p25, 8);
		end;
		if u15 == "Standing" and u1[v92] ~= nil then
			if u12 then
				u12:Destroy();
			end;
			if v92 ~= "wave" and v92 ~= "point" then
				u12 = _G.AffectChar("AC", math.huge);
			end;
			playAnimation(v92, 0.1, l__Humanoid__11, true);
		end;
		return;
	end;
end);
local u27 = nil;
local u28 = false;
local u29 = false;
local function v93(p26)
	if p26 <= 0 then
		onDied();
		move(0);
		u27:Disconnect();
		return;
	end;
	local v94 = l__Humanoid__11.MaxHealth * 0.65;
	local v95 = l__Humanoid__11.MaxHealth * 0.3;
	if v94 < p26 and not u28 and not u29 then
		u14 = 1;
	elseif p26 <= v94 and v95 < p26 and (not u28 or not u29) then
		u14 = 2;
	else
		if not (p26 <= v95) then
			if u28 and u29 and p26 > 0 then
				u14 = 3;
			end;
		elseif p26 > 0 then
			u14 = 3;
		end;
	end;
	if p26 <= 0 then
		stopAllAnimations();
	end;
end;
u27 = l__Humanoid__11.HealthChanged:Connect(v93);
local u31 = nil;
local v104 = "idle" .. u14;
if _G.DownedCheck and _G.DownedCheck() then
	v104 = "didle";
end;
playAnimation(v104, 0.1, l__Humanoid__11);
u15 = "Standing";
l__OnFlinched__12.OnClientEvent:Connect(function()
	if l__Humanoid__11.Health <= 0 then
		return;
	end;
	if u13 then
		local v105 = "idle" .. u14;
		if _G.DownedCheck and _G.DownedCheck() then
			v105 = "didle";
		end;
		playAnimation(v105, 0.2, l__Humanoid__11);
	end;
end);
v13.Downed.Changed:Connect(function(p32)
	if l__Humanoid__11.Health <= 0 then
		return;
	end;
	local v106 = "idle" .. u14;
	if p32 then
		v106 = "didle";
	end;
	playAnimation(v106, 0.2, l__Humanoid__11);
end);

while l__Character__4.Parent ~= nil do
	local v107, v108 = wait(0.1);
	move(v108);
end;
