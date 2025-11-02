local p1 = {
	RequestRate = 3, 
	IntSalt = 41900, 
	IntSalt2 = 69000, 
	UsernameSalt = true, 
	UserIdSalt = true, 
	MaxDT = 300,
	SEIN = {
		DefaultReverbType = Enum.ReverbType.City,
		CameraBobbing = true, 
		DefaultWalkSpeed = 15.8, 
		RunWalkSpeed = 25, 
		CrouchWalkSpeed = 8, 
		SprintKey1 = Enum.KeyCode.LeftShift, 
		SprintKey2 = Enum.KeyCode.RightShift, 
		SprintKey3 = Enum.KeyCode.ButtonL3, 
		CrouchKey1 = Enum.KeyCode.C, 
		CrouchKey2 = Enum.KeyCode.C, 
		CrouchKey3 = Enum.KeyCode.ButtonR3
	},
	CZs = {
		[1] = 1,
		[2] = 1
	}
}

require(script:WaitForChild("XIIX")).XIIX(p1)