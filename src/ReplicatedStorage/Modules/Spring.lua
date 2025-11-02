-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	spring = {}
};
local v2 = {};
v1.spring = v2;
local u1 = tick;
local u2 = math.cos;
local l__math_sin__3 = math.sin;
local u4 = setmetatable;
function v2.new(p1)
	local v3 = 0 * (p1 and 0);
	local v4 = u1();
	local v5 = {};
	local v6 = {};
	local u5 = 1;
	local u6 = 0;
	local u7 = v3;
	local u8 = v3;
	local u9 = 1;
	local u10 = p1 and v3;
	local u11 = p1 and v3;
	local u12 = v3;
	local function v7()
		if u5 == 0 then
			u6 = 0;
			u7 = v3;
			u8 = v3;
			return;
		end;
		if u9 < 0.99999999 then
			u6 = (1 - u9 * u9) ^ 0.5;
			u7 = u10 - u11;
			u8 = u9 / u6 * u7 + u12 / (u6 * u5);
			return;
		end;
		if u9 < 1.00000001 then
			u6 = 0;
			u7 = u10 - u11;
			u8 = u7 + u12 / u5;
			return;
		end;
		u6 = (u9 * u9 - 1) ^ 0.5;
		local v8 = -u12 / (2 * u5 * u6);
		local v9 = -(u11 - u10) / 2;
		u7 = (1 - u9 / u6) * v9 + v8;
		u8 = (1 + u9 / u6) * v9 - v8;
	end;
	v7();
	local function u13(p2)
		if u5 == 0 then
			return u10;
		end;
		if u9 < 0.99999999 then
			local v10 = u2(u6 * u5 * p2);
			local v11 = l__math_sin__3(u6 * u5 * p2);
			local v12 = 2.718281828459045 ^ (u9 * u5 * p2);
			return v10 / v12 * u7 + v11 / v12 * u8 + u11, u5 * (v10 * u6 - u9 * v11) / v12 * u8 - u5 * (v10 * u9 + u6 * v11) / v12 * u7;
		end;
		if u9 < 1.00000001 then
			local v13 = 2.718281828459045 ^ (u5 * p2);
			return (u7 + u5 * p2 * u8) / v13 + u11, -u5 / v13 * (u7 + (u5 * p2 - 1) * u8);
		end;
		local v14 = 2.718281828459045 ^ ((-u9 - u6) * u5 * p2);
		local v15 = 2.718281828459045 ^ ((-u9 + u6) * u5 * p2);
		return u7 * v14 + u8 * v15 + u11, v15 * (u6 - u9) * u5 * u8 - v14 * (u9 + u6) * u5 * u7;
	end;
	local u14 = v4;
	function v5.getpv()
		return u13(u1() - u14);
	end;
	function v5.setpv(p3, p4)
		u10 = p3;
		u12 = p4;
		u14 = u1();
		v7();
	end;
	function v5.accelerate(p5, p6)
		local v16 = u1();
		local v17, v18 = u13(v16 - u14);
		u10 = v17;
		u12 = v18 + p6;
		u14 = v16;
		v7();
	end;
	local function u15(p7)
		if p7 < 0.001 then
			return u10;
		end;
		if u5 == 0 then
			return u10;
		end;
		if u9 < 0.99999999 then
			local v19 = u2(u6 * u5 * p7);
			local v20 = l__math_sin__3(u6 * u5 * p7);
			local v21 = 2.718281828459045 ^ (u9 * u5 * p7);
			return v19 / v21 * u7 + v20 / v21 * u8 + u11;
		end;
		if u9 < 1.00000001 then
			return (u7 + u5 * p7 * u8) / 2.718281828459045 ^ (u5 * p7) + u11;
		end;
		return u7 * 2.718281828459045 ^ ((-u9 - u6) * u5 * p7) + u8 * 2.718281828459045 ^ ((-u9 + u6) * u5 * p7) + u11;
	end;
	local function u16(p8)
		if p8 < 0.001 then
			return u12;
		end;
		if u5 == 0 then
			return u10;
		end;
		if u9 < 0.99999999 then
			local v22 = u2(u6 * u5 * p8);
			local v23 = l__math_sin__3(u6 * u5 * p8);
			local v24 = 2.718281828459045 ^ (u9 * u5 * p8);
			return u5 * (v22 * u6 - u9 * v23) / v24 * u8 - u5 * (v22 * u9 + u6 * v23) / v24 * u7;
		end;
		if u9 < 1.00000001 then
			return -u5 / 2.718281828459045 ^ (u5 * p8) * (u7 + (u5 * p8 - 1) * u8);
		end;
		return 2.718281828459045 ^ ((-u9 + u6) * u5 * p8) * (u6 - u9) * u5 * u8 - 2.718281828459045 ^ ((-u9 - u6) * u5 * p8) * (u9 + u6) * u5 * u7;
	end;
	function v6.__index(p9, p10)
		local v25 = nil;
		v25 = u1();
		if p10 == "p" then
			return u15(v25 - u14);
		end;
		if p10 == "v" then
			return u16(v25 - u14);
		end;
		if p10 == "t" then
			return u11;
		end;
		if p10 == "d" then
			return u9;
		end;
		if p10 ~= "s" then
			return;
		end;
		return u5;
	end;
	function v6.__newindex(p11, p12, p13)
		local v26 = u1();
		if p12 == "p" then
			u10 = p13;
			u12 = u16(v26 - u14);
		elseif p12 == "v" then
			u10 = u15(v26 - u14);
			u12 = p13;
		elseif p12 == "t" then
			local v27, v28 = u13(v26 - u14);
			u10 = v27;
			u12 = v28;
			u11 = p13;
		elseif p12 == "d" then
			if p13 == nil then
				warn("nil value for d");
				warn(debug.stacktrace());
				p13 = u9;
			end;
			local v29, v30 = u13(v26 - u14);
			u10 = v29;
			u12 = v30;
			u9 = p13;
		elseif p12 == "s" then
			if p13 == nil then
				warn("nil value for s");
				warn(debug.stacktrace());
				p13 = u5;
			end;
			local v31, v32 = u13(v26 - u14);
			u10 = v31;
			u12 = v32;
			u5 = p13;
		elseif p12 == "a" then
			local v33, v34 = u13(v26 - u14);
			u10 = v33;
			u12 = v34 + p13;
		end;
		u14 = v26;
		v7();
	end;
	return u4(v5, v6);
end;
local l__math_atan2__17 = math.atan2;
local l__math_cos__18 = math.cos;
local l__math_sin__19 = math.sin;
local function u20(p14, p15, p16, p17, p18)
	if not p14 then
		return;
	end;
	if p14 > -1E-10 and p14 < 1E-10 then
		return u20(p15, p16, p17, p18);
	end;
	if not p18 then
		if p17 then
			local v35 = -p15 / (3 * p14);
			local v36 = (3 * p14 * p16 - p15 * p15) / (9 * p14 * p14);
			local v37 = (2 * p15 * p15 * p15 - 9 * p14 * p15 * p16 + 27 * p14 * p14 * p17) / (54 * p14 * p14 * p14);
			local v38 = v36 * v36 * v36 + v37 * v37;
			local v39 = v38 ^ 0.5 + v37;
			if v39 > -1E-10 and v39 < 1E-10 then
				if v37 < 0 then
					return v35 + (-2 * v37) ^ 0.3333333333333333;
				else
					return v35 - (2 * v37) ^ 0.3333333333333333;
				end;
			elseif v38 < 0 then
				local v40 = (-v36) ^ 0.5;
				local v41 = l__math_atan2__17((-v38) ^ 0.5, v37) / 3;
				local v42 = v40 * l__math_cos__18(v41);
				local v43 = v40 * l__math_sin__19(v41);
				return v35 - 2 * v42, v35 + v42 - 1.7320508075688772 * v43, v35 + v42 + 1.7320508075688772 * v43;
			elseif v39 < 0 then
				local v44 = -(-v39) ^ 0.3333333333333333;
				return v35 + v36 / v44 - v44;
			else
				local v45 = v39 ^ 0.3333333333333333;
				return v35 + v36 / v45 - v45;
			end;
		elseif p16 then
			local v46 = -p15 / (2 * p14);
			local v47 = v46 * v46 - p16 / p14;
			if v47 < 0 then
				return;
			else
				local v48 = v47 ^ 0.5;
				return v46 - v48, v46 + v48;
			end;
		elseif p15 then
			return -p15 / p14;
		else
			return;
		end;
	end;
	local v49 = -p15 / (4 * p14);
	local v50 = (8 * p14 * p16 - 3 * p15 * p15) / (8 * p14 * p14);
	local v51 = (p15 * p15 * p15 + 8 * p14 * p14 * p17 - 4 * p14 * p15 * p16) / (8 * p14 * p14 * p14);
	local v52 = (16 * p14 * p14 * p15 * p15 * p16 + 256 * p14 * p14 * p14 * p14 * p18 - 3 * p14 * p15 * p15 * p15 * p15 - 64 * p14 * p14 * p14 * p15 * p17) / (256 * p14 * p14 * p14 * p14 * p14);
	local v53, v54, v55 = u20(1, 2 * v50, v50 * v50 - 4 * v52, -v51 * v51);
	local v56 = v55 and v53;
	if v56 < 1E-10 then
		local v57, v58 = u20(1, v50, v52);
		if not v58 or v58 < 0 then
			return;
		else
			local v59 = v58 ^ 0.5;
			return v49 - v59, v49 + v59;
		end;
	end;
	local v60 = v56 ^ 0.5;
	local v61 = (v60 * v60 * v60 + v60 * v50 - v51) / (2 * v60);
	if v61 > -1E-10 and v61 < 1E-10 then
		return v49 - v60, v49;
	end;
	local v62, v63 = u20(1, v60, v61);
	local v64, v65 = u20(1, -v60, v52 / v61);
	if v62 and v64 then
		return v49 + v62, v49 + v63, v49 + v64, v49 + v65;
	end;
	if v62 then
		return v49 + v62, v49 + v63;
	end;
	if not v64 then
		return;
	end;
	return v49 + v64, v49 + v65;
end;
v1.solve = u20;
u1 = function(p19, p20, p21, p22)
	if p19 and p19 >= 0 then
		return p19;
	end;
	if p20 and p20 >= 0 then
		return p20;
	end;
	if p21 and p21 >= 0 then
		return p21;
	end;
	if p22 and p22 >= 0 then
		return p22;
	end;
end;
v1.minpos = u1;
u4 = function(p23, p24, p25, p26, p27)
	return u1(u20(p23, p24, p25, p26, p27));
end;
v1.minposroot = u4;
local l__Dot__21 = Vector3.new().Dot;
u2 = function(p28, p29, p30)
	local v66 = u1(u20(l__Dot__21(p29, p29), 3 * l__Dot__21(p29, p28), 2 * (l__Dot__21(p28, p28) - l__Dot__21(p29, p30)), -2 * l__Dot__21(p30, p28)));
	if not v66 then
		return;
	end;
	return v66, v66 * p28 + v66 * v66 / 2 * p29;
end;
v1.cpoint_traj_point = u2;
u2 = function(p31, p32, p33)
	local v67 = u1(u20(l__Dot__21(p32, p32), -4 * (l__Dot__21(p32, p33) + p31 * p31), 4 * l__Dot__21(p33, p33)));
	if not v67 then
		return;
	end;
	local v68 = v67 ^ 0.5;
	return p33 / v68 - v68 / 2 * p32;
end;
v1.simple_trajectory = u2;
u2 = function(p34, p35, p36, p37, p38, p39, p40)
	local v69 = p37 - p34;
	local v70 = p38 - p35;
	local v71 = p39 - p36;
	local v72, v73, v74, v75 = u20(l__Dot__21(v71, v71) / 4, l__Dot__21(v71, v70), l__Dot__21(v71, v69) + l__Dot__21(v70, v70) - p40 * p40, 2 * l__Dot__21(v69, v70), l__Dot__21(v69, v69));
	if v72 and v72 > 0 then
		return v71 * v72 / 2 + p38 + v69 / v72, v72;
	end;
	if v73 and v73 > 0 then
		return v71 * v73 / 2 + p38 + v69 / v73, v73;
	end;
	if v74 and v74 > 0 then
		return v71 * v74 / 2 + p38 + v69 / v74, v74;
	end;
	if not v75 or not (v75 > 0) then
		return;
	end;
	return v71 * v75 / 2 + p38 + v69 / v75, v75;
end;
v1.trajectory = u2;
return v1;
