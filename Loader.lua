--// script open scr make in ai

local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local plr = Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ZenithHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.25, 0.42)
frame.Position = UDim2.fromScale(0.37, 0.28)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0.14,0)
title.Text = "Zenith Hub | Beta"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true

local function makeButton(text,posY,color)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.fromScale(0.9,0.14)
	btn.Position = UDim2.fromScale(0.05,posY)
	btn.Text = text
	btn.BackgroundColor3 = color
	btn.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", btn)
	return btn
end

local btn1 = makeButton("Teleport To Safe",0.16,Color3.fromRGB(70,70,70))
local btn2 = makeButton("Teleport To End Zone",0.32,Color3.fromRGB(90,70,120))
local speedBtn = makeButton("Speed: OFF",0.48,Color3.fromRGB(60,120,60))
local interactBtn = makeButton("Instant Interact: ON",0.64,Color3.fromRGB(120,80,40))

local function getChar()
	return plr.Character or plr.CharacterAdded:Wait()
end

btn1.MouseButton1Click:Connect(function()
	local char = getChar()
	local hrp = char:WaitForChild("HumanoidRootPart")
	hrp.CFrame = CFrame.new(-1086.69873, 61.9259872, -1326.26465,
	-0.999916315, -6.85957602e-09, 0.0129352408,
	-6.51035093e-09, 1, 2.70400609e-08,
	-0.0129352408, 2.6953586e-08, -0.999916315)
end)

btn2.MouseButton1Click:Connect(function()
	local char = getChar()
	char:PivotTo(CFrame.new(-1113.57861, 58.9342117, 3269.5979))
end)

local speedEnabled = false
local normalSpeed = 16
local fastSpeed = 60

speedBtn.MouseButton1Click:Connect(function()
	local hum = getChar():WaitForChild("Humanoid")
	speedEnabled = not speedEnabled

	if speedEnabled then
		hum.WalkSpeed = fastSpeed
		speedBtn.Text = "Speed: ON"
	else
		hum.WalkSpeed = normalSpeed
		speedBtn.Text = "Speed: OFF"
	end
end)

local instantInteractEnabled = true

interactBtn.MouseButton1Click:Connect(function()
	instantInteractEnabled = not instantInteractEnabled

	if instantInteractEnabled then
		interactBtn.Text = "Instant Interact: ON"
	else
		interactBtn.Text = "Instant Interact: OFF"
	end
end)

ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, player)
	if instantInteractEnabled then
		fireproximityprompt(prompt)
	end
end)local speedBtn = makeButton("Speed: OFF",0.62,Color3.fromRGB(60,120,60))

local function getChar()
	return plr.Character or plr.CharacterAdded:Wait()
end

btn1.MouseButton1Click:Connect(function()
	local char = getChar()
	local hrp = char:WaitForChild("HumanoidRootPart")

	hrp.CFrame = CFrame.new(-1086.69873, 61.9259872, -1326.26465,
	-0.999916315, -6.85957602e-09, 0.0129352408,
	-6.51035093e-09, 1, 2.70400609e-08,
	-0.0129352408, 2.6953586e-08, -0.999916315)
end)

btn2.MouseButton1Click:Connect(function()
	local char = getChar()

	char:PivotTo(CFrame.new(-1113.57861, 58.9342117, 3269.5979))
end)

local speedEnabled = false
local normalSpeed = 16
local fastSpeed = 150

speedBtn.MouseButton1Click:Connect(function()
	local char = getChar()
	local hum = char:WaitForChild("Humanoid")

	speedEnabled = not speedEnabled

	if speedEnabled then
		hum.WalkSpeed = fastSpeed
		speedBtn.Text = "Speed: ON"
	else
		hum.WalkSpeed = normalSpeed
		speedBtn.Text = "Speed: OFF"
	end
end)
