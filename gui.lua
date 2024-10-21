local function createGui()
    -- Create main screen GUI
    local gui = Instance.new("ScreenGui", game.CoreGui)
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    mainFrame.BackgroundTransparency = 0.5
    mainFrame.Draggable = true

    -- Create title label for "Main"
    local titleLabel = Instance.new("TextLabel", mainFrame)
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "cir.gui"
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = 1

    -- Create minimize button
    local minimizeButton = Instance.new("TextButton", mainFrame)
    minimizeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    minimizeButton.Position = UDim2.new(0, 0, 0.2, 0)
    minimizeButton.Text = "-"
    minimizeButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Solid red
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)

    -- Create tab buttons
    local mainTabButton = Instance.new("TextButton", mainFrame)
    mainTabButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    mainTabButton.Position = UDim2.new(0, 0, 0.1, 0)
    mainTabButton.Text = "Main"
    mainTabButton.BackgroundColor3 = Color3.new(0, 0, 0)
    mainTabButton.TextColor3 = Color3.new(1, 1, 1)

    local genesisTabButton = Instance.new("TextButton", mainFrame)
    genesisTabButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    genesisTabButton.Position = UDim2.new(0, 0, 0.2, 0)
    genesisTabButton.Text = "Genesis FE"
    genesisTabButton.BackgroundColor3 = Color3.new(0, 0, 0)
    genesisTabButton.TextColor3 = Color3.new(1, 1, 1)

    -- Genesis FE Tab GUI
    local genesisFrame = Instance.new("Frame", mainFrame)
    genesisFrame.Size = UDim2.new(1, 0, 0.9, 0)
    genesisFrame.Position = UDim2.new(0, 0, 0.3, 0)
    genesisFrame.BackgroundTransparency = 1 -- Invisible, just for layout
    genesisFrame.Visible = false -- Start hidden

    -- Create buttons for Genesis FE characters
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

    local previousButton = nil
    for _, char in ipairs(characters) do
        local button = Instance.new("TextButton", genesisFrame)
        button.Size = UDim2.new(1, 0, 0, 30)
        button.Position = UDim2.new(0, 0, previousButton and (previousButton.Position.Y.Scale + 0.1) or 0, 0)
        button.Text = char[1]
        button.BackgroundColor3 = Color3.new(0, 0, 0)
        button.TextColor3 = Color3.new(1, 1, 1)

        button.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet(char[2]))()
        end)

        previousButton = button
    end

    -- Button functionality
    mainTabButton.MouseButton1Click:Connect(function()
        genesisFrame.Visible = false
    end)

    genesisTabButton.MouseButton1Click:Connect(function()
        genesisFrame.Visible = true
    end)

    minimizeButton.MouseButton1Click:Connect(function()
        if mainFrame.Size == UDim2.new(0, 400, 0, 300) then
            mainFrame.Size = UDim2.new(0, 50, 0, 50)
            mainFrame.Position = UDim2.new(0.5, -25, 0.5, -25)
            minimizeButton.Visible = false
        else
            mainFrame.Size = UDim2.new(0, 400, 0, 300)
            mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
            minimizeButton.Visible = true
        end
    end)

    return gui
end

createGui()
