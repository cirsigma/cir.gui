-- Create the ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false  -- Keeps the GUI open even after respawn

-- Create the main Frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 0, 400)  -- Width: 300px, Height: 400px
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)  -- Centered on screen
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)  -- White color
mainFrame.BackgroundTransparency = 0.5  -- 50% transparent

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

-- Update the mainFrame’s position as the player drags it
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Create the Tabs
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(0, 100, 1, 0)  -- Width: 100px, Full height
tabFrame.Position = UDim2.new(0, 0, 0, 0)
tabFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)  -- Dark gray color

local mainTabButton = Instance.new("TextButton", tabFrame)
mainTabButton.Size = UDim2.new(1, 0, 0, 50)  -- Full width, 50px height
mainTabButton.Position = UDim2.new(0, 0, 0, 0)
mainTabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
mainTabButton.Text = "Main"
mainTabButton.TextColor3 = Color3.new(1, 1, 1)

local genesisTabButton = Instance.new("TextButton", tabFrame)
genesisTabButton.Size = UDim2.new(1, 0, 0, 50)  -- Full width, 50px height
genesisTabButton.Position = UDim2.new(0, 0, 0, 50)
genesisTabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
genesisTabButton.Text = "Genesis FE"
genesisTabButton.TextColor3 = Color3.new(1, 1, 1)

-- Create the Content Frame
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, -100, 1, 0)  -- Full width minus tab width
contentFrame.Position = UDim2.new(0, 100, 0, 0)  -- Right of the tab
contentFrame.BackgroundColor3 = Color3.new(1, 1, 1)  -- White background

-- Main Tab UI
local mainLabel = Instance.new("TextLabel", contentFrame)
mainLabel.Size = UDim2.new(1, 0, 0, 50)
mainLabel.Position = UDim2.new(0, 0, 0, 0)
mainLabel.Text = "CIR.GUI"
mainLabel.TextColor3 = Color3.new(0, 0, 0)
mainLabel.BackgroundTransparency = 1  -- Transparent background

local ctrlLabel = Instance.new("TextLabel", contentFrame)
ctrlLabel.Size = UDim2.new(1, 0, 0, 50)
ctrlLabel.Position = UDim2.new(0, 0, 0, 50)
ctrlLabel.Text = "Press Ctrl to hide/show GUI"
ctrlLabel.TextColor3 = Color3.new(0, 0, 0)
ctrlLabel.BackgroundTransparency = 1  -- Transparent background

-- Genesis FE Tab UI
local genesisFrame = Instance.new("Frame", contentFrame)
genesisFrame.Size = UDim2.new(1, 0, 1, 0)
genesisFrame.Position = UDim2.new(0, 0, 0, 0)
genesisFrame.BackgroundTransparency = 1  -- Transparent

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

local buttonHeight = 30
local spacing = 5

for i, char in ipairs(characters) do
    local button = Instance.new("TextButton", genesisFrame)
    button.Size = UDim2.new(1, 0, 0, buttonHeight)
    button.Position = UDim2.new(0, 0, (buttonHeight + spacing) * (i - 1), 0)
    button.Text = char[1]
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)

    -- Button functionality to run character scripts
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(char[2]))()  -- Load and run the script for the selected character
    end)
end

-- Show main tab on startup
genesisFrame.Visible = false  -- Initially hide the Genesis FE tab

-- Tab switching functionality
mainTabButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = true
    genesisFrame.Visible = false
end)

genesisTabButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = false
    genesisFrame.Visible = true
end)

-- Hide/Show GUI functionality with Ctrl
local userInputService = game:GetService("UserInputService")

userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.LeftControl then
        mainFrame.Visible = not mainFrame.Visible  -- Toggle visibility
    end
end)
