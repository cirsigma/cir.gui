-- Create the ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false  -- Keep the GUI after respawn

-- Create the Tab Container (Left Edge Tabs)
local tabContainer = Instance.new("Frame", gui)
tabContainer.Size = UDim2.new(0, 100, 1, 0)  -- 100px wide, full height
tabContainer.Position = UDim2.new(0, 0, 0, 0)
tabContainer.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
tabContainer.BorderSizePixel = 0

-- Function to switch tabs
local function switchTab(content)
    for _, child in pairs(gui:GetChildren()) do
        if child:IsA("Frame") and child ~= tabContainer then
            child.Visible = false
        end
    end
    content.Visible = true
end

-- Create Main Tab Button
local mainTab = Instance.new("TextButton", tabContainer)
mainTab.Size = UDim2.new(1, 0, 0, 50)  -- Full width, 50px height
mainTab.Text = "Main"
mainTab.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
mainTab.TextColor3 = Color3.new(1, 1, 1)
mainTab.MouseButton1Click:Connect(function()
    switchTab(mainFrame)
end)

-- Create Genesis FE Tab Button
local genesisTab = Instance.new("TextButton", tabContainer)
genesisTab.Size = UDim2.new(1, 0, 0, 50)
genesisTab.Position = UDim2.new(0, 0, 0, 50)
genesisTab.Text = "Genesis FE"
genesisTab.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
genesisTab.TextColor3 = Color3.new(1, 1, 1)
genesisTab.MouseButton1Click:Connect(function()
    switchTab(genesisFrame)
end)

-- Create Main Frame (Content for "Main" Tab)
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 1, 0)  -- 300px wide, full height
mainFrame.Position = UDim2.new(0, 100, 0, 0)  -- Positioned next to the tabs
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.BackgroundTransparency = 0.1
mainFrame.Visible = true  -- Default tab

local mainLabel = Instance.new("TextLabel", mainFrame)
mainLabel.Size = UDim2.new(1, 0, 1, 0)
mainLabel.Text = "cir.gui"
mainLabel.TextColor3 = Color3.new(0, 0, 0)
mainLabel.BackgroundTransparency = 1

-- Create Genesis FE Frame (Content for "Genesis FE" Tab)
local genesisFrame = Instance.new("Frame", gui)
genesisFrame.Size = UDim2.new(0, 300, 1, 0)
genesisFrame.Position = UDim2.new(0, 100, 0, 0)
genesisFrame.BackgroundColor3 = Color3.new(1, 1, 1)
genesisFrame.BackgroundTransparency = 0.1
genesisFrame.Visible = false

-- List of Genesis FE Characters with Loadstrings
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

-- Generate Buttons for Genesis Characters
for i, char in ipairs(characters) do
    local button = Instance.new("TextButton", genesisFrame)
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = UDim2.new(0, 0, 0, (i - 1) * 50)
    button.Text = char[1]
    button.TextColor3 = Color3.new(0, 0, 0)
    button.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)

    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(char[2]))()
    end)
end
