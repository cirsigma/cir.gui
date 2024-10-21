-- Create the ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false  -- Keeps the GUI open after respawn

-- Create the Main Frame (the main GUI container)
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 400, 0, 300)  -- Adjusted size for better layout
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Center on the screen
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  -- Dark background
mainFrame.BackgroundTransparency = 0.1

-- Add a UI corner to the frame for rounded edges
local uiCorner = Instance.new("UICorner", mainFrame)
uiCorner.CornerRadius = UDim.new(0.1, 0)

-- Create the Main Tab with instructions
local mainLabel = Instance.new("TextLabel", mainFrame)
mainLabel.Size = UDim2.new(1, 0, 0.2, 0)
mainLabel.Position = UDim2.new(0, 0, 0, 0)
mainLabel.Text = "CIR.GUI\nPress Left Ctrl to hide/show"
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.TextScaled = true
mainLabel.BackgroundTransparency = 1

-- Create a Genesis FE Tab (Button Example)
local genesisTab = Instance.new("Frame", mainFrame)
genesisTab.Size = UDim2.new(1, 0, 0.8, 0)
genesisTab.Position = UDim2.new(0, 0, 0.2, 0)
genesisTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Add character buttons to the Genesis tab (adjusted layout)
local function addGenesisButton(name, posY)
    local button = Instance.new("TextButton", genesisTab)
    button.Size = UDim2.new(0.9, 0, 0.1, 0)
    button.Position = UDim2.new(0.05, 0, posY, 0)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
end

-- Add Genesis FE character buttons (Example characters)
addGenesisButton("Genesis Char 1", 0.05)
addGenesisButton("Genesis Char 2", 0.2)
addGenesisButton("Genesis Char 3", 0.35)
addGenesisButton("Genesis Char 4", 0.5)
addGenesisButton("Genesis Char 5", 0.65)

-- Draggable functionality
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

-- Toggle GUI visibility with Left Ctrl
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)
