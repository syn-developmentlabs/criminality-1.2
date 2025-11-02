# crim 1.2

## Clone into criminality-1.2
```
git clone https://github.com/syn-developmentlabs/criminality-1.2.git
cd criminality-1.2
```

## Build using rojo
```bash
rojo build --output criminality.rbxl
```

## Open the built criminality.rbxl in Roblox Studio
```bash
.\criminality.rbxl
```

## Run the startup script using the Roblox Studio command line
```lua
if not game:GetAttribute("U")then game:SetAttribute("U",true)for _,s in next,{"Workspace","Lighting","ServerScriptService","ServerStorage","ReplicatedStorage","StarterPack","StarterPlayer","SoundService"}do for _,m in next,game:GetService(s):GetChildren()do if m:IsA("Model")then for _,c in next,m:GetChildren()do c.Parent=m.Parent end m:Destroy()end end end end
```