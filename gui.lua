-- Create the ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false  -- Keeps the GUI open even after respawn

-- Create the main frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 580, 0, 460)
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -230)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)  -- White color
mainFrame.BackgroundTransparency = 0.5  -- 50% transparent
mainFrame.Active = true
mainFrame.Draggable = true

-- Title
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "CIR.GUI\nPress Ctrl to hide/show GUI"
titleLabel.TextScaled = true
titleLabel.TextColor3 = Color3.new(0, 0, 0)  -- Black color
titleLabel.TextAlign = Enum.TextXAlignment.Center

-- Create tabs
local tabContainer = Instance.new("Frame", mainFrame)
tabContainer.Size = UDim2.new(0, 160, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

local pages = {}
local function createTab(name)
    local button = Instance.new("TextButton", tabContainer)
    button.Size = UDim2.new(1, 0, 0, 50)
    button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)  -- White color
    button.TextScaled = true
    button.MouseButton1Click:Connect(function()
        for _, page in pairs(pages) do
            page.Visible = false
        end
        pages[name].Visible = true
    end)
    return button
end

-- Create the main page
local mainPage = Instance.new("Frame", mainFrame)
mainPage.Size = UDim2.new(1, -160, 1, -50)
mainPage.Position = UDim2.new(0, 160, 0, 50)
mainPage.BackgroundColor3 = Color3.new(1, 1, 1)
mainPage.Visible = true
pages["Main"] = mainPage

createTab("Main")

-- Create the Genesis FE tab
local genesisPage = Instance.new("Frame", mainFrame)
genesisPage.Size = UDim2.new(1, -160, 1, -50)
genesisPage.Position = UDim2.new(0, 160, 0, 50)
genesisPage.BackgroundColor3 = Color3.new(1, 1, 1)
genesisPage.Visible = false
pages["Genesis FE"] = genesisPage

local characters = {
    {"Goner", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"},
    {"Sniper", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"},
    {"Gale Fighter", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"},
    {"Krystal Dance", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"},
    {"AK47", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"},
    {"Linked Sword", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Linked%20Sword"},
    {"Good Cop Bad Cop", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Good%20Cop%20Bad%20Cop"},
    {"Neko", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neko"},
    {"Ban Hammer", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"},
    {"Puppet Master", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Puppet%20Master"},
    {"Minigun", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Minigun"},
    {"Sadist Genocider", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"},
    {"Banisher", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Banisher"},
    {"Karambit", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Karambit"},
    {"Neptunian V", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"},
    {"Motorcycle", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"},
    {"Star Glitcher", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Star%20Glitcher"},
}

-- Create buttons for each character
for i, char in ipairs(characters) do
    local button = Instance.new("TextButton", genesisPage)
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, (i - 1) * 45)  -- Stack buttons
    button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    button.Text = char[1]
    button.TextColor3 = Color3.new(1, 1, 1)  -- White color
    button.TextScaled = true

    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(char[2]))()
    end)
end

createTab("Genesis FE")

-- Toggle visibility with Left Ctrl
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.LeftControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Make it draggable
local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
