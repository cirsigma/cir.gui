-- Create the ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false  -- Keeps the GUI open even after respawn

-- Create the main frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)  -- Main frame size
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)  -- Centered on screen
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  -- Dark gray background
mainFrame.BackgroundTransparency = 0.1  -- Slight transparency

-- Create the title label
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "CIR.GUI - Press Ctrl to Hide/Show"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.TextAlignment = Enum.TextAlignment.Center

-- Create tabs frame
local tabsFrame = Instance.new("Frame", mainFrame)
tabsFrame.Size = UDim2.new(0, 120, 1, -50)  -- Width of the tabs
tabsFrame.Position = UDim2.new(0, 0, 0, 50)
tabsFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Function to create a button for each tab
local function createTabButton(title, position, callback)
    local button = Instance.new("TextButton", tabsFrame)
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    button.Text = title
    button.TextColor3 = Color3.new(1, 1, 1)
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

-- Create main and genesis buttons
local mainTabButton = createTabButton("Main", UDim2.new(0, 0, 0, 0), function()
    for _, v in pairs(mainFrame:GetChildren()) do
        if v:IsA("Frame") and v.Name ~= "tabsFrame" then
            v.Visible = false
        end
    end
end)

local genesisTabButton = createTabButton("Genesis FE", UDim2.new(0, 0, 0, 40), function()
    for _, v in pairs(mainFrame:GetChildren()) do
        if v:IsA("Frame") and v.Name ~= "tabsFrame" then
            v.Visible = false
        end
    end
    genesisFrame.Visible = true  -- Show Genesis frame
end)

-- Create the Genesis FE frame
local genesisFrame = Instance.new("Frame", mainFrame)
genesisFrame.Size = UDim2.new(1, -120, 1, -50)
genesisFrame.Position = UDim2.new(0, 120, 0, 50)
genesisFrame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
genesisFrame.Visible = false  -- Hide initially

-- Define the characters and their scripts
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

-- Function to create character buttons
local function createCharacterButton(name, url, position)
    local charButton = Instance.new("TextButton", genesisFrame)
    charButton.Size = UDim2.new(0.9, 0, 0, 40)
    charButton.Position = position
    charButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    charButton.Text = name
    charButton.TextColor3 = Color3.new(1, 1, 1)

    charButton.MouseButton1Click:Connect(function()
        -- Load the script from the URL
        local response = game:GetService("HttpService"):GetAsync(url)
        loadstring(response)()  -- Execute the script
    end)
    
    return charButton
end

-- Create buttons for all characters
for i, character in ipairs(characters) do
    createCharacterButton(character[1], character[2], UDim2.new(0, 0, 0, (i - 1) * 50))
end

-- Function to toggle GUI visibility
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Enable dragging functionality
local dragging, dragInput, dragStart, startPos

-- Function to start dragging
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

-- Function to update position while dragging
mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

-- Update the main frame's position as the player drags it
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
