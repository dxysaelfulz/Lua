local lp = game.Players.LocalPlayer

game:GetService("RunService").Heartbeat:Connect(function()
    local c = lp.Character
    if not c then return end

    local h = c:FindFirstChild("Hummanoid")
    if h and h.Health < 100 then
      h.Health = math.huge
    end
  end)
