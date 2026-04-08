local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0

local unlocked = false
local gate = Instance.new("Frame", gui)
gate.Size = UDim2.new(0,300,0,170)
gate.Position = UDim2.new(0.5,0,0.5,0)
gate.AnchorPoint = Vector2.new(0.5,0.5)
gate.BackgroundColor3 = Color3.fromRGB(0,0,0)
gate.BackgroundTransparency = 0.3
Instance.new("UICorner", gate).CornerRadius = UDim.new(0,12)

local gateTitle = Instance.new("TextLabel", gate)
gateTitle.Size = UDim2.new(1,0,0,35)
gateTitle.Text = "TON Hub"
gateTitle.BackgroundTransparency = 1
gateTitle.TextColor3 = Color3.new(1,1,1)
gateTitle.Font = Enum.Font.GothamSemibold
gateTitle.TextScaled = true

local gateInfo = Instance.new("TextLabel", gate)
gateInfo.Size = UDim2.new(1,-20,0,50)
gateInfo.Position = UDim2.new(0,10,0,40)
gateInfo.Text = "Советую подписаться на мой тгк! зайдешь и поймешь=)"
gateInfo.BackgroundTransparency = 1
gateInfo.TextColor3 = Color3.fromRGB(250,250,250)
gateInfo.Font = Enum.Font.Gotham
gateInfo.TextWrapped = true
gateInfo.TextSize = 14

local openTG = Instance.new("TextButton", gate)
openTG.Size = UDim2.new(1,-20,0,35)
openTG.Position = UDim2.new(0,10,0.97,-70)
openTG.Text = "Ссылка на тгк"
openTG.BackgroundColor3 = Color3.fromRGB(30,30,30)
openTG.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", openTG)

openTG.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/RobloxScripts404")
    local originalBg = openTG.BackgroundColor3
    local originalText = openTG.TextColor3
    local highlightBg = Color3.fromRGB(0, 255, 0)
    local highlightText = Color3.fromRGB(255, 255, 255)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween1 = TweenService:Create(openTG, tweenInfo, {BackgroundColor3 = highlightBg, TextColor3 = highlightText})
    tween1:Play()
    tween1.Completed:Connect(function()
        local tween2 = TweenService:Create(openTG, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = originalBg, TextColor3 = originalText})
        tween2:Play()
    end)
end)

local cont = Instance.new("TextButton", gate)
cont.Size = UDim2.new(1,-20,0,30)
cont.Position = UDim2.new(0,10,1,-35)
cont.Text = "Продолжить"
cont.BackgroundColor3 = Color3.fromRGB(30,30,30)
cont.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", cont)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,700,0,450)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.4
frame.Visible = false
frame.Active = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(0,200,0,35)
title.Position = UDim2.new(0.5,0,0,15)
title.AnchorPoint = Vector2.new(0.5,0)
title.Text = "TON Hub"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamSemibold
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Center

local menu = Instance.new("Frame", frame)
menu.Size = UDim2.new(0,160,1,-70)
menu.Position = UDim2.new(0,10,0,60)
menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
menu.BackgroundTransparency = 0.5
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,12)

local pages = Instance.new("Frame", frame)
pages.Size = UDim2.new(1,-190,1,-60)
pages.Position = UDim2.new(0,180,0,60)
pages.BackgroundTransparency = 1

local function newPage()
    local p = Instance.new("Frame", pages)
    p.Size = UDim2.new(1,0,1,0)
    p.BackgroundTransparency = 1
    p.Visible = false
    local layout = Instance.new("UIListLayout", p)
    layout.Padding = UDim.new(0,10)
    return p
end

local case = newPage()
local misc = newPage()
local info = newPage()
case.Visible = true

local function switch(p)
    for _,v in pairs(pages:GetChildren()) do
        if v:IsA("Frame") then v.Visible = false end
    end
    p.Visible = true
end

local function menuBtn(text,p)
    local count = 0
    for _,v in pairs(menu:GetChildren()) do
        if v:IsA("TextButton") then count += 1 end
    end
    local b = Instance.new("TextButton", menu)
    b.Size = UDim2.new(1,-20,0,40)
    b.Position = UDim2.new(0,10,0,10 + count*50)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(20,20,20)
    b.BackgroundTransparency = 0.3
    b.TextColor3 = Color3.fromRGB(230,230,230)
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    b.MouseButton1Click:Connect(function() switch(p) end)
end

menuBtn("Case",case)
menuBtn("Misc",misc)
menuBtn("Info",info)

local function createInput(parent,placeholder,posY)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(1,-20,0,35)
    box.Position = UDim2.new(0,10,0,posY)
    box.Text = ""
    box.PlaceholderText = placeholder
    box.ClearTextOnFocus = false
    box.BackgroundColor3 = Color3.fromRGB(30,30,30)
    box.BackgroundTransparency = 0.3
    box.TextColor3 = Color3.new(1,1,1)
    box.PlaceholderColor3 = Color3.fromRGB(150,150,150)
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    box.TextXAlignment = Enum.TextXAlignment.Center
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)
    return box
end

local function createButton(parent,text,posY,callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-20,0,35)
    b.Position = UDim2.new(0,10,0,posY)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(20,20,20)
    b.BackgroundTransparency = 0.3
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.MouseButton1Click:Connect(function() callback(b) end)
    return b
end

local caseCard = Instance.new("Frame", case)
caseCard.Size = UDim2.new(1,-10,0,225)
caseCard.BackgroundColor3 = Color3.fromRGB(0,0,0)
caseCard.BackgroundTransparency = 0.5
Instance.new("UICorner", caseCard).CornerRadius = UDim.new(0,12)

local amountTitle = Instance.new("TextLabel", caseCard)
amountTitle.Position = UDim2.new(0,10,0,10)
amountTitle.Size = UDim2.new(1,-20,0,20)
amountTitle.Text = "Amount to open (1-10)"
amountTitle.BackgroundTransparency = 1
amountTitle.TextColor3 = Color3.new(1,1,1)
amountTitle.Font = Enum.Font.GothamSemibold
amountTitle.TextSize = 14
amountTitle.TextXAlignment = Enum.TextXAlignment.Center

local amountBox = createInput(caseCard,"e.g. 10",35)

local caseTitle = Instance.new("TextLabel", caseCard)
caseTitle.Position = UDim2.new(0,10,0,75)
caseTitle.Size = UDim2.new(1,-20,0,20)
caseTitle.Text = "Case(s) to open"
caseTitle.BackgroundTransparency = 1
caseTitle.TextColor3 = Color3.new(1,1,1)
caseTitle.Font = Enum.Font.GothamSemibold
caseTitle.TextSize = 14
caseTitle.TextXAlignment = Enum.TextXAlignment.Center

local caseInput = createInput(caseCard,"e.g. Cursed Demon",95)

local function processCases()
    local amount = tonumber(amountBox.Text) or 1
    if amount < 1 then amount = 1 end
    if amount > 10 then amount = 10 end
    local caseText = caseInput.Text
    if caseText == "" then return end
    local remote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("OpenCase")
    for name in caseText:gmatch("[^,]+") do
        local trimmed = name:match("^%s*(.-)%s*$")
        if trimmed ~= "" then
            pcall(function() remote:InvokeServer(trimmed, amount) end)
        end
    end
end

createButton(caseCard,"OPEN",140,function() processCases() end)

local autoOpen = false
createButton(caseCard,"AUTO: OFF",180,function(btn)
    autoOpen = not autoOpen
    btn.Text = autoOpen and "AUTO: ON" or "AUTO: OFF"
    if autoOpen then
        task.spawn(function()
            while autoOpen do
                processCases()
                task.wait(1)
            end
        end)
    end
end)

local miscCard = Instance.new("Frame", misc)
miscCard.Size = UDim2.new(1,-10,0,100)
miscCard.BackgroundColor3 = Color3.fromRGB(0,0,0)
miscCard.BackgroundTransparency = 0.5
Instance.new("UICorner", miscCard).CornerRadius = UDim.new(0,12)

local sellTitle = Instance.new("TextLabel", miscCard)
sellTitle.Position = UDim2.new(0,10,0,10)
sellTitle.Size = UDim2.new(1,-20,0,20)
sellTitle.Text = "Automatically sells all items"
sellTitle.BackgroundTransparency = 1
sellTitle.TextColor3 = Color3.new(1,1,1)
sellTitle.Font = Enum.Font.GothamSemibold
sellTitle.TextSize = 14
sellTitle.TextXAlignment = Enum.TextXAlignment.Center

local autoSell = false
createButton(miscCard,"Auto Sell: OFF",40,function(btn)
    autoSell = not autoSell
    btn.Text = autoSell and "Auto Sell: ON" or "Auto Sell: OFF"
    if autoSell then
        task.spawn(function()
            while autoSell do
                pcall(function()
                    local args = {"Sell","ALL",false}
                    ReplicatedStorage:WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
                end)
                task.wait(2)
            end
        end)
    end
end)

local avatar = Instance.new("ImageLabel", frame)
avatar.Size = UDim2.new(0,38,0,38)
avatar.Position = UDim2.new(0,15,0,15)
avatar.BackgroundTransparency = 1
avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
Instance.new("UICorner", avatar).CornerRadius = UDim.new(1,0)

local display = Instance.new("TextLabel", frame)
display.Size = UDim2.new(0,120,0,18)
display.Position = UDim2.new(0,60,0,18)
display.Text = player.DisplayName
display.TextColor3 = Color3.new(1,1,1)
display.BackgroundTransparency = 1
display.Font = Enum.Font.GothamSemibold
display.TextSize = 14
display.TextXAlignment = Enum.TextXAlignment.Left

local username = Instance.new("TextLabel", frame)
username.Size = UDim2.new(0,120,0,16)
username.Position = UDim2.new(0,60,0,38)
username.Text = "@"..player.Name
username.TextColor3 = Color3.fromRGB(140,140,140)
username.BackgroundTransparency = 1
username.Font = Enum.Font.Gotham
username.TextSize = 12
username.TextXAlignment = Enum.TextXAlignment.Left

local welcome = Instance.new("TextLabel", frame)
welcome.Size = UDim2.new(0,150,0,20)
welcome.Position = UDim2.new(0,30.9,1,-50) -- 25 пикселей от низа
welcome.Text = "Welcome!=)"
welcome.TextColor3 = Color3.new(1,1,1)
welcome.BackgroundTransparency = 1 -- фон убран
welcome.Font = Enum.Font.GothamSemibold
welcome.TextSize = 23
welcome.TextXAlignment = Enum.TextXAlignment.Left

local creatorPanel = Instance.new("Frame", info)
creatorPanel.Size = UDim2.new(1, -20, 0, 60)
creatorPanel.Position = UDim2.new(0, 10, 1, -70)
creatorPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
creatorPanel.BackgroundTransparency = 0.5
Instance.new("UICorner", creatorPanel).CornerRadius = UDim.new(0, 12)

local creatorLeftMargin = 10
local creatorAvatar = Instance.new("ImageLabel", creatorPanel)
creatorAvatar.Size = UDim2.new(0, 38, 0, 38)
creatorAvatar.Position = UDim2.new(0, creatorLeftMargin, 0, 10)
creatorAvatar.BackgroundTransparency = 1
local creatorUserId = 3567222865
creatorAvatar.Image = Players:GetUserThumbnailAsync(creatorUserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
Instance.new("UICorner", creatorAvatar).CornerRadius = UDim.new(1, 0)

local creatorDisplay = Instance.new("TextLabel", creatorPanel)
creatorDisplay.Size = UDim2.new(0, 120, 0, 18)
creatorDisplay.Position = UDim2.new(0, creatorLeftMargin + 45, 0, 12)
creatorDisplay.Text = "SomeMi9bro"
creatorDisplay.TextColor3 = Color3.new(1, 1, 1)
creatorDisplay.BackgroundTransparency = 1
creatorDisplay.Font = Enum.Font.GothamSemibold
creatorDisplay.TextSize = 14
creatorDisplay.TextXAlignment = Enum.TextXAlignment.Left

local creatorUsername = Instance.new("TextLabel", creatorPanel)
creatorUsername.Size = UDim2.new(0, 120, 0, 16)
creatorUsername.Position = UDim2.new(0, creatorLeftMargin + 45, 0, 32)
creatorUsername.Text = "@lika1234ggdd"
creatorUsername.TextColor3 = Color3.fromRGB(140, 140, 140)
creatorUsername.BackgroundTransparency = 1
creatorUsername.Font = Enum.Font.Gotham
creatorUsername.TextSize = 12
creatorUsername.TextXAlignment = Enum.TextXAlignment.Left

local creatorTag = Instance.new("TextLabel", creatorPanel)
creatorTag.Size = UDim2.new(0, 60, 0, 16)
creatorTag.Position = UDim2.new(0, creatorLeftMargin + 250 + 125, 0, 20)
creatorTag.Text = "Creator"
creatorTag.TextColor3 = Color3.fromRGB(300, 300, 300)
creatorTag.BackgroundTransparency = 1
creatorTag.Font = Enum.Font.GothamBold
creatorTag.TextSize = 25
creatorTag.TextXAlignment = Enum.TextXAlignment.Left
creatorTag.TextYAlignment = Enum.TextYAlignment.Center

local keybindPanel = Instance.new("Frame", info)
keybindPanel.Size = UDim2.new(1, -20, 0, 60)
keybindPanel.Position = UDim2.new(0, 10, 1, -140)
keybindPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keybindPanel.BackgroundTransparency = 0.5
Instance.new("UICorner", keybindPanel).CornerRadius = UDim.new(0, 12)

local keybindTitle = Instance.new("TextLabel", keybindPanel)
keybindTitle.Size = UDim2.new(1, -20, 0, 20)
keybindTitle.Position = UDim2.new(0, 10, 0, 10)
keybindTitle.Text = "Keybind (Z)"
keybindTitle.BackgroundTransparency = 1
keybindTitle.TextColor3 = Color3.new(1,1,1)
keybindTitle.Font = Enum.Font.GothamSemibold
keybindTitle.TextSize = 16
keybindTitle.TextXAlignment = Enum.TextXAlignment.Left

local keybindDesc = Instance.new("TextLabel", keybindPanel)
keybindDesc.Size = UDim2.new(1, -20, 0, 20)
keybindDesc.Position = UDim2.new(0, 10, 0, 32)
keybindDesc.Text = "Keybind to open UI"
keybindDesc.BackgroundTransparency = 1
keybindDesc.TextColor3 = Color3.fromRGB(140,140,140)
keybindDesc.Font = Enum.Font.Gotham
keybindDesc.TextSize = 13
keybindDesc.TextXAlignment = Enum.TextXAlignment.Left

local function dropletTween(guiFrame, open)
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local goal = {}
    if open then
        guiFrame.AnchorPoint = Vector2.new(0.5,0.5)
        guiFrame.Position = UDim2.new(0.5,0,0.5,0)
        guiFrame.Size = UDim2.new(0,0,0,0)
        guiFrame.Visible = true
        goal.Size = UDim2.new(0,700,0,450)
    else
        tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        goal.Size = UDim2.new(0,0,0,0)
    end
    local tween = TweenService:Create(guiFrame, tweenInfo, goal)
    tween:Play()
    if not open then
        tween.Completed:Connect(function() guiFrame.Visible = false end)
    end
    for _,child in pairs(guiFrame:GetDescendants()) do
        if (child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("Frame")) and child ~= title then
            child.TextTransparency = open and 1 or 0
            local bgTrans = child.BackgroundTransparency
            child.BackgroundTransparency = open and 1 or bgTrans
            TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = open and 0 or 1, BackgroundTransparency = open and bgTrans or 1 }):Play()
        end
    end
end

cont.MouseButton1Click:Connect(function()
    unlocked = true
    gate:Destroy()
    dropletTween(frame, true)
    TweenService:Create(blur,TweenInfo.new(0.3),{Size = 15}):Play()
end)

local unloaded = false
UIS.InputBegan:Connect(function(input,gp)
    if gp or unloaded or not unlocked then return end
    if input.KeyCode == Enum.KeyCode.Z then
        dropletTween(frame, not frame.Visible)
        TweenService:Create(blur,TweenInfo.new(0.3),{Size = not frame.Visible and 15 or 0}):Play()
    end
end)

local function makeDraggable(guiObject)
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    local function update(input)
        local delta = input.Position - dragStart
        guiObject.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

makeDraggable(gate)
makeDraggable(frame)