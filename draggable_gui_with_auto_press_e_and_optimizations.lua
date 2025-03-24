local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui

-- Create a Frame with Background Transparency
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.8 -- 80% transparency
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Make the Frame draggable
local dragging = false
local dragInput, mousePos, framePos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        frame.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
    end
end)

-- Create a TextButton for Auto E
local toggleButtonE = Instance.new("TextButton")
toggleButtonE.Size = UDim2.new(0, 180, 0, 50)
toggleButtonE.Position = UDim2.new(0, 10, 0, 10)
toggleButtonE.Text = "Toggle Auto E"
toggleButtonE.BackgroundColor3 = Color3.new(1, 1, 1)
toggleButtonE.TextColor3 = Color3.new(0, 0, 0)
toggleButtonE.Parent = frame

local autoPressEnabled = false

toggleButtonE.MouseButton1Click:Connect(function()
    autoPressEnabled = not autoPressEnabled
    if autoPressEnabled then
        toggleButtonE.Text = "Auto E: ON"
        print("Auto E enabled") -- Debug print
    else
        toggleButtonE.Text = "Auto E: OFF"
        print("Auto E disabled") -- Debug print
    end
end)

RunService.RenderStepped:Connect(function()
    if autoPressEnabled then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        wait(0.1)  -- Adjust the delay as needed
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    end
end)

-- Create a TextButton for Anti AFK
local toggleButtonAFK = Instance.new("TextButton")
toggleButtonAFK.Size = UDim2.new(0, 180, 0, 50)
toggleButtonAFK.Position = UDim2.new(0, 10, 0, 70)
toggleButtonAFK.Text = "Toggle Anti AFK"
toggleButtonAFK.BackgroundColor3 = Color3.new(1, 1, 1)
toggleButtonAFK.TextColor3 = Color3.new(0, 0, 0)
toggleButtonAFK.Parent = frame

local antiAFKEnabled = false
local virtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    if antiAFKEnabled then
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
end)

toggleButtonAFK.MouseButton1Click:Connect(function()
    antiAFKEnabled = not antiAFKEnabled
    if antiAFKEnabled then
        toggleButtonAFK.Text = "Anti AFK: ON"
        print("Anti AFK enabled") -- Debug print
    else
        toggleButtonAFK.Text = "Anti AFK: OFF"
        print("Anti AFK disabled") -- Debug print
    end
end)

-- Toggle GUI visibility with Ctrl key
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        screenGui.Enabled = not screenGui.Enabled
    end
end)

-- Optimizations to improve FPS and reduce lag
local function optimizePerformance()
    -- Reduce graphics quality
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    -- Disable certain effects
    game.Lighting.GlobalShadows = false
    game.Lighting.Outlines = false

    -- Reduce the range of detail
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CastShadow = false
        end
    end
end

optimizePerformance()
