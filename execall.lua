-- Assuming you have these defined somewhere in your script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local TargetStrafe = {
    Enabled = true, 
    Speed = 40, -- Reduced speed for better circling
    Radius = 3, -- Radius of the circle
    Height = 1
}

local TargetPlr = nil
local Angle = 0

-- Function to enable/disable strafing
local function setStrafeEnabled(enabled)
    TargetStrafe.Enabled = enabled
end

-- Function to update strafing
local function updateStrafe()
    if TargetStrafe.Enabled and TargetPlr then
        local TargetHRP = TargetPlr.Character and TargetPlr.Character:FindFirstChild("HumanoidRootPart")
        local LocalHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if TargetHRP and LocalHRP then
            -- Calculate new CFrame for circling
            Angle = Angle + math.rad(TargetStrafe.Speed)
            local offsetX = TargetStrafe.Radius * math.cos(Angle)
            local offsetZ = TargetStrafe.Radius * math.sin(Angle)
            local newCFrame = TargetHRP.CFrame * CFrame.new(offsetX, TargetStrafe.Height, offsetZ)
            LocalHRP.CFrame = newCFrame
        end
    end
end

-- Set the target player (example usage)
TargetPlr = TargetPlr

-- Create draggable UI
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Parent = game.StarterGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0, 100, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.5

local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 150, 0, 30)
TextBox.Position = UDim2.new(0, 25, 0, 10)
TextBox.PlaceholderText = "Enter Target Player Username"

local SetButton = Instance.new("TextButton")
SetButton.Parent = Frame
SetButton.Size = UDim2.new(0, 150, 0, 30)
SetButton.Position = UDim2.new(0, 25, 0, 50)
SetButton.Text = "Set Target Player"
SetButton.MouseButton1Click:Connect(function()
    local newTargetUsername = TextBox.Text
    -- Check if a player with the given username exists
    local targetPlayer = game.Players:FindFirstChild(newTargetUsername)
    if targetPlayer then
        -- Set the new target player
        TargetPlr = targetPlayer
        print("Target player set to: " .. newTargetUsername)
    else
        print("Player not found: " .. newTargetUsername)
    end
end)

local StartButton = Instance.new("TextButton")
StartButton.Parent = Frame
StartButton.Size = UDim2.new(0, 150, 0, 30)
StartButton.Position = UDim2.new(0, 25, 0, 90)
StartButton.Text = "Start Strafe"
StartButton.MouseButton1Click:Connect(function()
    setStrafeEnabled(true)
end)

local StopButton = Instance.new("TextButton")
StopButton.Parent = Frame
StopButton.Size = UDim2.new(0, 150, 0, 30)
StopButton.Position = UDim2.new(0, 25, 0, 130)
StopButton.Text = "Stop Strafe"
StopButton.MouseButton1Click:Connect(function()
    setStrafeEnabled(false)
end)

-- Call updateStrafe in a loop, you can use RunService or BindToRenderStep for better performance
while true do
    updateStrafe()
    wait() -- You might want to adjust the frequency of the updates depending on your needs
end

-- Game: HoodModded
-- Developer: Stella
-- Version: 1.0.3
-- Type: Paid Model

local player = game.Players.LocalPlayer


local function killSelf()
    local character = player.Character
    if character then
    
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.Health = 0
        end
    end
end


game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Comma then
    
  
        killSelf()
    end
end)

pcall(function()
local espcolor = Color3.fromRGB(140, 69, 102)
local wallhack_esp_transparency = .4
local gui_hide_button = {Enum.KeyCode.LeftControl, "End"}
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local TeamBased = false ; local teambasedswitch = "}"
local presskeytoaim = true; local aimkey = "q"
aimbothider = false; aimbothiderspeed = .5
local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "End"}
local espupdatetime = 5; autoesp = false
local abs = math.abs
local mouselock = false
local canaimat = true
local lockaim = true; local lockangle = 5
local ver = "2"
local cam = game.Workspace.CurrentCamera
local BetterDeathCount = true


local mouse = lplr:GetMouse()
local switch = false
local key = "End"
local aimatpart = nil




local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
--Properties:

Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")



local gotstring = 0
local function getrandomstring()
gotstring = gotstring+666
local str = ""
local randomstring = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "g", "k", "l", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?", "`", "$",
"0","1","2","3","4","5","6","7","8","9", }
local counting123 = 0
for i, v in ipairs(randomstring) do
counting123 = i
end
do
math.randomseed(tick()+gotstring)
for i = 3, math.random(1,100) do
math.randomseed(i+tick()+gotstring)

local oneortwo = math.random(1,2)
if oneortwo == 2 then
math.randomseed(i+tick()+gotstring)
str = str..""..randomstring[math.random(1, counting123)]
else
math.randomseed(i+tick()+gotstring)
str = str..""..string.upper(randomstring[math.random(1, counting123)])
end

end
end
return str
end
local mousedown = false
local isonmovething = false
local mouseoffset = Vector2.new()
local mousedown = false




Gui.Name = getrandomstring()

Move.Name = getrandomstring()
Move.Draggable = true
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.0431373, 1, 0.0745098)
Move.BackgroundTransparency = 0.40000000596046
Move.BorderSizePixel = 0
Move.Position = UDim2.new(0.5, 0,0.018, 0)
Move.Size = UDim2.new(0.2, 0, 0.0320388414, 0)

Move.MouseEnter:Connect(function()

isonmovething = true

end)
Move.MouseLeave:Connect(function()

isonmovething = mousedown and true or false
end)
mouse.Button1Down:connect(function()
mousedown = true
mouseoffset = Move.AbsolutePosition - Vector2.new(mouse.X, mouse.Y)
end)
mouse.Button1Up:connect(function()
mousedown = false
end)

mouse.Move:Connect(function()
if isonmovething == true and mousedown then
Move.Position = UDim2.new(0, mouseoffset.X + mouse.X, 0, mouseoffset.Y + mouse.Y)
end
end)

Main.Name = getrandomstring()
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
Main.Position = UDim2.new(0, 0, 0.995670795, 0)
Main.Size = UDim2.new(0, 0, 0, 0)

EspStatus.Name = getrandomstring()
EspStatus.Parent = Main
EspStatus.BackgroundColor3 = Color3.new(1, 1, 1)
EspStatus.BackgroundTransparency = 1
EspStatus.Size = UDim2.new(0.272955924, 0, 0.161862016, 0)
EspStatus.Font = Enum.Font.ArialBold
EspStatus.Text = "Press T to update Esp"
EspStatus.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
EspStatus.TextScaled = true
EspStatus.TextSize = 14
EspStatus.TextWrapped = true

st1.Name = getrandomstring()
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0.271787882, 0, 0, 0)
st1.Size = UDim2.new(0.728211343, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
st1.Text = "Press "..aimkey.." to lock on a person inside ur view"
st1.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1.TextScaled = true
st1.TextSize = 14
st1.TextWrapped = true

st1_2.Name = getrandomstring()
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0, 0, 0.375590861, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
st1_2.Text = "Press L to enable esp loop. Press Y to disable/enable aimbot hider"
st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_2.TextScaled = true
st1_2.TextSize = 14
st1_2.TextWrapped = true

local aimbothiderbox = Instance.new("TextBox")
aimbothiderbox.Name = getrandomstring()
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
aimbothiderbox.Size = UDim2.new(1, 0,0.162, 0)
aimbothiderbox.TextScaled = true
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
aimbothiderbox.Position = UDim2.new(0, 0,0.853, 0)
aimbothiderbox.BackgroundTransparency = 1
aimbothiderbox.Parent = Main

st1_3.Name = getrandomstring()
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0, 0, 0.18558608, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.ArialBold
st1_3.Text = "Press O to change team based mode"
st1_3.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_3.TextScaled = true
st1_3.TextSize = 14
st1_3.TextWrapped = true
local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = Main
teambasedstatus.TextScaled = true
teambasedstatus.Position = UDim2.new(0, 0,.7, 0)
teambasedstatus.Size = UDim2.new(1, 0,.1, 0)
teambasedstatus.Name = getrandomstring()
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
local espstatustext = teambasedstatus:Clone()
espstatustext.Name = getrandomstring()
espstatustext.Position = UDim2.new(0, 0,0.58, 0)
espstatustext.Text = "Esp loop :"..tostring(autoesp)
espstatustext.Parent = Main
local hide = Instance.new("TextButton")
hide.Text = "_"
hide.BackgroundTransparency = 1
hide.TextScaled = true
hide.TextWrapped = true
hide.Size = UDim2.new(0.1, 0,1, 0)
hide.Position = UDim2.new(0.9, 0,-0.15, 0)
hide.Name = getrandomstring()
hide.Parent = Move
Name.Name = getrandomstring()
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(0.838, 0, 1, 0)
Name.Font = Enum.Font.Arial
Name.Text = "HunterAim - Lumina [Q]"
Name.TextColor3 = Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
local scr = Instance.new("ScrollingFrame")
scr.Size = Main.Size
scr.Position = Main.Position
scr.ScrollBarThickness = 0
scr.BackgroundTransparency = 1
scr.Name = getrandomstring()
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Position = UDim2.new(0,0,0,0)
Main.Parent = scr
scr.Parent = Move
startpos = Main.Position
Move.Active = true

-- Scripts:
hided = false
hide.MouseButton1Click:Connect(function()
if hided == false then
hided = true
Main:TweenPosition(UDim2.new(0, 0, -1.5, 0))
else
hided = false
Main:TweenPosition(startpos)
end
end)


aimbothiderbox.FocusLost:Connect(function()
local numb = tonumber(aimbothiderbox.Text)
if aimbothider == true then
aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
else
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
end
if numb ~= nil then
aimbothiderspeed = numb
if aimbothider == true then
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
else
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
end
else
if aimbothider == true then
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
else
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
end
end
end)


local plrsforaim = {}


Move.Draggable = true
Gui.ResetOnSpawn = false
--Gui.Name = "Chat"
Gui.DisplayOrder = 999
if not game:GetService("CoreGui") then
Gui.Parent = plrs.LocalPlayer.PlayerGui
else
Gui.Parent = game:GetService("CoreGui")
end





f = {}
local espforlder
local partconverter = Instance.new("Part")

f.addesp = function()
pcall(function()
--print("ESP ran")
if espforlder then
espforlder:Destroy()
espforlder = Instance.new("Folder")
espforlder.Parent = game.Workspace.CurrentCamera
else
espforlder = Instance.new("Folder")
espforlder.Parent = game.Workspace.CurrentCamera
end
for i, v in pairs(espforlder:GetChildren()) do
v:Destroy()
end
for _, plr in pairs(plrs:GetChildren()) do
if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
if TeamBased == true then
if plr.Team.Name ~= plrs.LocalPlayer.Team.Name  then
local e = espforlder:FindFirstChild(plr.Name)
if not e then
local fold = Instance.new("Folder", espforlder)
fold.Name = plr.Name

--partconverter.BrickColor = plr.Team.Color
--local teamc = partconverter.Color
for i, p in pairs(plr.Character:GetChildren()) do
if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
local urmom = Instance.new("BoxHandleAdornment")
urmom.ZIndex = 10
urmom.AlwaysOnTop = true
urmom.Color3 = espcolor
urmom.Size = p.Size
urmom.Adornee = p
urmom.Name = tick().." Ur mom has big gay"
urmom.Transparency = wallhack_esp_transparency
urmom.Parent = fold

end
end
plr.Character.Humanoid.Died:Connect(function()
fold:Destroy()
end)
end
end
else
local e = espforlder:FindFirstChild(plr.Name)
if not e then
local fold = Instance.new("Folder", espforlder)
fold.Name = plr.Name

--partconverter.BrickColor = plr.Team.Color
--local teamc = Move.BackgroundColor3
for i, p in pairs(plr.Character:GetChildren()) do
if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
local urmom = Instance.new("BoxHandleAdornment")
urmom.ZIndex = 10
urmom.AlwaysOnTop = true
urmom.Color3 = espcolor
urmom.Size = p.Size
urmom.Adornee = p
urmom.Name = tick().." Ur mom has big gay"
urmom.Transparency = wallhack_esp_transparency
urmom.Parent = fold
end
end
plr.Character.Humanoid.Died:Connect(function()
fold:Destroy()
end)
end
end


end
end
end)
end
local uis = game:GetService("UserInputService")
local bringall = false
local hided2 = false
mouse.KeyDown:Connect(function(a)
if a == "p" then
--print("worked1")
f.addesp()
elseif a == gui_hide_button[2] and uis:IsKeyDown(gui_hide_button[1]) then
if hided2 == false then
hided2 = true
autoesp =false
if espforlder then
espforlder:Destroy()
end
Gui.Enabled = false
else
Gui.Enabled = true
hided2 = false
end
elseif a == "u" then
if mouselock == false then
mouselock = true
else
mouselock = false
end
elseif a == "y" then
if aimbothider == false then
aimbothider = true
if aimbothider == true then
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
else
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
end
else

aimbothider = false
if aimbothider == true then
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
else
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
end
end
if aimbothider == true then
aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
else
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
end
elseif a == "l" then
if autoesp == false then
autoesp = true
else
autoesp = false
end
elseif a == Aim_Assist_Key[2] and uis:IsKeyDown(Aim_Assist_Key[1]) then
if Aim_Assist == true then
Aim_Assist = false
--print("disabled")
else
Aim_Assist = true
end
end
if a == "j" then
if mouse.Target then
mouse.Target:Destroy()
end
end
if a == key then
if switch == false then
switch = true
else
switch = false
if aimatpart ~= nil then
aimatpart = nil
end
end
elseif a == teambasedswitch then
if TeamBased == true then
TeamBased = false
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
else
TeamBased = true
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
end
elseif a == aimkey then
if not aimatpart then
local maxangle = math.rad(20)
for i, plr in pairs(plrs:GetChildren()) do
if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
if TeamBased == true then
if plr.Team.Name ~= lplr.Team.Name then
local an = checkfov(plr.Character.Head)
if an < maxangle then
maxangle = an
aimatpart = plr.Character.Head
end
end
else
local an = checkfov(plr.Character.Head)
if an < maxangle then
maxangle = an
aimatpart = plr.Character.Head
end
--print(plr)
end
local old = aimatpart
plr.Character.Humanoid.Died:Connect(function()
--print("died")
if aimatpart and aimatpart == old then
aimatpart = nil
end
end)

end
end
else
aimatpart = nil
canaimat = false
delay(1.1, function()
canaimat = true
end)
end
end
end)

function getfovxyz (p0, p1, deg)
local x1, y1, z1 = p0:ToOrientation()
local cf = CFrame.new(p0.p, p1.p)
local x2, y2, z2 = cf:ToOrientation()
local d = math.deg
if deg then
return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
else
return Vector3.new((x1-x2), (y1-y2), (z1-z2))
end
end


function aimat(part)
if part then
if aimbothider == true or Aim_Assist == true then
cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.p, part.CFrame.p), aimbothiderspeed)
else

cam.CFrame = CFrame.new(cam.CFrame.p, part.CFrame.p)
end
end
end
function checkfov (part)
local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
local angle = math.abs(fov.X) + math.abs(fov.Y)
return angle
end
pcall(function()
delay(0, function()
while wait(.4) do
if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
for i, plr in pairs(plrs:GetChildren()) do


local minangle = math.rad(5.5)
local lastpart = nil
local function gg(plr)
pcall(function()
if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
local raycasted = false
local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
local dist = (plr.Character.Head.CFrame.p- pos).magnitude
if dist < 4 then
raycasted = true
end
if raycasted == true then
local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
local an = abs(an1.X) + abs(an1.Y)
if an < minangle then
minangle = an
lastpart = plr.Character.Head
end
end
end
end)
end
if TeamBased then
if plr.Team.Name ~= lplr.Team.Name then
gg(plr)
end
else
gg(plr)
end
--print(math.deg(minangle))
if lastpart then
aimatpart = lastpart
aimatpart.Parent.Humanoid.Died:Connect(function()
if aimatpart == lastpart then
aimatpart = nil
end
end)

end
end
end
end
end)
end)
local oldheadpos
local lastaimapart
game:GetService("RunService").RenderStepped:Connect(function()
espstatustext.Text = ""..tostring(autoesp)
if aimatpart and lplr.Character and lplr.Character.Head then
if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
if dist > 40 then
aimatpart = nil
end
end
lastaimapart = aimatpart
oldheadpos = lastaimapart.CFrame.p
do
if aimatpart.Parent == plrs.LocalPlayer.Character then
aimatpart = nil
end
aimat(aimatpart)
pcall(function()
if Aim_Assist == true then
local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
local dist = (aimatpart.CFrame.p- pos).magnitude
if obj then
--print(obj:GetFullName())
end
if not obj or dist > 6 then
aimatpart = nil
--print("ooof")
end
canaimat = false
delay(.5, function()
canaimat = true
end)
end
end)
end



end
end)
delay(0, function()
while wait(espupdatetime) do
if autoesp == true then
pcall(function()
f.addesp()
end)
end
end
end)
--warn("loaded")
end)

function isnil(thing)
return (thing == nil)
end


local function round(n)
return math.floor(tonumber(n) + 0.5)
end

function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
pcall(function()
if not isnil(v.Character) then
for _,k in pairs(v.Character:GetChildren()) do
if k:IsA'BasePart' and not k:FindFirstChild'Cham' then
local cham = Instance.new('BoxHandleAdornment',k)
cham.ZIndex= 10
cham.Adornee=k
cham.AlwaysOnTop=true
cham.Size=k.Size
cham.Transparency=1
cham.Color3=Color3.new(1,0,0)
cham.Name = 'Cham'
end
end
if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild'NameEsp' then
local bill = Instance.new('BillboardGui',v.Character.Head)
bill.Name = 'NameEsp'
bill.Size=UDim2.new(1,200,1,30)
bill.Adornee=v.Character.Head
bill.AlwaysOnTop=true
local name = Instance.new('TextLabel',bill)
name.TextWrapped=true
name.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..'m')
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment='Top'
name.TextColor3=Color3.new(1,1,1)
name.BackgroundTransparency=1
else
v.Character.Head.NameEsp.TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..'m')
end
end
end)
end
end

while wait() do
UpdatePlayerChams()
end

-- Game: HoodModded
-- Developer: Stella
-- Version: 1.0.3
-- Type: Paid Model

local player = game.Players.LocalPlayer

local loggedCFrame = nil

local function killSelf()
    local character = player.Character
    if character then
    
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.Health = 0
        end
    end
end

local function teleportTo(cframe)
    player.Character:SetPrimaryPartCFrame(cframe)
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Period then -- Change KeyCode to Period
        
        loggedCFrame = player.Character:GetPrimaryPartCFrame()
        killSelf()
    end
end)

player.CharacterAdded:Connect(function(character)

    if loggedCFrame then
  
        wait(3)
        teleportTo(loggedCFrame)
        loggedCFrame = nil
    end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Speed (V3) - Web Execute Support", "DarkTheme")

local speed = Window:NewTab("Speed")
local rs = speed:NewSection("CFrame Speed")
rs:NewButton("CFrame Guns FIX", "ButtonInfo", function()
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                wait(0.1)
                if child:FindFirstChild("LocalScript") then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
end)
rs:NewButton("CFrame Speed (Z)", "ButtonInfo", function()
    	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 0.5
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.Z then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end)
rs:NewSlider("CFrame Speed ", "SliderInfo", 20, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().Multiplier = s
end)
rs:NewButton("Reach", "ButtonInfo", function()
		if player.Character:FindFirstChildWhichIsA('Tool') then
            player.Character:FindFirstChildWhichIsA('Tool').Handle.Size = Vector3.new(50,50,50)
        	player.Character:FindFirstChildWhichIsA('Tool').Handle.Transparency = 1
    print("Clicked")
end)
rs:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.V, function()
	Library.ToggleUI()
end)
