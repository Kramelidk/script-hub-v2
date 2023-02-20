local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()


    local Window = Library.CreateLib("Kramel's Script Hub v2", "DarkTheme")
    
    local Main = Window:NewTab("Movement")
    
    local MainSection = Main:NewSection("Movement")
    
    MainSection:NewSlider("WalkSpeed", "Changes how fast you walk.", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end)
	
	MainSection:NewSlider("JumpPower", "Changes how high you jump.", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
	end)
	
	
	
	local camera = workspace.CurrentCamera
	
	local Visual = Window:NewTab("Visual")
	
	local VisualSection = Visual:NewSection("Visual")
	
	
	VisualSection:NewSlider("FOV", "Changes the field of view.", 120, 10, function(s) -- 500 (MaxValue) | 0 (MinValue)
    camera.FieldOfView = s
	end)
	
	VisualSection:NewButton("Rejoin", "Rejoins the game.", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)
	
	VisualSection:NewButton("Stream Sniper", "With this you can stram snipe.", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)
	
	VisualSection:NewButton("Infinite Zoom Out", "Makes it so you can zoom out as much as you want.", function()
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
	end)
	
	local FpsSection = Visual:NewSection("Fps Booster")
	
	FpsSection:NewButton("Fps Boost", "Lowers the game graphics to get better performance.", function()
    -- Made by RIP#6666
_G.Settings = {
    Players = {
        ["Ignore Me"] = true, -- Ignore your Character
        ["Ignore Others"] = true -- Ignore other Characters
    },
    Meshes = {
        Destroy = false, -- Destroy Meshes
        LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
    },
    Images = {
        Invisible = true, -- Invisible Images
        LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
        Destroy = false, -- Destroy Images
    },
    ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
    ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
    ["No Explosions"] = true, -- Makes Explosion's invisible
    ["No Clothes"] = true, -- Removes Clothing from the game
    ["Low Water Graphics"] = true, -- Removes Water Quality
    ["No Shadows"] = true, -- Remove Shadows
    ["Low Rendering"] = true, -- Lower Rendering
    ["Low Quality Parts"] = true -- Lower quality parts
}
local Players = game:GetService("Players")
local BadInstances = {"DataModelMesh", "FaceInstance", "ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "PostEffect", "Explosion", "Clothing", "BasePart"}
local CanBeEnabled = {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "PostEffect"}
local function PartOfCharacter(Instance)
    for i, v in pairs(Players:GetPlayers()) do
        if v.Character and Instance:IsDescendantOf(v.Character) then
            return true
        end
    end
    return false
end
local function ReturnDescendants()
    local Descendants = {}
    WaitNumber = 5000
    if _G.Settings.Players["Ignore Others"] then
        for i, v in pairs(game:GetDescendants()) do
            if not v:IsDescendantOf(Players) and not PartOfCharacter(v) then
                for i2, v2 in pairs(BadInstances) do
                    if v:IsA(v2) then
                        table.insert(Descendants, v)
                    end
                end
            end
            if i == WaitNumber then
                task.wait()
                WaitNumber = WaitNumber + 5000
            end
        end
    elseif _G.Settings.Players["Ignore Me"] then
        for i, v in pairs(game:GetDescendants()) do
            if not v:IsDescendantOf(Players) and not v:IsDescendantOf(ME.Character) then
                for i2, v2 in pairs(BadInstances) do
                    if v:IsA(v2) then
                        table.insert(Descendants, v)
                    end
                end
            end
            if i == WaitNumber then
                task.wait()
                WaitNumber = WaitNumber + 5000
            end
        end
    end
    return Descendants
end
local function CheckIfBad(Instance)
    if not Instance:IsDescendantOf(Players) and not PartOfCharacter(Instance) then
        if Instance:IsA("DataModelMesh") then
            if _G.Settings.Meshes.LowDetail then
                sethiddenproperty(Instance, "LODX", Enum.LevelOfDetailSetting.Low)
                sethiddenproperty(Instance, "LODY", Enum.LevelOfDetailSetting.Low)
            elseif _G.Settings.Meshes.Destroy then
                Instance:Destroy()
            end
        elseif Instance:IsA("FaceInstance") then
            if _G.Settings.Images.Invisible then
                Instance.Transparency = 1
            elseif _G.Settings.Images.LowDetail then
                Instance.Shiny = 1
            elseif _G.Settings.Images.Destroy then
                Instance:Destroy()
            end
        elseif table.find(CanBeEnabled, Instance.ClassName) then
            if _G.Settings["No Particles"] or (_G.Settings.Other and _G.Settings.Other["No Particles"]) then
                Instance.Enabled = false
            end
        elseif Instance:IsA("Explosion") then
            if _G.Settings["No Explosions"] or (_G.Settings.Other and _G.Settings.Other["No Explosions"]) then
                Instance.Visible = false
            end
        elseif Instance:IsA("Clothing") then
            if _G.Settings["No Clothes"] or (_G.Settings.Other and _G.Settings.Other["No Clothes"]) then
                Instance:Destroy()
            end
        elseif Instance:IsA("BasePart") then
            if _G.Settings["Low Quality Parts"] or (_G.Settings.Other and _G.Settings.Other["Low Quality Parts"]) then
                Instance.Material = Enum.Material.Plastic
                Instance.Reflectance = 0
            end
        end
    end
end
if _G.Settings["Low Water Graphics"] or (_G.Settings.Other and _G.Settings.Other["Low Water Graphics"]) then
    workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
    workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
    workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
    workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0
end
if _G.Settings["No Shadows"] or (_G.Settings.Other and _G.Settings.Other["No Shadows"]) then
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 9e9
end
if _G.Settings["Low Rendering"] or (_G.Settings.Other and _G.Settings.Other["Low Rendering"]) then
    settings().Rendering.QualityLevel = 1
end
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Kramel",
    Text = "Loading FPS Booster...",
    Duration = 3,
    Button1 = "Okay"
})
local Descendants = ReturnDescendants()
local WaitNumber = 500
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Kramel",
    Text = "Checking " .. #Descendants .. " Instances...",
    Duration = 3,
    Button1 = "Okay"
})
for i, v in pairs(Descendants) do
    CheckIfBad(v)
    print("Loaded " .. i .. "/" .. #Descendants)
    if i == WaitNumber then
        task.wait()
        WaitNumber = WaitNumber + 500
    end
end
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Kramel",
    Text = "FPS Booster Loaded!",
    Duration = math.huge,
    Duration = 3,
    Button1 = "Okay"
})
game.DescendantAdded:Connect(CheckIfBad)
	end)
	
	
	
	local Troll = Window:NewTab("Troll Scripts")
	
	local TrollSection = Troll:NewSection("FE Troll Scripts")
	
	TrollSection:NewButton("FE Big Head v3", "Use a rthro head for this script to work.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/Scripts2022/main/BigHeadV3_Unpatched", true))()
	end)
	
	TrollSection:NewButton("FE Tall Man", "Use 100% on height and width for this to work.", function()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Character = LocalPlayer.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    function rm()
        for i,v in pairs(Character:GetDescendants()) do
            if v:IsA("BasePart") then
                if v.Name == "Handle" or v.Name == "Head" then
                    if Character.Head:FindFirstChild("OriginalSize") then
                        Character.Head.OriginalSize:Destroy()
                    end
                else
                    for i,cav in pairs(v:GetDescendants()) do
                        if cav:IsA("Attachment") then
                            if cav:FindFirstChild("OriginalPosition") then
                                cav.OriginalPosition:Destroy()  
                            end
                        end
                    end
                    v:FindFirstChild("OriginalSize"):Destroy()
                    if v:FindFirstChild("AvatarPartScaleType") then
                        v:FindFirstChild("AvatarPartScaleType"):Destroy()
                    end
                end
            end
        end
    end

    rm()
    wait(0.5)
    Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
    wait(1)

    rm()
    wait(0.5)
    Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
    wait(1)

    rm()
    wait(0.5)
    Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
    wait(1)

    rm()
    wait(0.5)
    Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
    wait(1)

    rm()
    wait(0.5)
    Humanoid:FindFirstChild("HeadScale"):Destroy()
    wait(1)
	end)
	
	TrollSection:NewButton("FE Hamster Ball", "Makes you roll like a hamster in a ball.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/ekipawubam'))()
	end)
	
	TrollSection:NewButton("FE Backflip, Frontflip", "Keybinds - X,C,Z.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/lawaconezo'))()
	end)
	
	TrollSection:NewButton("FE Small Avatar V2", "Set your body type to 0%.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/izuyetinay'))()
	end)
	
	TrollSection:NewButton("FE Giant Legs", "Equip 3d clothing for this to BREAK.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/izuyetinay'))()
	end)
	
	TrollSection:NewButton("FE Snake", "Makes you a snake.", function()
    loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()
	end)
	
	TrollSection:NewButton("FE Headless", "Gives you Headless.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/ixuyimawof'))()
	end)
	
	TrollSection:NewButton("FE LegLess", "Gives you LegLess.", function()
    local pchar = Game:GetService("Players").LocalPlayer.Character
	pchar.Torso["Right Hip"]:Destroy()
	pchar.Torso["Left Hip"]:Destroy()
	end)
	
	TrollSection:NewButton("Bypass Character Reset", "Changes the code so you can reset your character.", function()
	while true do
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
    game:GetService("RunService").RenderStepped:Wait()
	end
	end)

	
	
	
	local TrollSection2 = Troll:NewSection("FE Troll Hubs")
	
	TrollSection2:NewButton("Syntax Hub", "The key is Syntaxontop.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/caxoxaduxe'))()
	end)
	
	TrollSection2:NewButton("Universal FE Hub", "A hub that has a lot of scripts.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script'))()
	end)
	
	
	
	local UniversalSection = Troll:NewSection("Universal Hub")
	
	UniversalSection:NewButton("InfiniteYield", "A really good universal hub.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
	
	UniversalSection:NewButton("Dark Dex V4", "An explorer where you can browse the game files.", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4'))()
	end)
	
	
	local Animation = Window:NewTab("Animations")
	
	local ReanimateSection = Animation:NewSection("Reanimate, Netless")
	
	ReanimateSection:NewButton("Reanimate (Turns you into R6)", "Allows R6.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/Reanimate.lua"))()
	end)
	
	ReanimateSection:NewButton("Netless", "makes it so your body parts dont fall off.", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/eSPScHk6'))()
	end)
	
	local AnimationSection = Animation:NewSection("Animations")
	
	AnimationSection:NewButton("FE Nameless Animations v5 (R15)", "Very cool FE animations.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/joxoxubuve'))()
	end)
	
	AnimationSection:NewButton("Winged Master (R6)", "You turn into a weird flying object.", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/G68Krc4Q'))()
	end)
	
	AnimationSection:NewButton("Floppa (R15,R6)", "You turn into a Floppa.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Floppa/main/Floppa'))()
	end)
	
	AnimationSection:NewButton("Cursed Spider (R6)", "You turn into a dumb spider.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Cursed/main/Spider'))()
	end)
	
	AnimationSection:NewButton("Creepy Crawler (R15,R6)", "You turn into a Creepy Crawler.", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/eMmgNCQV'))()
	end)
	
	AnimationSection:NewButton("Gale Fighter (R15,R6)", "You turn into a FIGHTER.", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/haBVC7bj'))()
	end)
	
	AnimationSection:NewButton("Creeper (R6)", "You turn into a Creeper.", function()
    local pchar = Game:GetService("Players").LocalPlayer.Character
	pchar.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(90),math.rad(180),0)
	pchar.Torso["Right Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(90),0)
	pchar.Torso["Left Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(-90),0)
	pchar.Torso["Right Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(90),0)
	pchar.Torso["Left Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(-90),0)
	end)
	
	AnimationSection:NewButton("Big PP (R6)", "You get a BIG BLACK PP.", function()
    local pchar = Game:GetService("Players").LocalPlayer.Character
	pchar.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(90),math.rad(180),0)
	pchar.Torso["Left Shoulder"].C0 = CFrame.new(.5,-.8,-.8) * CFrame.Angles(0,math.rad(-90),-45)
	--ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
	pchar.Torso["Right Hip"].C0 = CFrame.new(0,-1.,0) * CFrame.Angles(0,math.rad(90),0)
	pchar.Torso["Left Hip"].C0 = CFrame.new(0,-1,0) * CFrame.Angles(0,math.rad(-90),0)
	pchar.Torso["Right Shoulder"]:Destroy()
	end)
	
	AnimationSection:NewButton("Creepy Spider (R6)", "You turn into a spider.", function()
setsimulationradius(math.huge, math.huge)

local mouse = game.Players.LocalPlayer:GetMouse()

game.Players.LocalPlayer.Character.Archivable = true
game.Players.LocalPlayer.Character.Animate.Disabled = true
local clonec =  game.Players.LocalPlayer.Character:Clone()
clonec.Parent = workspace
clonec.Name = "POOCLONE"
clonec.Humanoid.HipHeight = -1.2 -- change this to look taller.
game.Players.LocalPlayer.Character = clonec
clonec.Animate.Disabled = false

workspace.Camera.CameraSubject = clonec.Humanoid
game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
game.Players.LocalPlayer.Character.Animate.Disabled = true
---game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy()

spawn(function()


while true do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
clonec.Humanoid.Jump = game.Players.LocalPlayer.Character.Humanoid.Jump

local veco = workspace.Camera.CFrame:VectorToObjectSpace(game.Players.LocalPlayer.Character.Humanoid.MoveDirection)
clonec.Humanoid:Move(veco, true)

end
wait()
end

end)

for i,v in pairs(clonec:GetDescendants())do 
    
    if v:IsA("Part") then 
    v.Transparency = 1
    end 
end 





local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["HumanoidRootPart"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 0, 0)
game:GetService("RunService").Stepped:connect(function()
    
    game.Players.LocalPlayer.Character.Torso.CanCollide = false 
    game.Players.LocalPlayer.Character.Head.CanCollide = false 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false 
       game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true  
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (clonec.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90),0,0)) * CFrame.new(0,-0,-1)
           game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
 game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
 
end)




local segments = Instance.new("Folder")
local part = Instance.new("Part")
local part_2 = Instance.new("Part")

segments.Name = "segments"
segments.Parent = workspace
part.Anchored = true
part.CanCollide = false
part.Transparency = 1
part.Size = Vector3.new(1, 1, 2)
part.BottomSurface = Enum.SurfaceType.Smooth
part.BrickColor = BrickColor.new("Alder")
part.TopSurface = Enum.SurfaceType.Smooth
part.Color = Color3.new(0.666667, 0.333333, 1)
part.Parent = segments
part.Name = "seg1"
part.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Anchored = true
part_2.CanCollide = false
part_2.Size = Vector3.new(1, 1, 2)
part_2.BottomSurface = Enum.SurfaceType.Smooth
part_2.BrickColor = BrickColor.new("Cool yellow")
part_2.TopSurface = Enum.SurfaceType.Smooth
part_2.Color = Color3.new(0.992157, 0.917647, 0.552941)
part_2.Parent = segments
part_2.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Name = "seg2"
part_2.Transparency = 1

local segments2 = Instance.new("Folder")
local part = Instance.new("Part")
local part_2 = Instance.new("Part")

segments2.Name = "segments2"
segments2.Parent = workspace
part.Anchored = true
part.CanCollide = false
part.Size = Vector3.new(1, 1, 2)
part.BottomSurface = Enum.SurfaceType.Smooth
part.BrickColor = BrickColor.new("Alder")
part.TopSurface = Enum.SurfaceType.Smooth
part.Name = "seg1"
part.Color = Color3.new(0.666667, 0.333333, 1)
part.Parent = segments2
part.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Anchored = true
part_2.CanCollide = false
part_2.Size = Vector3.new(1, 1, 2)
part_2.BottomSurface = Enum.SurfaceType.Smooth
part_2.BrickColor = BrickColor.new("Alder")
part_2.TopSurface = Enum.SurfaceType.Smooth
part_2.Color = Color3.new(0.666667, 0.333333, 1)
part_2.Parent = segments2
part_2.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Name = "seg2"
part_2.Transparency = 1
part.Transparency = 1



local leg1 = Instance.new("Part")
leg1.Anchored = true
leg1.Size = Vector3.new(0.5, 0.2, 0.5)
leg1.BottomSurface = Enum.SurfaceType.Smooth
leg1.Color = Color3.new(0, 1, 0)
leg1.BrickColor = BrickColor.new("New Yeller")
leg1.TopSurface = Enum.SurfaceType.Smooth
leg1.Name = "leg1"
leg1.Parent = workspace
leg1.CFrame = CFrame.new(-31.15, 0.1, 8.65)
leg1.CanCollide = false
leg1.Transparency = 1





local leg1 =workspace.leg1:Clone()
leg1.Parent = workspace

local leg2= workspace.leg1:Clone()
leg2.Parent = workspace

local lp = game.Players.LocalPlayer
local head = game.Players.LocalPlayer.Character.Head

function coffset(x,y,z)
	return (head.CFrame * CFrame.new(x,y,z)).Position
end




mouse.KeyDown:connect(function(k)
	
	if k == "z" then
		
		leg1.Position = mouse.Hit.Position
	elseif k == "x" then
		
		
		leg2.Position = mouse.Hit.Position
	end
	
end)

	

		
spawn(function()
--
while true do
	
	
if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude >0.1 then
		wait(1.6/lp.Character.Humanoid.WalkSpeed)
		
	local ray1 =Ray.new(coffset(3,-0,0),Vector3.new(0,-10,0) )
	local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray1,{leg1,leg2,lp.Character})
	if pos then
		leg1.Position = pos
		end
		

	
		wait(1.6/lp.Character.Humanoid.WalkSpeed)
	local ray2 =Ray.new(coffset(-3,-0,0),Vector3.new(0,-10,0) )
	local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray2,{leg1,leg2,lp.Character})
	if pos then
	leg2.Position = pos	
		end
	
	end
	game:GetService("RunService").RenderStepped:wait()
end

end)


  

spawn(function()

local mouse = game.Players.LocalPlayer:GetMouse()



local len  = 2

local offset = Vector3.new(1,-3,0)
	
	local offset = Vector3.new(1,-1,0)
	
local segs = {}

local posn =  game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,-2.5,0)






for i,v in pairs(workspace.segments:GetChildren()) do
	
	
	
	table.insert(segs,v)
	
	
end






function vectorabsy(vec)
	local v = Vector3.new(vec.X,math.abs(vec.Y),vec.Z)
	return v
end


local count = #segs


while true do
	
	for i = 1,5 do
		
	for i = 1,count do
		
		if i == 1 then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =leg1.Position
			local vec = (pos2 - pos1).Unit 
			
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )
			local pos2 = 	segs[i-1].Position - (segs[i-1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
		end

	end	
	
	--Back

	
		for i = 1,count do
		
		local i = ( count - i ) + 1
		if i == count then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =(game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(offset)).Position  
			local vec =(pos2 - pos1).Unit 
			if vec.Y > 0 then
				
			vec = Vector3.new(vec.X, vec.Y-0.01 ,vec.Z)	
				
			end
			
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) * CFrame.Angles(0,math.rad(-180),0) 
			
			seg.CFrame =cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )
			
			local pos2 = 	segs[i+1].Position + (segs[i+1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit 
			
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2)  * CFrame.Angles(0,math.rad(-180),0)
			
			seg.CFrame = cframe
		end

		end	
		
	end
	game:GetService("RunService").Heartbeat:wait()
end
	
end)




spawn(function()

local mouse = game.Players.LocalPlayer:GetMouse()



local len  = 2

local offset = Vector3.new(-1,-1,0)

local segs = {}

local posn =  game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,-2.5,0)






for i,v in pairs(workspace.segments2:GetChildren()) do
	
	

	table.insert(segs,v)
	
	
end





function vectorabsy(vec)
	local v = Vector3.new(vec.X,math.abs(vec.Y),vec.Z)
	return v
end


local count = #segs


while true do

	for i = 1,5 do
		
	for i = 1,count do
		
		if i == 1 then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =leg2.Position
			local vec = (pos2 - pos1).Unit 
		
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )
			local pos2 = 	segs[i-1].Position - (segs[i-1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
		end

	end	
	
	--Back

	
		for i = 1,count do
		
		local i = ( count - i ) + 1
		if i == count then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =(game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(offset)).Position  
			local vec =(pos2 - pos1).Unit 
			if vec.Y > 0 then
				
			vec = Vector3.new(vec.X, vec.Y-0.01 ,vec.Z)	
				
			end
			
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) * CFrame.Angles(0,math.rad(-180),0) 
			
			seg.CFrame =cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )
			
			local pos2 = 	segs[i+1].Position + (segs[i+1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit 
			
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2)  * CFrame.Angles(0,math.rad(-180),0)
			
			seg.CFrame = cframe
		end

		end	
		
	end
	game:GetService("RunService").Heartbeat:wait()
end	
end)
game.Players.LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
game.Players.LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
game.Players.LocalPlayer.Character.Torso["Right Hip"]:Destroy()
game.Players.LocalPlayer.Character.Torso["Left Hip"]:Destroy()
local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Right Arm"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)
local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Left Arm"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)
local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Left Leg"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)
local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Right Leg"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)
spawn(function()
	game.Players.LocalPlayer.Character.Humanoid.Died:connect(function()	
		segments:Destroy()
		segments2:Destroy()	
	end)
	game:GetService("RunService").Stepped:connect(function()
	  	game.Players.LocalPlayer.Character["Right Arm"].CanCollide = false
	game.Players.LocalPlayer.Character["Left Arm"].CanCollide = false
		
	 game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
	game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
	   end)
	repeat game:GetService("RunService").Heartbeat:wait()	
	game.Players.LocalPlayer.Character["Right Arm"].CFrame = 	segments.seg1 .CFrame * CFrame.Angles(math.rad(90),0,0 )
	game.Players.LocalPlayer.Character["Left Arm"].CFrame = 	segments.seg2.CFrame * CFrame.Angles(math.rad(90),0,0 )	
	 game.Players.LocalPlayer.Character["Right Leg"].CFrame = 	segments2.seg1.CFrame * CFrame.Angles(math.rad(90),0,0 )
	game.Players.LocalPlayer.Character["Left Leg"].CFrame = 	segments2.seg2.CFrame * CFrame.Angles(math.rad(90),0,0 )
	until game.Players.LocalPlayer.Character.Humanoid.Health  < 1
end)

--thisisascript
	end)
	
	AnimationSection:NewButton("Da Feets (R6)", "You turn into a crazy tall boi.", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
	end)
	
	AnimationSection:NewButton("Default Dance (R6)", "You dance the fortnite dance.", function()
    loadstring(game:HttpGet('https://hastebin.com/raw/dozelayuqe'))()
	end)
	
	AnimationSection:NewButton("Among Us (R6)", "You among us.", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/mNF4uqKB'))()
	end)
	
	local Toggle = Window:NewTab("Toggle Scripts")
	
	local ToggleSection = Toggle:NewSection("Toggle ESP")
	
	ToggleSection:NewToggle("ESP", "Toggle ESP.", function(state)
    if state then
    
    _G.WRDESPEnabled = true --Enables the ESP (Defaults to true)
	_G.WRDESPBoxes = true --Draws boxes around other players (Defaults to true)
	_G.WRDESPTeamColors = nil --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
	_G.WRDESPTracers = nil --Displays lines leading to other players (Defaults to false)
	_G.WRDESPNames = false --Displays the names of the players within the ESP box (Defaults to true)
    
        loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    else
        _G.WRDESPEnabled = false --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = nil --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = nil --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = nil --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    end
end)

	ToggleSection:NewToggle("Show Names", "Displays the names.", function(state)
    if state then
        _G.WRDESPEnabled = nil --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = nil --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = nil --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = true --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    else
        _G.WRDESPEnabled = nil --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = nil --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = nil --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = false --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    end
end)

	ToggleSection:NewToggle("Show Tracers", "Displays tracers.", function(state)
    if state then
        _G.WRDESPEnabled = nil --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = nil --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = true --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = nil --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    else
        _G.WRDESPEnabled = nil --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = nil --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = false --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = nil --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    end
end)

	ToggleSection:NewToggle("Show Team Colors", "Displays team colors.", function(state)
    if state then
        _G.WRDESPEnabled = nil --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = true --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = nil --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = nil --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    else
        _G.WRDESPEnabled = nil --Enables the ESP (Defaults to true)
		_G.WRDESPBoxes = nil --Draws boxes around other players (Defaults to true)
		_G.WRDESPTeamColors = false --Distinguish different teams by their team color. If the game sets one. (Defaults to true)
		_G.WRDESPTracers = nil --Displays lines leading to other players (Defaults to false)
		_G.WRDESPNames = nil --Displays the names of the players within the ESP box (Defaults to true)
	
		loadstring(game:HttpGet('https://hastebin.com/raw/ezisaluwil'))()
    end
end)
	
	
	
	
	