local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local isEnabled = false
local lastCharacter = nil

local function randomString(length)
    length = length or math.random(8, 16)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local result = ""
    for i = 1, length do
        result = result .. chars:sub(math.random(1, #chars), math.random(1, #chars))
    end
    return result
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerListMaster"
screenGui.Parent = CoreGui 
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Name = "Container"
mainFrame.Size = UDim2.new(0, 240, 0, 215) 
mainFrame.Position = UDim2.new(0.5, -120, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderColor3 = Color3.fromRGB(85, 85, 125)
mainFrame.BorderSizePixel = 2
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Header"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
titleLabel.BorderColor3 = Color3.fromRGB(85, 85, 125)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "PlayerListMaster"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 16
titleLabel.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Name = randomString()
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 2.5)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
closeButton.BorderColor3 = Color3.fromRGB(255, 100, 100)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 16
closeButton.Parent = mainFrame

local walkSpeedLabel = Instance.new("TextLabel")
walkSpeedLabel.Name = randomString()
walkSpeedLabel.Size = UDim2.new(0, 100, 0, 20)
walkSpeedLabel.Position = UDim2.new(0.5, -110, 0, 40)
walkSpeedLabel.BackgroundTransparency = 1
walkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedLabel.Text = "Walk Speed:"
walkSpeedLabel.Font = Enum.Font.SourceSans
walkSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
walkSpeedLabel.TextSize = 14
walkSpeedLabel.Parent = mainFrame

local walkSpeedInput = Instance.new("TextBox")
walkSpeedInput.Name = randomString()
walkSpeedInput.Size = UDim2.new(0, 100, 0, 25)
walkSpeedInput.Position = UDim2.new(0.5, 10, 0, 38)
walkSpeedInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
walkSpeedInput.BorderColor3 = Color3.fromRGB(100, 100, 100)
walkSpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedInput.Text = "1"
walkSpeedInput.Font = Enum.Font.SourceSans
walkSpeedInput.TextSize = 14
walkSpeedInput.Parent = mainFrame

local animSpeedLabel = Instance.new("TextLabel")
animSpeedLabel.Name = randomString()
animSpeedLabel.Size = UDim2.new(0, 100, 0, 20)
animSpeedLabel.Position = UDim2.new(0.5, -110, 0, 75)
animSpeedLabel.BackgroundTransparency = 1
animSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
animSpeedLabel.Text = "Anim Speed:"
animSpeedLabel.Font = Enum.Font.SourceSans
animSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
animSpeedLabel.TextSize = 14
animSpeedLabel.Parent = mainFrame

local animSpeedInput = Instance.new("TextBox")
animSpeedInput.Name = randomString()
animSpeedInput.Size = UDim2.new(0, 100, 0, 25)
animSpeedInput.Position = UDim2.new(0.5, 10, 0, 73)
animSpeedInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
animSpeedInput.BorderColor3 = Color3.fromRGB(100, 100, 100)
animSpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
animSpeedInput.Text = "15"
animSpeedInput.Font = Enum.Font.SourceSans
animSpeedInput.TextSize = 14
animSpeedInput.Parent = mainFrame

local gravityLabel = Instance.new("TextLabel")
gravityLabel.Name = randomString()
gravityLabel.Size = UDim2.new(0, 100, 0, 20)
gravityLabel.Position = UDim2.new(0.5, -110, 0, 110)
gravityLabel.BackgroundTransparency = 1
gravityLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
gravityLabel.Text = "Gravity (0-1):"
gravityLabel.Font = Enum.Font.SourceSans
gravityLabel.TextXAlignment = Enum.TextXAlignment.Left
gravityLabel.TextSize = 14
gravityLabel.Parent = mainFrame

local gravityInput = Instance.new("TextBox")
gravityInput.Name = randomString()
gravityInput.Size = UDim2.new(0, 100, 0, 25)
gravityInput.Position = UDim2.new(0.5, 10, 0, 108)
gravityInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
gravityInput.BorderColor3 = Color3.fromRGB(100, 100, 100)
gravityInput.TextColor3 = Color3.fromRGB(255, 255, 255)
gravityInput.Text = "0.85"
gravityInput.Font = Enum.Font.SourceSans
gravityInput.TextSize = 14
gravityInput.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Name = randomString()
toggleButton.Size = UDim2.new(0, 170, 0, 40)
toggleButton.Position = UDim2.new(0.5, -85, 0, 155)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
toggleButton.BorderColor3 = Color3.fromRGB(255, 100, 100)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Off"
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = mainFrame

local function cleanupCheats(char)
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.WalkSpeed ~= 16 then
        hum.WalkSpeed = 16
    end

    local animController = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
    if animController then
        for _, track in ipairs(animController:GetPlayingAnimationTracks()) do
            if track.Speed ~= 1 then track:AdjustSpeed(1) end
        end
    end
    
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local gravityForce = rootPart:FindFirstChild("FloatyGravity")
        if gravityForce then gravityForce:Destroy() end
        local attachment = rootPart:FindFirstChild("FloatyGravityAttachment")
        if attachment then attachment:Destroy() end
    end
end

RunService.RenderStepped:Connect(function()
    local char = player.Character
    
    if isEnabled then
        if not char then return end
        lastCharacter = char

        local hum = char:FindFirstChildOfClass("Humanoid")
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        local animController = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")

        if not (hum and rootPart and animController) then return end

        local walkSpeed = tonumber(walkSpeedInput.Text) or 1
        local animSpeed = tonumber(animSpeedInput.Text) or 15
        local gravityMultiplier = math.clamp(tonumber(gravityInput.Text) or 0.85, 0, 1)

        if hum.WalkSpeed ~= walkSpeed then hum.WalkSpeed = walkSpeed end

        if hum.MoveDirection.Magnitude > 0.1 then
             for _, track in ipairs(animController:GetPlayingAnimationTracks()) do
                if track.Speed ~= animSpeed then track:AdjustSpeed(animSpeed) end
            end
        else
            for _, track in ipairs(animController:GetPlayingAnimationTracks()) do
                if track.Speed ~= 1 then track:AdjustSpeed(1) end
            end
        end
        
        local gravityForce = rootPart:FindFirstChild("FloatyGravity")
        local state = hum:GetState()
        
        if state == Enum.HumanoidStateType.Freefall then
            if not gravityForce then
                local attachment = Instance.new("Attachment", rootPart)
                attachment.Name = "FloatyGravityAttachment"
                
                gravityForce = Instance.new("VectorForce", rootPart)
                gravityForce.Name = "FloatyGravity"
                gravityForce.Attachment0 = attachment
                gravityForce.RelativeTo = Enum.ForceRelativeTo.World
            end
            gravityForce.Force = Vector3.new(0, hum:GetMass() * workspace.Gravity * gravityMultiplier, 0)
        else
            if gravityForce then
                gravityForce.Force = Vector3.new(0, 0, 0)
            end
        end

    else
        if lastCharacter then
            cleanupCheats(lastCharacter)
            lastCharacter = nil
        end
    end
end)

local function onToggle()
    isEnabled = not isEnabled
    
    if isEnabled then
        toggleButton.Text = "On"
        toggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        toggleButton.BorderColor3 = Color3.fromRGB(100, 255, 100)
    else
        toggleButton.Text = "Off"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        toggleButton.BorderColor3 = Color3.fromRGB(255, 100, 100)
        cleanupCheats(player.Character)
    end
end

closeButton.MouseButton1Click:Connect(function()
    cleanupCheats(player.Character)
    screenGui:Destroy()
end)

toggleButton.MouseButton1Click:Connect(onToggle)
