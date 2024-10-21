-- Create GUI Elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabFrame = Instance.new("Frame")
local MinimizeButton = Instance.new("TextButton")
local MainTab = Instance.new("TextButton")
local GenesisTab = Instance.new("TextButton")
local PageTitle = Instance.new("TextLabel")

-- UI Settings
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame (Draggable + Semi-Transparent)
MainFrame.BackgroundTransparency = 0.5
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Minimize Button
MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
MinimizeButton.Position = UDim2.new(0.9, -5, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Text = "-"
MinimizeButton.Parent = MainFrame

-- Tab Frame (Right-Side Tabs)
TabFrame.Size = UDim2.new(0.2, 0, 1, 0)
TabFrame.Position = UDim2.new(0.8, 0, 0, 0)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

-- Main Tab Button
MainTab.Size = UDim2.new(1, 0, 0.1, 0)
MainTab.Position = UDim2.new(0, 0, 0, 0)
MainTab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainTab.TextColor3 = Color3.fromRGB(255, 0, 0)
MainTab.Text = "Main"
MainTab.Parent = TabFrame

-- Genesis FE Tab Button
GenesisTab.Size = UDim2.new(1, 0, 0.1, 0)
GenesisTab.Position = UDim2.new(0, 0, 0.2, 0)
GenesisTab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GenesisTab.TextColor3 = Color3.fromRGB(255, 0, 0)
GenesisTab.Text = "Genesis FE"
GenesisTab.Parent = TabFrame

-- Page Title
PageTitle.Size = UDim2.new(0.7, 0, 0.1, 0)
PageTitle.Position = UDim2.new(0.15, 0, 0, 0)
PageTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
PageTitle.TextScaled = true
PageTitle.BackgroundTransparency = 1
PageTitle.Parent = MainFrame

-- Minimized State Management
local isMinimized = false
local originalSize = MainFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        -- Expand to original size
        MainFrame.Size = originalSize
        MinimizeButton.Text = "-"
    else
        -- Minimize to a small box
        MainFrame.Size = UDim2.new(0.1, 0, 0.1, 0)
        MinimizeButton.Text = "+"
    end
    isMinimized = not isMinimized
end)

-- Page Switching Logic
local function switchPage(pageName)
    for _, button in pairs(MainFrame:GetChildren()) do
        if button:IsA("TextButton") and button.Name ~= "MinimizeButton" then
            button.Visible = (button.Name == pageName)
        end
    end
end

MainTab.MouseButton1Click:Connect(function()
    PageTitle.Text = "cir.gui"
    switchPage("Main")
end)

GenesisTab.MouseButton1Click:Connect(function()
    PageTitle.Text = "Genesis FE"
    switchPage("GenesisFE")
end)

-- Helper Function to Create Genesis FE Buttons
local function createButton(name, pos, func)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.7, 0, 0.05, 0)
    button.Position = UDim2.new(0.15, 0, pos, 0)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.Parent = MainFrame
    button.Name = "GenesisFE"
    button.Visible = false

    button.MouseButton1Click:Connect(func)
end

-- Genesis FE Character Loaders
createButton("Goner", 0.1, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
end)

createButton("Sniper", 0.16, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()
end)

createButton("Gale Fighter", 0.22, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"))()
end)

createButton("Krystal Dance", 0.28, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
end)

createButton("AK-47", 0.34, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
end)

createButton("Linked Sword", 0.4, function()
    DisableFlingHealthBar = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Linked%20Sword"))()
end)

createButton("Neko", 0.46, function()
    DisableFlingHealthBar = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neko"))()
end)

createButton("Motorcycle", 0.52, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
end)

createButton("Star Glitcher", 0.58, function()
    DisableFX = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Star%20Glitcher"))()
end)
