--[[
  UI3R v3.0 — Glass iOS-style executor UI
  Features: Epic duelz-style intro · 3 themes (Glass/White/Dark) · Credits with real images
]]

-- ══════════════════════════════════════════════
-- SERVICES
-- ══════════════════════════════════════════════
local Players        = game:GetService("Players")
local TweenService   = game:GetService("TweenService")
local RunService     = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp            = Players.LocalPlayer

-- ══════════════════════════════════════════════
-- CONFIG
-- ══════════════════════════════════════════════
local Config = {
    Title       = "3$R",
    Subtitle    = "executor ui",
    Version     = "3.0",
    WindowW     = 640,
    WindowH     = 420,
    MinScale    = 0.70,
    MaxScale    = 1.40,
    IntroDuration = 3.5,

    -- Credits info — edit these
    Credits = {
        AuthorName  = "autor",
        AuthorId    = 1,          -- roblox userId for avatar
        Discord     = "discord.gg/xxx",
        YouTube     = "",
    },

    -- Tabs
    Tabs = { "combat", "esp", "utility", "ajustes", "creditos" },
}

-- ══════════════════════════════════════════════
-- THEME SYSTEM
-- ══════════════════════════════════════════════
local Themes = {
    glass = {
        name     = "Glass",
        Bg       = Color3.fromRGB(12, 12, 16),
        BgAlpha  = 0.28,
        Panel    = Color3.fromRGB(24, 24, 32),
        Text     = Color3.fromRGB(230, 230, 238),
        SubText  = Color3.fromRGB(120, 120, 135),
        Stroke   = Color3.fromRGB(50, 50, 65),
        Accent   = Color3.fromRGB(130, 160, 255),
        hasImage = false,
        BgImage  = "",
    },
    white = {
        name     = "White",
        Bg       = Color3.fromRGB(248, 248, 252),
        BgAlpha  = 0.08,
        Panel    = Color3.fromRGB(220, 220, 230),
        Text     = Color3.fromRGB(20, 20, 30),
        SubText  = Color3.fromRGB(100, 100, 115),
        Stroke   = Color3.fromRGB(180, 180, 200),
        Accent   = Color3.fromRGB(90, 120, 220),
        hasImage = true,
        BgImage  = "",
    },
    dark = {
        name     = "Dark",
        Bg       = Color3.fromRGB(4, 4, 6),
        BgAlpha  = 0.15,
        Panel    = Color3.fromRGB(14, 14, 18),
        Text     = Color3.fromRGB(220, 220, 228),
        SubText  = Color3.fromRGB(90, 90, 105),
        Stroke   = Color3.fromRGB(30, 30, 40),
        Accent   = Color3.fromRGB(160, 100, 255),
        hasImage = true,
        BgImage  = "",
    },
}

local Theme = {
    _current  = Themes.glass,
    _listeners = {},
}

function Theme:Get(key)
    return self._current[key]
end

function Theme:Listen(fn)
    local id = tostring(fn)
    self._listeners[id] = fn
    return function() self._listeners[id] = nil end
end

function Theme:Apply(themeName, bgImage)
    local t = Themes[themeName]
    if not t then return end
    if bgImage ~= nil then
        t.BgImage = bgImage
    end
    self._current = t
    for _, fn in pairs(self._listeners) do
        pcall(fn, t)
    end
end

-- ══════════════════════════════════════════════
-- HELPERS
-- ══════════════════════════════════════════════
local function tw(inst, t, props, style, dir)
    style = style or Enum.EasingStyle.Quad
    dir   = dir   or Enum.EasingDirection.Out
    TweenService:Create(inst, TweenInfo.new(t, style, dir), props):Play()
end

local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function uiStroke(parent, col, thick)
    local s = Instance.new("UIStroke")
    s.Color = col
    s.Thickness = thick or 1
    s.Parent = parent
    return s
end

local function newLabel(parent, text, size, color, font, xa, ya)
    local l = Instance.new("TextLabel")
    l.Text = text
    l.TextSize = size
    l.TextColor3 = color
    l.Font = font or Enum.Font.GothamMedium
    l.BackgroundTransparency = 1
    l.TextXAlignment = xa or Enum.TextXAlignment.Left
    l.TextYAlignment = ya or Enum.TextYAlignment.Center
    l.Parent = parent
    return l
end

local function newFrame(parent, size, pos, col, alpha)
    local f = Instance.new("Frame")
    f.Size = size
    f.Position = pos or UDim2.new(0,0,0,0)
    f.BackgroundColor3 = col or Color3.new(0,0,0)
    f.BackgroundTransparency = alpha or 0
    f.BorderSizePixel = 0
    f.Parent = parent
    return f
end

local function makeDraggable(frame, bar)
    local dragging, dragInput, dragStart, startPos
    bar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = inp.Position
            startPos  = frame.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    bar.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = inp
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if inp == dragInput and dragging then
            local delta = inp.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ══════════════════════════════════════════════
-- INTRO ANIMATION (duelz-style)
-- ══════════════════════════════════════════════
local function runIntro(onDone)
    local sg = Instance.new("ScreenGui")
    sg.Name = "UI3R_Intro"
    sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.Parent = lp.PlayerGui

    local vp = sg.AbsoluteSize
    local W, H = vp.X, vp.Y

    -- Dark overlay
    local bg = newFrame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(0,0,0), 0)
    bg.ZIndex = 1
    tw(bg, 0.6, {BackgroundTransparency = 0.05})

    -- ── BEAMS (5 light rays, rotating slowly) ──
    local beamContainer = newFrame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)
    beamContainer.ZIndex = 2
    local beams = {}
    local beamAngles = {0, 36, 72, 108, 144}
    local accent = Color3.fromRGB(130, 160, 255)
    for i, ang in ipairs(beamAngles) do
        local beam = newFrame(beamContainer,
            UDim2.new(0, 4, 0, math.max(W, H) * 2),
            UDim2.new(0.5, -2, 0.5, -math.max(W,H)),
            accent, 0.55)
        beam.AnchorPoint = Vector2.new(0.5, 0)
        beam.Rotation = ang
        beam.ZIndex = 2
        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
            ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)),
            ColorSequenceKeypoint.new(1, Color3.new(1,1,1)),
        })
        grad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.3, 0.6),
            NumberSequenceKeypoint.new(0.5, 0.4),
            NumberSequenceKeypoint.new(0.7, 0.6),
            NumberSequenceKeypoint.new(1, 1),
        })
        grad.Parent = beam
        beams[i] = {beam = beam, angle = ang}
    end

    -- ── DUST PARTICLES ──
    local dustContainer = newFrame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)
    dustContainer.ZIndex = 3
    local dustList = {}
    for i = 1, 18 do
        local px = math.random(10, 90) / 100
        local py = math.random(40, 90) / 100
        local sz = math.random(2, 5)
        local d = newFrame(dustContainer,
            UDim2.new(0, sz, 0, sz),
            UDim2.new(px, 0, py, 0),
            Color3.fromRGB(180, 200, 255), 0.3)
        d.ZIndex = 3
        corner(d, sz)
        dustList[i] = {frame = d, px = px, py = py, speed = math.random(15,40)/1000, phase = math.random()*math.pi*2}
    end

    -- ── CENTRAL RING ──
    local ringSize = 200
    local ring = newFrame(sg,
        UDim2.new(0, ringSize, 0, ringSize),
        UDim2.new(0.5, -ringSize/2, 0.5, -ringSize/2),
        Color3.new(0,0,0), 1)
    ring.ZIndex = 4
    corner(ring, ringSize/2)
    uiStroke(ring, accent, 2)
    ring.BackgroundTransparency = 1

    local ring2 = newFrame(sg,
        UDim2.new(0, ringSize-24, 0, ringSize-24),
        UDim2.new(0.5, -(ringSize-24)/2, 0.5, -(ringSize-24)/2),
        Color3.new(0,0,0), 1)
    ring2.ZIndex = 4
    corner(ring2, (ringSize-24)/2)
    uiStroke(ring2, Color3.fromRGB(80, 100, 180), 1)
    ring2.BackgroundTransparency = 1

    -- Glow center
    local glow = newFrame(sg,
        UDim2.new(0, 80, 0, 80),
        UDim2.new(0.5, -40, 0.5, -40),
        accent, 0.6)
    glow.ZIndex = 4
    corner(glow, 40)
    local glowGrad = Instance.new("UIGradient")
    glowGrad.Color = ColorSequence.new(accent, Color3.fromRGB(80, 50, 180))
    glowGrad.Parent = glow

    -- ── DIVIDERS ──
    local function makeDivider(yOff)
        local row = newFrame(sg, UDim2.new(0, 0, 0, 20),
            UDim2.new(0.5, 0, 0.5, yOff), Color3.new(0,0,0), 1)
        row.AnchorPoint = Vector2.new(0.5, 0.5)
        row.ZIndex = 5
        -- left line
        local ll = newFrame(row, UDim2.new(0, 0, 0, 1), UDim2.new(0.5, -4, 0.5, 0), accent, 0.3)
        ll.AnchorPoint = Vector2.new(1, 0.5)
        ll.ZIndex = 5
        -- right line
        local rl = newFrame(row, UDim2.new(0, 0, 0, 1), UDim2.new(0.5, 4, 0.5, 0), accent, 0.3)
        rl.AnchorPoint = Vector2.new(0, 0.5)
        rl.ZIndex = 5
        -- diamond center
        local dia = newFrame(row, UDim2.new(0, 8, 0, 8), UDim2.new(0.5, -4, 0.5, -4), accent, 0.0)
        dia.Rotation = 45
        dia.ZIndex = 5
        return {row=row, ll=ll, rl=rl, dia=dia}
    end
    local div1 = makeDivider(-140)
    local div2 = makeDivider( 100)

    -- ── LETTERS ──
    local WORD = Config.Title
    local letterSlots = {}
    local letterSpacing = 48
    local totalW = #WORD * letterSpacing
    local startX = (W - totalW) / 2

    local lettersContainer = newFrame(sg,
        UDim2.new(0, totalW + 20, 0, 60),
        UDim2.new(0.5, -totalW/2 - 10, 0.5, -30),
        Color3.new(0,0,0), 1)
    lettersContainer.ZIndex = 6

    for i = 1, #WORD do
        local ch = WORD:sub(i,i)
        local slot = newFrame(lettersContainer,
            UDim2.new(0, letterSpacing, 0, 60),
            UDim2.new(0, (i-1)*letterSpacing, 0, 0),
            Color3.new(0,0,0), 1)
        slot.ZIndex = 6

        local lbl = Instance.new("TextLabel")
        lbl.Text = ch
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 36
        lbl.TextColor3 = Color3.new(1,1,1)
        lbl.TextTransparency = 1
        lbl.BackgroundTransparency = 1
        lbl.Size = UDim2.new(1,0,1,0)
        lbl.TextXAlignment = Enum.TextXAlignment.Center
        lbl.ZIndex = 6
        lbl.Parent = slot

        local uisc = Instance.new("UIScale")
        uisc.Scale = 0
        uisc.Parent = slot

        letterSlots[i] = {slot=slot, lbl=lbl, uisc=uisc}
    end

    -- ── SUBTITLE ──
    local subLbl = Instance.new("TextLabel")
    subLbl.Text = Config.Subtitle .. "  v" .. Config.Version
    subLbl.Font = Enum.Font.Gotham
    subLbl.TextSize = 14
    subLbl.TextColor3 = Color3.fromRGB(150, 160, 200)
    subLbl.TextTransparency = 1
    subLbl.BackgroundTransparency = 1
    subLbl.Size = UDim2.new(0, 400, 0, 24)
    subLbl.Position = UDim2.new(0.5, -200, 0.5, 44)
    subLbl.TextXAlignment = Enum.TextXAlignment.Center
    subLbl.ZIndex = 6
    subLbl.Parent = sg

    -- ── PROGRESS BAR ──
    local barBg = newFrame(sg, UDim2.new(0, 300, 0, 3),
        UDim2.new(0.5, -150, 1, -40), Color3.fromRGB(40,40,55), 0)
    barBg.ZIndex = 7
    corner(barBg, 2)
    local barFill = newFrame(barBg, UDim2.new(0, 0, 1, 0), UDim2.new(0,0,0,0), accent, 0)
    barFill.ZIndex = 7
    corner(barFill, 2)

    -- ── ANIMATION SEQUENCE ──
    local t = 0
    local startTime = tick()
    local introDone = false

    -- RenderStepped: beams + dust
    local conn
    conn = RunService.RenderStepped:Connect(function(dt)
        t = t + dt
        -- Rotate beams
        for _, b in ipairs(beams) do
            b.beam.Rotation = b.angle + math.sin(t * 0.4) * 15
        end
        -- Float dust
        for _, d in ipairs(dustList) do
            local newY = d.py - (t * d.speed) % 1
            if newY < -0.05 then newY = newY + 1 end
            d.frame.Position = UDim2.new(
                d.px + math.sin(t * 0.5 + d.phase) * 0.015,
                0,
                newY + math.sin(t * 0.8 + d.phase) * 0.01,
                0
            )
        end
        -- Spin ring
        ring.Rotation = t * 30
        ring2.Rotation = -t * 20
        -- Glow pulse
        glow.BackgroundTransparency = 0.6 + math.sin(t*2) * 0.1
    end)

    -- Sequence
    task.spawn(function()
        task.wait(0.3)

        -- Expand dividers
        for _, div in ipairs({div1, div2}) do
            tw(div.ll, 0.8, {Size=UDim2.new(0, 220, 0, 1), BackgroundTransparency=0.4}, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            tw(div.rl, 0.8, {Size=UDim2.new(0, 220, 0, 1), BackgroundTransparency=0.4}, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            tw(div.dia, 0.4, {BackgroundTransparency=0.0})
        end

        task.wait(0.5)

        -- Animate letters one by one
        for i, ls in ipairs(letterSlots) do
            task.wait(0.08)
            tw(ls.uisc, 0.25, {Scale=1.3}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            tw(ls.lbl, 0.2, {TextTransparency=0})
            task.wait(0.1)
            tw(ls.uisc, 0.15, {Scale=1.0})

            -- Spark burst (3 tiny frames)
            for j = 1, 3 do
                local spark = newFrame(sg,
                    UDim2.new(0, 3, 0, 3),
                    UDim2.new(0, lettersContainer.AbsolutePosition.X + (i-0.5)*letterSpacing + math.random(-10,10),
                              0, lettersContainer.AbsolutePosition.Y + math.random(-8,8)),
                    Color3.new(1,1,1), 0)
                spark.ZIndex = 8
                corner(spark, 2)
                tw(spark, 0.4, {
                    Position = UDim2.new(0,
                        lettersContainer.AbsolutePosition.X + (i-0.5)*letterSpacing + math.random(-30,30),
                        0,
                        lettersContainer.AbsolutePosition.Y + math.random(-40, -10)),
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0,1,0,1),
                }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                task.delay(0.4, function() spark:Destroy() end)
            end
        end

        task.wait(0.2)
        -- Subtitle fade
        tw(subLbl, 0.5, {TextTransparency = 0})

        -- Flash
        local flash = newFrame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(1,1,1), 1)
        flash.ZIndex = 10
        tw(flash, 0.08, {BackgroundTransparency=0.5})
        task.wait(0.08)
        tw(flash, 0.3, {BackgroundTransparency=1})
        task.delay(0.35, function() flash:Destroy() end)

        -- Progress bar
        local progDuration = Config.IntroDuration - 1.2
        local progStart = tick()
        local progConn
        progConn = RunService.RenderStepped:Connect(function()
            local frac = math.min((tick()-progStart)/progDuration, 1)
            barFill.Size = UDim2.new(frac, 0, 1, 0)
        end)
        task.wait(progDuration)
        progConn:Disconnect()
        barFill.Size = UDim2.new(1,0,1,0)

        task.wait(0.2)

        -- OUTRO: fade everything out
        conn:Disconnect()
        tw(bg, 0.5, {BackgroundTransparency=1})
        tw(beamContainer, 0.5, {BackgroundTransparency=1})
        for _, ls in ipairs(letterSlots) do
            tw(ls.lbl, 0.4, {TextTransparency=1})
        end
        tw(subLbl, 0.4, {TextTransparency=1})
        tw(barBg, 0.4, {BackgroundTransparency=1})
        tw(barFill, 0.4, {BackgroundTransparency=1})
        tw(glow, 0.4, {BackgroundTransparency=1})
        tw(ring, 0.4, {BackgroundTransparency=1})
        tw(ring2, 0.4, {BackgroundTransparency=1})
        for _, d in ipairs(dustList) do
            tw(d.frame, 0.3, {BackgroundTransparency=1})
        end

        task.wait(0.5)
        sg:Destroy()
        onDone()
    end)
end

-- ══════════════════════════════════════════════
-- CONTROLS LIBRARY
-- ══════════════════════════════════════════════
local Controls = {}

function Controls.Section(parent, text)
    local row = newFrame(parent, UDim2.new(1,0,0,28), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)
    local lbl = newLabel(row, text:upper(), 10, Theme:Get("Accent"), Enum.Font.GothamBold)
    lbl.Size = UDim2.new(1,-12,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.TextColor3 = Theme:Get("Accent")

    local line = newFrame(row, UDim2.new(1,-12,0,1), UDim2.new(0,12,1,-1), Theme:Get("Stroke"), 0)
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
        ColorSequenceKeypoint.new(1, Color3.new(1,1,1)),
    })
    grad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.6, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    grad.Parent = line

    Theme:Listen(function(t)
        lbl.TextColor3 = t.Accent
        line.BackgroundColor3 = t.Stroke
    end)
    return row
end

function Controls.Toggle(parent, labelText, default, onChange)
    local val = default or false
    local row = newFrame(parent, UDim2.new(1,0,0,38), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)

    local lbl = newLabel(row, labelText, 13, Theme:Get("Text"), Enum.Font.GothamMedium)
    lbl.Size = UDim2.new(1,-58,1,0)
    lbl.Position = UDim2.new(0,12,0,0)

    local track = newFrame(row, UDim2.new(0,44,0,24), UDim2.new(1,-54,0.5,-12),
        val and Theme:Get("Accent") or Theme:Get("Panel"), 0)
    track.AnchorPoint = Vector2.new(0,0)
    corner(track, 12)
    uiStroke(track, Theme:Get("Stroke"), 1)

    local knob = newFrame(track, UDim2.new(0,20,0,20), UDim2.new(0,2,0.5,-10),
        Color3.new(1,1,1), 0)
    corner(knob, 10)

    local overlay = Instance.new("TextButton")
    overlay.Text = ""
    overlay.BackgroundTransparency = 1
    overlay.Size = UDim2.new(1,0,1,0)
    overlay.Parent = row

    local function refresh(animate)
        local kX = val and UDim2.new(1,-22,0.5,-10) or UDim2.new(0,2,0.5,-10)
        local tColor = val and Theme:Get("Accent") or Theme:Get("Panel")
        if animate then
            tw(knob, 0.18, {Position = kX})
            tw(track, 0.18, {BackgroundColor3 = tColor})
        else
            knob.Position = kX
            track.BackgroundColor3 = tColor
        end
    end
    refresh(false)

    overlay.MouseButton1Click:Connect(function()
        val = not val
        refresh(true)
        if onChange then onChange(val) end
    end)

    Theme:Listen(function(t)
        lbl.TextColor3 = t.Text
        track.BackgroundColor3 = val and t.Accent or t.Panel
        uiStroke(track, t.Stroke, 1)
    end)

    return {
        Get = function() return val end,
        Set = function(v) val = v; refresh(false) end,
    }
end

function Controls.Slider(parent, labelText, minV, maxV, defaultV, onChange, fmt)
    local val = defaultV or minV
    fmt = fmt or function(v) return tostring(math.floor(v)) end

    local row = newFrame(parent, UDim2.new(1,0,0,52), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)

    local topRow = newFrame(row, UDim2.new(1,0,0,22), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
    local lbl = newLabel(topRow, labelText, 13, Theme:Get("Text"), Enum.Font.GothamMedium)
    lbl.Size = UDim2.new(1,-50,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    local valLbl = newLabel(topRow, fmt(val), 12, Theme:Get("Accent"), Enum.Font.GothamMedium,
        Enum.TextXAlignment.Right)
    valLbl.Size = UDim2.new(0,44,1,0)
    valLbl.Position = UDim2.new(1,-54,0,0)

    local trackBg = newFrame(row, UDim2.new(1,-24,0,5), UDim2.new(0,12,0,34),
        Theme:Get("Panel"), 0)
    corner(trackBg, 3)
    local fill = newFrame(trackBg, UDim2.new(0,0,1,0), UDim2.new(0,0,0,0), Theme:Get("Accent"), 0)
    corner(fill, 3)
    local knob = newFrame(trackBg, UDim2.new(0,14,0,14), UDim2.new(0,0,0.5,-7),
        Color3.new(1,1,1), 0)
    corner(knob, 7)

    local function setVal(v, animate)
        val = math.clamp(v, minV, maxV)
        local frac = (val - minV) / (maxV - minV)
        valLbl.Text = fmt(val)
        if animate then
            tw(fill, 0.1, {Size = UDim2.new(frac, 0, 1, 0)})
            tw(knob, 0.1, {Position = UDim2.new(frac, -7, 0.5, -7)})
        else
            fill.Size = UDim2.new(frac, 0, 1, 0)
            knob.Position = UDim2.new(frac, -7, 0.5, -7)
        end
        if onChange then onChange(val) end
    end
    setVal(val, false)

    local dragging = false
    knob.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local abs = trackBg.AbsolutePosition
            local sz  = trackBg.AbsoluteSize
            local frac = math.clamp((inp.Position.X - abs.X) / sz.X, 0, 1)
            setVal(minV + (maxV - minV) * frac, false)
        end
    end)

    Theme:Listen(function(t)
        lbl.TextColor3 = t.Text
        valLbl.TextColor3 = t.Accent
        trackBg.BackgroundColor3 = t.Panel
        fill.BackgroundColor3 = t.Accent
    end)

    return {
        Get = function() return val end,
        Set = function(v) setVal(v, false) end,
    }
end

function Controls.Dropdown(parent, root, labelText, options, defaultIdx, onChange)
    local selectedIdx = defaultIdx or 1
    local open = false

    local row = newFrame(parent, UDim2.new(1,0,0,38), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)

    local lbl = newLabel(row, labelText, 13, Theme:Get("Text"), Enum.Font.GothamMedium)
    lbl.Size = UDim2.new(0.4,0,1,0)
    lbl.Position = UDim2.new(0,12,0,0)

    local btn = Instance.new("TextButton")
    btn.Text = "▾  " .. (options[selectedIdx] or "")
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 12
    btn.TextColor3 = Theme:Get("Text")
    btn.BackgroundColor3 = Theme:Get("Panel")
    btn.BackgroundTransparency = 0
    btn.Size = UDim2.new(0.52, 0, 0, 28)
    btn.Position = UDim2.new(0.46, 0, 0.5, -14)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.AutoButtonColor = false
    btn.Parent = row
    corner(btn, 6)
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 8)
    pad.Parent = btn
    uiStroke(btn, Theme:Get("Stroke"), 1)

    local popupH = #options * 30 + 4
    local popup = newFrame(root, UDim2.new(0, btn.AbsoluteSize.X, 0, 0),
        UDim2.new(0, 0, 0, 0), Theme:Get("Panel"), 0)
    popup.ZIndex = 20
    popup.ClipsDescendants = true
    corner(popup, 6)
    uiStroke(popup, Theme:Get("Stroke"), 1)

    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 2)
    list.Parent = popup

    local optBtns = {}
    for i, opt in ipairs(options) do
        local ob = Instance.new("TextButton")
        ob.Text = opt
        ob.Font = Enum.Font.GothamMedium
        ob.TextSize = 12
        ob.TextColor3 = Theme:Get("Text")
        ob.BackgroundColor3 = Theme:Get("Panel")
        ob.BackgroundTransparency = 1
        ob.Size = UDim2.new(1, 0, 0, 28)
        ob.TextXAlignment = Enum.TextXAlignment.Left
        ob.AutoButtonColor = false
        ob.LayoutOrder = i
        ob.ZIndex = 21
        ob.Parent = popup
        local p2 = Instance.new("UIPadding")
        p2.PaddingLeft = UDim.new(0, 8)
        p2.Parent = ob
        ob.MouseButton1Click:Connect(function()
            selectedIdx = i
            btn.Text = "▾  " .. opt
            open = false
            tw(popup, 0.15, {Size = UDim2.new(0, btn.AbsoluteSize.X, 0, 0)})
            if onChange then onChange(i, opt) end
        end)
        ob.MouseEnter:Connect(function()
            ob.BackgroundTransparency = 0.7
        end)
        ob.MouseLeave:Connect(function()
            ob.BackgroundTransparency = 1
        end)
        optBtns[i] = ob
    end

    btn.MouseButton1Click:Connect(function()
        open = not open
        local abs = btn.AbsolutePosition
        popup.Position = UDim2.new(0, abs.X, 0, abs.Y + 32)
        popup.Size = UDim2.new(0, btn.AbsoluteSize.X, 0, 0)
        if open then
            tw(popup, 0.18, {Size = UDim2.new(0, btn.AbsoluteSize.X, 0, popupH)},
                Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        else
            tw(popup, 0.12, {Size = UDim2.new(0, btn.AbsoluteSize.X, 0, 0)})
        end
    end)

    UserInputService.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 and open then
            task.defer(function()
                local mx, my = inp.Position.X, inp.Position.Y
                local pa = popup.AbsolutePosition
                local ps = popup.AbsoluteSize
                if mx < pa.X or mx > pa.X+ps.X or my < pa.Y or my > pa.Y+ps.Y then
                    open = false
                    tw(popup, 0.12, {Size = UDim2.new(0, btn.AbsoluteSize.X, 0, 0)})
                end
            end)
        end
    end)

    Theme:Listen(function(t)
        lbl.TextColor3 = t.Text
        btn.TextColor3 = t.Text
        btn.BackgroundColor3 = t.Panel
        uiStroke(btn, t.Stroke, 1)
        popup.BackgroundColor3 = t.Panel
        uiStroke(popup, t.Stroke, 1)
        for _, ob in ipairs(optBtns) do
            ob.TextColor3 = t.Text
            ob.BackgroundColor3 = t.Panel
        end
    end)

    return {
        Get = function() return selectedIdx end,
        Set = function(i)
            selectedIdx = i
            btn.Text = "▾  " .. (options[i] or "")
        end,
    }
end

function Controls.Button(parent, labelText, onClick)
    local btn = Instance.new("TextButton")
    btn.Text = labelText
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.TextColor3 = Theme:Get("Accent")
    btn.BackgroundColor3 = Theme:Get("Panel")
    btn.Size = UDim2.new(1,-24,0,34)
    btn.Position = UDim2.new(0,12,0,0)
    btn.AutoButtonColor = false
    btn.Parent = parent
    corner(btn, 8)
    uiStroke(btn, Theme:Get("Stroke"), 1)

    btn.MouseEnter:Connect(function()
        tw(btn, 0.12, {BackgroundColor3 = Theme:Get("Accent"), TextColor3 = Color3.new(1,1,1)})
    end)
    btn.MouseLeave:Connect(function()
        tw(btn, 0.12, {BackgroundColor3 = Theme:Get("Panel"), TextColor3 = Theme:Get("Accent")})
    end)
    btn.MouseButton1Click:Connect(function()
        if onClick then onClick() end
    end)

    -- wrapper frame for spacing
    local row = newFrame(parent, UDim2.new(1,0,0,46), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
    btn.Parent = row

    Theme:Listen(function(t)
        btn.TextColor3 = t.Accent
        btn.BackgroundColor3 = t.Panel
        uiStroke(btn, t.Stroke, 1)
    end)
    return btn
end

function Controls.ColorPicker(parent, labelText, default, onChange)
    local val = default or Color3.fromRGB(130,160,255)
    local row = newFrame(parent, UDim2.new(1,0,0,100), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)

    local topRow = newFrame(row, UDim2.new(1,0,0,30), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
    local lbl = newLabel(topRow, labelText, 13, Theme:Get("Text"), Enum.Font.GothamMedium)
    lbl.Size = UDim2.new(1,-54,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    local swatch = newFrame(topRow, UDim2.new(0,30,0,20), UDim2.new(1,-42,0.5,-10), val, 0)
    corner(swatch, 5)
    uiStroke(swatch, Theme:Get("Stroke"), 1)

    local function refreshSwatch()
        swatch.BackgroundColor3 = val
    end

    local function makeChannelSlider(label, getC, setC)
        Controls.Slider(row, label, 0, 255, math.floor(getC()*255), function(v)
            setC(v/255)
            refreshSwatch()
            if onChange then onChange(val) end
        end, function(v) return tostring(math.floor(v)) end)
    end

    makeChannelSlider("R", function() return val.R end, function(v) val = Color3.new(v, val.G, val.B) end)
    makeChannelSlider("G", function() return val.G end, function(v) val = Color3.new(val.R, v, val.B) end)
    makeChannelSlider("B", function() return val.B end, function(v) val = Color3.new(val.R, val.G, v) end)

    row.Size = UDim2.new(1,0,0,30 + 52*3 + 4)
    Theme:Listen(function(t)
        lbl.TextColor3 = t.Text
        uiStroke(swatch, t.Stroke, 1)
    end)
    return {
        Get = function() return val end,
        Set = function(c) val = c; refreshSwatch() end,
    }
end

function Controls.TextInput(parent, labelText, placeholder, default, onChange)
    local row = newFrame(parent, UDim2.new(1,0,0,52), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
    local lbl = newLabel(row, labelText, 13, Theme:Get("Text"), Enum.Font.GothamMedium)
    lbl.Size = UDim2.new(1,-24,0,22)
    lbl.Position = UDim2.new(0,12,0,2)

    local box = Instance.new("TextBox")
    box.Text = default or ""
    box.PlaceholderText = placeholder or ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 12
    box.TextColor3 = Theme:Get("Text")
    box.PlaceholderColor3 = Theme:Get("SubText")
    box.BackgroundColor3 = Theme:Get("Panel")
    box.Size = UDim2.new(1,-24,0,24)
    box.Position = UDim2.new(0,12,0,26)
    box.TextXAlignment = Enum.TextXAlignment.Left
    box.ClearTextOnFocus = false
    box.Parent = row
    corner(box, 6)
    uiStroke(box, Theme:Get("Stroke"), 1)
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0,8)
    pad.Parent = box

    box.FocusLost:Connect(function()
        if onChange then onChange(box.Text) end
    end)

    Theme:Listen(function(t)
        lbl.TextColor3 = t.Text
        box.TextColor3 = t.Text
        box.PlaceholderColor3 = t.SubText
        box.BackgroundColor3 = t.Panel
        uiStroke(box, t.Stroke, 1)
    end)

    return {
        Get = function() return box.Text end,
        Set = function(v) box.Text = v end,
    }
end

-- ══════════════════════════════════════════════
-- BUILD MAIN UI
-- ══════════════════════════════════════════════
local function buildUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "UI3R"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = lp.PlayerGui

    -- Responsive scale
    local uiScale = Instance.new("UIScale")
    uiScale.Parent = gui
    local function updateScale()
        local vp = gui.AbsoluteSize
        local s = math.clamp(vp.X / 1280, Config.MinScale, Config.MaxScale)
        uiScale.Scale = s
    end
    updateScale()
    gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScale)

    -- Window
    local win = newFrame(gui,
        UDim2.new(0, Config.WindowW, 0, Config.WindowH),
        UDim2.new(0.5, -Config.WindowW/2, 0.5, -Config.WindowH/2),
        Theme:Get("Bg"), Theme:Get("BgAlpha"))
    corner(win, 12)
    uiStroke(win, Theme:Get("Stroke"), 1)

    -- Background image
    local bgImg = Instance.new("ImageLabel")
    bgImg.Name = "BgImage"
    bgImg.Image = Theme:Get("BgImage") or ""
    bgImg.ImageTransparency = 0.2
    bgImg.BackgroundTransparency = 1
    bgImg.ScaleType = Enum.ScaleType.Crop
    bgImg.Size = UDim2.new(1,0,1,0)
    bgImg.ZIndex = 0
    bgImg.Parent = win
    corner(bgImg, 12)
    bgImg.Visible = Theme:Get("hasImage") and Theme:Get("BgImage") ~= ""

    -- Glass highlight
    local shine = newFrame(win, UDim2.new(1,0,0,80), UDim2.new(0,0,0,0), Color3.new(1,1,1), 0.92)
    local shineGrad = Instance.new("UIGradient")
    shineGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,0.7),
        NumberSequenceKeypoint.new(1,1),
    })
    shineGrad.Rotation = 90
    shineGrad.Parent = shine
    corner(shine, 12)

    -- Theme listener for window
    Theme:Listen(function(t)
        win.BackgroundColor3 = t.Bg
        win.BackgroundTransparency = t.BgAlpha
        uiStroke(win, t.Stroke, 1)
        bgImg.Image = t.BgImage or ""
        bgImg.Visible = t.hasImage and t.BgImage ~= ""
    end)

    -- Top bar
    local topBar = newFrame(win, UDim2.new(1,0,0,36), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
    topBar.ZIndex = 2

    -- Accent strip
    local strip = newFrame(topBar, UDim2.new(1,0,0,2), UDim2.new(0,0,0,0), Theme:Get("Accent"), 0)
    corner(strip, 1)
    Theme:Listen(function(t) strip.BackgroundColor3 = t.Accent end)

    local titleLbl = newLabel(topBar, Config.Title .. "  ", 15, Theme:Get("Text"), Enum.Font.GothamBold)
    titleLbl.Size = UDim2.new(1,-80,1,0)
    titleLbl.Position = UDim2.new(0,14,0,2)
    Theme:Listen(function(t) titleLbl.TextColor3 = t.Text end)

    local verLbl = newLabel(topBar, "v"..Config.Version, 10, Theme:Get("SubText"), Enum.Font.Gotham)
    verLbl.Size = UDim2.new(0,40,1,0)
    verLbl.Position = UDim2.new(0,80,0,2)
    Theme:Listen(function(t) verLbl.TextColor3 = t.SubText end)

    -- Close / minimize buttons
    local function mkWinBtn(text, xOff, col, onClick)
        local b = Instance.new("TextButton")
        b.Text = text
        b.Font = Enum.Font.GothamBold
        b.TextSize = 14
        b.TextColor3 = Color3.fromRGB(180,180,190)
        b.BackgroundColor3 = Theme:Get("Panel")
        b.Size = UDim2.new(0,24,0,20)
        b.Position = UDim2.new(1,xOff,0.5,-10)
        b.AutoButtonColor = false
        b.Parent = topBar
        corner(b, 5)
        b.MouseEnter:Connect(function() tw(b,0.1,{BackgroundColor3=col}) end)
        b.MouseLeave:Connect(function() tw(b,0.1,{BackgroundColor3=Theme:Get("Panel")}) end)
        b.MouseButton1Click:Connect(onClick)
        Theme:Listen(function(t) b.BackgroundColor3 = t.Panel end)
        return b
    end

    local minimized = false
    local contentArea -- forward ref
    local tabBar      -- forward ref

    mkWinBtn("×", -12, Color3.fromRGB(220,70,70), function() gui:Destroy() end)
    local minBtn = mkWinBtn("−", -40, Color3.fromRGB(220,160,40), function()
        minimized = not minimized
        if contentArea then
            tw(contentArea, 0.2, {Size = minimized
                and UDim2.new(1,0,0,0)
                or  UDim2.new(1,0,1,-72)})
        end
        if tabBar then tabBar.Visible = not minimized end
    end)

    -- Separator
    local topDiv = newFrame(win, UDim2.new(1,0,0,1), UDim2.new(0,0,0,36), Theme:Get("Stroke"), 0)
    Theme:Listen(function(t) topDiv.BackgroundColor3 = t.Stroke end)

    -- Tab bar
    tabBar = newFrame(win, UDim2.new(1,0,0,34), UDim2.new(0,0,0,37), Color3.new(0,0,0),1)
    tabBar.ZIndex = 2

    local tabBtns = {}
    local indicator = newFrame(tabBar, UDim2.new(0,60,0,2), UDim2.new(0,0,1,-2),
        Theme:Get("Accent"), 0)
    Theme:Listen(function(t) indicator.BackgroundColor3 = t.Accent end)
    corner(indicator, 1)

    -- Content area (clipped)
    contentArea = newFrame(win, UDim2.new(1,0,1,-72), UDim2.new(0,0,0,71), Color3.new(0,0,0),1)
    contentArea.ClipsDescendants = true

    -- Scrolling pages per tab
    local Pages = {}
    for _, tabName in ipairs(Config.Tabs) do
        local sf = Instance.new("ScrollingFrame")
        sf.Name = tabName
        sf.Size = UDim2.new(1,0,1,0)
        sf.CanvasSize = UDim2.new(0,0,0,0)
        sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
        sf.ScrollBarThickness = 3
        sf.ScrollBarImageColor3 = Theme:Get("Accent")
        sf.BackgroundTransparency = 1
        sf.BorderSizePixel = 0
        sf.Visible = false
        sf.Parent = contentArea
        local list = Instance.new("UIListLayout")
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.Padding = UDim.new(0,4)
        list.Parent = sf
        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0,8)
        pad.PaddingBottom = UDim.new(0,8)
        pad.Parent = sf
        Pages[tabName] = sf
        Theme:Listen(function(t) sf.ScrollBarImageColor3 = t.Accent end)
    end

    -- Tab buttons
    local tabW = Config.WindowW / #Config.Tabs
    for i, tabName in ipairs(Config.Tabs) do
        local b = Instance.new("TextButton")
        b.Text = tabName
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 11
        b.TextColor3 = Theme:Get("SubText")
        b.BackgroundTransparency = 1
        b.Size = UDim2.new(0, tabW, 1, 0)
        b.Position = UDim2.new(0, (i-1)*tabW, 0, 0)
        b.AutoButtonColor = false
        b.Parent = tabBar
        tabBtns[i] = {btn=b, name=tabName, x=(i-1)*tabW, w=tabW}
        Theme:Listen(function(t) b.TextColor3 = t.SubText end)
    end

    local currentTab = nil
    local function selectTab(name)
        if currentTab then
            Pages[currentTab].Visible = false
        end
        currentTab = name
        Pages[name].Visible = true

        for _, tb in ipairs(tabBtns) do
            if tb.name == name then
                tw(tb.btn, 0.15, {TextColor3 = Theme:Get("Accent")})
                tw(indicator, 0.2,
                    {Position = UDim2.new(0, tb.x+6, 1, -2), Size = UDim2.new(0, tb.w-12, 0, 2)},
                    Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            else
                tw(tb.btn, 0.15, {TextColor3 = Theme:Get("SubText")})
            end
        end
        Theme:Listen(function(t)
            for _, tb2 in ipairs(tabBtns) do
                tw(tb2.btn, 0.15, {TextColor3 = tb2.name == currentTab and t.Accent or t.SubText})
            end
        end)
    end

    for _, tb in ipairs(tabBtns) do
        tb.btn.MouseButton1Click:Connect(function()
            selectTab(tb.name)
        end)
    end

    makeDraggable(win, topBar)

    task.defer(function()
        selectTab(Config.Tabs[1])
    end)

    return { Pages = Pages, Gui = gui, SelectTab = selectTab }
end

-- ══════════════════════════════════════════════
-- POPULATE TABS
-- ══════════════════════════════════════════════
local function populateTabs(pages, gui)
    local root = gui  -- for dropdowns

    -- ── COMBAT ──
    do
        local p = pages["combat"]
        Controls.Section(p, "Aimbot")
        local aimbotToggle = Controls.Toggle(p, "Aimbot", false, function(v) end)
        local silentToggle = Controls.Toggle(p, "Silent Aim", false, function(v) end)
        local fovSlider    = Controls.Slider(p, "FOV", 10, 500, 120)
        local targetDrop   = Controls.Dropdown(p, root, "Target Part",
            {"Head","Torso","HumanoidRootPart"}, 1)

        Controls.Section(p, "Auto-Shoot")
        local autoToggle   = Controls.Toggle(p, "Auto Shoot", false, function(v) end)
        local delaySlider  = Controls.Slider(p, "Shoot Delay (ms)", 0, 500, 100)
        Controls.Section(p, "Hitbox")
        local hitboxToggle = Controls.Toggle(p, "Hitbox Expand", false, function(v) end)
        local hitboxSlider = Controls.Slider(p, "Hitbox Size", 1, 20, 5)
    end

    -- ── ESP ──
    do
        local p = pages["esp"]
        Controls.Section(p, "Visualización")
        Controls.Toggle(p, "Box ESP", false, function(v) end)
        Controls.Toggle(p, "Nombre", false, function(v) end)
        Controls.Toggle(p, "Distancia", false, function(v) end)
        Controls.Slider(p, "Rango ESP", 50, 2000, 500)
        Controls.Section(p, "Colores")
        Controls.Dropdown(p, root, "Color equipo",{"Blanco","Rojo","Verde","Azul"},1)
        Controls.Toggle(p, "Mostrar teamates", false, function(v) end)
    end

    -- ── UTILITY ──
    do
        local p = pages["utility"]
        Controls.Section(p, "Movimiento")
        Controls.Toggle(p, "Speed Hack", false, function(v) end)
        Controls.Slider(p, "Walk Speed", 16, 200, 16)
        Controls.Toggle(p, "Fly", false, function(v) end)
        Controls.Slider(p, "Fly Speed", 10, 150, 50)
        Controls.Section(p, "Misc")
        Controls.Toggle(p, "God Mode", false, function(v) end)
        Controls.Toggle(p, "Noclip", false, function(v) end)
        Controls.Button(p, "Resetear personaje", function()
            lp.Character:FindFirstChildOfClass("Humanoid"):TakeDamage(math.huge)
        end)
    end

    -- ── AJUSTES ──
    do
        local p = pages["ajustes"]
        Controls.Section(p, "Tema")

        -- 3 theme buttons
        local themeRow = newFrame(p, UDim2.new(1,0,0,46), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
        local themeNames = {"glass","white","dark"}
        local themeLabels = {"Glass","White","Dark"}
        for i, tn in ipairs(themeNames) do
            local tb = Instance.new("TextButton")
            tb.Text = themeLabels[i]
            tb.Font = Enum.Font.GothamMedium
            tb.TextSize = 12
            tb.TextColor3 = Theme:Get("SubText")
            tb.BackgroundColor3 = Theme:Get("Panel")
            tb.Size = UDim2.new(0, 80, 0, 30)
            tb.Position = UDim2.new(0, 12 + (i-1)*88, 0.5, -15)
            tb.AutoButtonColor = false
            tb.Parent = themeRow
            corner(tb, 7)
            uiStroke(tb, Theme:Get("Stroke"), 1)
            Theme:Listen(function(t)
                tb.TextColor3 = t.SubText
                tb.BackgroundColor3 = t.Panel
                uiStroke(tb, t.Stroke, 1)
            end)
            tb.MouseButton1Click:Connect(function()
                Theme:Apply(tn)
            end)
            tb.MouseEnter:Connect(function()
                tw(tb,0.12,{BackgroundColor3=Theme:Get("Accent"), TextColor3=Color3.new(1,1,1)})
            end)
            tb.MouseLeave:Connect(function()
                tw(tb,0.12,{BackgroundColor3=Theme:Get("Panel"), TextColor3=Theme:Get("SubText")})
            end)
        end

        Controls.Section(p, "Imagen de fondo")
        local imgInput = Controls.TextInput(p, "URL o rbxassetid://", "rbxassetid://XXXXXX", "", function(v)
            local t = Theme._current
            t.BgImage = v
            Theme:Apply(nil) -- don't change theme, just re-fire
            -- Instead, manually update:
            for _, fn in pairs(Theme._listeners) do
                pcall(fn, Theme._current)
            end
        end)

        Controls.Button(p, "Aplicar imagen", function()
            local v = imgInput.Get()
            Theme._current.BgImage = v
            for _, fn in pairs(Theme._listeners) do
                pcall(fn, Theme._current)
            end
        end)

        Controls.Section(p, "Acento")
        Controls.ColorPicker(p, "Color de acento", Theme:Get("Accent"), function(c)
            Theme._current.Accent = c
            for _, fn in pairs(Theme._listeners) do
                pcall(fn, Theme._current)
            end
        end)

        Controls.Section(p, "Ventana")
        Controls.Slider(p, "Escala UI", 70, 140, 100, function(v)
            local sg = gui:FindFirstChildOfClass("UIScale")
            if sg then sg.Scale = v/100 end
        end)
    end

    -- ── CRÉDITOS ──
    do
        local p = pages["creditos"]

        -- Author card
        local card = newFrame(p, UDim2.new(1,-24,0,100),
            UDim2.new(0,12,0,0), Theme:Get("Panel"), 0)
        corner(card, 10)
        uiStroke(card, Theme:Get("Stroke"), 1)
        Theme:Listen(function(t)
            card.BackgroundColor3 = t.Panel
            uiStroke(card, t.Stroke, 1)
        end)

        -- Avatar
        local avatarFrame = newFrame(card, UDim2.new(0,72,0,72),
            UDim2.new(0,14,0.5,-36), Theme:Get("Stroke"), 0)
        corner(avatarFrame, 36)
        uiStroke(avatarFrame, Theme:Get("Accent"), 2)
        Theme:Listen(function(t)
            avatarFrame.BackgroundColor3 = t.Stroke
            uiStroke(avatarFrame, t.Accent, 2)
        end)

        local avatarImg = Instance.new("ImageLabel")
        avatarImg.Size = UDim2.new(1,-4,1,-4)
        avatarImg.Position = UDim2.new(0,2,0,2)
        avatarImg.BackgroundTransparency = 1
        avatarImg.Image = ""
        avatarImg.Parent = avatarFrame
        corner(avatarImg, 33)

        -- Async load avatar
        task.spawn(function()
            local ok, thumb = pcall(function()
                return Players:GetUserThumbnailAsync(
                    Config.Credits.AuthorId,
                    Enum.ThumbnailType.HeadShot,
                    Enum.ThumbnailSize.Size420x420
                )
            end)
            if ok and thumb then
                avatarImg.Image = thumb
            end
        end)

        -- Author name + role
        local nameLbl = newLabel(card, Config.Credits.AuthorName, 16,
            Theme:Get("Text"), Enum.Font.GothamBold)
        nameLbl.Size = UDim2.new(1,-110,0,24)
        nameLbl.Position = UDim2.new(0,100,0,20)
        Theme:Listen(function(t) nameLbl.TextColor3 = t.Text end)

        local roleLbl = newLabel(card, "developer · UI3R v"..Config.Version, 11,
            Theme:Get("SubText"), Enum.Font.Gotham)
        roleLbl.Size = UDim2.new(1,-110,0,20)
        roleLbl.Position = UDim2.new(0,100,0,44)
        Theme:Listen(function(t) roleLbl.TextColor3 = t.SubText end)

        -- Accent line under name
        local accentLine = newFrame(card, UDim2.new(0,60,0,2),
            UDim2.new(0,100,0,42), Theme:Get("Accent"), 0)
        corner(accentLine, 1)
        Theme:Listen(function(t) accentLine.BackgroundColor3 = t.Accent end)

        -- wrapper frame for card spacing
        local cardWrapper = newFrame(p, UDim2.new(1,0,0,114), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
        card.Parent = cardWrapper

        -- Links section
        Controls.Section(p, "Links")

        local function linkBtn(icon, label, url)
            local row = newFrame(p, UDim2.new(1,0,0,42), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
            local iconBox = newFrame(row, UDim2.new(0,30,0,30),
                UDim2.new(0,12,0.5,-15), Theme:Get("Accent"), 0.1)
            corner(iconBox, 6)
            Theme:Listen(function(t) iconBox.BackgroundColor3 = t.Accent end)

            local iconLbl = newLabel(iconBox, icon, 16, Theme:Get("Accent"),
                Enum.Font.GothamBold, Enum.TextXAlignment.Center, Enum.TextYAlignment.Center)
            iconLbl.Size = UDim2.new(1,0,1,0)
            Theme:Listen(function(t) iconLbl.TextColor3 = t.Accent end)

            local nameLb = newLabel(row, label, 13, Theme:Get("Text"), Enum.Font.GothamMedium)
            nameLb.Size = UDim2.new(1,-110,1,0)
            nameLb.Position = UDim2.new(0,52,0,0)
            Theme:Listen(function(t) nameLb.TextColor3 = t.Text end)

            local urlLb = newLabel(row, url, 10, Theme:Get("SubText"), Enum.Font.Gotham,
                Enum.TextXAlignment.Right)
            urlLb.Size = UDim2.new(0,120,1,0)
            urlLb.Position = UDim2.new(1,-132,0,0)
            Theme:Listen(function(t) urlLb.TextColor3 = t.SubText end)

            local overlay = Instance.new("TextButton")
            overlay.Text = ""
            overlay.BackgroundTransparency = 1
            overlay.Size = UDim2.new(1,0,1,0)
            overlay.Parent = row
            overlay.MouseEnter:Connect(function()
                tw(row, 0.1, {BackgroundColor3 = Theme:Get("Panel"), BackgroundTransparency = 0.5})
            end)
            overlay.MouseLeave:Connect(function()
                tw(row, 0.1, {BackgroundTransparency = 1})
            end)
            -- Could use setclipboard(url) in executor
            overlay.MouseButton1Click:Connect(function()
                pcall(function()
                    setclipboard(url)
                end)
            end)
            return row
        end

        if Config.Credits.Discord ~= "" then
            linkBtn("D", "Discord", Config.Credits.Discord)
        end
        if Config.Credits.YouTube ~= "" then
            linkBtn("▶", "YouTube", Config.Credits.YouTube)
        end

        -- About text
        Controls.Section(p, "Acerca de")
        local aboutRow = newFrame(p, UDim2.new(1,0,0,60), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
        local aboutCard = newFrame(aboutRow, UDim2.new(1,-24,0,52),
            UDim2.new(0,12,0,4), Theme:Get("Panel"), 0)
        corner(aboutCard, 8)
        Theme:Listen(function(t) aboutCard.BackgroundColor3 = t.Panel end)
        local aboutLbl = Instance.new("TextLabel")
        aboutLbl.Text = "UI3R v"..Config.Version.." — Glass iOS-style UI\nHecho con ♥ — executor compatible"
        aboutLbl.Font = Enum.Font.Gotham
        aboutLbl.TextSize = 11
        aboutLbl.TextColor3 = Theme:Get("SubText")
        aboutLbl.TextWrapped = true
        aboutLbl.BackgroundTransparency = 1
        aboutLbl.Size = UDim2.new(1,-16,1,0)
        aboutLbl.Position = UDim2.new(0,8,0,0)
        aboutLbl.TextXAlignment = Enum.TextXAlignment.Left
        aboutLbl.Parent = aboutCard
        Theme:Listen(function(t) aboutLbl.TextColor3 = t.SubText end)
    end
end

-- ══════════════════════════════════════════════
-- LAUNCH
-- ══════════════════════════════════════════════
runIntro(function()
    local ui = buildUI()
    populateTabs(ui.Pages, ui.Gui)
end)
