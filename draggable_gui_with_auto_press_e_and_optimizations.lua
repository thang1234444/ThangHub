local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Cấu hình màu sắc
local colors = {
    background = Color3.fromRGB(30, 30, 30),
    primary = Color3.fromRGB(80, 100, 255),
    secondary = Color3.fromRGB(50, 50, 50),
    text = Color3.fromRGB(255, 255, 255),
    success = Color3.fromRGB(50, 200, 100),
    warning = Color3.fromRGB(250, 150, 50),
    slider = Color3.fromRGB(100, 120, 255)
}

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoEAntiAFK"
screenGui.Parent = PlayerGui
screenGui.ResetOnSpawn = false

-- Tạo khung chính
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 320)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -160)
mainFrame.BackgroundColor3 = colors.background
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Tạo hiệu ứng bo tròn góc cho mainFrame
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = mainFrame

-- Tạo thanh tiêu đề
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = colors.primary
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

-- Bo tròn góc cho thanh tiêu đề
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

-- Clip thanh tiêu đề để phù hợp với khung chính
local titleClip = Instance.new("Frame")
titleClip.Name = "TitleClip"
titleClip.Size = UDim2.new(1, 0, 0, 20)
titleClip.Position = UDim2.new(0, 0, 0.5, 0)
titleClip.BackgroundColor3 = colors.primary
titleClip.BorderSizePixel = 0
titleClip.Parent = titleBar

-- Tiêu đề
local titleText = Instance.new("TextLabel")
titleText.Name = "Title"
titleText.Size = UDim2.new(1, -80, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Font = Enum.Font.GothamBold
titleText.Text = "Auto E & Anti AFK"
titleText.TextColor3 = colors.text
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Nút đóng
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeButton.Text = "X"
closeButton.TextColor3 = colors.text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = titleBar

-- Bo tròn góc cho nút đóng
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 15)
closeCorner.Parent = closeButton

-- Nút thu nhỏ
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -70, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = colors.text
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 14
minimizeButton.Parent = titleBar

-- Bo tròn góc cho nút thu nhỏ
local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 15)
minimizeCorner.Parent = minimizeButton

-- Nút cấu hình
local configButton = Instance.new("ImageButton")
configButton.Name = "ConfigButton"
configButton.Size = UDim2.new(0, 24, 0, 24)
configButton.Position = UDim2.new(1, -105, 0, 8)
configButton.BackgroundTransparency = 1
configButton.Image = "rbxassetid://3926307971"
configButton.ImageRectOffset = Vector2.new(324, 124)
configButton.ImageRectSize = Vector2.new(36, 36)
configButton.ImageColor3 = colors.text
configButton.Parent = titleBar

-- Container chính
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -50)
contentFrame.Position = UDim2.new(0, 10, 0, 45)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Section Auto E
local autoESection = Instance.new("Frame")
autoESection.Name = "AutoESection"
autoESection.Size = UDim2.new(1, 0, 0, 120)
autoESection.BackgroundColor3 = colors.secondary
autoESection.BorderSizePixel = 0
autoESection.Parent = contentFrame

-- Bo tròn góc cho section
local sectionCorner = Instance.new("UICorner")
sectionCorner.CornerRadius = UDim.new(0, 8)
sectionCorner.Parent = autoESection

-- Tiêu đề section
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Name = "SectionTitle"
sectionTitle.Size = UDim2.new(1, -20, 0, 30)
sectionTitle.Position = UDim2.new(0, 10, 0, 5)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Font = Enum.Font.GothamSemibold
sectionTitle.Text = "Auto E Settings"
sectionTitle.TextColor3 = colors.text
sectionTitle.TextSize = 16
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = autoESection

-- Nút bật/tắt Auto E
local toggleButtonE = Instance.new("TextButton")
toggleButtonE.Name = "ToggleE"
toggleButtonE.Size = UDim2.new(1, -20, 0, 36)
toggleButtonE.Position = UDim2.new(0, 10, 0, 35)
toggleButtonE.BackgroundColor3 = colors.secondary
toggleButtonE.BorderSizePixel = 0
toggleButtonE.Text = ""
toggleButtonE.Parent = autoESection

-- Bo tròn góc cho nút
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButtonE

-- Hiệu ứng đổ bóng
local toggleShadow = Instance.new("Frame")
toggleShadow.Name = "Shadow"
toggleShadow.Size = UDim2.new(1, 0, 1, 0)
toggleShadow.BackgroundTransparency = 0.7
toggleShadow.BorderSizePixel = 0
toggleShadow.ZIndex = -1
toggleShadow.Parent = toggleButtonE

-- Nút toggle
local toggleSwitch = Instance.new("Frame")
toggleSwitch.Name = "Switch"
toggleSwitch.Size = UDim2.new(0, 50, 0, 24)
toggleSwitch.Position = UDim2.new(1, -60, 0.5, -12)
toggleSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleSwitch.BorderSizePixel = 0
toggleSwitch.Parent = toggleButtonE

-- Bo tròn góc cho switch
local switchCorner = Instance.new("UICorner")
switchCorner.CornerRadius = UDim.new(0, 12)
switchCorner.Parent = toggleSwitch

-- Nút tròn trong switch
local toggleCircle = Instance.new("Frame")
toggleCircle.Name = "Circle"
toggleCircle.Size = UDim2.new(0, 20, 0, 20)
toggleCircle.Position = UDim2.new(0, 2, 0.5, -10)
toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleCircle.BorderSizePixel = 0
toggleCircle.Parent = toggleSwitch

-- Bo tròn góc cho circle
local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(0, 10)
circleCorner.Parent = toggleCircle

-- Nhãn cho nút toggle
local toggleLabel = Instance.new("TextLabel")
toggleLabel.Name = "Label"
toggleLabel.Size = UDim2.new(1, -70, 1, 0)
toggleLabel.Position = UDim2.new(0, 10, 0, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Font = Enum.Font.Gotham
toggleLabel.Text = "Auto E: OFF"
toggleLabel.TextColor3 = colors.text
toggleLabel.TextSize = 14
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleLabel.Parent = toggleButtonE

-- Nhãn delay
local delayLabel = Instance.new("TextLabel")
delayLabel.Name = "DelayLabel"
delayLabel.Size = UDim2.new(1, -20, 0, 20)
delayLabel.Position = UDim2.new(0, 10, 0, 75)
delayLabel.BackgroundTransparency = 1
delayLabel.Font = Enum.Font.Gotham
delayLabel.Text = "Delay: 0.1s"
delayLabel.TextColor3 = colors.text
delayLabel.TextSize = 14
delayLabel.TextXAlignment = Enum.TextXAlignment.Left
delayLabel.Parent = autoESection

-- Thanh trượt delay
local sliderBG = Instance.new("Frame")
sliderBG.Name = "SliderBG"
sliderBG.Size = UDim2.new(1, -20, 0, 8)
sliderBG.Position = UDim2.new(0, 10, 0, 100)
sliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
sliderBG.BorderSizePixel = 0
sliderBG.Parent = autoESection

-- Bo tròn góc cho sliderBG
local sliderBGCorner = Instance.new("UICorner")
sliderBGCorner.CornerRadius = UDim.new(0, 4)
sliderBGCorner.Parent = sliderBG

-- Thanh trượt điền màu
local sliderFill = Instance.new("Frame")
sliderFill.Name = "Fill"
sliderFill.Size = UDim2.new(0, 0, 1, 0)
sliderFill.BackgroundColor3 = colors.slider
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderBG

-- Bo tròn góc cho sliderFill
local sliderFillCorner = Instance.new("UICorner")
sliderFillCorner.CornerRadius = UDim.new(0, 4)
sliderFillCorner.Parent = sliderFill

-- Nút trượt
local sliderButton = Instance.new("TextButton")
sliderButton.Name = "SliderButton"
sliderButton.Size = UDim2.new(0, 16, 0, 16)
sliderButton.Position = UDim2.new(0, -8, 0.5, -8)
sliderButton.BackgroundColor3 = colors.primary
sliderButton.Text = ""
sliderButton.Parent = sliderFill

-- Bo tròn góc cho sliderButton
local sliderButtonCorner = Instance.new("UICorner")
sliderButtonCorner.CornerRadius = UDim.new(0, 8)
sliderButtonCorner.Parent = sliderButton

-- Section Anti AFK
local antiAFKSection = Instance.new("Frame")
antiAFKSection.Name = "AntiAFKSection"
antiAFKSection.Size = UDim2.new(1, 0, 0, 70)
antiAFKSection.Position = UDim2.new(0, 0, 0, 130)
antiAFKSection.BackgroundColor3 = colors.secondary
antiAFKSection.BorderSizePixel = 0
antiAFKSection.Parent = contentFrame

-- Bo tròn góc cho section
local sectionCorner2 = Instance.new("UICorner")
sectionCorner2.CornerRadius = UDim.new(0, 8)
sectionCorner2.Parent = antiAFKSection

-- Tiêu đề section
local sectionTitle2 = Instance.new("TextLabel")
sectionTitle2.Name = "SectionTitle"
sectionTitle2.Size = UDim2.new(1, -20, 0, 30)
sectionTitle2.Position = UDim2.new(0, 10, 0, 5)
sectionTitle2.BackgroundTransparency = 1
sectionTitle2.Font = Enum.Font.GothamSemibold
sectionTitle2.Text = "Anti AFK Settings"
sectionTitle2.TextColor3 = colors.text
sectionTitle2.TextSize = 16
sectionTitle2.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle2.Parent = antiAFKSection

-- Nút bật/tắt Anti AFK
local toggleButtonAFK = Instance.new("TextButton")
toggleButtonAFK.Name = "ToggleAFK"
toggleButtonAFK.Size = UDim2.new(1, -20, 0, 36)
toggleButtonAFK.Position = UDim2.new(0, 10, 0, 35)
toggleButtonAFK.BackgroundColor3 = colors.secondary
toggleButtonAFK.BorderSizePixel = 0
toggleButtonAFK.Text = ""
toggleButtonAFK.Parent = antiAFKSection

-- Bo tròn góc cho nút
local toggleCornerAFK = Instance.new("UICorner")
toggleCornerAFK.CornerRadius = UDim.new(0, 6)
toggleCornerAFK.Parent = toggleButtonAFK

-- Hiệu ứng đổ bóng
local toggleShadowAFK = Instance.new("Frame")
toggleShadowAFK.Name = "Shadow"
toggleShadowAFK.Size = UDim2.new(1, 0, 1, 0)
toggleShadowAFK.BackgroundTransparency = 0.7
toggleShadowAFK.BorderSizePixel = 0
toggleShadowAFK.ZIndex = -1
toggleShadowAFK.Parent = toggleButtonAFK

-- Nút toggle
local toggleSwitchAFK = Instance.new("Frame")
toggleSwitchAFK.Name = "Switch"
toggleSwitchAFK.Size = UDim2.new(0, 50, 0, 24)
toggleSwitchAFK.Position = UDim2.new(1, -60, 0.5, -12)
toggleSwitchAFK.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleSwitchAFK.BorderSizePixel = 0
toggleSwitchAFK.Parent = toggleButtonAFK

-- Bo tròn góc cho switch
local switchCornerAFK = Instance.new("UICorner")
switchCornerAFK.CornerRadius = UDim.new(0, 12)
switchCornerAFK.Parent = toggleSwitchAFK

-- Nút tròn trong switch
local toggleCircleAFK = Instance.new("Frame")
toggleCircleAFK.Name = "Circle"
toggleCircleAFK.Size = UDim2.new(0, 20, 0, 20)
toggleCircleAFK.Position = UDim2.new(0, 2, 0.5, -10)
toggleCircleAFK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleCircleAFK.BorderSizePixel = 0
toggleCircleAFK.Parent = toggleSwitchAFK

-- Bo tròn góc cho circle
local circleCornerAFK = Instance.new("UICorner")
circleCornerAFK.CornerRadius = UDim.new(0, 10)
circleCornerAFK.Parent = toggleCircleAFK

-- Nhãn cho nút toggle
local toggleLabelAFK = Instance.new("TextLabel")
toggleLabelAFK.Name = "Label"
toggleLabelAFK.Size = UDim2.new(1, -70, 1, 0)
toggleLabelAFK.Position = UDim2.new(0, 10, 0, 0)
toggleLabelAFK.BackgroundTransparency = 1
toggleLabelAFK.Font = Enum.Font.Gotham
toggleLabelAFK.Text = "Anti AFK: OFF"
toggleLabelAFK.TextColor3 = colors.text
toggleLabelAFK.TextSize = 14
toggleLabelAFK.TextXAlignment = Enum.TextXAlignment.Left
toggleLabelAFK.Parent = toggleButtonAFK

-- Section Status
local statusSection = Instance.new("Frame")
statusSection.Name = "StatusSection"
statusSection.Size = UDim2.new(1, 0, 0, 70)
statusSection.Position = UDim2.new(0, 0, 0, 210)
statusSection.BackgroundColor3 = colors.secondary
statusSection.BorderSizePixel = 0
statusSection.Parent = contentFrame

-- Bo tròn góc cho section
local sectionCorner3 = Instance.new("UICorner")
sectionCorner3.CornerRadius = UDim.new(0, 8)
sectionCorner3.Parent = statusSection

-- Tiêu đề section
local sectionTitle3 = Instance.new("TextLabel")
sectionTitle3.Name = "SectionTitle"
sectionTitle3.Size = UDim2.new(1, -20, 0, 30)
sectionTitle3.Position = UDim2.new(0, 10, 0, 5)
sectionTitle3.BackgroundTransparency = 1
sectionTitle3.Font = Enum.Font.GothamSemibold
sectionTitle3.Text = "Status"
sectionTitle3.TextColor3 = colors.text
sectionTitle3.TextSize = 16
sectionTitle3.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle3.Parent = statusSection

-- Status text
local statusText = Instance.new("TextLabel")
statusText.Name = "StatusText"
statusText.Size = UDim2.new(1, -20, 0, 20)
statusText.Position = UDim2.new(0, 10, 0, 35)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.Gotham
statusText.Text = "Đang chạy... Phiên bản 1.0"
statusText.TextColor3 = colors.text
statusText.TextSize = 14
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = statusSection

-- Tạo khả năng kéo thả cho khung
local dragging = false
local dragInput, mousePos, framePos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        local newPosition = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
        
        -- Hiệu ứng mượt khi kéo thả
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(mainFrame, tweenInfo, {Position = newPosition})
        tween:Play()
    end
end)

-- Biến lưu trạng thái
local autoPressEnabled = false
local antiAFKEnabled = false
local delay = 0.1
local minimized = false
local originalSize = mainFrame.Size

-- Xử lý sự kiện nút đóng
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Xử lý sự kiện nút thu nhỏ
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    
    local targetSize
    local targetPosition
    
    if minimized then
        targetSize = UDim2.new(0, 300, 0, 40)
        targetPosition = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, 
                                   mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset + 140)
    else
        targetSize = originalSize
        targetPosition = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, 
                                   mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset - 140)
    end
    
    local sizeInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(mainFrame, sizeInfo, {Size = targetSize, Position = targetPosition})
    sizeTween:Play()
end)

-- Xử lý sự kiện toggle Auto E
local function updateAutoEToggle()
    local targetPosition
    local targetColor
    
    if autoPressEnabled then
        targetPosition = UDim2.new(0, 28, 0.5, -10)
        targetColor = colors.success
        toggleLabel.Text = "Auto E: ON"
    else
        targetPosition = UDim2.new(0, 2, 0.5, -10)
        targetColor = Color3.fromRGB(80, 80, 80)
        toggleLabel.Text = "Auto E: OFF"
    end
    
    local posInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local colorInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local posTween = TweenService:Create(toggleCircle, posInfo, {Position = targetPosition})
    local colorTween = TweenService:Create(toggleSwitch, colorInfo, {BackgroundColor3 = targetColor})
    
    posTween:Play()
    colorTween:Play()
end

toggleButtonE.MouseButton1Click:Connect(function()
    autoPressEnabled = not autoPressEnabled
    updateAutoEToggle()
    
    -- Hiệu ứng khi nhấn
    local clickEffect = TweenService:Create(toggleButtonE, TweenInfo.new(0.1), {BackgroundTransparency = 0.2})
    clickEffect:Play()
    
    wait(0.1)
    local resetEffect = TweenService:Create(toggleButtonE, TweenInfo.new(0.1), {BackgroundTransparency = 0})
    resetEffect:Play()
end)

-- Xử lý sự kiện toggle Anti AFK
local function updateAntiAFKToggle()
    local targetPosition
    local targetColor
    
    if antiAFKEnabled then
        targetPosition = UDim2.new(0, 28, 0.5, -10)
        targetColor = colors.success
        toggleLabelAFK.Text = "Anti AFK: ON"
    else
        targetPosition = UDim2.new(0, 2, 0.5, -10)
        targetColor = Color3.fromRGB(80, 80, 80)
        toggleLabelAFK.Text = "Anti AFK: OFF"
    end
    
    local posInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local colorInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local posTween = TweenService:Create(toggleCircleAFK, posInfo, {Position = targetPosition})
    local colorTween = TweenService:Create(toggleSwitchAFK, colorInfo, {BackgroundColor3 = targetColor})
    
    posTween:Play()
    colorTween:Play()
end

toggleButtonAFK.MouseButton1Click:Connect(function()
    antiAFKEnabled = not antiAFKEnabled
    updateAntiAFKToggle()
    
    -- Hiệu ứng khi nhấn
    local clickEffect = TweenService:Create(toggleButtonAFK, TweenInfo.new(0.1), {BackgroundTransparency = 0.2})
    clickEffect:Play()
    
    wait(0.1)
    local resetEffect = TweenService:Create(toggleButtonAFK, TweenInfo.new(0.1), {BackgroundTransparency = 0})
    resetEffect:Play()
end)

-- Xử lý sự kiện thanh trượt delay
local function updateSlider(input)
    local sliderSize = sliderBG.AbsoluteSize.X
    local localX = input.Position.X - sliderBG.AbsolutePosition.X
    local position = math.clamp(localX / sliderSize, 0, 1)
    
    -- Cập nhật thanh fill
    sliderFill.Size = UDim2.new(position, 0, 1, 0)
    
    -- Cập nhật giá trị delay
    delay = 0.1 + (2.9 * position)
    delayLabel.Text = string.format("Delay: %.1fs", delay)
end

sliderBG.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        updateSlider(input)
    end
end)

sliderBG.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        updateSlider(input)
    end
end)

sliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local moveConnection
        local releaseConnection
        
        moveConnection = UIS.InputChanged:Connect(function(move)
            if move.UserInputType == Enum.UserInputType.MouseMovement then
                updateSlider(move)
            end
        end)
        
        releaseConnection = UIS.InputEnded:Connect(function(release)
            if release.UserInputType == Enum.UserInputType.MouseButton1 then
                moveConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

-- Auto E functionality (improved)
local lastPressTime = 0
RunService.RenderStepped:Connect(function()
    if autoPressEnabled and tick() - lastPressTime >= delay then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        wait(0.05) -- Thời gian giữ phím ngắn để không gây lag
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        lastPressTime = tick()
        
        -- Cập nhật trạng thái
        statusText.Text = string.format("Auto E: Đã nhấn E (%.1fs)", delay)
    end
end)

-- Anti AFK functionality
Players.LocalPlayer.Idled:connect(function()
    if antiAFKEnabled then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        
        -- Cập nhật trạng thái
        statusText.Text = "Anti AFK: Đã ngăn chặn AFK"
        wait(2)
        statusText.Text = "Đang chạy... Phiên bản 1.0"
    end
end)

-- Hiệu ứng khởi động
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
local startupInfo = TweenInfo.
