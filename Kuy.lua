if math.random() < 1 then
	local DiscordPopup = loadstring(game:HttpGet("https://raw.githubusercontent.com/darkdexv2/DiscordPopup/main/Adv"))()
end
task.wait(3)

local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local uis = game:GetService("UserInputService")
local pps = game:GetService("ProximityPromptService")
local rs = game:GetService("RunService")

local autosteal = false
local instanthold = false
local holdconn = nil
local speedenabled = false
local noclip = false
local infinjump = false
local flying = false
local flyconn = nil
local noclipconn = nil

local defaultspeed = 16
local customspeed = 50
local flyspeed = 50

local teleportpos = Vector3.new(756.0792846679688, 3.499999761581421, -100.78203582763672)

local sg = Instance.new("ScreenGui")
sg.Name = "TsunamiGui"
sg.ResetOnSpawn = false
sg.Parent = lp:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 340, 0, 520)
main.Position = UDim2.new(0.5, -170, 0.5, -260)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(40, 40, 40)
border.Thickness = 1
border.Parent = main

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "ESCAPE TSUNAMI FOR LUCKY BLOCKS"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Font = Enum.Font.Code
title.BorderSizePixel = 0
title.Parent = main

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, 0, 0, 15)
credit.Position = UDim2.new(0, 0, 0, 35)
credit.BackgroundTransparency = 1
credit.Text = "byted"
credit.TextColor3 = Color3.fromRGB(80, 80, 80)
credit.TextSize = 11
credit.Font = Enum.Font.Code
credit.Parent = main

local line = Instance.new("Frame")
line.Size = UDim2.new(1, -20, 0, 1)
line.Position = UDim2.new(0, 10, 0, 55)
line.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
line.BorderSizePixel = 0
line.Parent = main

local tabs = Instance.new("Frame")
tabs.Name = "Tabs"
tabs.Size = UDim2.new(1, -20, 0, 30)
tabs.Position = UDim2.new(0, 10, 0, 65)
tabs.BackgroundTransparency = 1
tabs.Parent = main

local tab1 = Instance.new("TextButton")
tab1.Name = "MainTab"
tab1.Size = UDim2.new(0.33, -3, 1, 0)
tab1.Position = UDim2.new(0, 0, 0, 0)
tab1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
tab1.Text = "MAIN"
tab1.TextColor3 = Color3.fromRGB(100, 255, 100)
tab1.TextSize = 12
tab1.Font = Enum.Font.Code
tab1.BorderSizePixel = 0
tab1.Parent = tabs

local tab1corner = Instance.new("UICorner")
tab1corner.CornerRadius = UDim.new(0, 4)
tab1corner.Parent = tab1

local tab2 = Instance.new("TextButton")
tab2.Name = "PlayerTab"
tab2.Size = UDim2.new(0.33, -3, 1, 0)
tab2.Position = UDim2.new(0.33, 1.5, 0, 0)
tab2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
tab2.Text = "PLAYER"
tab2.TextColor3 = Color3.fromRGB(180, 180, 180)
tab2.TextSize = 12
tab2.Font = Enum.Font.Code
tab2.BorderSizePixel = 0
tab2.Parent = tabs

local tab2corner = Instance.new("UICorner")
tab2corner.CornerRadius = UDim.new(0, 4)
tab2corner.Parent = tab2

local tab3 = Instance.new("TextButton")
tab3.Name = "TeleportTab"
tab3.Size = UDim2.new(0.33, -3, 1, 0)
tab3.Position = UDim2.new(0.66, 3, 0, 0)
tab3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
tab3.Text = "TELEPORT"
tab3.TextColor3 = Color3.fromRGB(180, 180, 180)
tab3.TextSize = 12
tab3.Font = Enum.Font.Code
tab3.BorderSizePixel = 0
tab3.Parent = tabs

local tab3corner = Instance.new("UICorner")
tab3corner.CornerRadius = UDim.new(0, 4)
tab3corner.Parent = tab3

local mainpage = Instance.new("Frame")
mainpage.Name = "MainPage"
mainpage.Size = UDim2.new(1, -20, 1, -165)
mainpage.Position = UDim2.new(0, 10, 0, 105)
mainpage.BackgroundTransparency = 1
mainpage.Visible = true
mainpage.Parent = main

local playerpage = Instance.new("Frame")
playerpage.Name = "PlayerPage"
playerpage.Size = UDim2.new(1, -20, 1, -165)
playerpage.Position = UDim2.new(0, 10, 0, 105)
playerpage.BackgroundTransparency = 1
playerpage.Visible = false
playerpage.Parent = main

local teleportpage = Instance.new("Frame")
teleportpage.Name = "TeleportPage"
teleportpage.Size = UDim2.new(1, -20, 1, -165)
teleportpage.Position = UDim2.new(0, 10, 0, 105)
teleportpage.BackgroundTransparency = 1
teleportpage.Visible = false
teleportpage.Parent = main

local function createbtn(name, txt, pos, parent)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.Text = txt
	btn.TextColor3 = Color3.fromRGB(180, 180, 180)
	btn.TextSize = 13
	btn.Font = Enum.Font.Code
	btn.BorderSizePixel = 0
	btn.Parent = parent
	
	local btnborder = Instance.new("UIStroke")
	btnborder.Color = Color3.fromRGB(35, 35, 35)
	btnborder.Thickness = 1
	btnborder.Parent = btn
	
	local btncorner = Instance.new("UICorner")
	btncorner.CornerRadius = UDim.new(0, 4)
	btncorner.Parent = btn
	
	btn.MouseEnter:Connect(function()
		if btn.TextColor3 ~= Color3.fromRGB(100, 255, 100) then
			btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		end
	end)
	
	btn.MouseLeave:Connect(function()
		if btn.TextColor3 ~= Color3.fromRGB(100, 255, 100) then
			btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		end
	end)
	
	return btn, btnborder
end

local toggle1, toggle1border = createbtn("AutoStealToggle", "AUTO STEAL [OFF]", UDim2.new(0, 0, 0, 0), mainpage)
local toggle2, toggle2border = createbtn("InstantHoldToggle", "INSTANT HOLD [OFF]", UDim2.new(0, 0, 0, 45), mainpage)
local manualbtn, manualborder = createbtn("ManualSteal", "MANUAL STEAL", UDim2.new(0, 0, 0, 90), mainpage)

local speedbtn, speedborder = createbtn("SpeedToggle", "SPEED [OFF]", UDim2.new(0, 0, 0, 0), playerpage)
local noclipbtn, noclipborder = createbtn("NoclipToggle", "NOCLIP [OFF]", UDim2.new(0, 0, 0, 45), playerpage)
local jumpbtn, jumpborder = createbtn("InfiniteJump", "INFINITE JUMP [OFF]", UDim2.new(0, 0, 0, 90), playerpage)
local flybtn, flyborder = createbtn("FlyToggle", "FLY [OFF]", UDim2.new(0, 0, 0, 135), playerpage)

local ogzonebtn = createbtn("OGZone", "OG ZONE", UDim2.new(0, 0, 0, 0), teleportpage)
local exclusivezonebtn = createbtn("ExclusiveZone", "EXCLUSIVE ZONE", UDim2.new(0, 0, 0, 45), teleportpage)
local divinezonebtn = createbtn("DivineZone", "DIVINE ZONE", UDim2.new(0, 0, 0, 90), teleportpage)
local brainrotzonebtn = createbtn("BrainrotZone", "BRAINROT GOD ZONE", UDim2.new(0, 0, 0, 135), teleportpage)
local secretzonebtn = createbtn("SecretZone", "SECRET ZONE", UDim2.new(0, 0, 0, 180), teleportpage)
local mythiczonebtn = createbtn("MythicZone", "MYTHIC ZONE", UDim2.new(0, 0, 0, 225), teleportpage)

local speedslider = Instance.new("Frame")
speedslider.Name = "SpeedSlider"
speedslider.Size = UDim2.new(1, 0, 0, 50)
speedslider.Position = UDim2.new(0, 0, 0, 180)
speedslider.BackgroundTransparency = 1
speedslider.Parent = playerpage

local speedlabel = Instance.new("TextLabel")
speedlabel.Size = UDim2.new(1, 0, 0, 15)
speedlabel.Position = UDim2.new(0, 0, 0, 0)
speedlabel.BackgroundTransparency = 1
speedlabel.Text = "Speed: 50"
speedlabel.TextColor3 = Color3.fromRGB(180, 180, 180)
speedlabel.TextSize = 11
speedlabel.Font = Enum.Font.Code
speedlabel.Parent = speedslider

local sliderback = Instance.new("Frame")
sliderback.Size = UDim2.new(1, 0, 0, 6)
sliderback.Position = UDim2.new(0, 0, 0, 25)
sliderback.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sliderback.BorderSizePixel = 0
sliderback.Parent = speedslider

local slidercorner = Instance.new("UICorner")
slidercorner.CornerRadius = UDim.new(0, 3)
slidercorner.Parent = sliderback

local sliderfill = Instance.new("Frame")
sliderfill.Size = UDim2.new(0.185, 0, 1, 0)
sliderfill.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
sliderfill.BorderSizePixel = 0
sliderfill.Parent = sliderback

local sliderfillcorner = Instance.new("UICorner")
sliderfillcorner.CornerRadius = UDim.new(0, 3)
sliderfillcorner.Parent = sliderfill

local sliderknob = Instance.new("Frame")
sliderknob.Size = UDim2.new(0, 14, 0, 14)
sliderknob.Position = UDim2.new(0.185, -7, 0.5, -7)
sliderknob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderknob.BorderSizePixel = 0
sliderknob.Parent = sliderback

local knobcorner = Instance.new("UICorner")
knobcorner.CornerRadius = UDim.new(1, 0)
knobcorner.Parent = sliderknob

local flyslider = Instance.new("Frame")
flyslider.Name = "FlySlider"
flyslider.Size = UDim2.new(1, 0, 0, 50)
flyslider.Position = UDim2.new(0, 0, 0, 240)
flyslider.BackgroundTransparency = 1
flyslider.Parent = playerpage

local flylabel = Instance.new("TextLabel")
flylabel.Size = UDim2.new(1, 0, 0, 15)
flylabel.Position = UDim2.new(0, 0, 0, 0)
flylabel.BackgroundTransparency = 1
flylabel.Text = "Fly Speed: 50"
flylabel.TextColor3 = Color3.fromRGB(180, 180, 180)
flylabel.TextSize = 11
flylabel.Font = Enum.Font.Code
flylabel.Parent = flyslider

local flysliderback = Instance.new("Frame")
flysliderback.Size = UDim2.new(1, 0, 0, 6)
flysliderback.Position = UDim2.new(0, 0, 0, 25)
flysliderback.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
flysliderback.BorderSizePixel = 0
flysliderback.Parent = flyslider

local flyslidercorner = Instance.new("UICorner")
flyslidercorner.CornerRadius = UDim.new(0, 3)
flyslidercorner.Parent = flysliderback

local flysliderfill = Instance.new("Frame")
flysliderfill.Size = UDim2.new(0.185, 0, 1, 0)
flysliderfill.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
flysliderfill.BorderSizePixel = 0
flysliderfill.Parent = flysliderback

local flysliderfillcorner = Instance.new("UICorner")
flysliderfillcorner.CornerRadius = UDim.new(0, 3)
flysliderfillcorner.Parent = flysliderfill

local flysliderknob = Instance.new("Frame")
flysliderknob.Size = UDim2.new(0, 14, 0, 14)
flysliderknob.Position = UDim2.new(0.185, -7, 0.5, -7)
flysliderknob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flysliderknob.BorderSizePixel = 0
flysliderknob.Parent = flysliderback

local flyknobcorner = Instance.new("UICorner")
flyknobcorner.CornerRadius = UDim.new(1, 0)
flyknobcorner.Parent = flysliderknob

local status = Instance.new("TextLabel")
status.Name = "StatusLabel"
status.Size = UDim2.new(1, 0, 0, 25)
status.Position = UDim2.new(0, 0, 1, -50)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(100, 255, 100)
status.TextSize = 11
status.Font = Enum.Font.Code
status.Parent = main

local note = Instance.new("TextLabel")
note.Size = UDim2.new(1, -20, 0, 30)
note.Position = UDim2.new(0, 10, 1, -35)
note.BackgroundTransparency = 1
note.Text = "Note: Auto Steal teleports you when prompt is triggered"
note.TextColor3 = Color3.fromRGB(60, 60, 60)
note.TextSize = 9
note.Font = Enum.Font.Code
note.TextWrapped = true
note.TextYAlignment = Enum.TextYAlignment.Top
note.Parent = main

local sliderdragging = false
local flysliderdragging = false

local function updateslider(pct)
	pct = math.clamp(pct, 0, 1)
	customspeed = math.floor(16 + (pct * 184))
	speedlabel.Text = "Speed: " .. customspeed
	sliderfill.Size = UDim2.new(pct, 0, 1, 0)
	sliderknob.Position = UDim2.new(pct, -7, 0.5, -7)
	
	if speedenabled then
		local char = lp.Character
		if char then
			local hum = char:FindFirstChild("Humanoid")
			if hum then
				hum.WalkSpeed = customspeed
			end
		end
	end
end

local function updateflyslider(pct)
	pct = math.clamp(pct, 0, 1)
	flyspeed = math.floor(16 + (pct * 184))
	flylabel.Text = "Fly Speed: " .. flyspeed
	flysliderfill.Size = UDim2.new(pct, 0, 1, 0)
	flysliderknob.Position = UDim2.new(pct, -7, 0.5, -7)
end

sliderback.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliderdragging = true
		local pos = sliderback.AbsolutePosition
		local sz = sliderback.AbsoluteSize
		local mx = input.Position.X
		local pct = (mx - pos.X) / sz.X
		updateslider(pct)
	end
end)

sliderknob.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliderdragging = true
	end
end)

flysliderback.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		flysliderdragging = true
		local pos = flysliderback.AbsolutePosition
		local sz = flysliderback.AbsoluteSize
		local mx = input.Position.X
		local pct = (mx - pos.X) / sz.X
		updateflyslider(pct)
	end
end)

flysliderknob.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		flysliderdragging = true
	end
end)

uis.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliderdragging = false
		flysliderdragging = false
	end
end)

uis.InputChanged:Connect(function(input)
	if sliderdragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local pos = sliderback.AbsolutePosition
		local sz = sliderback.AbsoluteSize
		local mx = input.Position.X
		local pct = (mx - pos.X) / sz.X
		updateslider(pct)
	end
	
	if flysliderdragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local pos = flysliderback.AbsolutePosition
		local sz = flysliderback.AbsoluteSize
		local mx = input.Position.X
		local pct = (mx - pos.X) / sz.X
		updateflyslider(pct)
	end
end)

tab1.MouseButton1Click:Connect(function()
	mainpage.Visible = true
	playerpage.Visible = false
	teleportpage.Visible = false
	tab1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	tab1.TextColor3 = Color3.fromRGB(100, 255, 100)
	tab2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab2.TextColor3 = Color3.fromRGB(180, 180, 180)
	tab3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab3.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

tab2.MouseButton1Click:Connect(function()
	mainpage.Visible = false
	playerpage.Visible = true
	teleportpage.Visible = false
	tab2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	tab2.TextColor3 = Color3.fromRGB(100, 255, 100)
	tab1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab1.TextColor3 = Color3.fromRGB(180, 180, 180)
	tab3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab3.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

tab3.MouseButton1Click:Connect(function()
	mainpage.Visible = false
	playerpage.Visible = false
	teleportpage.Visible = true
	tab3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	tab3.TextColor3 = Color3.fromRGB(100, 255, 100)
	tab1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab1.TextColor3 = Color3.fromRGB(180, 180, 180)
	tab2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab2.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

toggle1.MouseButton1Click:Connect(function()
	autosteal = not autosteal
	if autosteal then
		toggle1.Text = "AUTO STEAL [ON]"
		toggle1.TextColor3 = Color3.fromRGB(100, 255, 100)
		toggle1border.Color = Color3.fromRGB(100, 255, 100)
		status.Text = "auto steal active"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
	else
		toggle1.Text = "AUTO STEAL [OFF]"
		toggle1.TextColor3 = Color3.fromRGB(180, 180, 180)
		toggle1border.Color = Color3.fromRGB(35, 35, 35)
		status.Text = "auto steal disabled"
		status.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
	task.wait(1.5)
	status.Text = ""
end)

toggle2.MouseButton1Click:Connect(function()
	instanthold = not instanthold
	if instanthold then
		toggle2.Text = "INSTANT HOLD [ON]"
		toggle2.TextColor3 = Color3.fromRGB(100, 255, 100)
		toggle2border.Color = Color3.fromRGB(100, 255, 100)
		status.Text = "instant hold active"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
		
		if fireproximityprompt then
			task.wait(0.1)
			holdconn = pps.PromptButtonHoldBegan:Connect(function(prompt)
				if prompt.HoldDuration > 0 then
					prompt.HoldDuration = 0
				end
				fireproximityprompt(prompt)
			end)
		else
			status.Text = "executor not supported"
			status.TextColor3 = Color3.fromRGB(255, 100, 100)
			instanthold = false
			toggle2.Text = "INSTANT HOLD [OFF]"
			toggle2.TextColor3 = Color3.fromRGB(180, 180, 180)
			toggle2border.Color = Color3.fromRGB(35, 35, 35)
		end
	else
		toggle2.Text = "INSTANT HOLD [OFF]"
		toggle2.TextColor3 = Color3.fromRGB(180, 180, 180)
		toggle2border.Color = Color3.fromRGB(35, 35, 35)
		status.Text = ""
		if holdconn then
			holdconn:Disconnect()
			holdconn = nil
		end
	end
	task.wait(1.5)
	status.Text = ""
end)

manualbtn.MouseButton1Click:Connect(function()
	pcall(function()
		lp.Character.HumanoidRootPart.CFrame = CFrame.new(teleportpos)
		status.Text = "teleported"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
		task.delay(1.5, function()
			status.Text = ""
		end)
	end)
end)

speedbtn.MouseButton1Click:Connect(function()
	speedenabled = not speedenabled
	local char = lp.Character
	if not char then return end
	local hum = char:FindFirstChild("Humanoid")
	if not hum then return end
	
	if speedenabled then
		speedbtn.Text = "SPEED [ON]"
		speedbtn.TextColor3 = Color3.fromRGB(100, 255, 100)
		speedborder.Color = Color3.fromRGB(100, 255, 100)
		hum.WalkSpeed = customspeed
		status.Text = "speed enabled"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
	else
		speedbtn.Text = "SPEED [OFF]"
		speedbtn.TextColor3 = Color3.fromRGB(180, 180, 180)
		speedborder.Color = Color3.fromRGB(35, 35, 35)
		hum.WalkSpeed = defaultspeed
		status.Text = "speed disabled"
		status.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
	task.wait(1.5)
	status.Text = ""
end)

noclipbtn.MouseButton1Click:Connect(function()
	noclip = not noclip
	if noclip then
		noclipbtn.Text = "NOCLIP [ON]"
		noclipbtn.TextColor3 = Color3.fromRGB(100, 255, 100)
		noclipborder.Color = Color3.fromRGB(100, 255, 100)
		status.Text = "noclip enabled"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
		
		noclipconn = rs.Stepped:Connect(function()
			local char = lp.Character
			if char then
				for _, v in pairs(char:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end)
	else
		noclipbtn.Text = "NOCLIP [OFF]"
		noclipbtn.TextColor3 = Color3.fromRGB(180, 180, 180)
		noclipborder.Color = Color3.fromRGB(35, 35, 35)
		status.Text = "noclip disabled"
		status.TextColor3 = Color3.fromRGB(255, 100, 100)
		
		if noclipconn then
			noclipconn:Disconnect()
			noclipconn = nil
		end
		
		local char = lp.Character
		if char then
			for _, v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = true
				end
			end
		end
	end
	task.wait(1.5)
	status.Text = ""
end)

jumpbtn.MouseButton1Click:Connect(function()
	infinjump = not infinjump
	if infinjump then
		jumpbtn.Text = "INFINITE JUMP [ON]"
		jumpbtn.TextColor3 = Color3.fromRGB(100, 255, 100)
		jumpborder.Color = Color3.fromRGB(100, 255, 100)
		status.Text = "infinite jump enabled"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
	else
		jumpbtn.Text = "INFINITE JUMP [OFF]"
		jumpbtn.TextColor3 = Color3.fromRGB(180, 180, 180)
		jumpborder.Color = Color3.fromRGB(35, 35, 35)
		status.Text = "infinite jump disabled"
		status.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
	task.wait(1.5)
	status.Text = ""
end)

flybtn.MouseButton1Click:Connect(function()
	flying = not flying
	if flying then
		flybtn.Text = "FLY [ON]"
		flybtn.TextColor3 = Color3.fromRGB(100, 255, 100)
		flyborder.Color = Color3.fromRGB(100, 255, 100)
		status.Text = "fly enabled - wasd space shift"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
		
		flyconn = rs.Heartbeat:Connect(function()
			if not flying then return end
		
flyconn = rs.Heartbeat:Connect(function()
