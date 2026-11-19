--[[
  UI3R v4.0 — SnowX-style glass UI · tabs en la parte superior
  Estética: blanco/glass · imagen de personaje · cards limpias · toggles iOS
]]

-- ══════════════════════════════════════════════
-- SERVICES
-- ══════════════════════════════════════════════
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp               = Players.LocalPlayer

-- ══════════════════════════════════════════════
-- CONFIG  — edita aquí
-- ══════════════════════════════════════════════
local Config = {
    Title        = "UI3R",
    Author       = "By autor",
    Version      = "4.0",
    WindowW      = 740,
    WindowH      = 460,
    -- Imagen de personaje (rbxassetid:// o URL) — déjala vacía para nada
    CharImage    = "",
    -- Tabs: {id, label, icon (texto/emoji)}
    Tabs = {
        { id="player",   label="Player",    icon="👤" },
        { id="combat",   label="Combat",    icon="⚔️"  },
        { id="esp",      label="ESP",       icon="👁️"  },
        { id="extra",    label="Extra",     icon="⚙️"  },
        { id="ajustes",  label="Settings",  icon="🎨"  },
        { id="creditos", label="Credits",   icon="⭐"  },
    },
    Credits = {
        AuthorName = "autor",
        AuthorId   = 1,
        Discord    = "discord.gg/xxx",
        YouTube    = "",
    },
    IntroDuration = 3.2,
}

-- ══════════════════════════════════════════════
-- THEME
-- ══════════════════════════════════════════════
local Themes = {
    glass = {
        name     = "Glass",
        Win      = Color3.fromRGB(240, 242, 248),
        WinAlpha = 0.08,
        Sidebar  = Color3.fromRGB(230, 232, 240),
        SideAlpha= 0.12,
        Card     = Color3.fromRGB(255, 255, 255),
        CardAlpha= 0.55,
        Text     = Color3.fromRGB(30, 30, 45),
        SubText  = Color3.fromRGB(120, 125, 145),
        Accent   = Color3.fromRGB(80, 110, 230),
        Stroke   = Color3.fromRGB(210, 212, 225),
        TabActive= Color3.fromRGB(80, 110, 230),
        TabBg    = Color3.fromRGB(80, 110, 230),
        hasImage = false,
        BgImage  = "",
    },
    dark = {
        name     = "Dark",
        Win      = Color3.fromRGB(14, 14, 20),
        WinAlpha = 0.15,
        Sidebar  = Color3.fromRGB(20, 20, 28),
        SideAlpha= 0.0,
        Card     = Color3.fromRGB(28, 28, 38),
        CardAlpha= 0.0,
        Text     = Color3.fromRGB(220, 222, 235),
        SubText  = Color3.fromRGB(100, 102, 120),
        Accent   = Color3.fromRGB(100, 130, 255),
        Stroke   = Color3.fromRGB(40, 42, 55),
        TabActive= Color3.fromRGB(100, 130, 255),
        TabBg    = Color3.fromRGB(100, 130, 255),
        hasImage = true,
        BgImage  = "",
    },
    purple = {
        name     = "Purple",
        Win      = Color3.fromRGB(18, 12, 30),
        WinAlpha = 0.10,
        Sidebar  = Color3.fromRGB(28, 18, 45),
        SideAlpha= 0.0,
        Card     = Color3.fromRGB(38, 25, 60),
        CardAlpha= 0.0,
        Text     = Color3.fromRGB(230, 220, 245),
        SubText  = Color3.fromRGB(140, 120, 165),
        Accent   = Color3.fromRGB(180, 100, 255),
        Stroke   = Color3.fromRGB(60, 40, 90),
        TabActive= Color3.fromRGB(180, 100, 255),
        TabBg    = Color3.fromRGB(180, 100, 255),
        hasImage = true,
        BgImage  = "",
    },
}

local T = { _cur = Themes.glass, _listeners = {} }
function T:Get(k) return self._cur[k] end
function T:Listen(fn)
    local id = {}
    self._listeners[id] = fn
    return function() self._listeners[id] = nil end
end
function T:Apply(name, bgImage)
    local t = Themes[name] or self._cur
    if bgImage ~= nil then t.BgImage = bgImage end
    self._cur = t
    for _, fn in pairs(self._listeners) do pcall(fn, t) end
end
function T:Fire()
    for _, fn in pairs(self._listeners) do pcall(fn, self._cur) end
end

-- ══════════════════════════════════════════════
-- HELPERS
-- ══════════════════════════════════════════════
local function tw(i, t, p, s, d)
    TweenService:Create(i, TweenInfo.new(t, s or Enum.EasingStyle.Quad,
        d or Enum.EasingDirection.Out), p):Play()
end
local function corner(p, r)
    local c = Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r or 8); c.Parent=p; return c
end
local function stroke(p, col, th)
    local s = Instance.new("UIStroke"); s.Color=col; s.Thickness=th or 1; s.Parent=p; return s
end
local function frame(parent, size, pos, col, alpha)
    local f = Instance.new("Frame")
    f.Size=size; f.Position=pos or UDim2.new(0,0,0,0)
    f.BackgroundColor3=col or Color3.new(1,1,1)
    f.BackgroundTransparency=alpha or 0
    f.BorderSizePixel=0; f.Parent=parent; return f
end
local function label(parent, text, size, col, font, xa)
    local l = Instance.new("TextLabel")
    l.Text=text; l.TextSize=size; l.TextColor3=col
    l.Font=font or Enum.Font.GothamMedium
    l.BackgroundTransparency=1
    l.TextXAlignment=xa or Enum.TextXAlignment.Left
    l.TextYAlignment=Enum.TextYAlignment.Center
    l.Parent=parent; return l
end
local function draggable(win, bar)
    local drag, di, ds, sp
    bar.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then
            drag=true; ds=i.Position; sp=win.Position
            i.Changed:Connect(function()
                if i.UserInputState==Enum.UserInputState.End then drag=false end
            end)
        end
    end)
    bar.InputChanged:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseMovement then di=i end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if i==di and drag then
            local d=i.Position-ds
            win.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)
        end
    end)
end

-- ══════════════════════════════════════════════
-- INTRO (duelz-style)
-- ══════════════════════════════════════════════
local function runIntro(onDone)
    local sg = Instance.new("ScreenGui")
    sg.Name="UI3R_Intro"; sg.ResetOnSpawn=false
    sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    sg.Parent=lp.PlayerGui

    -- Overlay
    local bg = frame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)
    tw(bg, 0.5, {BackgroundTransparency=0.04})

    -- Beams
    local beamC = frame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(0,0,0), 1)
    beamC.ZIndex=2
    local acc = Color3.fromRGB(100, 130, 255)
    local beams = {}
    for i=1,5 do
        local b = frame(beamC, UDim2.new(0,3,0,2000), UDim2.new(0.5,-1,0.5,-1000), acc, 0.5)
        b.ZIndex=2; b.AnchorPoint=Vector2.new(0.5,0.5)
        b.Rotation=(i-1)*36
        local g=Instance.new("UIGradient")
        g.Transparency=NumberSequence.new({
            NumberSequenceKeypoint.new(0,1),
            NumberSequenceKeypoint.new(0.35,0.4),
            NumberSequenceKeypoint.new(0.5,0.3),
            NumberSequenceKeypoint.new(0.65,0.4),
            NumberSequenceKeypoint.new(1,1),
        }); g.Parent=b
        beams[i]={b=b,a=(i-1)*36}
    end

    -- Dust
    local dustC = frame(sg, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Color3.new(0,0,0),1)
    dustC.ZIndex=3
    local dust={}
    for i=1,16 do
        local sz=math.random(2,4)
        local d=frame(dustC,UDim2.new(0,sz,0,sz),UDim2.new(math.random(10,90)/100,0,math.random(40,90)/100,0),
            Color3.fromRGB(160,185,255),0.4)
        d.ZIndex=3; corner(d,sz)
        dust[i]={f=d,px=math.random(10,90)/100,py=math.random(40,90)/100,
            sp=math.random(10,30)/1000,ph=math.random()*math.pi*2}
    end

    -- Rings
    local function ring(sz, col, thick)
        local r=frame(sg,UDim2.new(0,sz,0,sz),UDim2.new(0.5,-sz/2,0.5,-sz/2),Color3.new(0,0,0),1)
        r.ZIndex=4; corner(r,sz/2); stroke(r,col,thick); return r
    end
    local r1=ring(180,acc,2)
    local r2=ring(140,Color3.fromRGB(60,80,180),1)
    local glow=frame(sg,UDim2.new(0,60,0,60),UDim2.new(0.5,-30,0.5,-30),acc,0.5)
    glow.ZIndex=4; corner(glow,30)

    -- Dividers
    local function mkDiv(yOff)
        local row=frame(sg,UDim2.new(0,0,0,16),UDim2.new(0.5,0,0.5,yOff),Color3.new(0,0,0),1)
        row.AnchorPoint=Vector2.new(0.5,0.5); row.ZIndex=5
        local ll=frame(row,UDim2.new(0,0,0,1),UDim2.new(0.5,-4,0.5,0),acc,0.4)
        ll.AnchorPoint=Vector2.new(1,0.5); ll.ZIndex=5
        local rl=frame(row,UDim2.new(0,0,0,1),UDim2.new(0.5,4,0.5,0),acc,0.4)
        rl.AnchorPoint=Vector2.new(0,0.5); rl.ZIndex=5
        local dia=frame(row,UDim2.new(0,7,0,7),UDim2.new(0.5,-3.5,0.5,-3.5),acc,0)
        dia.Rotation=45; dia.ZIndex=5
        return {ll=ll,rl=rl,dia=dia}
    end
    local d1=mkDiv(-120); local d2=mkDiv(90)

    -- Letters
    local WORD=Config.Title
    local LSPACING=52
    local TW=#WORD*LSPACING
    local lc=frame(sg,UDim2.new(0,TW+10,0,56),UDim2.new(0.5,-(TW+10)/2,0.5,-28),Color3.new(0,0,0),1)
    lc.ZIndex=6
    local slots={}
    for i=1,#WORD do
        local sl=frame(lc,UDim2.new(0,LSPACING,0,56),UDim2.new(0,(i-1)*LSPACING,0,0),Color3.new(0,0,0),1)
        sl.ZIndex=6
        local lbl=Instance.new("TextLabel")
        lbl.Text=WORD:sub(i,i); lbl.Font=Enum.Font.GothamBold; lbl.TextSize=38
        lbl.TextColor3=Color3.new(1,1,1); lbl.TextTransparency=1
        lbl.BackgroundTransparency=1; lbl.Size=UDim2.new(1,0,1,0)
        lbl.TextXAlignment=Enum.TextXAlignment.Center; lbl.ZIndex=6; lbl.Parent=sl
        local usc=Instance.new("UIScale"); usc.Scale=0; usc.Parent=sl
        slots[i]={sl=sl,lb=lbl,usc=usc}
    end

    -- Subtitle
    local sub=Instance.new("TextLabel")
    sub.Text=Config.Author.." · v"..Config.Version
    sub.Font=Enum.Font.Gotham; sub.TextSize=13
    sub.TextColor3=Color3.fromRGB(160,170,210); sub.TextTransparency=1
    sub.BackgroundTransparency=1; sub.Size=UDim2.new(0,400,0,22)
    sub.Position=UDim2.new(0.5,-200,0.5,42); sub.TextXAlignment=Enum.TextXAlignment.Center
    sub.ZIndex=6; sub.Parent=sg

    -- Progress
    local pbg=frame(sg,UDim2.new(0,280,0,3),UDim2.new(0.5,-140,1,-36),Color3.fromRGB(50,55,80),0)
    pbg.ZIndex=7; corner(pbg,2)
    local pf=frame(pbg,UDim2.new(0,0,1,0),UDim2.new(0,0,0,0),acc,0)
    pf.ZIndex=7; corner(pf,2)

    -- Animate
    local t=0
    local conn=RunService.RenderStepped:Connect(function(dt)
        t=t+dt
        for _,b in ipairs(beams) do b.b.Rotation=b.a+math.sin(t*0.35)*18 end
        for _,d in ipairs(dust) do
            local ny=d.py-(t*d.sp)%1
            if ny<-0.05 then ny=ny+1 end
            d.f.Position=UDim2.new(d.px+math.sin(t*0.5+d.ph)*0.012,0,ny+math.sin(t*0.7+d.ph)*0.008,0)
        end
        r1.Rotation=t*25; r2.Rotation=-t*18
        glow.BackgroundTransparency=0.5+math.sin(t*2)*0.08
    end)

    task.spawn(function()
        task.wait(0.4)
        for _,dv in ipairs({d1,d2}) do
            tw(dv.ll,0.7,{Size=UDim2.new(0,200,0,1),BackgroundTransparency=0.35})
            tw(dv.rl,0.7,{Size=UDim2.new(0,200,0,1),BackgroundTransparency=0.35})
            tw(dv.dia,0.35,{BackgroundTransparency=0})
        end
        task.wait(0.6)
        for i,s in ipairs(slots) do
            task.wait(0.09)
            tw(s.usc,0.22,{Scale=1.25},Enum.EasingStyle.Back,Enum.EasingDirection.Out)
            tw(s.lb,0.18,{TextTransparency=0})
            task.wait(0.1); tw(s.usc,0.14,{Scale=1})
            for j=1,3 do
                local sp=frame(sg,UDim2.new(0,3,0,3),
                    UDim2.new(0,lc.AbsolutePosition.X+(i-0.5)*LSPACING+math.random(-10,10),
                              0,lc.AbsolutePosition.Y+math.random(-8,8)),
                    Color3.new(1,1,1),0)
                sp.ZIndex=9; corner(sp,2)
                tw(sp,0.45,{
                    Position=UDim2.new(0,lc.AbsolutePosition.X+(i-0.5)*LSPACING+math.random(-28,28),
                                       0,lc.AbsolutePosition.Y+math.random(-40,-10)),
                    BackgroundTransparency=1,Size=UDim2.new(0,1,0,1)})
                task.delay(0.5,function() sp:Destroy() end)
            end
        end
        task.wait(0.15); tw(sub,0.5,{TextTransparency=0})
        -- Flash
        local fl=frame(sg,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),Color3.new(1,1,1),1)
        fl.ZIndex=10; tw(fl,0.07,{BackgroundTransparency=0.45})
        task.wait(0.07); tw(fl,0.28,{BackgroundTransparency=1})
        task.delay(0.32,function() fl:Destroy() end)
        -- Progress bar
        local pd=Config.IntroDuration-1.3; local ps=tick()
        local pc=RunService.RenderStepped:Connect(function()
            pf.Size=UDim2.new(math.min((tick()-ps)/pd,1),0,1,0)
        end)
        task.wait(pd); pc:Disconnect(); pf.Size=UDim2.new(1,0,1,0)
        task.wait(0.25)
        -- Outro
        conn:Disconnect()
        for _,s in ipairs(slots) do tw(s.lb,0.35,{TextTransparency=1}) end
        tw(sub,0.3,{TextTransparency=1}); tw(bg,0.45,{BackgroundTransparency=1})
        tw(glow,0.3,{BackgroundTransparency=1}); tw(r1,0.3,{BackgroundTransparency=1})
        tw(r2,0.3,{BackgroundTransparency=1})
        for _,d in ipairs(dust) do tw(d.f,0.25,{BackgroundTransparency=1}) end
        tw(pbg,0.3,{BackgroundTransparency=1}); tw(pf,0.3,{BackgroundTransparency=1})
        task.wait(0.5); sg:Destroy(); onDone()
    end)
end

-- ══════════════════════════════════════════════
-- CONTROLS
-- ══════════════════════════════════════════════
local C = {}

-- Wrapper card for each row
local function card(parent, h)
    local c=frame(parent,UDim2.new(1,-20,0,h or 44),UDim2.new(0,10,0,0),
        T:Get("Card"),T:Get("CardAlpha"))
    corner(c,10)
    T:Listen(function(t) c.BackgroundColor3=t.Card; c.BackgroundTransparency=t.CardAlpha end)
    return c
end

function C.Section(parent, text)
    local row=frame(parent,UDim2.new(1,0,0,30),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
    local l=label(row,text,11,T:Get("Accent"),Enum.Font.GothamBold)
    l.Size=UDim2.new(1,-20,1,0); l.Position=UDim2.new(0,20,0,0)
    T:Listen(function(t) l.TextColor3=t.Accent end)
    return row
end

function C.Toggle(parent, text, default, onChange)
    local val=default or false
    local c=card(parent,44)
    local l=label(c,text,13,T:Get("Text"),Enum.Font.GothamMedium)
    l.Size=UDim2.new(1,-68,1,0); l.Position=UDim2.new(0,14,0,0)
    T:Listen(function(t) l.TextColor3=t.Text end)

    local track=frame(c,UDim2.new(0,46,0,26),UDim2.new(1,-58,0.5,-13),
        val and T:Get("Accent") or T:Get("Stroke"),0)
    corner(track,13)
    local knob=frame(track,UDim2.new(0,22,0,22),UDim2.new(0,2,0.5,-11),Color3.new(1,1,1),0)
    corner(knob,11)
    -- subtle shadow on knob
    local kst=stroke(knob,Color3.fromRGB(180,180,200),0.5)

    local overlay=Instance.new("TextButton")
    overlay.Text=""; overlay.BackgroundTransparency=1
    overlay.Size=UDim2.new(1,0,1,0); overlay.Parent=c

    local function refresh(anim)
        local kx=val and UDim2.new(1,-24,0.5,-11) or UDim2.new(0,2,0.5,-11)
        local tc=val and T:Get("Accent") or T:Get("Stroke")
        if anim then
            tw(knob,0.2,{Position=kx},Enum.EasingStyle.Quad)
            tw(track,0.2,{BackgroundColor3=tc})
        else
            knob.Position=kx; track.BackgroundColor3=tc
        end
    end
    refresh(false)

    overlay.MouseButton1Click:Connect(function()
        val=not val; refresh(true)
        if onChange then onChange(val) end
    end)
    T:Listen(function(t)
        l.TextColor3=t.Text
        track.BackgroundColor3=val and t.Accent or t.Stroke
    end)
    return {Get=function()return val end, Set=function(v) val=v; refresh(false) end}
end

function C.Slider(parent, text, minV, maxV, defV, onChange, fmt)
    local val=defV or minV
    fmt=fmt or function(v) return math.floor(v) end
    local c=card(parent,54)

    local topR=frame(c,UDim2.new(1,0,0,22),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
    local l=label(topR,text,13,T:Get("Text"),Enum.Font.GothamMedium)
    l.Size=UDim2.new(1,-54,1,0); l.Position=UDim2.new(0,14,0,0)
    local vl=label(topR,tostring(fmt(val)),12,T:Get("Accent"),Enum.Font.GothamMedium,
        Enum.TextXAlignment.Right)
    vl.Size=UDim2.new(0,42,1,0); vl.Position=UDim2.new(1,-52,0,0)

    local tbg=frame(c,UDim2.new(1,-28,0,4),UDim2.new(0,14,0,38),T:Get("Stroke"),0)
    corner(tbg,2)
    local tf=frame(tbg,UDim2.new(0,0,1,0),UDim2.new(0,0,0,0),T:Get("Accent"),0)
    corner(tf,2)
    local kn=frame(tbg,UDim2.new(0,16,0,16),UDim2.new(0,0,0.5,-8),Color3.new(1,1,1),0)
    corner(kn,8); stroke(kn,T:Get("Stroke"),0.8)

    local function set(v,anim)
        val=math.clamp(v,minV,maxV)
        local fr=(val-minV)/(maxV-minV)
        vl.Text=tostring(fmt(val))
        if anim then
            tw(tf,0.08,{Size=UDim2.new(fr,0,1,0)})
            tw(kn,0.08,{Position=UDim2.new(fr,-8,0.5,-8)})
        else
            tf.Size=UDim2.new(fr,0,1,0); kn.Position=UDim2.new(fr,-8,0.5,-8)
        end
        if onChange then onChange(val) end
    end
    set(val,false)

    local drag=false
    kn.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and i.UserInputType==Enum.UserInputType.MouseMovement then
            local ap=tbg.AbsolutePosition; local as=tbg.AbsoluteSize
            set(minV+(maxV-minV)*math.clamp((i.Position.X-ap.X)/as.X,0,1),false)
        end
    end)
    T:Listen(function(t)
        l.TextColor3=t.Text; vl.TextColor3=t.Accent
        tbg.BackgroundColor3=t.Stroke; tf.BackgroundColor3=t.Accent
        stroke(kn,t.Stroke,0.8)
    end)
    return {Get=function()return val end, Set=function(v) set(v,false) end}
end

function C.Dropdown(parent, root, text, options, defIdx, onChange)
    local sel=defIdx or 1
    local open=false
    local c=card(parent,44)

    local l=label(c,text,13,T:Get("Text"),Enum.Font.GothamMedium)
    l.Size=UDim2.new(0.4,0,1,0); l.Position=UDim2.new(0,14,0,0)
    T:Listen(function(t) l.TextColor3=t.Text end)

    local btn=Instance.new("TextButton")
    btn.Text=(options[sel] or "").."  ▾"
    btn.Font=Enum.Font.GothamMedium; btn.TextSize=12
    btn.TextColor3=T:Get("Text"); btn.BackgroundColor3=T:Get("Stroke")
    btn.BackgroundTransparency=0.5; btn.Size=UDim2.new(0.52,0,0,30)
    btn.Position=UDim2.new(0.46,0,0.5,-15)
    btn.TextXAlignment=Enum.TextXAlignment.Center
    btn.AutoButtonColor=false; btn.Parent=c
    corner(btn,8); stroke(btn,T:Get("Stroke"),1)
    T:Listen(function(t)
        btn.TextColor3=t.Text; btn.BackgroundColor3=t.Stroke
        stroke(btn,t.Stroke,1)
    end)

    local popH=#options*32+6
    local pop=frame(root,UDim2.new(0,160,0,0),UDim2.new(0,0,0,0),T:Get("Card"),T:Get("CardAlpha"))
    pop.ZIndex=25; pop.ClipsDescendants=true; corner(pop,8); stroke(pop,T:Get("Stroke"),1)
    T:Listen(function(t)
        pop.BackgroundColor3=t.Card; pop.BackgroundTransparency=t.CardAlpha
        stroke(pop,t.Stroke,1)
    end)
    local plist=Instance.new("UIListLayout")
    plist.SortOrder=Enum.SortOrder.LayoutOrder; plist.Padding=UDim.new(0,2); plist.Parent=pop

    local oBtns={}
    for i,opt in ipairs(options) do
        local ob=Instance.new("TextButton")
        ob.Text=opt; ob.Font=Enum.Font.GothamMedium; ob.TextSize=12
        ob.TextColor3=T:Get("Text"); ob.BackgroundColor3=T:Get("Card")
        ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,30)
        ob.TextXAlignment=Enum.TextXAlignment.Center
        ob.AutoButtonColor=false; ob.LayoutOrder=i; ob.ZIndex=26; ob.Parent=pop
        ob.MouseEnter:Connect(function() ob.BackgroundTransparency=0.6 end)
        ob.MouseLeave:Connect(function() ob.BackgroundTransparency=1 end)
        ob.MouseButton1Click:Connect(function()
            sel=i; btn.Text=opt.."  ▾"; open=false
            tw(pop,0.12,{Size=UDim2.new(0,160,0,0)})
            if onChange then onChange(i,opt) end
        end)
        T:Listen(function(t)
            ob.TextColor3=t.Text; ob.BackgroundColor3=t.Card
        end)
        oBtns[i]=ob
    end

    btn.MouseButton1Click:Connect(function()
        open=not open
        local ab=btn.AbsolutePosition
        pop.Position=UDim2.new(0,ab.X,0,ab.Y+34)
        pop.Size=UDim2.new(0,160,0,0)
        if open then
            tw(pop,0.18,{Size=UDim2.new(0,160,0,popH)},Enum.EasingStyle.Back,Enum.EasingDirection.Out)
        else
            tw(pop,0.12,{Size=UDim2.new(0,160,0,0)})
        end
    end)
    UserInputService.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 and open then
            task.defer(function()
                local mx,my=i.Position.X,i.Position.Y
                local pa=pop.AbsolutePosition; local ps=pop.AbsoluteSize
                if mx<pa.X or mx>pa.X+ps.X or my<pa.Y or my>pa.Y+ps.Y then
                    open=false; tw(pop,0.12,{Size=UDim2.new(0,160,0,0)})
                end
            end)
        end
    end)
    return {Get=function()return sel end, Set=function(i) sel=i; btn.Text=(options[i] or "").."  ▾" end}
end

function C.Button(parent, text, onClick)
    local c=card(parent,44)
    local btn=Instance.new("TextButton")
    btn.Text=text; btn.Font=Enum.Font.GothamMedium; btn.TextSize=13
    btn.TextColor3=T:Get("Accent"); btn.BackgroundColor3=T:Get("Card")
    btn.BackgroundTransparency=T:Get("CardAlpha"); btn.Size=UDim2.new(1,0,1,0)
    btn.AutoButtonColor=false; btn.Parent=c; corner(btn,10)
    btn.MouseEnter:Connect(function()
        tw(btn,0.12,{BackgroundColor3=T:Get("Accent"),BackgroundTransparency=0,TextColor3=Color3.new(1,1,1)})
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,0.12,{BackgroundColor3=T:Get("Card"),BackgroundTransparency=T:Get("CardAlpha"),TextColor3=T:Get("Accent")})
    end)
    btn.MouseButton1Click:Connect(function() if onClick then onClick() end end)
    T:Listen(function(t)
        btn.TextColor3=t.Accent; btn.BackgroundColor3=t.Card; btn.BackgroundTransparency=t.CardAlpha
    end)
    return btn
end

function C.TextInput(parent, text, placeholder, default, onChange)
    local c=card(parent,54)
    local l=label(c,text,12,T:Get("SubText"),Enum.Font.GothamMedium)
    l.Size=UDim2.new(1,-24,0,20); l.Position=UDim2.new(0,14,0,4)
    T:Listen(function(t) l.TextColor3=t.SubText end)

    local box=Instance.new("TextBox")
    box.Text=default or ""; box.PlaceholderText=placeholder or ""
    box.Font=Enum.Font.Gotham; box.TextSize=12
    box.TextColor3=T:Get("Text"); box.PlaceholderColor3=T:Get("SubText")
    box.BackgroundColor3=T:Get("Stroke"); box.BackgroundTransparency=0.5
    box.Size=UDim2.new(1,-28,0,24); box.Position=UDim2.new(0,14,0,26)
    box.TextXAlignment=Enum.TextXAlignment.Left; box.ClearTextOnFocus=false
    box.Parent=c; corner(box,6)
    local pad=Instance.new("UIPadding"); pad.PaddingLeft=UDim.new(0,8); pad.Parent=box
    stroke(box,T:Get("Stroke"),1)
    box.FocusLost:Connect(function() if onChange then onChange(box.Text) end end)
    T:Listen(function(t)
        l.TextColor3=t.SubText; box.TextColor3=t.Text; box.PlaceholderColor3=t.SubText
        box.BackgroundColor3=t.Stroke; stroke(box,t.Stroke,1)
    end)
    return {Get=function()return box.Text end, Set=function(v) box.Text=v end}
end

-- ══════════════════════════════════════════════
-- BUILD MAIN UI
-- ══════════════════════════════════════════════
local function buildUI()
    local gui=Instance.new("ScreenGui")
    gui.Name="UI3R"; gui.ResetOnSpawn=false
    gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    gui.Parent=lp.PlayerGui

    -- Responsive scale
    local usc=Instance.new("UIScale"); usc.Parent=gui
    local function updScale()
        local vp=gui.AbsoluteSize
        usc.Scale=math.clamp(vp.X/1280,0.65,1.5)
    end
    updScale(); gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updScale)

    -- Main window
    local win=frame(gui,
        UDim2.new(0,Config.WindowW,0,Config.WindowH),
        UDim2.new(0.5,-Config.WindowW/2,0.5,-Config.WindowH/2),
        T:Get("Win"),T:Get("WinAlpha"))
    corner(win,16)
    stroke(win,T:Get("Stroke"),1)

    -- Blurred glass effect (UIBlurEffect if available)
    pcall(function()
        local blur=Instance.new("BlurEffect")
        blur.Size=8; blur.Parent=gui
    end)

    -- Background image
    local bgImg=Instance.new("ImageLabel")
    bgImg.Image=T:Get("BgImage") or ""
    bgImg.ImageTransparency=0.25; bgImg.BackgroundTransparency=1
    bgImg.ScaleType=Enum.ScaleType.Crop
    bgImg.Size=UDim2.new(1,0,1,0); bgImg.ZIndex=0
    bgImg.Parent=win; corner(bgImg,16)
    bgImg.Visible=T:Get("hasImage") and T:Get("BgImage")~=""

    -- Glass highlight strip
    local shine=frame(win,UDim2.new(1,0,0,70),UDim2.new(0,0,0,0),Color3.new(1,1,1),0.88)
    local sg2=Instance.new("UIGradient")
    sg2.Transparency=NumberSequence.new({
        NumberSequenceKeypoint.new(0,0.65),NumberSequenceKeypoint.new(1,1)})
    sg2.Rotation=90; sg2.Parent=shine; corner(shine,16)

    T:Listen(function(t)
        win.BackgroundColor3=t.Win; win.BackgroundTransparency=t.WinAlpha
        stroke(win,t.Stroke,1)
        bgImg.Image=t.BgImage or ""; bgImg.Visible=t.hasImage and t.BgImage~=""
    end)

    -- ── TOP BAR ──
    local topBar=frame(win,UDim2.new(1,0,0,48),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
    topBar.ZIndex=3

    -- Logo circle
    local logoCircle=frame(topBar,UDim2.new(0,30,0,30),UDim2.new(0,12,0.5,-15),
        T:Get("Accent"),0)
    corner(logoCircle,15)
    T:Listen(function(t) logoCircle.BackgroundColor3=t.Accent end)
    local logoLbl=label(logoCircle,"✦",14,Color3.new(1,1,1),Enum.Font.GothamBold,
        Enum.TextXAlignment.Center)
    logoLbl.Size=UDim2.new(1,0,1,0); logoLbl.TextYAlignment=Enum.TextYAlignment.Center

    -- Title
    local titleLbl=label(topBar,Config.Title,16,T:Get("Text"),Enum.Font.GothamBold)
    titleLbl.Size=UDim2.new(0,80,1,0); titleLbl.Position=UDim2.new(0,50,0,0)
    T:Listen(function(t) titleLbl.TextColor3=t.Text end)

    local authorLbl=label(topBar,Config.Author,10,T:Get("SubText"),Enum.Font.Gotham)
    authorLbl.Size=UDim2.new(0,100,0,16); authorLbl.Position=UDim2.new(0,50,0,26)
    T:Listen(function(t) authorLbl.TextColor3=t.SubText end)

    -- Window buttons (top right)
    local function winBtn(sym, xOff, hoverCol, fn)
        local b=Instance.new("TextButton")
        b.Text=sym; b.Font=Enum.Font.GothamBold; b.TextSize=14
        b.TextColor3=T:Get("SubText"); b.BackgroundColor3=T:Get("Stroke")
        b.BackgroundTransparency=0.5; b.Size=UDim2.new(0,26,0,22)
        b.Position=UDim2.new(1,xOff,0.5,-11); b.AutoButtonColor=false
        b.Parent=topBar; corner(b,6)
        b.MouseEnter:Connect(function() tw(b,0.1,{BackgroundColor3=hoverCol,BackgroundTransparency=0}) end)
        b.MouseLeave:Connect(function() tw(b,0.1,{BackgroundColor3=T:Get("Stroke"),BackgroundTransparency=0.5}) end)
        b.MouseButton1Click:Connect(fn)
        T:Listen(function(t) b.TextColor3=t.SubText; b.BackgroundColor3=t.Stroke end)
        return b
    end

    winBtn("×",-14,Color3.fromRGB(220,70,70),function() gui:Destroy() end)
    local minimized=false
    local contentArea
    winBtn("−",-44,Color3.fromRGB(220,160,40),function()
        minimized=not minimized
        if contentArea then
            tw(contentArea,0.2,{Size=minimized
                and UDim2.new(1,0,0,0)
                or  UDim2.new(1,0,1,-96)})
        end
    end)

    -- ── SEPARATOR ──
    local sep=frame(win,UDim2.new(1,0,0,1),UDim2.new(0,0,0,48),T:Get("Stroke"),0)
    T:Listen(function(t) sep.BackgroundColor3=t.Stroke end)

    -- ── TAB BAR ──
    local TAB_H=48
    local tabBar=frame(win,UDim2.new(1,0,0,TAB_H),UDim2.new(0,0,0,49),Color3.new(0,0,0),1)
    tabBar.ZIndex=3

    -- Sliding indicator (pill under active tab)
    local indicator=frame(tabBar,UDim2.new(0,60,0,3),UDim2.new(0,0,1,-3),T:Get("Accent"),0)
    corner(indicator,2)
    T:Listen(function(t) indicator.BackgroundColor3=t.Accent end)

    -- Second separator
    local sep2=frame(win,UDim2.new(1,0,0,1),UDim2.new(0,0,0,97),T:Get("Stroke"),0)
    T:Listen(function(t) sep2.BackgroundColor3=t.Stroke end)

    -- ── CHARACTER IMAGE (behind content) ──
    local charImg=Instance.new("ImageLabel")
    charImg.Image=Config.CharImage
    charImg.ImageTransparency=0.3; charImg.BackgroundTransparency=1
    charImg.ScaleType=Enum.ScaleType.Fit
    charImg.Size=UDim2.new(0,220,0,320)
    charImg.Position=UDim2.new(1,-230,0.5,-120)  -- right side, vertically centered
    charImg.ZIndex=1; charImg.Parent=win
    charImg.Visible=Config.CharImage~="https://cdn.discordapp.com/attachments/1422180559781761029/1572863702112280596/evangelion.png?ex=6affeaf8&is=6afe9978&hm=4c6b823912d1ca35461f27fcff1ff36179d7e12371e629af08cc12d5f3fe1d85"

    -- ── CONTENT AREA ──
    contentArea=frame(win,UDim2.new(1,0,1,-98),UDim2.new(0,0,0,98),Color3.new(0,0,0),1)
    contentArea.ClipsDescendants=true; contentArea.ZIndex=2

    -- Pages
    local Pages={}
    for _,tab in ipairs(Config.Tabs) do
        local sf=Instance.new("ScrollingFrame")
        sf.Name=tab.id; sf.Size=UDim2.new(1,0,1,0)
        sf.CanvasSize=UDim2.new(0,0,0,0); sf.AutomaticCanvasSize=Enum.AutomaticSize.Y
        sf.ScrollBarThickness=3; sf.ScrollBarImageColor3=T:Get("Accent")
        sf.BackgroundTransparency=1; sf.BorderSizePixel=0; sf.Visible=false
        sf.Parent=contentArea
        local uil=Instance.new("UIListLayout"); uil.SortOrder=Enum.SortOrder.LayoutOrder
        uil.Padding=UDim.new(0,6); uil.Parent=sf
        local pad=Instance.new("UIPadding")
        pad.PaddingTop=UDim.new(0,10); pad.PaddingBottom=UDim.new(0,10); pad.Parent=sf
        Pages[tab.id]=sf
        T:Listen(function(t) sf.ScrollBarImageColor3=t.Accent end)
    end

    -- Tab buttons
    local tabW=Config.WindowW/#Config.Tabs
    local tabBtns={}
    for i,tab in ipairs(Config.Tabs) do
        local b=Instance.new("TextButton")
        b.Text=tab.icon.."  "..tab.label
        b.Font=Enum.Font.GothamMedium; b.TextSize=11
        b.TextColor3=T:Get("SubText"); b.BackgroundTransparency=1
        b.Size=UDim2.new(0,tabW,1,0); b.Position=UDim2.new(0,(i-1)*tabW,0,0)
        b.AutoButtonColor=false; b.Parent=tabBar
        tabBtns[i]={btn=b,id=tab.id,x=(i-1)*tabW,w=tabW}
        T:Listen(function(t) b.TextColor3=t.SubText end)
    end

    local curTab=nil
    local function selTab(id)
        if curTab then Pages[curTab].Visible=false end
        curTab=id; Pages[id].Visible=true
        for _,tb in ipairs(tabBtns) do
            if tb.id==id then
                tw(tb.btn,0.15,{TextColor3=T:Get("Accent")})
                tw(indicator,0.22,
                    {Position=UDim2.new(0,tb.x+8,1,-3),Size=UDim2.new(0,tb.w-16,0,3)},
                    Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
            else
                tw(tb.btn,0.15,{TextColor3=T:Get("SubText")})
            end
        end
        -- keep tab colors in sync after theme change
        T:Listen(function(t)
            for _,tb2 in ipairs(tabBtns) do
                tw(tb2.btn,0.15,{TextColor3=tb2.id==curTab and t.Accent or t.SubText})
            end
        end)
    end

    for _,tb in ipairs(tabBtns) do
        tb.btn.MouseButton1Click:Connect(function() selTab(tb.id) end)
    end

    draggable(win,topBar)
    task.defer(function() selTab(Config.Tabs[1].id) end)

    return {Pages=Pages, Gui=gui, SelectTab=selTab}
end

-- ══════════════════════════════════════════════
-- POPULATE TABS
-- ══════════════════════════════════════════════
local function populateTabs(pages, gui)
    local root=gui

    -- ── PLAYER ──
    do
        local p=pages["player"]
        C.Section(p,"Movement")
        C.Toggle(p,"Activar Speed",false,function(v) end)
        C.Slider(p,"Speed",16,200,16)
        C.Toggle(p,"Fly",false,function(v) end)
        C.Slider(p,"Speed Fly",10,150,60)
        C.Section(p,"Other")
        C.Toggle(p,"Noclip",false,function(v) end)
        C.Toggle(p,"God Mode",false,function(v) end)
        C.Button(p,"Reset character",function()
            local h=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            if h then h:TakeDamage(math.huge) end
        end)
    end

    -- ── COMBAT ──
    do
        local p=pages["combat"]
        C.Section(p,"Aimbot")
        C.Toggle(p,"Aimbot",false,function(v) end)
        C.Toggle(p,"Silent Aim",false,function(v) end)
        C.Slider(p,"FOV",10,500,120)
        C.Dropdown(p,root,"Target Part",{"Head","Torso","HumanoidRootPart"},1)
        C.Section(p,"Auto-Shoot")
        C.Toggle(p,"Auto Shoot",false,function(v) end)
        C.Slider(p,"Shoot Delay (ms)",0,500,100)
        C.Section(p,"Hitbox")
        C.Toggle(p,"Expand Hitbox",false,function(v) end)
        C.Slider(p,"Hitbox Size",1,20,5)
    end

    -- ── ESP ──
    do
        local p=pages["esp"]
        C.Section(p,"Visuals")
        C.Toggle(p,"Box ESP",false,function(v) end)
        C.Toggle(p,"Name",false,function(v) end)
        C.Toggle(p,"Distance",false,function(v) end)
        C.Toggle(p,"Health Bar",false,function(v) end)
        C.Slider(p,"Range",50,2000,500)
        C.Section(p,"Options")
        C.Dropdown(p,root,"Team Color",{"White","Red","Green","Blue"},1)
        C.Toggle(p,"Show teammates",false,function(v) end)
    end

    -- ── EXTRA ──
    do
        local p=pages["extra"]
        C.Section(p,"Misc")
        C.Toggle(p,"Infinite Jump",false,function(v) end)
        C.Toggle(p,"Anti-AFK",false,function(v) end)
        C.Toggle(p,"Remove fog",false,function(v) end)
        C.Section(p,"Camera")
        C.Slider(p,"FOV",70,120,70)
        C.Toggle(p,"Fullbright",false,function(v) end)
    end

    -- ── AJUSTES / SETTINGS ──
    do
        local p=pages["ajustes"]
        C.Section(p,"Theme")

        -- Theme selector
        local thRow=frame(p,UDim2.new(1,0,0,52),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
        local themes={{"glass","Glass"},{"dark","Dark"},{"purple","Purple"}}
        for i,td in ipairs(themes) do
            local tb=Instance.new("TextButton")
            tb.Text=td[2]; tb.Font=Enum.Font.GothamMedium; tb.TextSize=12
            tb.TextColor3=T:Get("SubText"); tb.BackgroundColor3=T:Get("Card")
            tb.BackgroundTransparency=T:Get("CardAlpha")
            tb.Size=UDim2.new(0,86,0,34); tb.Position=UDim2.new(0,10+(i-1)*92,0.5,-17)
            tb.AutoButtonColor=false; tb.Parent=thRow; corner(tb,9); stroke(tb,T:Get("Stroke"),1)
            T:Listen(function(t)
                tb.TextColor3=t.SubText; tb.BackgroundColor3=t.Card
                tb.BackgroundTransparency=t.CardAlpha; stroke(tb,t.Stroke,1)
            end)
            tb.MouseEnter:Connect(function()
                tw(tb,0.1,{BackgroundColor3=T:Get("Accent"),BackgroundTransparency=0,
                    TextColor3=Color3.new(1,1,1)})
            end)
            tb.MouseLeave:Connect(function()
                tw(tb,0.1,{BackgroundColor3=T:Get("Card"),
                    BackgroundTransparency=T:Get("CardAlpha"),TextColor3=T:Get("SubText")})
            end)
            tb.MouseButton1Click:Connect(function() T:Apply(td[1]) end)
        end

        C.Section(p,"Background Image")
        local imgIn=C.TextInput(p,"Image URL / rbxassetid://","rbxassetid://XXXXXX","")
        C.Button(p,"Apply Image",function()
            local v=imgIn.Get()
            T._cur.BgImage=v; T:Fire()
        end)

        C.Section(p,"Accent Color")
        -- Simple color presets
        local colRow=frame(p,UDim2.new(1,0,0,52),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
        local presets={
            Color3.fromRGB(80,110,230),
            Color3.fromRGB(180,100,255),
            Color3.fromRGB(80,200,140),
            Color3.fromRGB(230,100,100),
            Color3.fromRGB(230,160,60),
        }
        for i,col in ipairs(presets) do
            local sw=frame(colRow,UDim2.new(0,30,0,30),UDim2.new(0,10+(i-1)*38,0.5,-15),col,0)
            corner(sw,15)
            local selBtn=Instance.new("TextButton")
            selBtn.Text=""; selBtn.BackgroundTransparency=1; selBtn.Size=UDim2.new(1,0,1,0)
            selBtn.Parent=sw
            selBtn.MouseButton1Click:Connect(function()
                T._cur.Accent=col; T:Fire()
            end)
        end

        C.Section(p,"Window")
        C.Slider(p,"UI Scale",65,150,100,function(v)
            local sc=gui:FindFirstChildOfClass("UIScale")
            if sc then sc.Scale=v/100 end
        end)

        C.Section(p,"Character Image")
        local charIn=C.TextInput(p,"Character image URL","rbxassetid:// or URL","")
        C.Button(p,"Apply Character",function()
            local v=charIn.Get()
            Config.CharImage=v
            local cImg=gui:FindFirstChild("UI3R") and
                gui:FindFirstChild("UI3R"):FindFirstChild("BgImage") -- placeholder
            -- Update through the win reference in closure isn't accessible here,
            -- so we search directly
            for _,sg in ipairs(lp.PlayerGui:GetChildren()) do
                if sg.Name=="UI3R" then
                    for _,ch in ipairs(sg:GetDescendants()) do
                        if ch:IsA("ImageLabel") and ch.Name~="BgImage" and ch.ZIndex==1 then
                            ch.Image=v; ch.Visible=v~=""
                        end
                    end
                end
            end
        end)
    end

    -- ── CRÉDITOS ──
    do
        local p=pages["creditos"]

        -- Author card
        local authorCard=frame(p,UDim2.new(1,-20,0,90),UDim2.new(0,10,0,0),
            T:Get("Card"),T:Get("CardAlpha"))
        corner(authorCard,12); stroke(authorCard,T:Get("Stroke"),1)
        T:Listen(function(t)
            authorCard.BackgroundColor3=t.Card; authorCard.BackgroundTransparency=t.CardAlpha
            stroke(authorCard,t.Stroke,1)
        end)

        local aw=frame(authorCard,UDim2.new(0,66,0,66),UDim2.new(0,12,0.5,-33),
            T:Get("Stroke"),0); corner(aw,33)
        stroke(aw,T:Get("Accent"),2)
        T:Listen(function(t) aw.BackgroundColor3=t.Stroke; stroke(aw,t.Accent,2) end)
        local av=Instance.new("ImageLabel")
        av.Image=""; av.BackgroundTransparency=1; av.Size=UDim2.new(1,-4,1,-4)
        av.Position=UDim2.new(0,2,0,2); av.Parent=aw; corner(av,30)
        task.spawn(function()
            local ok,img=pcall(function()
                return Players:GetUserThumbnailAsync(Config.Credits.AuthorId,
                    Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
            end)
            if ok and img then av.Image=img end
        end)

        local nm=label(authorCard,Config.Credits.AuthorName,16,T:Get("Text"),Enum.Font.GothamBold)
        nm.Size=UDim2.new(1,-96,0,24); nm.Position=UDim2.new(0,90,0,16)
        T:Listen(function(t) nm.TextColor3=t.Text end)

        local acline=frame(authorCard,UDim2.new(0,50,0,2),UDim2.new(0,90,0,42),
            T:Get("Accent"),0); corner(acline,1)
        T:Listen(function(t) acline.BackgroundColor3=t.Accent end)

        local rl=label(authorCard,"Developer · UI3R v"..Config.Version,10,T:Get("SubText"),Enum.Font.Gotham)
        rl.Size=UDim2.new(1,-96,0,20); rl.Position=UDim2.new(0,90,0,46)
        T:Listen(function(t) rl.TextColor3=t.SubText end)

        -- wrapper for card
        local aw2=frame(p,UDim2.new(1,0,0,104),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
        authorCard.Parent=aw2

        -- Link buttons
        C.Section(p,"Social")
        local function lnkBtn(icon,lbl,url)
            local c2=card(p,44)
            local ibox=frame(c2,UDim2.new(0,28,0,28),UDim2.new(0,10,0.5,-14),T:Get("Accent"),0.15)
            corner(ibox,7)
            T:Listen(function(t) ibox.BackgroundColor3=t.Accent end)
            local il=label(ibox,icon,14,T:Get("Accent"),Enum.Font.GothamBold,Enum.TextXAlignment.Center)
            il.Size=UDim2.new(1,0,1,0); il.TextYAlignment=Enum.TextYAlignment.Center
            T:Listen(function(t) il.TextColor3=t.Accent end)
            local ll=label(c2,lbl,13,T:Get("Text"),Enum.Font.GothamMedium)
            ll.Size=UDim2.new(1,-130,1,0); ll.Position=UDim2.new(0,48,0,0)
            T:Listen(function(t) ll.TextColor3=t.Text end)
            local ul=label(c2,url,10,T:Get("SubText"),Enum.Font.Gotham,Enum.TextXAlignment.Right)
            ul.Size=UDim2.new(0,110,1,0); ul.Position=UDim2.new(1,-122,0,0)
            T:Listen(function(t) ul.TextColor3=t.SubText end)
            local ov=Instance.new("TextButton"); ov.Text=""; ov.BackgroundTransparency=1
            ov.Size=UDim2.new(1,0,1,0); ov.Parent=c2
            ov.MouseEnter:Connect(function() tw(c2,0.1,{BackgroundTransparency=max(T:Get("CardAlpha")-0.2,0)}) end)
            ov.MouseLeave:Connect(function() tw(c2,0.1,{BackgroundTransparency=T:Get("CardAlpha")}) end)
            ov.MouseButton1Click:Connect(function()
                pcall(function() setclipboard(url) end)
            end)
        end

        if Config.Credits.Discord~="" then
            lnkBtn("D","Discord",Config.Credits.Discord)
        end
        if Config.Credits.YouTube~="" then
            lnkBtn("▶","YouTube",Config.Credits.YouTube)
        end

        C.Section(p,"About")
        local ab=card(p,56)
        local al=Instance.new("TextLabel")
        al.Text="UI3R v"..Config.Version.." — Glass UI for Roblox executors\nMade with ♥ · Compatible con la mayoría de executors"
        al.Font=Enum.Font.Gotham; al.TextSize=11; al.TextColor3=T:Get("SubText")
        al.TextWrapped=true; al.BackgroundTransparency=1
        al.Size=UDim2.new(1,-20,1,0); al.Position=UDim2.new(0,10,0,0)
        al.TextXAlignment=Enum.TextXAlignment.Left; al.Parent=ab
        T:Listen(function(t) al.TextColor3=t.SubText end)
    end
end

-- ══════════════════════════════════════════════
-- LAUNCH
-- ══════════════════════════════════════════════
-- Fix: max not available globally in some executors
local max=math.max

runIntro(function()
    local ui=buildUI()
    populateTabs(ui.Pages,ui.Gui)
end)
