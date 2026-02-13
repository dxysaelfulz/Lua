-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()

-- Create Main Window
local Window = Library:Window({
    Title = "Ruóxi [ +1 speed for brainrot ]",
    Desc = "by dugxyux7kd_",
    Icon = 105059922903197,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Ruóxi"
    }
})

-- Sidebar Line
local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(0, 140, 0, 0)
SidebarLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 5
SidebarLine.Parent = game:GetService("CoreGui")

-- ================= MAIN TAB =================
local Tab = Window:Tab({Title = "Main", Icon = "star"}) do
    Tab:Section({Title = "All UI Components"})

    -- Toggle
    Tab:Toggle({
        Title = "Enable Feature",
        Desc = "Toggle to enable or disable the feature",
        Value = false,
        Callback = function(v)
            print("Toggle:", v)
        end
    })

    -- Button
    Tab:Button({
        Title = "Run Action",
        Desc = "Click to perform something",
        Callback = function()
            Window:Notify({
                Title = "Button",
                Desc = "Action performed successfully.",
                Time = 3
            })
        end
    })

    -- Textbox
    Tab:Textbox({
        Title = "Input Text",
        Desc = "Type something here",
        Placeholder = "Enter value",
        Value = "",
        ClearTextOnFocus = false,
        Callback = function(text)
            print("Textbox value:", text)
        end
    })

    -- Slider
    Tab:Slider({
        Title = "Set Speed",
        Min = 0,
        Max = 100,
        Rounding = 0,
        Value = 25,
        Callback = function(val)
            print("Slider:", val)
        end
    })

    -- Dropdown
    Tab:Dropdown({
        Title = "Choose Option",
        List = {"Option 1", "Option 2", "Option 3"},
        Value = "Option 1",
        Callback = function(choice)
            print("Selected:", choice)
        end
    })

    -- ===== WARP BUTTON =====
    Tab:Button({
        Title = "Teleport To End Zone",
        Desc = "Teleport End",
        Callback = function()
            local player = game.Players.LocalPlayer
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if hrp then
                hrp.CFrame = CFrame.new(-1113.57861, 58.9342117, 4287.80518)

                Window:Notify({
                    Title = "Teleport succeed ",
                    Desc = "teleport to zone successful",
                    Time = 3
                })
            else
                Window:Notify({
                    Title = "Error",
                    Desc = "Not found avatar",
                    Time = 3
                })
            end
        end
    })

    -- Code Display
    local CodeBlock = Tab:Code({
        Title = "Example Code",
        Code = "-- This is a code preview\nprint('Hello world')"
    })

    task.delay(5, function()
        CodeBlock:SetCode("-- Updated!\nprint('New content loaded')")
    end)
end

Window:Line()

-- ================= EXTRA TAB =================
local Extra = Window:Tab({Title = "Extra", Icon = "tag"}) do
    Extra:Section({Title = "About"})
    Extra:Button({
        Title = "Show Message",
        Desc = "Display a popup",
        Callback = function()
            Window:Notify({
                Title = "Fluent UI",
                Desc = "Everything works fine!",
                Time = 3
            })
        end
    })
end

Window:Line()

-- ================= SETTINGS TAB =================
local Settings = Window:Tab({Title = "Settings", Icon = "wrench"}) do
    Settings:Section({Title = "Config"})
    Settings:Button({
        Title = "Show Message",
        Desc = "Display a popup",
        Callback = function()
            Window:Notify({
                Title = "Settings",
                Desc = "Everything works fine!",
                Time = 3
            })
        end
    })
end

-- Final Notification
Window:Notify({
    Title = "Ruóxi",
    Desc = "loaded successfully!",
    Time = 4
})
