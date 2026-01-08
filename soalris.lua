local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()

-- ============================================================================
-- [ ГЛОБАЛЬНЫЕ НАСТРОЙКИ ]
-- ============================================================================
local GlobalSettings = {
    GlowMode = "Spin"
}

-- ============================================================================
-- [ ТЕМЫ ]
-- ============================================================================
local Themes = {
    Default = {
        Main        = Color3.fromRGB(25, 25, 30),
        Second      = Color3.fromRGB(35, 35, 40),
        Accent      = Color3.fromRGB(0, 160, 255),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 160, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))},
        Text        = Color3.fromRGB(255, 255, 255),
        TextDark    = Color3.fromRGB(170, 170, 170),
        Error       = Color3.fromRGB(255, 60, 60)
    },
    Blood = {
        Main        = Color3.fromRGB(20, 15, 15),
        Second      = Color3.fromRGB(30, 20, 20),
        Accent      = Color3.fromRGB(220, 40, 40),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))},
        Text        = Color3.fromRGB(255, 240, 240),
        TextDark    = Color3.fromRGB(170, 120, 120),
        Error       = Color3.fromRGB(255, 0, 0)
    },
    Purple = {
        Main        = Color3.fromRGB(20, 15, 25),
        Second      = Color3.fromRGB(30, 25, 40),
        Accent      = Color3.fromRGB(160, 80, 255),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))},
        Text        = Color3.fromRGB(240, 230, 255),
        TextDark    = Color3.fromRGB(160, 140, 190),
        Error       = Color3.fromRGB(255, 0, 100)
    },
    Abyss = {
        Main        = Color3.fromRGB(20, 15, 25),
        Second      = Color3.fromRGB(30, 25, 40),
        Accent      = Color3.fromRGB(100, 0, 255),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 0, 200)), ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 50, 255))},
        Text        = Color3.fromRGB(240, 230, 255),
        TextDark    = Color3.fromRGB(160, 140, 190),
        Error       = Color3.fromRGB(255, 0, 100)
    },
    Ocean = {
        Main        = Color3.fromRGB(15, 25, 35),
        Second      = Color3.fromRGB(25, 35, 45),
        Accent      = Color3.fromRGB(0, 255, 200),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 150))},
        Text        = Color3.fromRGB(220, 255, 255),
        TextDark    = Color3.fromRGB(120, 170, 170),
        Error       = Color3.fromRGB(255, 80, 80)
    },
    Toxic = {
        Main        = Color3.fromRGB(10, 20, 10),
        Second      = Color3.fromRGB(20, 30, 20),
        Accent      = Color3.fromRGB(50, 255, 100),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 255, 150))},
        Text        = Color3.fromRGB(220, 255, 220),
        TextDark    = Color3.fromRGB(120, 170, 120),
        Error       = Color3.fromRGB(255, 50, 50)
    },
    Sunrise = {
        Main        = Color3.fromRGB(30, 20, 15),
        Second      = Color3.fromRGB(40, 30, 25),
        Accent      = Color3.fromRGB(255, 150, 0),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))},
        Text        = Color3.fromRGB(255, 240, 230),
        TextDark    = Color3.fromRGB(170, 140, 120),
        Error       = Color3.fromRGB(255, 0, 0)
    },
    Vaporwave = {
        Main        = Color3.fromRGB(30, 20, 35),
        Second      = Color3.fromRGB(45, 30, 50),
        Accent      = Color3.fromRGB(255, 100, 200),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))},
        Text        = Color3.fromRGB(255, 230, 255),
        TextDark    = Color3.fromRGB(170, 120, 170),
        Error       = Color3.fromRGB(255, 50, 100)
    },
    Gold = {
        Main        = Color3.fromRGB(25, 20, 10),
        Second      = Color3.fromRGB(35, 30, 20),
        Accent      = Color3.fromRGB(255, 200, 50),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 0))},
        Text        = Color3.fromRGB(255, 250, 220),
        TextDark    = Color3.fromRGB(170, 160, 120),
        Error       = Color3.fromRGB(255, 50, 50)
    },
    Orange = {
        Main        = Color3.fromRGB(20, 20, 20),
        Second      = Color3.fromRGB(35, 30, 25),
        Accent      = Color3.fromRGB(218, 165, 32),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(184, 134, 11))},
        Text        = Color3.fromRGB(255, 250, 220),
        TextDark    = Color3.fromRGB(170, 160, 120),
        Error       = Color3.fromRGB(255, 50, 50)
    },
    Mint = {
        Main        = Color3.fromRGB(20, 25, 25),
        Second      = Color3.fromRGB(30, 35, 35),
        Accent      = Color3.fromRGB(100, 255, 180),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 255, 150)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 255, 250))},
        Text        = Color3.fromRGB(230, 255, 240),
        TextDark    = Color3.fromRGB(130, 170, 160),
        Error       = Color3.fromRGB(255, 80, 80)
    },
    Night = {
        Main        = Color3.fromRGB(10, 10, 20),
        Second      = Color3.fromRGB(20, 20, 35),
        Accent      = Color3.fromRGB(80, 120, 255),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 255))},
        Text        = Color3.fromRGB(230, 230, 255),
        TextDark    = Color3.fromRGB(120, 120, 170),
        Error       = Color3.fromRGB(255, 80, 80)
    },
    Void = {
        Main        = Color3.fromRGB(15, 15, 15),
        Second      = Color3.fromRGB(30, 30, 30),
        Accent      = Color3.fromRGB(200, 200, 200),
        Gradient    = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
        Text        = Color3.fromRGB(255, 255, 255),
        TextDark    = Color3.fromRGB(150, 150, 150),
        Error       = Color3.fromRGB(255, 100, 100)
    }
}

-- ============================================================================
-- [ УТИЛИТЫ ]
-- ============================================================================
local function GetTheme(cfg)
    if type(cfg) == "table" then return cfg end
    return Themes[cfg] or Themes.Default
end

local function Create(class, properties)
    local instance = Instance.new(class)
    for k, v in pairs(properties) do
        instance[k] = v
    end
    return instance
end

local function AddCorner(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = instance
    return corner
end

local function AddLiquidStroke(instance, theme)
    local stroke = Create("UIStroke", {
        Color = Color3.new(1,1,1),
        Thickness = 1.5,
        Transparency = 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = instance
    })
    local gradient = Create("UIGradient", { Color = theme.Gradient, Rotation = 45, Parent = stroke })
    task.spawn(function()
        while stroke.Parent do
            if GlobalSettings.GlowMode == "Spin" then
                gradient.Rotation = gradient.Rotation + 1
            elseif GlobalSettings.GlowMode == "Pulse" then
                gradient.Rotation = gradient.Rotation + 1
                local t = (math.sin(tick() * 3) + 1) / 2
                stroke.Transparency = 0.2 + (t * 0.6)
            end
            task.wait(0.02)
        end
    end)
    return stroke
end

local function AddSoftOrbs(parent, theme)
    local Container = Create("Frame", {
        Parent = parent, Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, ZIndex = 1, ClipsDescendants = true
    })
    
    local function Spawn(size, color)
        local Orb = Create("Frame", {
            Parent = Container,
            Size = UDim2.fromOffset(size, size),
            Position = UDim2.fromScale(math.random(5,95)/100, math.random(5,95)/100),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = color,
            BackgroundTransparency = 0.92,
            BorderSizePixel = 0,
            ZIndex = 1
        })
        AddCorner(Orb, 1000)
        local Grad = Create("UIGradient", {
            Parent = Orb,
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.5),
                NumberSequenceKeypoint.new(1, 1)
            }
        })

        task.spawn(function()
            while Orb.Parent do
                local targetPos = UDim2.fromScale(math.random(10,90)/100, math.random(10,90)/100)
                TweenService:Create(Orb, TweenInfo.new(math.random(15, 30), Enum.EasingStyle.Sine), {Position = targetPos}):Play()
                task.wait(math.random(15, 30))
            end
        end)
    end

    for i = 1, 10 do
        Spawn(math.random(100, 350), (i % 2 == 0) and theme.Accent or theme.Second)
    end
end

local function CreateRipple(btn, color)
    btn.ClipsDescendants = true
    btn.MouseButton1Click:Connect(function()
        local ripple = Create("Frame", {
            Name = "Ripple", Parent = btn, BackgroundColor3 = color,
            BackgroundTransparency = 0.6, Position = UDim2.new(0, Mouse.X - btn.AbsolutePosition.X, 0, Mouse.Y - btn.AbsolutePosition.Y),
            Size = UDim2.new(0, 0, 0, 0), ZIndex = 20, AnchorPoint = Vector2.new(0.5, 0.5)
        })
        AddCorner(ripple, 100)
        local tween = TweenService:Create(ripple, TweenInfo.new(0.5), { Size = UDim2.new(0, 400, 0, 400), BackgroundTransparency = 1 })
        tween:Play()
        tween.Completed:Connect(function() ripple:Destroy() end)
    end)
end

local function MakeDraggable(topbar, frame)
    local dragging, dragInput, dragStart, startPos
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    topbar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            TweenService:Create(frame, TweenInfo.new(0.05), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
        end
    end)
end

local function MakeResizable(handle, frame)
    local dragging, dragStart, startSize
    local MinSize = Vector2.new(450, 300)
    local MaxSize = Vector2.new(900, 700)
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startSize = frame.AbsoluteSize
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            local newX = math.clamp(startSize.X + delta.X, MinSize.X, MaxSize.X)
            local newY = math.clamp(startSize.Y + delta.Y, MinSize.Y, MaxSize.Y)
            TweenService:Create(frame, TweenInfo.new(0.05), {Size = UDim2.fromOffset(newX, newY)}):Play()
        end
    end)
end

-- ============================================================================
-- [ KEY SYSTEM ]
-- ============================================================================
function Library:KeySystem(Settings)
    local Config = Settings or {}
    local Key = Config.Key; if not Key or Key == "" then return end
    
    local LinkToCopy = tostring(Config.Link or "https://google.com")
    local SelectedTheme = GetTheme(Config.Theme)
    local Validated = false

    local ScreenGui = Create("ScreenGui", { Name = "LiquidKey", ResetOnSpawn = false, DisplayOrder = 20000 })
    if RunService:IsStudio() then ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") else pcall(function() ScreenGui.Parent = CoreGui end) if not ScreenGui.Parent then ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end end

    local Main = Create("Frame", { Parent = ScreenGui, Size = UDim2.fromOffset(0,0), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = SelectedTheme.Main, BackgroundTransparency = 0.1, ClipsDescendants = true })
    AddCorner(Main, 14); AddLiquidStroke(Main, SelectedTheme); AddSoftOrbs(Main, SelectedTheme)
    TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(450, 250)}):Play()
    
    local Content = Create("Frame", { Parent = Main, Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, ZIndex = 2 })
    Create("TextLabel", { Parent = Content, Size = UDim2.new(1,0,0,50), BackgroundTransparency = 1, Text = Config.Title or "Security Access", Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.Text, TextSize = 22, ZIndex = 3 })
    
    local Input = Create("TextBox", { 
        Parent = Content, Size = UDim2.new(1, -60, 0, 45), Position = UDim2.new(0, 30, 0, 70), 
        BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.7, 
        Text = "", PlaceholderText = "Enter License Key...", TextColor3 = SelectedTheme.Text, Font = Enum.Font.Gotham, TextSize = 14, ZIndex = 3 
    }); AddCorner(Input, 8)
    local InputStroke = AddLiquidStroke(Input, SelectedTheme)
    InputStroke.Transparency = 0.8

    local CheckColor = Color3.new(SelectedTheme.Accent.R * 0.6, SelectedTheme.Accent.G * 0.6, SelectedTheme.Accent.B * 0.6)
    
    local CheckBtn = Create("TextButton", { 
        Parent = Content, Size = UDim2.new(0, 180, 0, 40), Position = UDim2.new(0, 30, 0, 140), 
        BackgroundColor3 = CheckColor, BackgroundTransparency = 0.2,
        Text = "Check Key", Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.Text, TextSize = 14, ZIndex = 3 
    }); AddCorner(CheckBtn, 8); CreateRipple(CheckBtn, Color3.new(1,1,1))
    
    local GetKeyBtn = Create("TextButton", { 
        Parent = Content, Size = UDim2.new(0, 180, 0, 40), Position = UDim2.new(1, -210, 0, 140), 
        BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.5,
        Text = "Get Key Link", Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.TextDark, TextSize = 14, ZIndex = 3 
    }); AddCorner(GetKeyBtn, 8); CreateRipple(GetKeyBtn, SelectedTheme.Accent); AddLiquidStroke(GetKeyBtn, SelectedTheme).Transparency = 0.7

    local Status = Create("TextLabel", { Parent = Content, Size = UDim2.new(1,0,0,20), Position = UDim2.new(0,0,1,-30), BackgroundTransparency = 1, Text = "Protected System", Font = Enum.Font.Gotham, TextColor3 = SelectedTheme.TextDark, TextSize = 12, ZIndex = 3 })

    GetKeyBtn.MouseButton1Click:Connect(function() 
        local success, err = pcall(function()
            if setclipboard then setclipboard(LinkToCopy); return true
            elseif toclipboard then toclipboard(LinkToCopy); return true
            elseif syn and syn.write_clipboard then syn.write_clipboard(LinkToCopy); return true
            elseif Clipboard and Clipboard.set then Clipboard.set(LinkToCopy); return true
            end
            return false
        end)

        if success then
            Status.Text = "Link copied!" 
            Status.TextColor3 = SelectedTheme.Accent 
        else
            Status.Text = "Check Console (F9)" 
            Status.TextColor3 = SelectedTheme.Error
            print("[Library] Copy Link:", LinkToCopy)
        end
        task.wait(2) 
        Status.Text = "Protected System" 
        Status.TextColor3 = SelectedTheme.TextDark
    end)

    CheckBtn.MouseButton1Click:Connect(function()
        if Input.Text == Key then
            TweenService:Create(Main, TweenInfo.new(0.4), {Size = UDim2.fromOffset(0,0)}):Play()
            task.wait(0.4); ScreenGui:Destroy(); Validated = true
        else
            Status.Text = "Incorrect Key!"
            Status.TextColor3 = SelectedTheme.Error
            InputStroke.Color = SelectedTheme.Error; InputStroke.Transparency = 0
            
            local x, y = Main.Position.X.Scale, Main.Position.Y.Scale
            for i = 1, 5 do
                Main.Position = UDim2.fromScale(x + math.random(-1,1)/200, y)
                task.wait(0.04)
            end
            Main.Position = UDim2.fromScale(x, y)
            
            task.wait(1)
            InputStroke.Color = Color3.new(1,1,1); InputStroke.Transparency = 0.8
            Status.Text = "Protected System"; Status.TextColor3 = SelectedTheme.TextDark
        end
    end)
    repeat task.wait() until Validated
end

-- ============================================================================
-- [ MAIN WINDOW ]
-- ============================================================================
function Library:CreateWindow(Settings)
    local Config = Settings or {}
    local Title = Config.Title or "UI"
    local SelectedTheme = GetTheme(Config.Theme)
    local ToggleKey = Config.ToggleKey or Enum.KeyCode.RightControl
    local WindowTrans = Config.Transparency or 0.1

    local ScreenGui = Create("ScreenGui", { Name = "LiquidUI", ResetOnSpawn = false, DisplayOrder = 10000 })
    if RunService:IsStudio() then ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") else pcall(function() ScreenGui.Parent = CoreGui end) if not ScreenGui.Parent then ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end end

    -- === NOTIFICATION SYSTEM ===
    -- Контейнер для уведомлений (справа снизу)
    local NotifContainer = Create("Frame", {
        Parent = ScreenGui, Size = UDim2.new(0, 300, 1, -20), Position = UDim2.new(1, -310, 0, 10),
        BackgroundTransparency = 1, ZIndex = 10000
    })
    local NotifLayout = Create("UIListLayout", {
        Parent = NotifContainer, SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, Padding = UDim.new(0, 10)
    })

    function Library:Notify(NotifyConfig)
        local NTitle = NotifyConfig.Title or "Notification"
        local NContent = NotifyConfig.Content or "Content"
        local NDuration = NotifyConfig.Duration or 3
        local NImage = NotifyConfig.Image or "rbxassetid://10651036728" -- Восклицательный знак в круге

        local Frame = Create("Frame", {
            Parent = NotifContainer, Size = UDim2.new(1, 0, 0, 60), Position = UDim2.new(1, 0, 0, 0), -- Старт за экраном
            BackgroundColor3 = SelectedTheme.Main, BackgroundTransparency = 0.1, ZIndex = 10001
        })
        AddCorner(Frame, 8); AddLiquidStroke(Frame, SelectedTheme).Transparency = 0.5
        
        -- Иконка
        local Icon = Create("ImageLabel", {
            Parent = Frame, Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(0, 10, 0.5, -15),
            BackgroundTransparency = 1, Image = NImage, ImageColor3 = SelectedTheme.Accent, ZIndex = 10002
        })
        
        -- Заголовок
        Create("TextLabel", {
            Parent = Frame, Size = UDim2.new(1, -60, 0, 20), Position = UDim2.new(0, 50, 0, 8),
            BackgroundTransparency = 1, Text = NTitle, Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 10002
        })
        
        -- Описание
        Create("TextLabel", {
            Parent = Frame, Size = UDim2.new(1, -60, 0, 20), Position = UDim2.new(0, 50, 0, 28),
            BackgroundTransparency = 1, Text = NContent, Font = Enum.Font.Gotham, TextColor3 = SelectedTheme.TextDark, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 10002
        })
        
        -- Полоска таймера
        local BarBg = Create("Frame", { Parent = Frame, Size = UDim2.new(1, -20, 0, 3), Position = UDim2.new(0, 10, 1, -5), BackgroundColor3 = SelectedTheme.Second, BorderSizePixel = 0, ZIndex = 10002 }); AddCorner(BarBg, 2)
        local Bar = Create("Frame", { Parent = BarBg, Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = SelectedTheme.Accent, BorderSizePixel = 0, ZIndex = 10003 }); AddCorner(Bar, 2)
        
        -- Анимация появления
        TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
        -- Анимация бара
        TweenService:Create(Bar, TweenInfo.new(NDuration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
        
        task.spawn(function()
            task.wait(NDuration)
            -- Анимация исчезновения
            TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 50, 0, 0), BackgroundTransparency = 1}):Play()
            task.wait(0.5)
            Frame:Destroy()
        end)
    end
    -- ==================================

    local Main = Create("Frame", {
        Name = "Main", Parent = ScreenGui, Size = UDim2.fromOffset(600, 400), Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = SelectedTheme.Main, BackgroundTransparency = WindowTrans, 
        BorderSizePixel = 0, ClipsDescendants = true 
    })
    AddCorner(Main, 14); AddLiquidStroke(Main, SelectedTheme); AddSoftOrbs(Main, SelectedTheme)

    Main.Size = UDim2.fromOffset(0,0)
    TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(600, 400)}):Play()

    -- RESIZE HANDLE
    local ResizeBtn = Create("TextButton", {
        Parent = Main, Size = UDim2.fromOffset(25, 25), Position = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(1, 1),
        BackgroundTransparency = 1, Text = "", ZIndex = 2000
    })
    local Line1 = Create("Frame", { Parent = ResizeBtn, Size = UDim2.new(0, 14, 0, 2), Position = UDim2.new(1, -9, 1, -9), AnchorPoint = Vector2.new(0.5,0.5), Rotation = -45, BackgroundColor3 = SelectedTheme.TextDark, BackgroundTransparency = 0.3, BorderSizePixel = 0, ZIndex = 2001 })
    local Line2 = Create("Frame", { Parent = ResizeBtn, Size = UDim2.new(0, 7, 0, 2), Position = UDim2.new(1, -5, 1, -5), AnchorPoint = Vector2.new(0.5,0.5), Rotation = -45, BackgroundColor3 = SelectedTheme.TextDark, BackgroundTransparency = 0.3, BorderSizePixel = 0, ZIndex = 2001 })
    MakeResizable(ResizeBtn, Main)

    local TopBar = Create("Frame", { Parent = Main, Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, ZIndex = 5 })
    MakeDraggable(TopBar, Main)
    Create("TextLabel", { Parent = TopBar, Size = UDim2.new(1, -40, 1, 0), Position = UDim2.new(0, 15, 0, 0), BackgroundTransparency = 1, Text = Title, Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.Text, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6 })
    local Close = Create("TextButton", { Parent = TopBar, Size = UDim2.new(0, 40, 1, 0), Position = UDim2.new(1, -40, 0, 0), BackgroundTransparency = 1, Text = "×", Font = Enum.Font.Gotham, TextColor3 = SelectedTheme.Text, TextSize = 28, ZIndex = 6 })
    Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local TabContainer = Create("ScrollingFrame", { Parent = Main, Size = UDim2.new(0, 150, 1, -50), Position = UDim2.new(0, 10, 0, 45), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.5, ScrollBarThickness = 0, BorderSizePixel = 0, ZIndex = 5 }); AddCorner(TabContainer, 8)
    Create("UIListLayout", { Parent = TabContainer, Padding = UDim.new(0, 8) }); 
    Create("UIPadding", { Parent = TabContainer, PaddingTop = UDim.new(0, 10), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5) })
    
    -- VISIBLE SIDEBAR RESIZER (DOTS FIX)
    local SidebarResizer = Create("TextButton", {
        Parent = Main, Size = UDim2.new(0, 12, 1, -50), Position = UDim2.new(0, 150, 0, 45),
        BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 20
    })
    local GripFrame = Create("Frame", { Parent = SidebarResizer, Size = UDim2.fromOffset(4, 20), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1 })
    Create("UIListLayout", { Parent = GripFrame, FillDirection = Enum.FillDirection.Vertical, Padding = UDim.new(0, 4), HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder })
    for i = 1, 3 do 
        local Dot = Create("Frame", { Parent = GripFrame, Size = UDim2.fromOffset(4, 4), BackgroundColor3 = SelectedTheme.TextDark, BackgroundTransparency = 0.4, BorderSizePixel = 0 }); AddCorner(Dot, 100)
    end
    
    local ProfileFrame = Create("Frame", {
        Parent = Main, Size = UDim2.new(0, 150, 0, 45), Position = UDim2.new(0, 10, 1, -55),
        BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.5, BorderSizePixel = 0, ZIndex = 5
    }); AddCorner(ProfileFrame, 8)
    local AvatarImg = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    pcall(function() AvatarImg = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48) end)
    local Avatar = Create("ImageLabel", { Parent = ProfileFrame, Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(0, 8, 0.5, -15), BackgroundTransparency = 1, Image = AvatarImg, ZIndex = 6 }); AddCorner(Avatar, 100)
    Create("TextLabel", { Parent = ProfileFrame, Size = UDim2.new(1, -50, 0, 15), Position = UDim2.new(0, 45, 0, 8), BackgroundTransparency = 1, Text = Players.LocalPlayer.DisplayName, Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.Text, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6, TextTruncate = Enum.TextTruncate.AtEnd })
    Create("TextLabel", { Parent = ProfileFrame, Size = UDim2.new(1, -50, 0, 15), Position = UDim2.new(0, 45, 0, 23), BackgroundTransparency = 1, Text = "@"..Players.LocalPlayer.Name, Font = Enum.Font.Gotham, TextColor3 = SelectedTheme.TextDark, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6, TextTruncate = Enum.TextTruncate.AtEnd })

    local PageContainer = Create("Frame", { Parent = Main, Size = UDim2.new(1, -170, 1, -50), Position = UDim2.new(0, 170, 0, 45), BackgroundTransparency = 1, ZIndex = 5, ClipsDescendants = true })

    -- SIDEBAR RESIZE LOGIC
    local draggingSidebar = false
    local SidebarWidth = 150
    local MinSidebar, MaxSidebar = 150, 350
    
    SidebarResizer.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSidebar = true end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSidebar = false end end)
    UserInputService.InputChanged:Connect(function(input)
        if draggingSidebar and input.UserInputType == Enum.UserInputType.MouseMovement then
            local MouseX = input.Position.X
            local FrameX = Main.AbsolutePosition.X
            local RelX = MouseX - FrameX
            local NewWidth = math.clamp(RelX - 10, MinSidebar, MaxSidebar)
            
            TabContainer.Size = UDim2.new(0, NewWidth, 1, -105)
            ProfileFrame.Size = UDim2.new(0, NewWidth, 0, 45)
            SidebarResizer.Position = UDim2.new(0, NewWidth + 5, 0, 45) 
            PageContainer.Position = UDim2.new(0, NewWidth + 20, 0, 45) 
            PageContainer.Size = UDim2.new(1, -(NewWidth + 25), 1, -50)
        end
    end)

    local IsOpen, LastSize = true, UDim2.fromOffset(600, 400)
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == ToggleKey then IsOpen = not IsOpen; if IsOpen then Main.Visible = true; TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = LastSize}):Play() else LastSize = Main.Size; local close = TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.fromOffset(0, 0)}); close:Play(); close.Completed:Connect(function() if not IsOpen then Main.Visible = false end end) end end
    end)

    local Funcs = {}
    local TabCount = 0
    local ActiveTab = nil

    function Funcs:CreateTab(TabName)
        TabCount = TabCount + 1
        local MyIndex = TabCount
        
        local Tab = {}
        local TabBtn = Create("TextButton", { Parent = TabContainer, Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.8, Text = TabName, Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.TextDark, TextSize = 14, ZIndex = 6, AutoButtonColor = false }); AddCorner(TabBtn, 6)
        local TabStroke = AddLiquidStroke(TabBtn, SelectedTheme); TabStroke.Transparency = 1 
        
        local Page = Create("ScrollingFrame", { Parent = PageContainer, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ScrollBarThickness = 2, ScrollBarImageColor3 = SelectedTheme.Accent, BorderSizePixel = 0, Visible = false, CanvasSize = UDim2.new(0,0,0,0), ZIndex = 6 })
        local Layout = Create("UIListLayout", { Parent = Page, Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder }); 
        Create("UIPadding", { Parent = Page, PaddingTop = UDim.new(0, 2), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 10) })
        Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10) end)

        local function Activate()
            if ActiveTab and ActiveTab.Btn == TabBtn then return end
            local OldTab = ActiveTab
            local Direction = (OldTab and MyIndex > OldTab.Index) and "Down" or "Up"
            ActiveTab = {Btn = TabBtn, Page = Page, Index = MyIndex}

            for _, v in pairs(TabContainer:GetChildren()) do 
                if v:IsA("TextButton") then 
                    TweenService:Create(v, TweenInfo.new(0.3), {BackgroundTransparency = 0.8, BackgroundColor3 = SelectedTheme.Second, TextColor3 = SelectedTheme.TextDark}):Play() 
                    if v:FindFirstChild("UIStroke") then v.UIStroke.Transparency = 1 end
                end 
            end
            
            TweenService:Create(TabBtn, TweenInfo.new(0.3), {BackgroundTransparency = 0.5, BackgroundColor3 = SelectedTheme.Main, TextColor3 = SelectedTheme.Text}):Play()
            TabStroke.Transparency = 0.5
            
            if OldTab then
                local OldPage = OldTab.Page
                local OutPos = (Direction == "Down") and UDim2.new(0,0,-1,0) or UDim2.new(0,0,1,0)
                TweenService:Create(OldPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = OutPos}):Play()
                task.delay(0.4, function() if ActiveTab.Page ~= OldPage then OldPage.Visible = false end end)
            end
            
            Page.Visible = true
            if Direction == "Down" then Page.Position = UDim2.new(0,0,1,0) elseif Direction == "Up" then Page.Position = UDim2.new(0,0,-1,0) else Page.Position = UDim2.new(0,0,0,0) end
            if Direction ~= "None" then TweenService:Create(Page, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0,0,0,0)}):Play() end
        end
        TabBtn.MouseButton1Click:Connect(Activate)
        if MyIndex == 1 then Activate() end

        local Elements = {}
        local ElementOrder = 0

        function Elements:CreateSection(Text)
            ElementOrder = ElementOrder + 1
            local Lab = Create("TextLabel", { Parent = Page, Size = UDim2.new(1, 0, 0, 25), BackgroundTransparency = 1, Text = Text, Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.TextDark, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = ElementOrder })
            Create("UIPadding", { Parent = Lab, PaddingLeft = UDim.new(0, 5) })
        end

        function Elements:CreateButton(Cfg)
            ElementOrder = ElementOrder + 1
            local Btn = Create("TextButton", { Parent = Page, Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.4, Text = "", AutoButtonColor = false, ZIndex = 7, LayoutOrder = ElementOrder }); AddCorner(Btn, 6); AddLiquidStroke(Btn, SelectedTheme).Transparency = 0.8
            Create("TextLabel", { Parent = Btn, Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = Cfg.Name or "Button", Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8 })
            CreateRipple(Btn, SelectedTheme.Accent)
            Btn.MouseButton1Click:Connect(function() if Cfg.Callback then Cfg.Callback() end end)
        end

        function Elements:CreateToggle(Cfg)
            ElementOrder = ElementOrder + 1
            local State = Cfg.Default or false
            local Btn = Create("TextButton", { Parent = Page, Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.4, Text = "", AutoButtonColor = false, ZIndex = 7, LayoutOrder = ElementOrder }); AddCorner(Btn, 6); AddLiquidStroke(Btn, SelectedTheme).Transparency = 0.8
            Create("TextLabel", { Parent = Btn, Size = UDim2.new(1, -60, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = Cfg.Name or "Toggle", Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8 })
            local ToggleBg = Create("Frame", { Parent = Btn, Size = UDim2.new(0, 40, 0, 20), Position = UDim2.new(1, -50, 0.5, -10), BackgroundColor3 = State and SelectedTheme.Accent or Color3.fromRGB(60,60,60), ZIndex = 8 }); AddCorner(ToggleBg, 20)
            local Circle = Create("Frame", { Parent = ToggleBg, Size = UDim2.new(0, 16, 0, 16), Position = State and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Color3.new(1,1,1), ZIndex = 9 }); AddCorner(Circle, 20)
            Btn.MouseButton1Click:Connect(function() State = not State; TweenService:Create(ToggleBg, TweenInfo.new(0.2), {BackgroundColor3 = State and SelectedTheme.Accent or Color3.fromRGB(60,60,60)}):Play(); TweenService:Create(Circle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = State and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play(); if Cfg.Callback then Cfg.Callback(State) end end)
        end

        function Elements:CreateSlider(Cfg)
            ElementOrder = ElementOrder + 1
            local Min, Max, Val = Cfg.Min or 0, Cfg.Max or 100, Cfg.Default or Cfg.Min
            local Frame = Create("Frame", { Parent = Page, Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.4, ZIndex = 7, LayoutOrder = ElementOrder }); AddCorner(Frame, 6); AddLiquidStroke(Frame, SelectedTheme).Transparency = 0.8
            Create("TextLabel", { Parent = Frame, Size = UDim2.new(1, -20, 0, 20), Position = UDim2.new(0, 10, 0, 5), BackgroundTransparency = 1, Text = Cfg.Name, Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8 })
            local ValLbl = Create("TextLabel", { Parent = Frame, Size = UDim2.new(0, 50, 0, 20), Position = UDim2.new(1, -60, 0, 5), BackgroundTransparency = 1, Text = tostring(Val), Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.Accent, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 8 })
            local SlideBar = Create("TextButton", { Parent = Frame, Size = UDim2.new(1, -20, 0, 6), Position = UDim2.new(0, 10, 0, 30), BackgroundColor3 = Color3.fromRGB(50,50,50), Text = "", AutoButtonColor = false, ZIndex = 8 }); AddCorner(SlideBar, 10)
            local Fill = Create("Frame", { Parent = SlideBar, Size = UDim2.new((Val-Min)/(Max-Min), 0, 1, 0), BackgroundColor3 = SelectedTheme.Accent, BorderSizePixel = 0, ZIndex = 9 }); AddCorner(Fill, 10)
            local Dragging = false
            local function Update(input) local p = math.clamp((input.Position.X - SlideBar.AbsolutePosition.X) / SlideBar.AbsoluteSize.X, 0, 1); Val = math.floor(Min + ((Max-Min)*p)); ValLbl.Text = tostring(Val); TweenService:Create(Fill, TweenInfo.new(0.05), {Size = UDim2.new(p, 0, 1, 0)}):Play(); if Cfg.Callback then Cfg.Callback(Val) end end
            SlideBar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = true; Update(i) end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end end)
            UserInputService.InputChanged:Connect(function(i) if Dragging and i.UserInputType == Enum.UserInputType.MouseMovement then Update(i) end end)
        end

        function Elements:CreateInput(Cfg)
            ElementOrder = ElementOrder + 1
            local Frame = Create("Frame", { Parent = Page, Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.4, ZIndex = 7, LayoutOrder = ElementOrder }); AddCorner(Frame, 6); AddLiquidStroke(Frame, SelectedTheme).Transparency = 0.8
            Create("TextLabel", { Parent = Frame, Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = Cfg.Name, Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8 })
            local BoxContainer = Create("Frame", { Parent = Frame, Size = UDim2.new(0, 100, 0, 30), Position = UDim2.new(1, -110, 0.5, -15), BackgroundColor3 = Color3.fromRGB(20,20,20), BackgroundTransparency = 0.5, ZIndex = 8 }); AddCorner(BoxContainer, 6)
            local Box = Create("TextBox", { Parent = BoxContainer, Size = UDim2.new(1, -10, 1, 0), Position = UDim2.new(0, 5, 0, 0), BackgroundTransparency = 1, Text = Cfg.Default or "", PlaceholderText = Cfg.Placeholder or "Type...", TextColor3 = SelectedTheme.Text, Font = Enum.Font.Gotham, TextSize = 13, ZIndex = 9, TextXAlignment = Enum.TextXAlignment.Center })
            Box.FocusLost:Connect(function() if Cfg.Callback then Cfg.Callback(Box.Text) end end)
        end

        function Elements:CreateDropdown(Cfg)
            ElementOrder = ElementOrder + 1
            local Expanded, Selected, Options = false, Cfg.Default, Cfg.Items or {}
            local Drop = Create("TextButton", { Parent = Page, Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.4, Text = "", AutoButtonColor = false, ClipsDescendants = true, ZIndex = 7, LayoutOrder = ElementOrder }); AddCorner(Drop, 6); AddLiquidStroke(Drop, SelectedTheme).Transparency = 0.8
            local Title = Create("TextLabel", { Parent = Drop, Size = UDim2.new(1, -40, 0, 35), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = (Cfg.Name or "Dropdown")..(Selected and " - "..tostring(Selected) or ""), Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8 })
            local Arrow = Create("TextLabel", { Parent = Drop, Size = UDim2.new(0, 30, 0, 35), Position = UDim2.new(1, -35, 0, 0), BackgroundTransparency = 1, Text = "v", Font = Enum.Font.GothamBold, TextColor3 = SelectedTheme.TextDark, TextSize = 14, ZIndex = 8 })
            local Container = Create("ScrollingFrame", { Parent = Drop, Size = UDim2.new(1, 0, 0, 0), Position = UDim2.new(0, 0, 0, 35), BackgroundTransparency = 1, ZIndex = 8, ScrollBarThickness = 2, ScrollBarImageColor3 = SelectedTheme.Accent, BorderSizePixel = 0, CanvasSize = UDim2.new(0,0,0,0) }); Create("UIPadding", { Parent = Container, PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5) }); local ListLayout = Create("UIListLayout", { Parent = Container, Padding = UDim.new(0, 2) })
            
            local function Refresh()
                for _, v in pairs(Container:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
                for _, item in pairs(Options) do
                    local Btn = Create("TextButton", { Parent = Container, Size = UDim2.new(1, 0, 0, 25), Position = UDim2.new(0, 0, 0, 0), BackgroundColor3 = SelectedTheme.Main, BackgroundTransparency = 0.5, Text = tostring(item), Font = Enum.Font.Gotham, TextColor3 = SelectedTheme.Text, TextSize = 13, ZIndex = 9, TextXAlignment = Enum.TextXAlignment.Center }); AddCorner(Btn, 4)
                    Btn.MouseButton1Click:Connect(function() Selected = item; Title.Text = (Cfg.Name or "Dropdown").." - "..tostring(Selected); Expanded = false; TweenService:Create(Drop, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 0, 35)}):Play(); TweenService:Create(Arrow, TweenInfo.new(0.3), {Rotation = 0}):Play(); if Cfg.Callback then Cfg.Callback(item) end end)
                end
                Container.CanvasSize = UDim2.new(0, 0, 0, #Options * 27 + 10)
            end
            Refresh()
            Drop.MouseButton1Click:Connect(function() Expanded = not Expanded; local H = Expanded and math.min(#Options * 27 + 45, 175) or 35; TweenService:Create(Drop, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 0, H)}):Play(); TweenService:Create(Arrow, TweenInfo.new(0.3), {Rotation = Expanded and 180 or 0}):Play(); TweenService:Create(Container, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 1, -35)}):Play() end)
            return {Refresh = function(self, list) Options = list; Refresh() end}
        end

        -- STATIC COLOR PICKER (V41 Style)
        function Elements:CreateColorPicker(Cfg)
            ElementOrder = ElementOrder + 1
            local Color = Cfg.Default or Color3.fromRGB(255, 255, 255)
            
            -- STATIC CONTAINER (Always Open, Height 190)
            local Frame = Create("Frame", { Parent = Page, Size = UDim2.new(1, 0, 0, 190), BackgroundColor3 = SelectedTheme.Second, BackgroundTransparency = 0.4, ZIndex = 7, LayoutOrder = ElementOrder }); AddCorner(Frame, 6); AddLiquidStroke(Frame, SelectedTheme).Transparency = 0.8
            Create("TextLabel", { Parent = Frame, Size = UDim2.new(1, -50, 0, 35), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = Cfg.Name or "Color Picker", Font = Enum.Font.GothamMedium, TextColor3 = SelectedTheme.Text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8 })
            local Preview = Create("Frame", { Parent = Frame, Size = UDim2.new(0, 25, 0, 25), Position = UDim2.new(1, -35, 0, 5), BackgroundColor3 = Color, ZIndex = 8 }); AddCorner(Preview, 6)
            
            local Container = Create("Frame", { Parent = Frame, Size = UDim2.new(1, 0, 1, -35), Position = UDim2.new(0, 0, 0, 35), BackgroundTransparency = 1, ZIndex = 8 })
            local BoxContainer = Create("Frame", { Parent = Container, Size = UDim2.new(0.4, 0, 1, 0), BackgroundTransparency = 1, ZIndex = 9 })
            Create("TextLabel", { Parent = BoxContainer, Size = UDim2.new(1,0,0,20), Position = UDim2.new(0,10,0,5), BackgroundTransparency = 1, Text = "RGB / Hex", TextColor3 = SelectedTheme.TextDark, Font = Enum.Font.Gotham, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 10 })
            
            local RInput = Create("TextBox", { Parent = BoxContainer, Size = UDim2.new(0, 35, 0, 25), Position = UDim2.new(0, 10, 0, 30), Text = math.floor(Color.R*255), BackgroundColor3 = SelectedTheme.Main, TextColor3 = SelectedTheme.Text, Font = Enum.Font.Gotham, TextSize = 12, ZIndex = 10 }); AddCorner(RInput, 4)
            local GInput = Create("TextBox", { Parent = BoxContainer, Size = UDim2.new(0, 35, 0, 25), Position = UDim2.new(0, 50, 0, 30), Text = math.floor(Color.G*255), BackgroundColor3 = SelectedTheme.Main, TextColor3 = SelectedTheme.Text, Font = Enum.Font.Gotham, TextSize = 12, ZIndex = 10 }); AddCorner(GInput, 4)
            local BInput = Create("TextBox", { Parent = BoxContainer, Size = UDim2.new(0, 35, 0, 25), Position = UDim2.new(0, 90, 0, 30), Text = math.floor(Color.B*255), BackgroundColor3 = SelectedTheme.Main, TextColor3 = SelectedTheme.Text, Font = Enum.Font.Gotham, TextSize = 12, ZIndex = 10 }); AddCorner(BInput, 4)
            local HexInput = Create("TextBox", { Parent = BoxContainer, Size = UDim2.new(0, 115, 0, 25), Position = UDim2.new(0, 10, 0, 65), Text = "#"..Color:ToHex(), BackgroundColor3 = SelectedTheme.Main, TextColor3 = SelectedTheme.Text, Font = Enum.Font.Gotham, TextSize = 12, ZIndex = 10 }); AddCorner(HexInput, 4)

            local PalContainer = Create("Frame", { Parent = Container, Size = UDim2.new(0.6, 0, 1, -45), Position = UDim2.new(0.4, 0, 0, 10), BackgroundTransparency = 1, ZIndex = 9 })
            local h, s, v = Color:ToHSV()
            local SVMap = Create("ImageButton", { Parent = PalContainer, Size = UDim2.new(1, -15, 0, 120), Position = UDim2.new(0, 0, 0, 0), BackgroundColor3 = Color3.fromHSV(h, 1, 1), Image = "rbxassetid://4155801252", ZIndex = 10, AutoButtonColor = false }); AddCorner(SVMap, 4)
            local SVTrigger = Create("TextButton", { Parent = SVMap, Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, Text = "", ZIndex = 100 })
            local SVCursor = Create("Frame", { Parent = SVMap, Size = UDim2.new(0, 6, 0, 6), Position = UDim2.fromScale(s, 1-v), BackgroundColor3 = Color3.new(1,1,1), ZIndex = 12, AnchorPoint = Vector2.new(0.5,0.5) }); AddCorner(SVCursor, 100)
            local HueBar = Create("ImageButton", { Parent = PalContainer, Size = UDim2.new(1, -15, 0, 10), Position = UDim2.new(0, 0, 0, 130), BackgroundColor3 = Color3.new(1,1,1), ZIndex = 10, AutoButtonColor = false }); AddCorner(HueBar, 4)
            Create("UIGradient", { Parent = HueBar, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)), ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255,255,0)), ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0,255,0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,255,255)), ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0,0,255)), ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255,0,255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,0))} })
            local HueTrigger = Create("TextButton", { Parent = HueBar, Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, Text = "", ZIndex = 100 })
            local HueCursor = Create("Frame", { Parent = HueBar, Size = UDim2.new(0, 2, 1, 0), Position = UDim2.fromScale(h, 0), BackgroundColor3 = Color3.new(1,1,1), ZIndex = 11 })

            local function Update(newH, newS, newV)
                h, s, v = newH or h, newS or s, newV or v; Color = Color3.fromHSV(h, s, v); Preview.BackgroundColor3 = Color; SVMap.BackgroundColor3 = Color3.fromHSV(h, 1, 1); SVCursor.Position = UDim2.fromScale(s, 1-v); HueCursor.Position = UDim2.fromScale(h, 0); RInput.Text = math.floor(Color.R*255); GInput.Text = math.floor(Color.G*255); BInput.Text = math.floor(Color.B*255); HexInput.Text = "#"..Color:ToHex(); if Cfg.Callback then Cfg.Callback(Color) end
            end
            
            RInput.FocusLost:Connect(function() local r = tonumber(RInput.Text); if r then local c = Color3.fromRGB(math.clamp(r,0,255), Color.G*255, Color.B*255); local _h,_s,_v = c:ToHSV(); Update(_h, _s, _v) end end)
            GInput.FocusLost:Connect(function() local g = tonumber(GInput.Text); if g then local c = Color3.fromRGB(Color.R*255, math.clamp(g,0,255), Color.B*255); local _h,_s,_v = c:ToHSV(); Update(_h, _s, _v) end end)
            BInput.FocusLost:Connect(function() local b = tonumber(BInput.Text); if b then local c = Color3.fromRGB(Color.R*255, Color.G*255, math.clamp(b,0,255)); local _h,_s,_v = c:ToHSV(); Update(_h, _s, _v) end end)
            HexInput.FocusLost:Connect(function() local s,c = pcall(function() return Color3.fromHex(HexInput.Text) end); if s then local _h,_s,_v = c:ToHSV(); Update(_h, _s, _v) end end)

            local draggingSV, draggingHue = false, false
            SVTrigger.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSV = true end end)
            HueTrigger.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingHue = true end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSV = false; draggingHue = false end end)
            
            RunService.RenderStepped:Connect(function()
                if draggingSV then
                    local relativeX = (Mouse.X - SVMap.AbsolutePosition.X) / SVMap.AbsoluteSize.X
                    local relativeY = (Mouse.Y - SVMap.AbsolutePosition.Y) / SVMap.AbsoluteSize.Y
                    Update(nil, math.clamp(relativeX,0,1), 1-math.clamp(relativeY,0,1))
                elseif draggingHue then
                    local relativeX = (Mouse.X - HueBar.AbsolutePosition.X) / HueBar.AbsoluteSize.X
                    Update(math.clamp(relativeX,0,1), nil, nil)
                end
            end)
        end

        return Elements
    end
    return Funcs
end
return Library
