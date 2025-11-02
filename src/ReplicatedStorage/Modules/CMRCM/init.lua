local physics = require(script.PhysicsModule)

local cam = {}
cam.__index = cam


local cams = {}

local lTick = tick()

local function updatecam(v,dt)			
	local x,y,z = v.recoil.x.p(),v.recoil.y.p(),v.recoil.z.p()

	--local n = (0.5 / dt) / 60
	local n = dt * 50
	x,y,z = x*n,y*n,z*n

	v.current.CoordinateFrame = v.current.CoordinateFrame*CFrame.Angles(x,y,z)
end

function cam.new(setting)
	local nCam = {}
	nCam.current = workspace.CurrentCamera
	nCam.angles = {}
	nCam.angles.x = 0
	nCam.angles.y = 0
	nCam.angles.z = 0
	nCam.recoil = {}
	nCam.recoil.x = physics.spring.new{d=setting.RecoilDamper;s=setting.RecoilSpeed;}
	nCam.recoil.y = physics.spring.new{d=setting.RecoilDamper;s=setting.RecoilSpeed;}
	nCam.recoil.z = physics.spring.new{d=setting.RecoilDamper;s=setting.RecoilSpeed;}

	table.insert(cams,nCam)
	return setmetatable(nCam,cam)
end

function cam:accelerate(x,y,z)
	self.recoil.x.impulse(x)
	self.recoil.y.impulse(y)
	self.recoil.z.impulse(z)
end

function cam:accelerateXY(x,y)
	self.recoil.x.impulse(x)
	self.recoil.y.impulse(y)
end

function cam:disconnect()
	for i,v in pairs(cams) do
		if v == self then
			table.remove(cams,i)
			self = nil
			break
		end
	end
end

game:GetService("RunService"):BindToRenderStep("RecoilCam",2000,function(dt)
	local cDT = tick() - lTick

	for _,v in pairs(cams) do
		updatecam(v,cDT)
	end

	lTick = tick()
end)

return cam