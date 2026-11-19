local runService, httpService, coreGui, v509, genv, players2, localPlayer3, currentCamera, mc2,
  v512, v513, v514, v515, v516, v517, v518, block, reach, v524, list14, dummies, v535, v536,
  screenGui, folder2, rbxassetFontsFamiliesPressStart2PJson, v538, v547, v572, v609, v676, v679,
  flag15, f152, v714, combatTab, aimAssistSection, autoSection, espTab, mainSection, boxSection,
  alertsSection, nametagSection

local players = game:GetService("Players")
runService = game:GetService("RunService")
httpService = game:GetService("HttpService")
coreGui = game:GetService("CoreGui")
local index = {}
local v14 = setmetatable({}, { __index = index, __metatable = nil })

do
  local function f10()
    local v36 = game
    local userInputService2 = v36:GetService("UserInputService")
    local new = Vector2.new
    local udim2 = UDim2
    local new2 = udim2.new
    local fromOffset = UDim2.fromOffset
    local fromRGB = Color3.fromRGB
    local floor2 = math.floor
    local v41 = math
    local round = v41.round

    local metrics = {
      Pad = 10,
      Gap = 6,
      SectionGap = 10,
      Radius = 3,
      SmallRadius = 2,
      CardRadius = 4,
      PillRadius = 5,
      PopupRadius = 5,
      FloatRadius = 6,
      WindowRadius = 6,
      WindowW = 586,
      WindowH = 466,
      MinWindowW = 520,
      MinWindowH = 380,
      SidebarW = 141,
      ContentX = 142,
      ColumnW = 207,
      TabW = 121,
      TabH = 28,
      TabPitch = 32,
      CategoryToTab = 25,
      TabToCategory = 25,
      FirstCategory = 56,
      SearchH = 28,
      Row = 16,
      HeaderH = 24,
      HeaderDescH = 40,
      DividerH = 9,
      SliderH = 33,
      DropdownH = 47,
      InputH = 26,
      ButtonH = 28,
      ListRowH = 24,
      ToggleW = 28,
      ToggleH = 16,
      ToggleKnob = 10,
      Knob = 11,
      PickerKnob = 8,
      TrackH = 9,
      TrackY = 24,
      TrackInset = 5,
      ChipH = 16,
      ValueChipH = 17,
      Swatch = 14,
      ChipGap = 2,
    }

    local themes = {
      Blossom = {
        Background = fromRGB(42, 44, 52),
        Tab = fromRGB(48, 50, 58),
        Outline = fromRGB(65, 68, 80),
        Inline = fromRGB(56, 58, 68),
        Text = fromRGB(232, 234, 245),
        InactiveText = fromRGB(126, 130, 148),
        Accent = fromRGB(113, 159, 226),
        Element = fromRGB(54, 57, 68),
        Gradient = fromRGB(172, 187, 209),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(72, 77, 90),
      },
      Afterglow = {
        Background = fromRGB(34, 28, 25),
        Tab = fromRGB(30, 23, 20),
        Outline = fromRGB(60, 46, 38),
        Inline = fromRGB(42, 33, 29),
        Text = fromRGB(240, 232, 226),
        InactiveText = fromRGB(140, 122, 110),
        Accent = fromRGB(255, 145, 60),
        Element = fromRGB(49, 34, 27),
        Gradient = fromRGB(172, 167, 163),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(70, 51, 42),
      },
      Frostbite = {
        Background = fromRGB(22, 30, 38),
        Tab = fromRGB(16, 25, 32),
        Outline = fromRGB(42, 58, 72),
        Inline = fromRGB(27, 38, 47),
        Text = fromRGB(228, 240, 248),
        InactiveText = fromRGB(114, 136, 152),
        Accent = fromRGB(86, 219, 255),
        Element = fromRGB(28, 39, 52),
        Gradient = fromRGB(164, 172, 178),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(44, 60, 74),
      },
      Volt = {
        Background = fromRGB(24, 24, 20),
        Tab = fromRGB(18, 18, 14),
        Outline = fromRGB(54, 54, 40),
        Inline = fromRGB(32, 32, 26),
        Text = fromRGB(242, 242, 226),
        InactiveText = fromRGB(134, 134, 112),
        Accent = fromRGB(255, 250, 76),
        Element = fromRGB(32, 32, 26),
        Gradient = fromRGB(170, 170, 158),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(58, 58, 44),
      },
      Obsidian = {
        Background = fromRGB(16, 16, 18),
        Tab = fromRGB(12, 11, 14),
        Outline = fromRGB(44, 42, 52),
        Inline = fromRGB(24, 24, 29),
        Text = fromRGB(234, 232, 244),
        InactiveText = fromRGB(118, 114, 134),
        Accent = fromRGB(159, 109, 255),
        Element = fromRGB(24, 23, 31),
        Gradient = fromRGB(166, 164, 175),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(236, 240, 248),
      },
      ["Sakura Drift"] = {
        Background = fromRGB(38, 28, 34),
        Tab = fromRGB(32, 23, 29),
        Outline = fromRGB(70, 50, 62),
        Inline = fromRGB(48, 35, 43),
        Text = fromRGB(248, 234, 242),
        InactiveText = fromRGB(150, 122, 138),
        Accent = fromRGB(255, 155, 205),
        Element = fromRGB(44, 46, 48),
        Gradient = fromRGB(176, 166, 172),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(77, 53, 67),
      },
      ["Neon Mirage"] = {
        Background = fromRGB(22, 16, 34),
        Tab = fromRGB(17, 12, 28),
        Outline = fromRGB(54, 40, 82),
        Inline = fromRGB(32, 23, 48),
        Text = fromRGB(238, 232, 252),
        InactiveText = fromRGB(128, 114, 160),
        Accent = fromRGB(255, 86, 255),
        Element = fromRGB(30, 21, 46),
        Gradient = fromRGB(144, 163, 182),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(56, 39, 84),
      },
      ["Copper Dust"] = {
        Background = fromRGB(39, 30, 25),
        Tab = fromRGB(34, 25, 20),
        Outline = fromRGB(72, 54, 42),
        Inline = fromRGB(49, 36, 28),
        Text = fromRGB(244, 232, 220),
        InactiveText = fromRGB(148, 124, 104),
        Accent = fromRGB(243, 152, 86),
        Element = fromRGB(51, 34, 22),
        Gradient = fromRGB(173, 164, 155),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(77, 56, 42),
      },
      Abyss = {
        Background = fromRGB(12, 20, 28),
        Tab = fromRGB(8, 15, 22),
        Outline = fromRGB(30, 48, 62),
        Inline = fromRGB(18, 30, 40),
        Text = fromRGB(222, 236, 246),
        InactiveText = fromRGB(100, 128, 148),
        Accent = fromRGB(52, 176, 238),
        Element = fromRGB(16, 28, 38),
        Gradient = fromRGB(158, 169, 176),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(32, 51, 67),
      },
      Porcelain = {
        Background = fromRGB(250, 248, 244),
        Tab = fromRGB(236, 234, 230),
        Outline = fromRGB(214, 212, 208),
        Inline = fromRGB(255, 255, 255),
        Text = fromRGB(44, 46, 54),
        InactiveText = fromRGB(140, 142, 150),
        Accent = fromRGB(133, 176, 255),
        Element = fromRGB(255, 255, 255),
        Gradient = fromRGB(214, 218, 226),
        Shadow = fromRGB(120, 120, 120),
        HoveredElement = fromRGB(255, 255, 255),
      },
      Graphite = {
        Background = fromRGB(32, 30, 30),
        Tab = fromRGB(40, 40, 40),
        Outline = fromRGB(58, 60, 62),
        Inline = fromRGB(42, 45, 46),
        Text = fromRGB(236, 236, 250),
        InactiveText = fromRGB(128, 128, 134),
        Accent = fromRGB(105, 159, 237),
        Element = fromRGB(44, 46, 46),
        Gradient = fromRGB(190, 190, 190),
        Shadow = fromRGB(0, 0, 0),
        HoveredElement = fromRGB(67, 70, 72),
      },
    }

    local v43 = {
      "Blossom", "Afterglow", "Frostbite", "Volt", "Obsidian", "Sakura Drift", "Neon Mirage",
      "Copper Dust", "Abyss", "Porcelain", "Graphite",
    }

    local v44 = {
      { "Background", "Background" }, { "Tab", "Tab" }, { "Outline", "Outline" },
      { "Inline", "Inline" }, { "Text", "Text" }, { "Inactive Text", "InactiveText" },
      { "Accent", "Accent" }, { "Element", "Element" }, { "Gradient", "Gradient" },
      { "Shadow", "Shadow" }, { "Hovered Element", "HoveredElement" },
    }

    local options = { "Normal", "Lower Case", "Upper Case", "Bold Case" }

    local fonts = {
      Inter = "rbxassetid://12187365364",
      ["Builder Sans"] = "rbxasset://fonts/families/BuilderSans.json",
      Roboto = "rbxasset://fonts/families/Roboto.json",
      Montserrat = "rbxasset://fonts/families/Montserrat.json",
      ["Source Sans Pro"] = "rbxasset://fonts/families/SourceSansPro.json",
      Ubuntu = "rbxasset://fonts/families/Ubuntu.json",
      Nunito = "rbxasset://fonts/families/Nunito.json",
      Arimo = "rbxasset://fonts/families/Arimo.json",
    }

    local options2 = {
      "Inter", "Builder Sans", "Roboto", "Montserrat", "Source Sans Pro", "Ubuntu", "Nunito",
      "Arimo",
    }

    local options3 = { "Regular", "Medium", "SemiBold", "Bold" }
    local copy = table.clone(themes.Blossom)
    local v45 = "Normal"
    local font = "rbxassetid://12187365364"
    local semiBold = Enum.FontWeight.SemiBold

    local v46 = {
      Fast = { W = 42, Z = 1 },
      Knob = { W = 44, Z = 0.86 },
      Follow = { W = 34, Z = 1 },
      Smooth = { W = 26, Z = 1 },
      Soft = { W = 19, Z = 1 },
      Settle = { W = 24, Z = 0.8 },
    }

    local list3 = {}
    local v47 = {}
    local seen = {}

    local v48 = {
      number = 0.0015,
      Color3 = 0.003,
      UDim2 = 0.4,
      Vector2 = 0.4,
    }

    local function f11(p9)
      local v49 = typeof(p9)

      if v49 == "number" then
        return { p9 }
      elseif v49 == "Color3" then
        return { p9.R, p9.G, p9.B }
      elseif v49 == "UDim2" then
        return { p9.X.Scale, p9.X.Offset, p9.Y.Scale, p9.Y.Offset }
      end

      if v49 == "Vector2" then
        return { p9.X, p9.Y }
      end

      error("cannot animate " .. v49)
    end

    local function f12(kind, x)
      if kind == "number" then
        return x[1]
      elseif kind == "Color3" then
        return Color3.new(
          math.clamp(x[1], 0, 1), math.clamp(x[2], 0, 1), math.clamp(x[3], 0, 1)
        )
      end

      if kind == "UDim2" then
        return new2(x[1], round(x[2]), x[3], round(x[4]))
      end

      return new(round(x[1]), round(x[2]))
    end

    local function f13(p10)
      p10.Dead = true
      local v50 = v47[p10.Target]

      if v50 and v50[p10.Prop] == p10 then
        v50[p10.Prop] = nil

        if next(v50) == nil then
          v47[p10.Target] = nil
        end
      end
    end

    local function f14(key3, key4, p11, p12, p13)
      local v51 = v47[key3]

      if not v51 then
        v51 = {}
        v47[key3] = v51
      end

      local v52 = v51[key4]

      if not v52 then
        local x2 = f11(key3[key4])
        local v53 = #x2
        local v = {}

        for k = 1, v53 do
          v[k] = 0
        end

        v52 = {
          Target = key3,
          Prop = key4,
          Kind = typeof(p11),
          X = x2,
          V = v,
        }

        v51[key4] = v52
        table.insert(list3, v52)
      end

      v52.G = f11(p11)
      v52.Goal = p11
      v52.P = v46[p12 or "Smooth"]
      v52.Done = p13 and p13.Done or nil
      v52.Step = p13 and p13.Step or nil
    end

    local function f15(key5, key6, p14)
      local v54 = v47[key5]
      local v55 = v54 and v54[key6]

      if v55 then
        f13(v55)
      end

      key5[key6] = p14
    end

    local function f16(p15, p16, p17, open, p18)
      if open then
        f14(p15, p16, p17, p18)
      else
        f15(p15, p16, p17)
      end
    end

    local function f17(delta)
      local v56 = {}
      local lowest = math.min(delta, 0.05)
      local v57 = 1

      while v57 <= #list3 do
        local v58 = list3[v57]

        if v58.Dead then
          list3[v57] = list3[#list3]
          list3[#list3] = nil
        else
          local v59 = v56[v58.P]

          if not v59 then
            local p = v58.P
            local w = p.W
            local z = v58.P.Z

            if z >= 1 then
              local v60 = math.exp(-w * lowest)

              v59 = {
                v60 * (1 + w * lowest), v60 * lowest, -v60 * w * w * lowest,
                v60 * (1 - w * lowest),
              }
            else
              local v61 = w * math.sqrt(1 - z * z)
              local v62 = math.exp(-z * w * lowest)
              local v63 = math.cos(v61 * lowest)
              local v64 = math.sin(v61 * lowest)

              v59 = {
                v62 * (v63 + z * w * v64 / v61), v62 * v64 / v61, -v62 * w * w * v64 / v61,
                v62 * (v63 - z * w * v64 / v61),
              }
            end

            v56[v58.P] = v59
          end

          local x3 = v58.X
          local v65 = v58.V
          local g = v58.G
          local v66 = v48[v58.Kind]
          local flag = true
          local v67 = v66 * v58.P.W

          for m = 1, #x3 do
            local v68 = x3[m] - g[m]
            local v69 = v59[3] * v68 + v59[4] * v65[m]
            local v70 = v59[1] * v68 + v59[2] * v65[m]
            x3[m] = g[m] + v70
            v65[m] = v69
            local v71 = v58.Kind == "UDim2" and m % 2 == 1 and 0.0005 or v66

            if math.abs(v70) > v71 or math.abs(v69) > v67 then
              flag = false
            end
          end

          if flag then
            v58.Target[v58.Prop] = v58.Goal

            if v58.Step then
              v58.Step(v58.Goal)
            end

            local done = v58.Done
            f13(v58)

            list3[v57] = list3[#list3]
            list3[#list3] = nil

            if done then
              task.spawn(done)
            end
          else
            local last = f12(v58.Kind, x3)

            if last ~= v58.Last then
              v58.Last = last
              v58.Target[v58.Prop] = last

              if v58.Step then
                v58.Step(last)
              end
            end

            v57 = v57 + 1
          end
        end
      end
    end

    local connect, f18

    local function f19()
      if connect then
        return
      end

      connect = runService.RenderStepped:Connect(function(delta2)
        f17(delta2)

        for v72 in seen do
          v72(delta2)
        end

        f18()
      end)
    end

    local v73 = {}

    local function f20(key7)
      if type(key7) == "function" then
        return key7()
      end

      return copy[key7]
    end

    local v74 = {}
    local seen2 = {}
    local v75 = {}
    local seen3 = {}

    local function f21(key8)
      local v76 = v73[key8]

      if v76 then
        for _, v77 in v76 do
          if type(v77) == "string" then
            local v78 = v74[v77]

            if v78 then
              v78[key8] = nil
            end
          end
        end
      end

      v73[key8] = nil
      seen2[key8] = nil
      v75[key8] = nil
      v47[key8] = nil
      seen3[key8] = nil
    end

    local function f22(key9, key10, key11)
      local v79 = v73[key9]

      if not v79 then
        v79 = {}
        v73[key9] = v79
        key9.Destroying:Once(function() f21(key9) end)
      end

      v79[key10] = key11

      if type(key11) == "string" then
        local v80 = v74[key11]

        if not v80 then
          v80 = {}
          v74[key11] = v80
        end

        v80[key9] = key10
      else
        seen2[key9] = true
      end

      key9[key10] = f20(key11)
    end

    local function f23(key12, p19)
      local v81 = v73[key12]

      if not v81 then
        return
      end

      for v82, v83 in v81 do
        local v84 = f20(v83)

        if p19 == false or typeof(v84) == "ColorSequence" then
          f15(key12, v82, v84)
        else
          f14(key12, v82, v84, p19 or "Fast")
        end
      end
    end

    local function f24(p20)
      if v45 == "Lower Case" then
        return string.lower(p20)
      end

      if v45 == "Upper Case" or v45 == "Bold Case" then
        return string.upper(p20)
      end

      return p20
    end

    local function getFont(weight)
      local bold = weight

      if v45 == "Bold Case" then
        bold = Enum.FontWeight.Bold
      end

      return Font.new(font, bold or semiBold, Enum.FontStyle.Normal)
    end

    local function f25(key13, listening, p21)
      local v85 = p21 or "Text"
      local v86 = v75[key13]

      if not v86 then
        v86 = {}
        v75[key13] = v86
      end

      v86[v85] = listening
      key13[v85] = f24(listening)
    end

    local function f26()
      for v87, v88 in v75 do
        for v89, v90 in v88 do
          if v89 == "Text" or v89 == "PlaceholderText" then
            v87[v89] = f24(v90)
          end
        end

        v87.FontFace = getFont(v88.Weight)
      end
    end

    local v91 = { TextLabel = true, TextButton = true, TextBox = true }

    local function getInstance2(key14, p22, parent3)
      local instance7 = Instance.new(key14)

      if instance7:IsA("GuiObject") then
        instance7.BorderSizePixel = 0
        instance7.BackgroundTransparency = 1
      end

      if key14 == "TextButton" then
        instance7.AutoButtonColor = false
        instance7.Text = ""
      end

      if v91[key14] then
        if key14 ~= "TextButton" then
          v75[instance7] = {}
        end

        instance7.FontFace = getFont(nil)
        instance7.TextSize = 13
        instance7.TextXAlignment = Enum.TextXAlignment.Left
        instance7.TextYAlignment = Enum.TextYAlignment.Top
      end

      local v92, v93, v94, v95

      if p22 then
        for v96, v97 in p22 do
          if v96 == "Bg" then
            v95 = v97
          elseif v96 == "Fg" then
            v93 = v97
          elseif v96 == "Radius" then
            v92 = v97
          elseif v96 == "Border" then
            v94 = v97
          elseif v96 == "Weight" then
            v75[instance7].Weight = v97
            instance7.FontFace = getFont(v97)
          elseif (v96 == "Text" and key14 ~= "TextBox" or v96 == "PlaceholderText")
            and v91[key14] then
            f25(instance7, v97, v96)
          else
            instance7[v96] = v97
          end
        end
      end

      if v95 then
        if not (p22 and p22.BackgroundTransparency) then
          instance7.BackgroundTransparency = 0
        end

        f22(instance7, "BackgroundColor3", v95)
      end

      if v93 then
        f22(instance7, "TextColor3", v93)
      end

      if v92 then
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = v92 >= 99 and UDim.new(0.5, 0) or UDim.new(0, v92)
        uiCorner.Parent = instance7
      end

      if v94 then
        local uiStroke = Instance.new("UIStroke")
        uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke.Thickness = 1

        f22(uiStroke, "Color", v94)
        uiStroke.Parent = instance7
      end

      if parent3 then
        instance7.Parent = parent3
      end

      return instance7
    end

    local function getRounded(p23, textSize)
      local v98 = round(textSize * 0.7)
      return math.ceil((p23 - v98) / 2 - round(textSize * 0.16))
    end

    local function f27(p24, p25)
      local textSize2 = p25.TextSize or 12
      local rowH = p25.RowH or metrics.Row
      local x4 = p25.X or 0
      local fg = p25.Fg or "Text"
      local text6 = p25.Text or ""

      return getInstance2("TextLabel", {
        Fg = fg,
        Text = text6,
        TextSize = textSize2,
        Weight = p25.Weight,
        TextTruncate = p25.Truncate,
        TextTransparency = p25.TextTransparency,
        ZIndex = p25.ZIndex,
        Position = fromOffset(x4, (p25.Y or 0) + getRounded(rowH, textSize2)),
        Size = p25.W and fromOffset(p25.W, rowH) or new2(1, -x4 - (p25.Right or 0), 0, rowH),
      }, p24)
    end

    local function f28(p26, p27, p28)
      local v99 = p27
      p28.Truncate = Enum.TextTruncate.AtEnd
      local v100 = f27(p26, p28)
      local offset = v100.Position.Y.Offset
      local rowH2 = p28.RowH or metrics.Row

      local function f29()
        v100.Size = fromOffset(v99 - 12, rowH2)

        v100.Position = fromOffset(
          floor2((v99 - math.min(math.ceil(v100.TextBounds.X), v99 - 12)) / 2), offset
        )
      end

      v100:GetPropertyChangedSignal("TextBounds"):Connect(f29)
      f29()

      return v100, function(p29)
        v99 = p29
        f29()
      end
    end

    local function makeGradient(parent4)
      local uiGradient = Instance.new("UIGradient")
      uiGradient.Rotation = 90

      f22(uiGradient, "Color", function()
        return ColorSequence.new(Color3.new(1, 1, 1), copy.Gradient)
      end)

      uiGradient.Parent = parent4
      return uiGradient
    end

    local v101 = {
      Large = { Blur = 10, Spread = 0, Transparency = 0.3 },
      PickerKnob = { Blur = 6, Spread = 6, Transparency = 0.5 },
    }

    local ok = pcall(function() Instance.new("UIShadow"):Destroy() end)

    local function makeShadow(parent5, key15)
      if not ok then
        return nil
      end

      local v102 = v101[key15]

      local uiShadow = Instance.new("UIShadow")
      uiShadow.BlurRadius = UDim.new(0, v102.Blur)
      uiShadow.Spread = fromOffset(v102.Spread, v102.Spread)
      uiShadow.Transparency = v102.Transparency

      f22(uiShadow, "Color", "Shadow")
      uiShadow.Parent = parent5
      return uiShadow
    end

    local function f30(callback, ...)
      if callback then
        task.spawn(callback, ...)
      end
    end

    local function getClamped(p30)
      return math.clamp(p30, 0, 1)
    end

    local function f31(input3)
      return input3.UserInputType == Enum.UserInputType.MouseButton1
        or input3.UserInputType == Enum.UserInputType.Touch
    end

    local v103

    local function f32()
      local getMouseLocation = userInputService2:GetMouseLocation()

      if v103 then
        return getMouseLocation + v103.AbsolutePosition
      end

      return getMouseLocation
    end

    local function f33(absolutePosition)
      return v103 and absolutePosition - v103.AbsolutePosition or absolutePosition
    end

    local function f34(p31, p32, p33)
      local v104 = p33 or 0
      local absolutePosition2 = p31.AbsolutePosition
      local absoluteSize = p31.AbsoluteSize

      return p32.X >= absolutePosition2.X - v104
        and p32.X <= absolutePosition2.X + absoluteSize.X + v104
        and p32.Y >= absolutePosition2.Y - v104
        and p32.Y <= absolutePosition2.Y + absoluteSize.Y + v104
    end

    local function f35(p34, p35, p36)
      local v105

      local function f36(p37)
        local v106 = f32()

        if not v105 or v106 ~= v105 then
          v105 = v106

          if p34 then
            p34(v106)
          end
        end

        if p36 then
          p36(v106, p37)
        end
      end

      seen[f36] = true

      local connect2

      connect2 = userInputService2.InputEnded:Connect(function(input4)
        if f31(input4) then
          connect2:Disconnect()
          seen[f36] = nil
          local v107 = f32()

          if p34 and v107 ~= v105 then
            p34(v107)
          end

          if p35 then
            p35(v107)
          end
        end
      end)
    end

    local v108 = {}

    local function f37(p38)
      local parent6 = p38

      while true do
        local guiObject = parent6 and parent6:IsA("GuiObject")

        if guiObject then
          if not parent6.Visible then
            return false
          end

          parent6 = parent6.Parent
        else
          break
        end
      end

      return true
    end

    local v109

    local function f38(instance8, p39)
      local v110 = v109

      if not v110 then
        return false
      end

      local openDropdown = v110.OpenDropdown

      if openDropdown then
        if instance8:IsDescendantOf(openDropdown.Panel) then
          return false
        elseif f34(openDropdown.Panel, p39) then
          return true
        end
      end

      local activePopup = v110.ActivePopup
      local v111 = activePopup

      if activePopup then
        local v112 = f34(activePopup.Frame, p39)
        local v113 = v112 and not instance8:IsDescendantOf(activePopup.Frame)
        v111 = v113
      end

      if v111 then
        return true
      end

      local search = v110.Search
      local v114 = search

      if search then
        local open2 = v110.Search.Open
        local v115 = open2

        if open2 then
          local search2 = v110.Search
          v115 = not instance8:IsDescendantOf(search2.Overlay)
        end

        v114 = v115
      end

      if v114 then
        return true
      end

      return false
    end

    local function f39(button, fn, fn2)
      local flag2 = false

      local function f40()
        if not flag2 then
          return
        end

        flag2 = false
        v108[button] = nil
        fn2()
      end

      button.MouseEnter:Connect(function()
        if flag2 or f38(button, f32()) then
          return
        end

        flag2 = true
        v108[button] = f40
        fn()
      end)

      button.MouseLeave:Connect(f40)
      button.Destroying:Once(function() v108[button] = nil end)
    end

    function f18()
      if next(v108) == nil then
        return
      end

      local v116 = f32()

      for v117, v118 in v108 do
        if not f34(v117, v116) or not f37(v117) or f38(v117, v116) then
          v118()
        end
      end
    end

    local index4 = {}
    index4.__index = index4

    local function f41(root)
      return setmetatable({ Root = root, Alpha = 1, Entries = nil }, index4)
    end

    local function f42(root2)
      local list4 = {}

      local function f43(key16, key17)
        if seen3[key16] or v47[key16] and v47[key16][key17] then
          return
        end

        local v119 = key16[key17]

        if v119 < 1 then
          table.insert(list4, { key16, key17, v119 })
        end
      end

      local function f44(instance9)
        if instance9:IsA("GuiObject") then
          if instance9 ~= root2 and not instance9.Visible then
            return
          end

          f43(instance9, "BackgroundTransparency")

          if v91[instance9.ClassName] then
            f43(instance9, "TextTransparency")
          end

          if instance9:IsA("ImageLabel") then
            f43(instance9, "ImageTransparency")
          end
        else
          if instance9:IsA("UIStroke") or instance9.ClassName == "UIShadow" then
            f43(instance9, "Transparency")
          end
        end

        for _, v121 in instance9:GetChildren() do
          f44(v121)
        end
      end

      f44(root2)

      return list4
    end

    function index4:_apply(p40)
      local entries = self.Entries

      if not entries then
        return
      end

      for _, v122 in entries do
        v122[1][v122[2]] = 1 - (1 - v122[3]) * p40
      end
    end

    function index4:Show(p41, p42)
      if not self.Entries then
        self.Entries = f42(self.Root)
        self.Alpha = 0
        self:_apply(0)
      end

      self.Root.Visible = true
      local v123 = p42 or "Smooth"

      f14(self, "Alpha", 1, v123, {
        Step = function(p43) self:_apply(p43) end,
        Done = function()
          self.Entries = nil

          if p41 then
            p41()
          end
        end,
      })
    end

    function index4:Hide(p44, p45)
      if not self.Entries then
        self.Entries = f42(self.Root)
        self.Alpha = 1
      end

      f14(self, "Alpha", 0, p45 or "Fast", {
        Step = function(p46) self:_apply(p46) end,
        Done = function()
          self.Root.Visible = false
          self:_apply(1)
          self.Entries = nil

          if p44 then
            p44()
          end
        end,
      })
    end

    local function f45()
      local list5 = { { "f", 0.6, 0.6, 14.8, 14.8, 99 } }

      for n = 0, 2 do
        for i6 = 0, 3 do
          local v124 = n * 120 + i6 * 42
          local radians = math.rad(v124)
          local v125 = 6.3 - i6 * 1.45
          local v126 = math.cos(radians)
          local v127 = math.sin(radians)

          table.insert(list5, {
            "h", 8 + v126 * v125 - 2, 8 + v127 * v125 - 0.6, 4, 1.2, 99, v124 + 118,
          })
        end
      end

      table.insert(list5, { "h", 7, 7, 2, 2, 99 })
      return list5
    end

    local v128 = {
      target = {
        { "f", 0.5, 0.5, 15, 15, 99 }, { "h", 3, 3, 10, 10, 99 },
        { "f", 4.8, 4.8, 6.4, 6.4, 99 },
      },
      bullet = {
        { "f", 1, 4, 3, 8, 1 }, { "f", 5, 4, 6, 8, 1 }, { "f", 8.2, 5.2, 5.6, 5.6, 1, 45 },
      },
      smile = {
        { "f", 1, 1, 14, 14, 99 }, { "h", 4.4, 5, 2.6, 2.6, 99 }, { "h", 9, 5, 2.6, 2.6, 99 },
        { "h", 4.6, 9.8, 6.8, 2, 99 },
      },
      globe = {
        { "f", 1, 1, 14, 14, 99 }, { "h", 3, 3.2, 4.4, 3, 99, -20 },
        { "h", 8.2, 8, 4.6, 3.8, 99, 20 }, { "h", 9.8, 2.8, 2.6, 2, 99 },
        { "h", 3.4, 9.6, 2.6, 2.6, 99 },
      },
      bomb = {
        { "f", 1, 4, 11, 11, 99 }, { "f", 9.2, 2.8, 4, 3, 0.5, 45 },
        { "f", 12.8, 0.8, 2.4, 2.4, 99 },
      },
      file = {
        { "f", 3, 1, 10, 14, 1.5 }, { "h", 10.6, -0.8, 4.2, 4.2, 0, 45 },
        { "h", 5.5, 7.5, 5, 1.1, 0 }, { "h", 5.5, 10.3, 5, 1.1, 0 },
      },
      gear = {
        { "f", 6.5, 0.8, 3, 14.4, 0.6, 0 }, { "f", 6.5, 0.8, 3, 14.4, 0.6, 45 },
        { "f", 6.5, 0.8, 3, 14.4, 0.6, 90 }, { "f", 6.5, 0.8, 3, 14.4, 0.6, 135 },
        { "f", 2.6, 2.6, 10.8, 10.8, 99 }, { "h", 5.6, 5.6, 4.8, 4.8, 99 },
      },
      robot = {
        { "f", 7.2, 2, 1.6, 3.5, 0 }, { "f", 6.4, 0.5, 3.2, 3.2, 99 },
        { "f", 2.2, 5, 11.6, 9.4, 2 }, { "f", 0.2, 8, 1.4, 4, 0.5 },
        { "f", 14.4, 8, 1.4, 4, 0.5 }, { "h", 4.6, 7.6, 2.5, 2.5, 99 },
        { "h", 8.9, 7.6, 2.5, 2.5, 99 }, { "h", 5.4, 11.4, 5.2, 1.1, 0 },
      },
      wrench = {
        { "f", 5.6, 4.2, 3.8, 12.6, 1.4, 45 }, { "f", 8.8, 0.8, 6.6, 6.6, 99 },
        { "h", 11.4, -1.2, 3.2, 5.8, 0, 45 },
      },
      cube = {
        { "f", 4, 1.1, 8, 13.8, 0, 0 }, { "f", 4, 1.1, 8, 13.8, 0, 60 },
        { "f", 4, 1.1, 8, 13.8, 0, 120 }, { "h", 7.5, 8, 1, 6.6, 0, 0 },
        { "h", 4.6, 2.6, 1, 6.8, 0, 120 }, { "h", 10.4, 2.6, 1, 6.8, 0, 60 },
      },
      search = { { "r", 2, 2, 9, 9, 99, 0, 1.7 }, { "f", 9.6, 11.2, 5.6, 2, 99, 45 } },
      user = { { "f", 5, 1, 6, 6, 99 }, { "f", 2.5, 8.5, 11, 6.5, 3 } },
      key = {
        { "f", 1, 8.5, 7, 7, 99 }, { "f", 6.2, 5, 9, 2.2, 0.6, -45 },
        { "f", 11.2, 4.6, 3.4, 2, 0.4, 45 }, { "h", 3.1, 10.6, 2.8, 2.8, 99 },
      },
      grip = { { "f", 5.5, 11.3, 11, 1.5, 99, -45 }, { "f", 10.2, 12.7, 5.6, 1.5, 99, -45 } },
      check = { { "f", 2, 8.4, 6.2, 2, 99, 45 }, { "f", 5.2, 6.8, 10, 2, 99, -45 } },
      layout = {
        { "f", 0.5, 1, 15, 4.5, 1 }, { "f", 0.5, 6.5, 7, 8.5, 1 }, { "f", 8.5, 6.5, 7, 8.5, 1 },
      },
      reset = {
        { "r", 2.6, 2.6, 10.8, 10.8, 99, 0, 1.8 }, { "h", 9.5, 0.5, 6, 5.5, 0 },
        { "f", 9.2, 1.2, 4.6, 4.6, 0.5, 45 },
      },
      logo = f45(),
    }

    local function f46(root3, icon, p47, p48, p49, p50)
      local v129 = p50 or {}

      local instance10 = getInstance2("Frame", {
        Name = "Icon",
        Size = fromOffset(p47, p47),
        Position = v129.Position,
        AnchorPoint = v129.AnchorPoint,
        ZIndex = v129.ZIndex,
      }, root3)

      local v130 = { Root = instance10, Parts = {} }

      if type(icon) == "string" and string.find(icon, "rbxasset", 1, true) then
        local instance11 = getInstance2(
          "ImageLabel", { Size = new2(1, 0, 1, 0), Image = icon }, instance10
        )

        f22(instance11, "ImageColor3", p48)
        table.insert(v130.Parts, instance11)
      else
        local v131 = p47 / 16

        for _, v132 in v128[icon] or v128.cube do
          local v133, v134, v135, v136, v137, v138, v139, v140 = table.unpack(v132, 1, 8)

          local instance12 = getInstance2("Frame", {
            Position = UDim2.fromScale(v134 / 16, v135 / 16),
            Size = UDim2.fromScale(v136 / 16, v137 / 16),
            Rotation = v139 or 0,
            Radius = v138 and v138 > 0
                and (v138 >= 99 and 99 or math.max(1, round(v138 * v131)))
              or nil,
          }, instance10)

          if v133 == "r" then
            local instance13 = getInstance2(
              "UIStroke", { Thickness = (v140 or 1.5) * v131 }, instance12
            )

            f22(instance13, "Color", p48)
            table.insert(v130.Parts, instance13)
          else
            instance12.BackgroundTransparency = 0
            f22(instance12, "BackgroundColor3", v133 == "h" and p49 or p48)
            table.insert(v130.Parts, instance12)
          end
        end
      end

      function v130.Update(p51)
        for _, v141 in v130.Parts do
          f23(v141, p51)
        end
      end

      return v130
    end

    local function f47(p52, key18, p53, key19, p54)
      local v142 = { Hover = false, Press = false }
      local instance14 = p54 or p52

      f22(p52, "BackgroundColor3", function()
        if v142.Press and key19 then
          return copy[key19]
        end

        if v142.Hover then
          return copy[p53 or "HoveredElement"]
        end

        return copy[key18]
      end)

      f39(instance14, function()
        v142.Hover = true
        f23(p52)
      end, function()
        v142.Hover = false
        v142.Press = false
        f23(p52)
      end)

      if instance14:IsA("GuiButton") then
        instance14.MouseButton1Down:Connect(function()
          v142.Press = true
          f23(p52)
        end)

        instance14.MouseButton1Up:Connect(function()
          v142.Press = false
          f23(p52)
        end)
      end

      return v142
    end

    local index5 = {}
    local index6 = {}
    local index7 = {}
    local index8 = {}
    index5.__index = index5
    index6.__index = index6

    local function f48(p55, decimals)
      if decimals and decimals > 0 then
        return string.format("%." .. decimals .. "f", p55)
      end

      return tostring(floor2(p55 + 0.5))
    end

    index7.__index = index7
    index8.__index = index8

    local function f49(key20)
      if key20 == nil then
        return "-"
      end

      return ({
        LeftShift = "LS",
        RightShift = "RS",
        LeftControl = "LC",
        RightControl = "RC",
        LeftAlt = "LA",
        RightAlt = "RA",
        MouseButton1 = "M1",
        MouseButton2 = "M2",
        MouseButton3 = "M3",
        Return = "Ent",
        Backspace = "Bk",
        One = "1",
        Two = "2",
        Three = "3",
        Four = "4",
        Five = "5",
        Six = "6",
        Seven = "7",
        Eight = "8",
        Nine = "9",
        Zero = "0",
      })[key20.Name] or key20.Name
    end

    local function f50(frame, text7, p56, valueChipH)
      local rowH3 = (valueChipH or metrics.ChipH) - 2

      local instance15 = getInstance2("Frame", {
        Bg = "Element",
        Radius = metrics.Radius,
        Border = "Outline",
        Size = fromOffset(16, rowH3),
        AnchorPoint = p56 and new(1, 0) or nil,
      }, frame)

      makeGradient(instance15)

      return instance15, (f27(instance15, {
        Fg = "InactiveText",
        Text = text7,
        TextSize = 11,
        X = 4,
        RowH = rowH3,
      }))
    end

    local function f51(p57, p58, p59, p60)
      local offset2 = p57.Size.Y.Offset

      local function getHighest(rounded)
        local highest = math.max((p59 or 2) - 2, rounded + 8)
        p57.Size = fromOffset(highest, offset2)
        p58.Position = fromOffset(floor2((highest - rounded) / 2), p58.Position.Y.Offset)

        if p60 then
          p60(highest + 2)
        end

        return highest
      end

      local function f52()
        getHighest(math.ceil(p58.TextBounds.X))
      end

      p58:GetPropertyChangedSignal("TextBounds"):Connect(f52)
      f52()
      return getHighest, f52
    end

    local function f53(instance16, p61, text8, fn3, fn4, fn5)
      local offset3 = instance16.Size.Y.Offset

      local instance17 = getInstance2(
        "TextButton", { Size = new2(1, 0, 1, 0), ZIndex = 2 }, instance16
      )

      f47(instance16, "Element", nil, nil, instance17)
      local flag3 = false
      local uiStroke2 = instance16:FindFirstChildOfClass("UIStroke")
      f22(uiStroke2, "Color", function() return flag3 and copy.Accent or copy.Outline end)

      local instance18 = getInstance2("TextBox", {
        Fg = "Text",
        TextSize = 11,
        Visible = false,
        ZIndex = 3,
        ClearTextOnFocus = false,
        Position = fromOffset(4, getRounded(offset3, 11)),
        Size = new2(1, -8, 0, offset3),
      }, instance16)

      instance18:GetPropertyChangedSignal("Text"):Connect(function()
        if flag3 then
          fn4(math.ceil(instance18.TextBounds.X))
        end
      end)

      instance17.MouseButton1Click:Connect(function()
        flag3 = true
        f23(uiStroke2)
        instance18.Text = text8()
        p61.Visible = false

        instance18.Visible = true
        instance18:CaptureFocus()
        instance18.CursorPosition = #instance18.Text + 1
        instance18.SelectionStart = 1
      end)

      instance18.FocusLost:Connect(function()
        if not flag3 then
          return
        end

        flag3 = false
        f23(uiStroke2)
        local v145 = tonumber(string.match(instance18.Text, "%-?%d*%.?%d+") or "")
        instance18.Visible = false
        p61.Visible = true

        if v145 then
          fn3(v145)
        end

        fn5()
      end)
    end

    function index8:Layout(p62)
      local total = 0

      for _, v146 in self.Sections do
        v146.Y = total

        if not v146.Dragging and not v146.Dropping then
          f16(v146.Root, "Position", fromOffset(0, total), p62, "Settle")
        end

        total = total + (v146.TotalH + metrics.SectionGap)
      end

      self.ContentH = math.max(0, total - metrics.SectionGap)
      self.Scroll.CanvasSize = fromOffset(0, self.ContentH)
      self:ClampScroll()
    end

    function index8:ClampScroll()
      self.Target = math.clamp(self.Target, 0, math.max(
        0, self.ContentH - (self.Tab.Window.Height - metrics.Pad * 2)
      ))
    end

    function index8:ScrollTo(target)
      self.Target = target
      self:ClampScroll()
      f14(self.Scroll, "CanvasPosition", new(0, self.Target), "Soft")
    end

    function index7:Layout(p63)
      local pad = metrics.Pad
      local flag4 = false

      for _, v147 in self.Items do
        if v147.Visible then
          flag4 = true
          v147.Y = pad
          f16(v147.Frame, "Position", fromOffset(0, pad), p63)
          pad = pad + (v147.Height + metrics.Gap)
        end
      end

      if flag4 then
        pad = pad - metrics.Gap
      end

      self.CardH = pad + metrics.Pad
      self.TotalH = self.HeaderH + self.CardH

      f16(self.Card, "Size", new2(1, -2, 0, self.CardH - 2), p63)

      if not self.Dragging then
        f16(self.Root, "Size", new2(1, 0, 0, self.TotalH), p63)
      end

      if self.Column then
        self.Column:Layout(p63)
      end
    end

    function index7:_item(height, kind2, name, p64)
      local size = new2(1, 0, 0, height)

      local v151 = {
        Frame = getInstance2("Frame", { Size = size }, self.Body),
        Height = height,
        Kind = kind2,
        Name = name,
        Section = self,
        Slots = {},
        Visible = true,
        Y = 0,
      }

      table.insert(self.Items, v151)

      if name and p64 ~= false then
        table.insert(self.Window.Index, v151)
      end

      self:Layout(false)
      return v151
    end

    local function f54(p65)
      local v152 = 0

      for _, v153 in p65.Slots do
        local v154 = v152 + v153.Gap
        v153.Frame.Position = new2(1, -v154 - 1, 0, floor2((metrics.Row - v153.Height) / 2) + 1)
        v152 = v154 + v153.Width
      end

      if p65.Label then
        p65.Label.Size = new2(1, -(v152 + metrics.Gap), 0, metrics.Row)
      end
    end

    local function f55(item, frame2, width, height2, p66)
      local v155 = {
        Frame = frame2,
        Width = width,
        Height = height2,
        Gap = #item.Slots == 0 and 0 or p66,
      }

      frame2.AnchorPoint = new(1, 0)
      table.insert(item.Slots, v155)
      f54(item)
      return v155
    end

    local function getListening(p67, item2, p68)
      local window = p67.Window

      local listening2 = {
        Key = p68.Key,
        Mode = p68.Mode or "Toggle",
        Listening = false,
        OnPress = p68.OnPress,
        OnRelease = p68.OnRelease,
        Name = p68.Name,
      }

      local instance19, v156 = f50(item2.Frame, f49(listening2.Key))

      local instance20 = getInstance2(
        "TextButton", { Size = new2(1, 0, 1, 0), ZIndex = 2 }, instance19
      )

      local v157 = f55(item2, instance19, 18, metrics.ChipH, metrics.Gap + 2)

      f51(instance19, v156, 18, function(width2)
        v157.Width = width2
        f54(item2)
      end)

      f47(instance19, "Element", nil, nil, instance20)

      f22(v156, "TextColor3", function()
        if listening2.Listening then
          return copy.Accent
        end

        return copy.InactiveText
      end)

      function listening2.Refresh()
        f25(v156, listening2.Listening and "..." or f49(listening2.Key))
        f23(v156)

        if listening2.OnKeyChanged then
          listening2.OnKeyChanged()
        end
      end

      function listening2:Set(key21)
        listening2.Key = key21
        listening2.Refresh()
      end

      instance20.MouseButton1Click:Connect(function()
        listening2.Listening = true
        window.Listening = listening2
        listening2.Refresh()
      end)

      instance20.MouseButton2Click:Connect(function()
        window:OpenKeybindMenu(instance19, listening2)
      end)

      listening2.Chip = instance19
      listening2.Label = v156

      table.insert(window.Binds, listening2)
      return listening2
    end

    local function f56(p69, item3, p70)
      local window2 = p69.Window

      local v158 = {
        Value = p70.Default or Color3.new(1, 1, 1),
        Alpha = p70.Alpha or 0,
        Animation = "None",
        Callback = p70.Callback,
        Flag = p70.Flag,
      }

      local instance21 = getInstance2("TextButton", {
        Size = fromOffset(metrics.Swatch - 2, metrics.Swatch - 2),
        Radius = metrics.Radius,
        BackgroundTransparency = 0,
        BackgroundColor3 = v158.Value,
        Border = "Outline",
      }, item3.Frame)

      f55(item3, instance21, metrics.Swatch, metrics.Swatch, metrics.Gap + 2)

      v158.Swatch = instance21

      function v158:Set(p71, alpha, p72)
        v158.Value = p71

        if alpha ~= nil then
          v158.Alpha = alpha
        end

        instance21.BackgroundColor3 = p71

        if window2.Picker.Target == v158 and not window2.Picker.Dragging then
          window2.Picker.Sync()
        end

        if not p72 then
          f30(v158.Callback, p71, v158.Alpha)
        end
      end

      instance21.MouseButton1Click:Connect(function() window2:OpenPicker(instance21, v158) end)
      table.insert(window2.Colors, v158)
      return v158
    end

    local function f57(p73, item4, p74, p75)
      local v159

      if p74.Color then
        v159 = f56(p73, item4, {
          Default = p74.Color,
          Alpha = p74.ColorAlpha,
          Callback = p74.ColorCallback,
        })
      end

      local v160

      if p74.Keybind ~= nil then
        v160 = getListening(p73, item4, {
          Key = p74.Keybind,
          Mode = p74.KeybindMode,
          Name = p74.KeybindName or p75,
        })
      end

      return v160, v159
    end

    local function f58(p76, p77, p78, item5)
      local window3 = p76.Window
      window3.FlagOwners[item5] = p77

      if p78.NoSave then
        return nil
      end

      local flag5 = p78.Flag
        or p76.Tab.Name .. "/" .. p76.Name .. "/" .. tostring(p78.Name or item5.Kind)

      local v161 = 1
      local v162 = flag5

      while window3.Flags[v162] do
        v161 = v161 + 1
        v162 = flag5 .. "#" .. v161
      end

      window3.Flags[v162] = p77
      p77.Flag = v162
      return v162
    end

    function index7:Toggle(p79)
      local window4 = self.Window
      local name2 = p79.Name
      local row = metrics.Row
      local item6 = self:_item(row, "Toggle", name2)
      local v166 = { Value = p79.Default == true, Item = item6, Callback = p79.Callback }

      local instance22 = getInstance2(
        "TextButton", { Position = fromOffset(0, -3), Size = new2(1, 0, 1, 6) }, item6.Frame
      )

      local flag6 = false

      local v167 = f27(item6.Frame, {
        Text = name2,
        Truncate = Enum.TextTruncate.AtEnd,
        Fg = function()
          if v166.Value then
            return copy.Text
          end

          return flag6 and copy.InactiveText:Lerp(copy.Text, 0.45) or copy.InactiveText
        end,
      })

      item6.Label = v167

      local instance23 = getInstance2("Frame", {
        Bg = function() return v166.Value and copy.Accent or copy.Element end,
        Size = fromOffset(metrics.ToggleW - 2, metrics.ToggleH - 2),
        Radius = 99,
        Border = "Outline",
      }, item6.Frame)

      makeGradient(instance23)

      local instance24 = getInstance2("Frame", {
        Bg = function() return v166.Value and copy.Text or copy.InactiveText end,
        Size = fromOffset(metrics.ToggleKnob, metrics.ToggleKnob),
        Radius = 99,
      }, instance23)

      f55(item6, instance23, metrics.ToggleW, metrics.ToggleH, 0)

      local function f59(p80)
        f16(
          instance24, "Position",
          fromOffset(v166.Value and metrics.ToggleW - 2 - metrics.ToggleKnob - 2 or 2, 2), p80,
          "Knob"
        )

        local v168 = p80 and "Fast" or false

        f23(instance23, v168)
        f23(instance24, v168)
        f23(v167, v168)
      end

      local function f60()
        if v166.Keybind then
          window4:SetHotkeyActive(v166.Keybind, v166.Value)
        end
      end

      function v166:Set(p81, p82)
        local v169 = p81 == true

        if v169 == v166.Value then
          return
        end

        v166.Value = v169
        f59(true)
        f60()

        if not p82 then
          f30(v166.Callback, v169)
        end
      end

      f39(instance22, function()
        flag6 = true
        f23(v167)
      end, function()
        flag6 = false
        f23(v167)
      end)

      instance22.MouseButton1Click:Connect(function() v166:Set(not v166.Value) end)
      local keybindName = p79.KeybindName or name2 == "Enabled" and self.Name or name2
      p79.KeybindName = keybindName
      local keybind, color = f57(self, item6, p79, keybindName)

      v166.Keybind = keybind
      v166.Color = color

      if v166.Keybind then
        function v166.Keybind.OnPress()
          if v166.Keybind.Mode == "Hold" then
            v166:Set(true)
          else
            v166:Set(not v166.Value)
          end
        end

        function v166.Keybind.OnRelease()
          if v166.Keybind.Mode == "Hold" then
            v166:Set(false)
          end
        end

        v166.Keybind.OnKeyChanged = f60
      end

      f59(false)
      f60()
      local v171 = f58(self, v166, p79, item6)

      if v171 and v166.Keybind then
        window4.Flags[v171 .. "/Key"] = v166.Keybind
      end

      if v171 and v166.Color then
        window4.Flags[v171 .. "/Color"] = v166.Color
      end

      return v166
    end

    function index7:Label(p83)
      local name3 = p83.Name or p83.Text
      local row2 = metrics.Row
      local item7 = self:_item(row2, "Label", name3, false)
      local v174 = f27(item7.Frame, { Text = name3, Truncate = Enum.TextTruncate.AtEnd })
      item7.Label = v174

      local v175 = { Item = item7, Instance = v174 }

      function v175:Set(p84)
        f25(v174, p84)
      end

      local keybind2, color2 = f57(self, item7, p83, name3)

      v175.Keybind = keybind2
      v175.Color = color2

      return v175
    end

    function index7:Divider()
      local item8 = self:_item(metrics.DividerH, "Divider", nil, false)

      getInstance2("Frame", {
        Bg = "Element",
        Position = fromOffset(1, 1),
        Size = new2(1, -2, 1, -2),
        Radius = 99,
        Border = "Outline",
      }, item8.Frame)

      return item8
    end

    function index7:Keybind(p85)
      local row3 = metrics.Row

      local item9 = self:_item(row3, "Keybind", p85.Name)
      item9.Label = f27(item9.Frame, { Text = p85.Name, Truncate = Enum.TextTruncate.AtEnd })

      local listening3 = getListening(self, item9, {
        Key = p85.Default,
        Mode = p85.Mode,
        Name = p85.Name,
        OnPress = p85.Callback,
      })

      listening3.Item = item9

      f58(self, listening3, p85, item9)
      return listening3
    end

    function index7:Colorpicker(p86)
      local item10 = self:_item(metrics.Row, "Colorpicker", p86.Name, p86.Indexed)
      item10.Label = f27(item10.Frame, { Text = p86.Name, Truncate = Enum.TextTruncate.AtEnd })

      local v180 = f56(self, item10, p86)
      v180.Item = item10

      f58(self, v180, p86, item10)
      return v180
    end

    local function f61(window5)
      return window5.ColumnW - metrics.Pad * 2 - 2
    end

    local function f62(frame3)
      local instance25 = getInstance2("Frame", {
        Bg = "Element",
        Position = fromOffset(1, metrics.TrackY + 1),
        Size = new2(1, -2, 0, metrics.TrackH - 2),
        Radius = 99,
        Border = "Outline",
      }, frame3)

      makeGradient(instance25)

      local instance26 = getInstance2("Frame", {
        Name = "Fill",
        Bg = "Accent",
        Radius = 99,
        Size = new2(0, 0, 1, 0),
      }, instance25)

      makeGradient(instance26)

      return instance25, instance26, (getInstance2("TextButton", {
        Position = fromOffset(-4, metrics.Row),
        Size = new2(1, 8, 0, metrics.Row + 1),
        ZIndex = 4,
      }, frame3))
    end

    local function f63(p87)
      return getInstance2("Frame", {
        Name = "Knob",
        Bg = "Text",
        Size = fromOffset(metrics.Knob, metrics.Knob),
        Radius = 99,
        ZIndex = 3,
      }, p87)
    end

    local function f64(p88, p89)
      return round(metrics.TrackInset + p88 * (p89 - metrics.TrackInset * 2))
    end

    local function f65(p90, p91, p92)
      f16(p90, "Position", fromOffset(
        p91 - floor2(metrics.Knob / 2), floor2((metrics.TrackH - 2 - metrics.Knob) / 2)
      ), p92, "Follow")
    end

    local function f66(p93, p94)
      local trackInset = metrics.TrackInset

      return getClamped((p94.X - p93.AbsolutePosition.X - trackInset)
        / (p93.AbsoluteSize.X - trackInset * 2))
    end

    function index7:Slider(p95)
      local item11 = self._item
      local sliderH = metrics.SliderH
      local v184 = item11(self, sliderH, "Slider", p95.Name)
      local v185 = f27(v184.Frame, { Text = p95.Name, Truncate = Enum.TextTruncate.AtEnd })
      local min = p95.Min
      local max = p95.Max
      local v188 = min or 0
      local v189 = max or 100
      local decimals2 = p95.Decimals or 0
      local suffix = p95.Suffix or ""
      local v190 = { Value = v188, Item = v184, Callback = p95.Callback }

      local instance27, v191 = f50(v184.Frame, "", true, metrics.ValueChipH)
      instance27.Position = new2(1, -1, 0, 0)

      local getHighest2, v192 = f51(instance27, v191, 24, function(p96)
        v185.Size = new2(1, -(p96 + metrics.Gap), 0, metrics.Row)
      end)

      local instance28, instance29, v193 = f62(v184.Frame)
      local v194 = f63(instance28)

      local function f67(p97)
        local v195 = f64(
          v189 == v188 and 0 or (v190.Value - v188) / (v189 - v188), f61(self.Window)
        )

        f65(v194, v195, p97)
        f16(instance29, "Size", new2(0, v195, 1, 0), p97, "Follow")
      end

      function v190:Set(p98, p99, p100)
        local v196 = 10 ^ (-decimals2)
        local clamped = math.clamp(floor2(p98 / v196 + 0.5) * v196, v188, v189)
        local v197 = clamped ~= v190.Value
        v190.Value = clamped
        f25(v191, f48(clamped, decimals2) .. suffix)
        f67(p100 ~= false)

        if v197 and not p99 then
          f30(v190.Callback, clamped)
        end
      end

      f53(
        instance27, v191, function() return f48(v190.Value, decimals2) end,
        function(p101) v190:Set(p101) end, getHighest2, v192
      )

      local function f68(p102)
        local v198 = f66(instance28, p102)
        v190:Set(v188 + (v189 - v188) * v198)
      end

      v193.InputBegan:Connect(function(input5)
        if not f31(input5) then
          return
        end

        f68(f32())
        f35(f68)
      end)

      table.insert(self.Window.ResizeJobs, function() f67(false) end)
      v190:Set(p95.Default or v188, true, false)
      f58(self, v190, p95, v184)
      return v190
    end

    function index7.RangeSlider(p103, p104)
      local item12 = p103._item
      local sliderH2 = metrics.SliderH
      local v202 = item12(p103, sliderH2, "Range Slider", p104.Name)
      local v203 = f27(v202.Frame, { Text = p104.Name, Truncate = Enum.TextTruncate.AtEnd })
      local min2 = p104.Min
      local max2 = p104.Max
      local v206 = min2 or 0
      local v207 = max2 or 100
      local decimals3 = p104.Decimals or 0
      local suffix2 = p104.Suffix or ""
      local default = p104.Default or { v206, v207 }
      local v208 = { Value = { default[1], default[2] }, Item = v202, Callback = p104.Callback }
      local instance30, v209 = f50(v202.Frame, "", true, metrics.ValueChipH)
      local instance31, v210 = f50(v202.Frame, "", true, metrics.ValueChipH)
      instance30.Position = new2(1, -1, 0, 0)
      local v211 = 24
      local v212 = 24

      local function f69()
        instance31.Position = new2(1, -(v211 + metrics.ChipGap + 1), 0, 0)
        v203.Size = new2(1, -(v211 + v212 + metrics.ChipGap + metrics.Gap), 0, metrics.Row)
      end

      local getHighest3, v213 = f51(instance30, v209, 24, function(p105)
        v211 = p105
        f69()
      end)

      local getHighest4, v214 = f51(instance31, v210, 24, function(p106)
        v212 = p106
        f69()
      end)

      local instance32, instance33, v215 = f62(v202.Frame)
      local v216 = f63(instance32)
      local v217 = f63(instance32)

      local function f70(p107)
        return (p107 - v206) / (v207 - v206)
      end

      local function f71(p108)
        local v218 = f61(p103.Window)
        local v220 = f64(f70(v208.Value[1]), v218)
        local v221 = f64(f70(v208.Value[2]), v218)

        f65(v216, v220, p108)
        f65(v217, v221, p108)

        f16(instance33, "Position", new2(0, v220, 0, 0), p108, "Follow")
        f16(instance33, "Size", new2(0, v221 - v220, 1, 0), p108, "Follow")
      end

      function v208:Set(p109, p110, p111)
        v208.Value = { math.min(p109[1], p109[2]), math.max(p109[1], p109[2]) }

        f25(v210, f48(v208.Value[1], decimals3) .. suffix2)
        f25(v209, f48(v208.Value[2], decimals3) .. suffix2)

        f71(p111 ~= false)

        if not p110 then
          f30(v208.Callback, v208.Value)
        end
      end

      local function getClamped2(p112)
        local v222 = 10 ^ (-decimals3)
        return math.clamp(floor2(p112 / v222 + 0.5) * v222, v206, v207)
      end

      f53(instance31, v210, function() return f48(v208.Value[1], decimals3) end, function(p113)
        v208:Set({ math.min(getClamped2(p113), v208.Value[2]), v208.Value[2] })
      end, getHighest4, v214)

      f53(instance30, v209, function() return f48(v208.Value[2], decimals3) end, function(p114)
        v208:Set({ v208.Value[1], math.max(getClamped2(p114), v208.Value[1]) })
      end, getHighest3, v213)

      local v224 = 1

      local function f72(p115)
        return getClamped2(v206 + (v207 - v206) * f66(instance32, p115))
      end

      local function f73(p116)
        local v225 = f72(p116)
        local v226 = { v208.Value[1], v208.Value[2] }

        if v224 == 1 then
          v226[1] = math.min(v225, v226[2])
        else
          v226[2] = math.max(v225, v226[1])
        end

        v208:Set(v226)
      end

      v215.InputBegan:Connect(function(input6)
        if not f31(input6) then
          return
        end

        local v227 = f32()
        local v228 = f72(v227)
        v224 = math.abs(v228 - v208.Value[1]) <= math.abs(v228 - v208.Value[2]) and 1 or 2
        f73(v227)
        f35(f73)
      end)

      table.insert(p103.Window.ResizeJobs, function() f71(false) end)
      v208:Set(v208.Value, true, false)
      f58(p103, v208, p104, v202)
      return v208
    end

    local function getOpenDropdown(window6, frame4, p117)
      local openDropdown2 = {
        Options = p117.Options or {},
        Multi = p117.Multi == true,
        Open = false,
        Value = p117.Multi and {} or p117.Default,
        Callback = p117.Callback,
      }

      if p117.Multi and p117.Default then
        for _, v229 in p117.Default do
          openDropdown2.Value[v229] = true
        end
      end

      local instance34 = getInstance2("TextButton", {
        Position = fromOffset(1, (p117.Y or 0) + 1),
        Size = new2(1, -2, 0, metrics.InputH - 2),
        Radius = metrics.Radius,
        BackgroundTransparency = 0,
      }, frame4)

      f47(instance34, "Element")
      makeGradient(instance34)

      local instance35 = getInstance2("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
      }, instance34)

      f22(instance35, "Color", function()
        return openDropdown2.Open and copy.Accent or copy.Outline
      end)

      local v230 = f27(instance34, {
        Fg = "InactiveText",
        TextSize = 13,
        X = 7,
        RowH = metrics.InputH - 2,
        Right = 28,
        Truncate = Enum.TextTruncate.AtEnd,
      })

      f46(instance34, "layout", 14, "InactiveText", "Element", {
        AnchorPoint = new(1, 0),
        Position = new2(1, -5, 0, 5),
      })

      local instance36 = getInstance2("TextButton", {
        Bg = "Background",
        BackgroundTransparency = 1,
        Radius = metrics.Radius,
        Visible = false,
        Size = fromOffset(10, 0),
      }, window6.Dropdowns)

      local instance37 = getInstance2("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
        Transparency = 1,
      }, instance36)

      f22(instance37, "Color", "Outline")

      local instance38 = getInstance2("ScrollingFrame", {
        Size = new2(1, 0, 1, 0),
        ScrollBarThickness = 0,
        CanvasSize = fromOffset(0, 0),
      }, instance36)

      local list6 = {}
      local v231 = 0
      local v232 = false

      local v233 = f27(instance36, {
        Fg = "InactiveText",
        Text = p117.Empty or "No options",
        TextSize = 13,
        X = 9,
        RowH = metrics.ListRowH,
        Right = 8,
        TextTransparency = 1,
      })

      openDropdown2.Reveal = 0

      local function f74()
        if not openDropdown2.Multi then
          return openDropdown2.Value and tostring(openDropdown2.Value) or "None"
        end

        local list7 = {}

        for _, v234 in openDropdown2.Options do
          if openDropdown2.Value[v234] then
            table.insert(list7, tostring(v234))
          end
        end

        return #list7 > 0 and table.concat(list7, ", ") or "None"
      end

      local function f75(option)
        if openDropdown2.Multi then
          return openDropdown2.Value[option] == true
        end

        return openDropdown2.Value == option
      end

      local function f76()
        v231 = math.clamp(#openDropdown2.Options, 1, p117.MaxRows or 10) * metrics.ListRowH
      end

      local f77

      local function f78()
        local reveal = openDropdown2.Reveal
        instance36.BackgroundTransparency = 1 - reveal
        instance37.Transparency = 1 - reveal
        v233.TextTransparency = 1 - reveal

        for _, v235 in list6 do
          f77(v235)
        end
      end

      local function f79(p118)
        local v236 = p118 and "Fast" or false

        for _, v237 in list6 do
          local v238 = f75(v237.Option)

          if p118 then
            f14(v237, "Sel", v238 and 1 or 0, "Fast", { Step = function() f77(v237) end })
          else
            f15(v237, "Sel", v238 and 1 or 0)
            f77(v237)
          end

          f16(v237.Text, "Position", fromOffset(v238 and 17 or 8, v237.TextY), p118, "Smooth")

          f23(v237.Text, v236)
          f23(v237.Button, v236)
        end

        f25(v230, f74())
      end

      function f77(p119)
        local reveal2 = openDropdown2.Reveal

        p119.Button.BackgroundTransparency = 1 - math.max(p119.Sel, p119.Hov) * reveal2
        p119.Bar.BackgroundTransparency = 1 - p119.Sel * reveal2
        p119.Text.TextTransparency = 1 - reveal2
      end

      local function f80()
        local absolutePosition3 = instance34.AbsolutePosition
        local absoluteSize2 = instance34.AbsoluteSize
        local screen = window6.Screen
        local absolutePosition4 = screen.AbsolutePosition
        local y = absolutePosition4.Y
        local screen2 = window6.Screen
        local absoluteSize3 = screen2.AbsoluteSize
        local y2 = absoluteSize3.Y

        v232 = absolutePosition3.Y + absoluteSize2.Y + 6 + v231 > y + y2 - 8
          and absolutePosition3.Y - 6 - v231 > window6.Screen.AbsolutePosition.Y + 8

        local v246 = f33(new(absolutePosition3.X, v232 and absolutePosition3.Y - 6
          or absolutePosition3.Y + absoluteSize2.Y + 6))

        instance36.AnchorPoint = v232 and new(0, 1) or new(0, 0)
        instance36.Position = fromOffset(v246.X, v246.Y)
      end

      local function f81()
        for _, v247 in list6 do
          v247.Button:Destroy()
        end

        list6 = {}
        local v248 = #openDropdown2.Options

        for v249, v250 in openDropdown2.Options do
          local v251 = {
            Option = v250,
            Sel = 0,
            Hov = 0,
            Hovering = false,
          }

          v251.Button = getInstance2("TextButton", {
            Bg = function() return v251.Hovering and copy.Inline or copy.Tab end,
            BackgroundTransparency = 1,
            Position = fromOffset(0, (v249 - 1) * metrics.ListRowH),
            Size = new2(1, 0, 0, metrics.ListRowH),
            Radius = (v249 == 1 or v249 == v248) and metrics.Radius or nil,
          }, instance38)

          v251.Bar = getInstance2("Frame", {
            Bg = "Accent",
            BackgroundTransparency = 1,
            Position = fromOffset(7, 6),
            Size = fromOffset(2, 12),
          }, v251.Button)

          v251.Text = f27(v251.Button, {
            Text = tostring(v250),
            X = 8,
            TextSize = 13,
            RowH = metrics.ListRowH,
            Right = 18,
            Truncate = Enum.TextTruncate.AtEnd,
            TextTransparency = 1,
            Fg = function() return f75(v250) and copy.Text or copy.InactiveText end,
          })

          v251.TextY = v251.Text.Position.Y.Offset

          local function f82()
            f77(v251)
          end

          f39(v251.Button, function()
            v251.Hovering = true
            f23(v251.Button)
            f14(v251, "Hov", 1, "Fast", { Step = f82 })
          end, function()
            v251.Hovering = false
            f23(v251.Button)
            f14(v251, "Hov", 0, "Fast", { Step = f82 })
          end)

          v251.Button.MouseButton1Click:Connect(function()
            if openDropdown2.Multi then
              openDropdown2.Value[v250] = not openDropdown2.Value[v250] or nil
              f79(true)
              f30(openDropdown2.Callback, openDropdown2.Value)
            else
              openDropdown2:Set(v250)
              openDropdown2:Toggle(false)
            end
          end)

          table.insert(list6, v251)
        end

        instance38.CanvasSize = fromOffset(0, v248 * metrics.ListRowH)
        v233.Visible = v248 == 0
        f79(false)
      end

      openDropdown2.Follow = f80

      function openDropdown2:Toggle(p120)
        local v252 = p120

        if v252 == nil then
          v252 = not openDropdown2.Open
        end

        if v252 == openDropdown2.Open then
          return
        end

        openDropdown2.Open = v252
        f23(instance35)
        local x5 = instance34.AbsoluteSize.X

        if v252 then
          if window6.OpenDropdown and window6.OpenDropdown ~= openDropdown2 then
            window6.OpenDropdown:Toggle(false)
          end

          window6.OpenDropdown = openDropdown2
          f76()
          f80()

          instance36.Visible = true
          instance36.Size = fromOffset(x5, v231)

          f14(openDropdown2, "Reveal", 1, "Fast", { Step = f78 })

          local position4 = not openDropdown2.Multi
            and table.find(openDropdown2.Options, openDropdown2.Value)

          local highest2 = math.max(0, #openDropdown2.Options * metrics.ListRowH - v231)

          instance38.CanvasPosition = new(0, position4 and math.clamp(
            floor2((position4 - 1) * metrics.ListRowH - (v231 - metrics.ListRowH) / 2), 0,
            highest2
          ) or 0)

          for v253, v254 in list6 do
            local v255 = (v253 - 1) * metrics.ListRowH
            v254.Button.Position = fromOffset(0, v255 + 6)

            task.delay(math.min(v253, 10) * 0.012, function()
              if v254.Button.Parent then
                f16(v254.Button, "Position", fromOffset(0, v255), openDropdown2.Open, "Smooth")
              end
            end)
          end
        else
          if window6.OpenDropdown == openDropdown2 then
            window6.OpenDropdown = nil
          end

          f14(openDropdown2, "Reveal", 0, "Fast", {
            Step = f78,
            Done = function() instance36.Visible = false end,
          })
        end
      end

      function openDropdown2:Set(p121, p122)
        if openDropdown2.Multi then
          openDropdown2.Value = {}

          for _, v256 in p121 do
            openDropdown2.Value[v256] = true
          end
        else
          openDropdown2.Value = p121
        end

        f79(true)

        if not p122 then
          f30(openDropdown2.Callback, openDropdown2.Multi and openDropdown2.Value or p121)
        end
      end

      function openDropdown2:SetOptions(options4)
        openDropdown2.Options = options4
        f81()

        if openDropdown2.Open then
          f76()
          instance36.Size = fromOffset(instance34.AbsoluteSize.X, v231)
        end
      end

      openDropdown2.Input = instance34
      openDropdown2.Panel = instance36

      instance34.MouseButton1Click:Connect(function()
        if window6.DropdownClosedBy == instance34
          and os.clock() - window6.DropdownClosedAt < 0.25 then
          return
        end

        openDropdown2:Toggle()
      end)

      f81()
      return openDropdown2
    end

    function index7:Dropdown(p123)
      local item13 = self:_item(metrics.DropdownH, "Dropdown", p123.Name)
      f27(item13.Frame, { Text = p123.Name, Truncate = Enum.TextTruncate.AtEnd })
      p123.Y = metrics.DropdownH - metrics.InputH

      local openDropdown3 = getOpenDropdown(self.Window, item13.Frame, p123)
      openDropdown3.Item = item13

      f58(self, openDropdown3, p123, item13)
      return openDropdown3
    end

    function index7:Button(p124)
      local buttonH = metrics.ButtonH
      local item14 = self:_item(buttonH, "Button", p124.Name)
      local window7 = self.Window

      local instance39 = getInstance2("TextButton", {
        Position = fromOffset(1, 1),
        Size = new2(1, -2, 0, metrics.ButtonH - 2),
        Radius = metrics.Radius,
        Border = "Outline",
        BackgroundTransparency = 0,
      }, item14.Frame)

      f47(instance39, "Element", "HoveredElement", "Inline")
      makeGradient(instance39)

      local _, v261 = f28(instance39, f61(window7), {
        Text = p124.Name,
        TextSize = 13,
        RowH = metrics.ButtonH - 2,
      })

      table.insert(window7.ResizeJobs, function() v261(f61(window7)) end)
      local v262 = { Item = item14, Instance = instance39, Callback = p124.Callback }
      instance39.MouseButton1Click:Connect(function() f30(v262.Callback) end)
      return v262
    end

    function index7:Textbox(p125)
      local item15 = self:_item(metrics.InputH, "Textbox", p125.Name or p125.Placeholder)

      local instance40 = getInstance2("Frame", {
        Bg = "Element",
        Position = fromOffset(1, 1),
        Size = new2(1, -2, 0, metrics.InputH - 2),
        Radius = metrics.Radius,
        Border = "Outline",
      }, item15.Frame)

      makeGradient(instance40)

      local instance41 = getInstance2("TextBox", {
        Fg = "Text",
        PlaceholderText = p125.Placeholder or p125.Name or "",
        Text = p125.Default or "",
        TextSize = 13,
        Position = fromOffset(7, getRounded(metrics.InputH - 2, 13)),
        Size = new2(1, -14, 0, 18),
        ClearTextOnFocus = false,
      }, instance40)

      f22(instance41, "PlaceholderColor3", "InactiveText")

      local v263 = {
        Item = item15,
        Instance = instance41,
        Value = instance41.Text,
        Callback = p125.Callback,
      }

      function v263:Set(text9, p126)
        instance41.Text = text9
        v263.Value = text9

        if not p126 then
          f30(v263.Callback, text9)
        end
      end

      local uiStroke3 = instance40:FindFirstChildOfClass("UIStroke")
      local flag7 = false
      f22(uiStroke3, "Color", function() return flag7 and copy.Accent or copy.Outline end)

      instance41.Focused:Connect(function()
        flag7 = true
        f23(uiStroke3)
      end)

      instance41.FocusLost:Connect(function()
        flag7 = false
        f23(uiStroke3)
        v263:Set(instance41.Text)
      end)

      f58(self, v263, p125, item15)
      return v263
    end

    function index7:Listbox(p127)
      local height3 = p127.Height or 177
      local item16 = self:_item(height3, "Listbox", p127.Name, false)

      local instance42 = getInstance2("ScrollingFrame", {
        Bg = "Inline",
        Position = fromOffset(1, 1),
        Size = new2(1, -2, 0, height3 - 2),
        Radius = metrics.Radius,
        Border = "Outline",
        ScrollBarThickness = 0,
        CanvasSize = fromOffset(0, 0),
      }, item16.Frame)

      local v266 = {
        Options = {},
        Value = nil,
        Item = item16,
        Callback = p127.Callback,
      }

      local list8 = {}

      local v267 = f27(instance42, {
        Fg = "InactiveText",
        Text = p127.Empty or "Nothing here yet",
        TextSize = 13,
        X = 10,
        Y = 2,
        RowH = metrics.ListRowH,
        Right = 8,
      })

      local function f83(p128)
        local v268 = p128 and "Fast" or false

        for _, v269 in list8 do
          local v270 = v266.Value == v269.Option
          f23(v269.Text, v268)

          f16(v269.Text, "Position", fromOffset(v270 and 17 or 8, v269.TextY), p128, "Smooth")
          f16(v269.Bar, "BackgroundTransparency", v270 and 0 or 1, p128, "Fast")
        end
      end

      function v266:Set(value6, p129)
        v266.Value = value6
        f83(true)

        if not p129 then
          f30(v266.Callback, value6)
        end
      end

      function v266:SetOptions(p130)
        for _, v271 in list8 do
          v271.Button:Destroy()
        end

        list8 = {}
        v266.Options = p130

        for v272, v273 in p130 do
          local v274 = {
            Option = v273,
            Button = getInstance2("TextButton", {
              Bg = "HoveredElement",
              BackgroundTransparency = 1,
              Position = fromOffset(2, 2 + (v272 - 1) * metrics.ListRowH),
              Size = new2(1, -4, 0, metrics.ListRowH),
              Radius = metrics.SmallRadius,
            }, instance42),
          }

          seen3[v274.Button] = true

          v274.Bar = getInstance2("Frame", {
            Bg = "Accent",
            BackgroundTransparency = 1,
            Position = fromOffset(6, 6),
            Size = fromOffset(2, 12),
          }, v274.Button)

          v274.Text = f27(v274.Button, {
            Text = v273,
            X = 8,
            TextSize = 13,
            RowH = metrics.ListRowH,
            Right = 18,
            Truncate = Enum.TextTruncate.AtEnd,
            Fg = function() return v266.Value == v273 and copy.Text or copy.InactiveText end,
          })

          v274.TextY = v274.Text.Position.Y.Offset

          f39(
            v274.Button, function() f14(v274.Button, "BackgroundTransparency", 0, "Fast") end,
            function() f14(v274.Button, "BackgroundTransparency", 1, "Fast") end
          )

          v274.Button.MouseButton1Click:Connect(function() v266:Set(v273) end)
          table.insert(list8, v274)
        end

        instance42.CanvasSize = fromOffset(0, 4 + #p130 * metrics.ListRowH)
        v267.Visible = #p130 == 0
        f83(false)
      end

      v266:SetOptions(p127.Options or {})

      return v266
    end

    function index7:_beginDrag()
      if self.Dropping then
        return
      end

      local window8 = self.Window
      local v275 = f32()
      local v276 = v275 - self.Root.AbsolutePosition
      local card = self.Card
      local uiStroke4 = card:FindFirstChildOfClass("UIStroke")
      local flag8 = false
      local v277

      local function f84(column)
        return column.Scroll.AbsolutePosition + new(0, self.Y - column.Scroll.CanvasPosition.Y)
      end

      local v278

      local function f85(p131)
        local tab = self.Tab
        local v281 = tab.Columns[1]
        local v282 = tab.Columns[2]

        local v283 = (v281.Scroll.AbsolutePosition.X + v281.Scroll.AbsoluteSize.X
            + v282.Scroll.AbsolutePosition.X)
          / 2

        local v284 = p131.X < v283 and v281 or v282
        local position5 = table.find(v284.Sections, self)
        local v285 = 1

        for v286, v287 in v284.Sections do
          if v287 ~= self then
            local v288 = v284.Scroll.AbsolutePosition.Y - v284.Scroll.CanvasPosition.Y + v287.Y
              + v287.TotalH / 2

            local v289 = position5 and v286 < position5 and -14

            if p131.Y > v288 + (v289 or 14) then
              v285 = v285 + 1
            end
          end
        end

        return v284, v285
      end

      local function f86()
        flag8 = true
        self.Dragging = true
        window8:CloseFloating()
        local root4 = self.Root
        local absolutePosition5 = root4.AbsolutePosition
        local absoluteSize4 = self.Root.AbsoluteSize
        local v290 = f33(absolutePosition5)

        self.Root.Parent = window8.DragLayer
        self.Root.Size = fromOffset(absoluteSize4.X, self.TotalH)
        self.Root.Position = fromOffset(v290.X, v290.Y)

        f23(uiStroke4)

        v277 = getInstance2("Frame", {
          Bg = "Accent",
          BackgroundTransparency = 0.92,
          Radius = metrics.CardRadius,
          Border = "Accent",
          Position = fromOffset(v290.X, v290.Y),
          Size = fromOffset(absoluteSize4.X, self.TotalH),
          ZIndex = -1,
        }, window8.DragLayer)

        v278 = f41(v277)
        v277.Visible = false

        local v291 = v278
        v291:Show(nil, "Fast")
      end

      f35(function(p132)
        if not flag8 then
          if (p132 - v275).Magnitude < 5 then
            return
          end

          f86()
        end

        local v292 = f33(p132 - v276)
        f14(self.Root, "Position", fromOffset(v292.X, v292.Y), "Follow")
        local v293, v294 = f85(p132)
        local position6 = table.find(v293.Sections, self)

        if v293 ~= self.Column or position6 ~= v294 then
          local column2 = self.Column

          table.remove(column2.Sections, table.find(column2.Sections, self))
          table.insert(v293.Sections, math.min(v294, #v293.Sections + 1), self)

          self.Column = v293

          if column2 ~= v293 then
            column2:Layout(true)
          end

          v293:Layout(true)
        end
      end, function()
        if not flag8 then
          return
        end

        local column3 = self.Column
        column3:Layout(true)

        self.Dragging = false
        self.Dropping = true

        f23(uiStroke4)
        local v295 = f33(f84(column3))
        local instance43 = v277
        v278:Hide(function() instance43:Destroy() end)

        f14(self.Root, "Position", fromOffset(v295.X, v295.Y), "Smooth", {
          Done = function()
            self.Dropping = false
            self.Root.Parent = column3.Scroll
            self.Root.Size = new2(1, 0, 0, self.TotalH)
            self.Root.Position = fromOffset(0, self.Y)
          end,
        })
      end, function(p133)
        if not flag8 then
          return
        end

        local column4 = self.Column
        local scroll = column4.Scroll
        local absolutePosition6 = scroll.AbsolutePosition
        local y3 = absolutePosition6.Y
        local v296 = scroll.AbsolutePosition.Y + scroll.AbsoluteSize.Y

        if p133.X >= scroll.AbsolutePosition.X
          and p133.X <= scroll.AbsolutePosition.X + scroll.AbsoluteSize.X then
          if p133.Y < y3 + 36 then
            column4:ScrollTo(column4.Target - 8)
          elseif p133.Y > v296 - 36 then
            column4:ScrollTo(column4.Target + 8)
          end
        end

        local v297 = f33(f84(column4))
        f14(v277, "Position", fromOffset(v297.X, v297.Y), "Smooth")
      end)
    end

    function index6:Section(p134)
      local window9 = self.Window
      local v298 = self.Columns[p134.Side or 1]
      local headerDescH = p134.Description and metrics.HeaderDescH or metrics.HeaderH

      local instance44 = getInstance2(
        "Frame", { Name = p134.Name, Size = new2(1, 0, 0, headerDescH) }, v298.Scroll
      )

      local instance45 = getInstance2(
        "TextButton", { Size = new2(1, 0, 0, headerDescH - 8) }, instance44
      )

      local flag9 = false

      local function getText()
        return flag9 and copy.Text or copy.InactiveText
      end

      local v299 = f46(instance45, p134.Icon or "cube", 16, getText, "Tab")

      local v300 = f27(instance45, {
        Text = p134.Name,
        X = 27,
        Fg = getText,
        Truncate = Enum.TextTruncate.AtEnd,
      })

      if p134.Description then
        f27(instance45, {
          Fg = "InactiveText",
          Text = p134.Description,
          TextSize = 11,
          RowH = 14,
          Y = 18,
          Truncate = Enum.TextTruncate.AtEnd,
        })
      end

      local instance46 = getInstance2("Frame", {
        Bg = "Inline",
        Active = true,
        Position = fromOffset(1, headerDescH + 1),
        Size = new2(1, -2, 0, 0),
        Radius = metrics.CardRadius,
      }, instance44)

      local applyStrokeMode = Enum.ApplyStrokeMode
      local border = applyStrokeMode.Border
      local v301

      f22(
        getInstance2("UIStroke", { ApplyStrokeMode = border, Thickness = 1 }, instance46),
        "Color", function() return v301 and v301.Dragging and copy.Accent or copy.Outline end
      )

      local position7 = fromOffset(metrics.Pad - 1, -1)

      local body = getInstance2("Frame", {
        Position = position7,
        Size = new2(1, -(metrics.Pad - 1) * 2, 1, 2),
      }, instance46)

      v301 = setmetatable({
        Window = window9,
        Tab = self,
        Column = v298,
        Name = p134.Name,
        Root = instance44,
        Card = instance46,
        Body = body,
        Items = {},
        HeaderH = headerDescH,
        TotalH = headerDescH,
        CardH = 0,
        Y = 0,
        Dragging = false,
        Dropping = false,
        Title = v300,
      }, index7)

      table.insert(v298.Sections, v301)
      table.insert(window9.Sections, v301)

      f39(instance45, function()
        flag9 = true
        v299.Update()
        f23(v300)
      end, function()
        flag9 = false
        v299.Update()
        f23(v300)
      end)

      instance45.MouseButton1Down:Connect(function() v301:_beginDrag() end)
      v301:Layout(false)
      return v301
    end

    local function f87(instance47)
      local v302 = false

      if typeof(gethui) == "function" then
        v302 = pcall(function() instance47.Parent = gethui() end)
      end

      if not v302 then
        v302 = pcall(function()
          local v304 = game
          instance47.Parent = v304:GetService("CoreGui")
        end)
      end

      if not v302 or not instance47.Parent then
        local localPlayer = players.LocalPlayer
        instance47.Parent = localPlayer:WaitForChild("PlayerGui")
      end
    end

    function index5:Category(text10)
      local sidebarY = self.SidebarY + (self.SidebarHasTabs and metrics.TabToCategory or 0)

      f27(self.Sidebar, {
        Fg = "InactiveText",
        Text = text10,
        TextSize = 9,
        X = metrics.Pad,
        RowH = 12,
        Y = sidebarY - 6,
        W = 120,
      })

      self.SidebarY = sidebarY
      self.SidebarAfterCategory = true
    end

    function index5:Tab(p135)
      local sidebarY2 = self.SidebarY
        + (self.SidebarAfterCategory and metrics.CategoryToTab or metrics.TabPitch)

      self.SidebarAfterCategory = false
      self.SidebarHasTabs = true
      self.SidebarY = sidebarY2

      local v308 = setmetatable({
        Window = self,
        Name = p135.Name,
        Y = sidebarY2 - metrics.TabH / 2,
      }, index6)

      local instance48 = getInstance2("TextButton", {
        Position = fromOffset(metrics.Pad, v308.Y),
        Size = fromOffset(metrics.TabW, metrics.TabH),
        ZIndex = 2,
      }, self.Sidebar)

      v308.Button = instance48
      local flag10 = false

      local function f88()
        return self.CurrentTab == v308
      end

      local function getText2()
        return (f88() or flag10) and copy.Text or copy.InactiveText
      end

      v308.Icon = f46(
        instance48, p135.Icon or "cube", 16, getText2,
        function() return f88() and copy.Inline or copy.Background end,
        { Position = fromOffset(6, 6) }
      )

      v308.Label = f27(instance48, {
        Text = p135.Name,
        X = 33,
        TextSize = 13,
        RowH = metrics.TabH,
        Fg = getText2,
        Right = 6,
        Truncate = Enum.TextTruncate.AtEnd,
      })

      v308.LabelY = v308.Label.Position.Y.Offset

      v308.Page = getInstance2(
        "Frame", { Name = p135.Name, Size = new2(1, 0, 1, 0), Visible = false }, self.Pages
      )

      v308.Columns = {}

      for i7 = 1, 2 do
        local pad2 = metrics.Pad
        local columnW = self.ColumnW
        local pad3 = metrics.Pad
        local position8 = fromOffset(pad2 + (i7 - 1) * (columnW + pad3), 0)
        local size2 = new2(0, self.ColumnW, 1, 0)
        local canvasSize = fromOffset(0, 0)
        local mouseEnabled = userInputService2.MouseEnabled
        local page = v308.Page

        local scroll2 = getInstance2("ScrollingFrame", {
          Position = position8,
          Size = size2,
          ScrollBarThickness = 0,
          CanvasSize = canvasSize,
          ScrollingEnabled = not mouseEnabled,
          ClipsDescendants = true,
        }, page)

        local v309 = setmetatable({
          Scroll = scroll2,
          Sections = {},
          Target = 0,
          ContentH = 0,
          Tab = v308,
          ShowTop = false,
          ShowBottom = false,
        }, index8)

        local function f89(position9, rotation)
          local instance49 = getInstance2("Frame", {
            Bg = "Tab",
            BackgroundTransparency = 1,
            Position = position9,
            Size = fromOffset(self.ColumnW, 14),
            ZIndex = 4,
          }, v308.Page)

          getInstance2(
            "UIGradient", { Rotation = rotation, Transparency = NumberSequence.new(1, 0) },
            instance49
          )

          return instance49
        end

        local pad4 = metrics.Pad
        local columnW2 = self.ColumnW
        local v310 = pad4 + (i7 - 1) * (columnW2 + metrics.Pad)
        local fadeTop = f89(fromOffset(v310, 0), 270)
        local fadeBottom = f89(new2(0, v310, 1, -14), 90)

        v309.FadeTop = fadeTop
        v309.FadeBottom = fadeBottom

        table.insert(self.Columns, v309)
        v308.Columns[i7] = v309
      end

      local function f90()
        v308.Icon.Update()
        f23(v308.Label)

        f14(
          v308.Label, "Position", fromOffset(flag10 and not f88() and 35 or 33, v308.LabelY),
          "Smooth"
        )
      end

      v308.Paint = f90

      f39(instance48, function()
        flag10 = true
        f90()
      end, function()
        flag10 = false
        f90()
      end)

      instance48.MouseButton1Click:Connect(function() self:SelectTab(v308) end)
      table.insert(self.Tabs, v308)

      if not self.CurrentTab then
        self:SelectTab(v308, true)
      end

      return v308
    end

    function index5:SelectTab(p136, p137)
      if self.CurrentTab == p136 then
        return
      end

      local currentTab = self.CurrentTab

      self.CurrentTab = p136
      self:CloseFloating()

      if currentTab then
        currentTab.Page.Visible = false
        currentTab.Paint()
      end

      p136.Page.Visible = true
      p136.Paint()

      self.Indicator.Visible = true
      f16(self.Indicator, "Position", fromOffset(metrics.Pad + 1, p136.Y + 1), not p137, "Soft")

      if not p137 then
        self.Veil.BackgroundTransparency = 0
        f14(self.Veil, "BackgroundTransparency", 1, "Soft")
        p136.Page.Position = fromOffset(0, 10)
        f14(p136.Page, "Position", fromOffset(0, 0), "Soft")
      end
    end

    function index5:SetHotkeyActive(key22, p138)
      local v311 = self.HotkeyEntries[key22]
      local v312 = p138 and key22.Key ~= nil
      local v313 = v312 and not v311
      local v314, v315

      if v313 then
        v314 = getInstance2("Frame", {
          Bg = "Background",
          Size = fromOffset(40, 24),
          Radius = metrics.FloatRadius,
          Border = "Outline",
          Visible = false,
        }, self.Hotkeys)

        getInstance2("Frame", {
          Bg = "Accent",
          Position = fromOffset(1, 5),
          Size = fromOffset(2, 14),
          Radius = metrics.SmallRadius,
        }, v314)

        v315 = f27(v314, {
          TextSize = 12,
          X = metrics.Pad,
          RowH = 24,
          Weight = Enum.FontWeight.SemiBold,
        })

        v311 = { Frame = v314, Label = v315, Fader = f41(v314) }
        self.HotkeyEntries[key22] = v311
        table.insert(self.HotkeyOrder, key22)

        v315:GetPropertyChangedSignal("TextBounds"):Connect(function()
          v314.Size = fromOffset(math.ceil(v315.TextBounds.X) + metrics.Pad * 2, 24)
        end)

        f25(v315, (key22.Name or "Key") .. " - " .. f49(key22.Key))

        v314.Size = fromOffset(math.ceil(v315.TextBounds.X) + metrics.Pad * 2, 24)
        v314.Position = fromOffset(-14, 33 * #self.HotkeyOrder + 1)

        v311.Fader:Show()
      elseif v311 and v312 then
        f25(v311.Label, (key22.Name or "Key") .. " - " .. f49(key22.Key))
        return
      elseif v311 then
        self.HotkeyEntries[key22] = nil
        table.remove(self.HotkeyOrder, table.find(self.HotkeyOrder, key22))
        f14(v311.Frame, "Position", fromOffset(-14, v311.Frame.Position.Y.Offset), "Smooth")
        v311.Fader:Hide(function() v311.Frame:Destroy() end)
      else
        return
      end

      for v316, v317 in self.HotkeyOrder do
        f14(self.HotkeyEntries[v317].Frame, "Position", fromOffset(1, 33 * v316 + 1), "Settle")
      end
    end

    function index5:Notify(p139)
      local v318 = p139

      if type(v318) == "string" then
        v318 = { Text = v318 }
      end

      local instance50 = getInstance2("Frame", {
        Bg = "Background",
        Size = fromOffset(60, 28),
        Radius = metrics.FloatRadius,
        Border = "Outline",
        Visible = false,
      }, self.Notifications)

      f46(
        instance50, v318.Icon or "check", 14, function() return fromRGB(112, 205, 132) end,
        "Background", { Position = fromOffset(8, 7) }
      )

      local v319 = f27(instance50, {
        Text = v318.Text,
        TextSize = 12,
        X = 28,
        RowH = 28,
        W = 340,
        Truncate = Enum.TextTruncate.AtEnd,
      })

      local v320 = { Frame = instance50, Fader = f41(instance50) }

      local function f91()
        instance50.Size = fromOffset(math.min(math.ceil(v319.TextBounds.X), 340) + 38, 28)
      end

      v319:GetPropertyChangedSignal("TextBounds"):Connect(f91)
      f91()
      table.insert(self.NotifyStack, 1, v320)

      local function f92()
        local v321 = #self.NotifyStack

        for v322, v323 in self.NotifyStack do
          local v324 = (v321 - v322) * 36

          if not v323.Placed then
            v323.Placed = true
            v323.Frame.Position = fromOffset(-36, v324)
          end

          f14(v323.Frame, "Position", fromOffset(0, v324), "Settle")
        end
      end

      function v320.Dismiss()
        if v320.Gone then
          return
        end

        v320.Gone = true
        table.remove(self.NotifyStack, table.find(self.NotifyStack, v320))
        f14(instance50, "Position", fromOffset(-36, instance50.Position.Y.Offset), "Smooth")
        v320.Fader:Hide(function() instance50:Destroy() end)
        f92()
      end

      f92()
      v320.Fader:Show()

      if #self.NotifyStack > 6 then
        self.NotifyStack[#self.NotifyStack].Dismiss()
      end

      task.delay(v318.Duration or 3, v320.Dismiss)
    end

    function index5:ApplyTheme(key23, p140)
      local v325 = themes[key23]

      if not v325 then
        return
      end

      for v326, v327 in v325 do
        copy[v326] = v327
      end

      self.ThemeName = key23
      local seen4 = {}

      for _, v328 in self.Tabs do
        if v328 ~= self.CurrentTab then
          for _, v329 in v328.Page:GetDescendants() do
            seen4[v329] = true
          end
        end
      end

      for v330 in v73 do
        f23(v330, not seen4[v330] and "Soft" or false)
      end

      for _, v331 in self.ThemeRows do
        local color3 = v331.Color
        color3:Set(copy[v331.Key], nil, true)
      end

      if not p140 then
        self:Notify(('Applied "%s" theme.'):format(key23))
      end
    end

    function index5:SetThemeColor(key24, p141)
      copy[key24] = p141
      self.PendingThemeKeys[key24] = true
    end

    function index5:_flushThemeColors(p142)
      self.ThemeClock = self.ThemeClock + p142

      if next(self.PendingThemeKeys) == nil or self.ThemeClock < 0.033333333333333 then
        return
      end

      self.ThemeClock = 0

      for v332 in self.PendingThemeKeys do
        local v333 = v74[v332]

        if v333 then
          for v334, v335 in v333 do
            f15(v334, v335, copy[v332])
          end
        end

        self.PendingThemeKeys[v332] = nil
      end

      for v336 in seen2 do
        f23(v336, false)
      end
    end

    function index5:SetCasing(p143, p144)
      v45 = p143
      f26()

      if not p144 then
        self:Notify(('Set casing to "%s".'):format(p143))
      end
    end

    function index5:SetFont(key25)
      font = fonts[key25] or key25
      f26()
    end

    function index5:SetTextWeight(key26)
      semiBold = Enum.FontWeight[key26]
      f26()
    end

    function index5:CloseFloating()
      if self.OpenDropdown then
        self.OpenDropdown:Toggle(false)
      end

      self:ClosePopup()
    end

    function index5:ClosePopup()
      local activePopup2 = self.ActivePopup

      if not activePopup2 then
        return
      end

      self.ActivePopup = nil
      local anchor = activePopup2.Anchor
      local v337 = os
      local lastPopupTime = v337.clock()

      self.LastPopupAnchor = anchor
      self.LastPopupTime = lastPopupTime

      if activePopup2.OnClose then
        activePopup2.OnClose()
      end

      local position10 = activePopup2.Frame.Position

      f14(
        activePopup2.Frame, "Position",
        fromOffset(position10.X.Offset, position10.Y.Offset - 4), "Fast"
      )

      activePopup2.Fader:Hide()
    end

    function index5:_openPopup(p145, anchor2, p146)
      if self.LastPopupAnchor == anchor2 and os.clock() - self.LastPopupTime < 0.2 then
        return false
      end

      self:ClosePopup()
      local v338 = f33(p146)
      local absoluteSize5 = self.Screen.AbsoluteSize
      local size3 = p145.Frame.Size

      local clamped2 = math.clamp(
        floor2(v338.X), 8, math.max(8, absoluteSize5.X - size3.X.Offset - 8)
      )

      local clamped3 = math.clamp(
        floor2(v338.Y), 8, math.max(8, absoluteSize5.Y - size3.Y.Offset - 8)
      )

      p145.Anchor = anchor2
      p145.Frame.Position = fromOffset(clamped2, clamped3 - 6)

      f14(p145.Frame, "Position", fromOffset(clamped2, clamped3), "Settle")
      p145.Fader:Show()
      self.ActivePopup = p145
      return true
    end

    function index5:OpenKeybindMenu(p147, target2)
      local keybindMenu = self.KeybindMenu
      keybindMenu.Target = target2
      keybindMenu.Paint(false)

      local absolutePosition7 = p147.AbsolutePosition
      local absoluteSize6 = p147.AbsoluteSize
      local x6 = absolutePosition7.X

      self:_openPopup(
        keybindMenu, p147, new(x6, absolutePosition7.Y + absoluteSize6.Y + metrics.Gap)
      )
    end

    function index5:OpenPicker(p148, target3)
      local picker = self.Picker

      if self.LastPopupAnchor == p148 and os.clock() - self.LastPopupTime < 0.2 then
        return
      end

      local absolutePosition8 = p148.AbsolutePosition
      local absoluteSize7 = p148.AbsoluteSize

      picker.Target = target3
      picker.Sync()

      local x7 = absolutePosition8.X

      self:_openPopup(
        picker, p148, new(x7 - 8, absolutePosition8.Y + absoluteSize7.Y + metrics.Pad)
      )
    end

    function index5:_clamped(p149, p150, p151)
      local screen3 = self.Screen
      local absoluteSize8 = screen3.AbsoluteSize
      local absoluteSize9 = p149.AbsoluteSize
      local anchorPoint = p149.AnchorPoint
      local lowest2 = math.min(60, absoluteSize9.X)
      local clamp = math.clamp
      local x8 = anchorPoint.X
      local x9 = absoluteSize9.X
      local x10 = absoluteSize9.X
      local max3 = math.max
      local x11 = absoluteSize9.X

      local v349 = clamp(
        p150 - x8 * x9, lowest2 - x10, max3(lowest2 - x11, absoluteSize8.X - lowest2)
      )

      local clamp2 = math.clamp
      local y4 = anchorPoint.Y
      local y5 = absoluteSize9.Y
      local max4 = math.max
      local y6 = absoluteSize8.Y
      local v355 = clamp2(p151 - y4 * y5, 0, max4(0, y6 - 30))

      return fromOffset(
        round(v349 + anchorPoint.X * absoluteSize9.X),
        round(v355 + anchorPoint.Y * absoluteSize9.Y)
      )
    end

    function index5:_modalPosition(p152)
      return fromOffset(floor2((self.Width - 420) / 2), floor2((self.Height - 340) / 2) + p152)
    end

    local function f93(p153, p154, huge)
      local clamped4 = math.clamp(floor2(p153), p154, math.max(p154, huge))
      return clamped4 - clamped4 % 2
    end

    function index5:_minHeight()
      local rounded2 = math.ceil(self.SidebarY + metrics.TabH / 2 + metrics.Gap + metrics.SearchH
        + metrics.Pad)

      return f93(math.max(self.MinSize.Y, rounded2 + rounded2 % 2), 0, math.huge)
    end

    function index5:_applySize(p155, height4)
      self.Width = p155
      self.Height = height4
      self.ColumnW = (p155 - metrics.ContentX - metrics.Pad * 3) / 2
      self.Holder.Size = fromOffset(p155, height4)

      for _, v358 in self.Tabs do
        for v359, v360 in v358.Columns do
          local v361 = metrics.Pad + (v359 - 1) * (self.ColumnW + metrics.Pad)

          v360.Scroll.Position = fromOffset(v361, 0)
          v360.Scroll.Size = new2(0, self.ColumnW, 1, 0)

          local fadeTop2 = v360.FadeTop
          local fadeTop3 = v360.FadeTop
          local position11 = fromOffset(v361, 0)
          local size4 = fromOffset(self.ColumnW, 14)
          fadeTop2.Position = position11
          fadeTop3.Size = size4
          local fadeBottom2 = v360.FadeBottom
          local fadeBottom3 = v360.FadeBottom
          local position12 = new2(0, v361, 1, -14)
          local size5 = fromOffset(self.ColumnW, 14)
          fadeBottom2.Position = position12
          fadeBottom3.Size = size5
          v360:ClampScroll()

          if v360.Scroll.CanvasPosition.Y > v360.Target then
            f15(v360.Scroll, "CanvasPosition", new(0, v360.Target))
          end
        end
      end

      for _, v362 in self.ResizeJobs do
        v362()
      end

      if self.Search and not self.Search.Open then
        self.Search.Modal.Position = self:_modalPosition(0)
      end
    end

    function index5.SetSize(p156, p157, p158)
      local v363 = f93(p157, p156.MinSize.X, math.huge)
      local v364 = f93(p158, p156:_minHeight(), math.huge)
      local position13 = p156.Holder.Position

      f15(p156.Holder, "Position", fromOffset(
        position13.X.Offset + (v363 - p156.Width) / 2,
        position13.Y.Offset + (v364 - p156.Height) / 2
      ))

      p156.Moved[p156.Holder] = true
      p156:_applySize(v363, v364)
    end

    function index5:_beginResize(p159, p160, p161)
      if self.Search.Open then
        return
      end

      self:CloseFloating()
      local v365 = f32()
      local width3 = self.Width
      local height5 = self.Height
      local minHeight = self:_minHeight()
      local position14 = self.Holder.Position
      local x12 = position14.X
      local offset4 = x12.Offset
      local y7 = position14.Y
      local offset5 = y7.Offset
      local v366 = offset4 - width3 / 2
      local v367 = offset5 - height5 / 2

      f35(function(p162)
        local v368 = p162 - v365
        local absoluteSize10 = self.Screen.AbsoluteSize

        local v369 = p159 == 1
            and f93(width3 + v368.X, self.MinSize.X, absoluteSize10.X - v366 - 4)
          or width3

        local v370 = p160 == 1 and f93(height5 + v368.Y, minHeight, absoluteSize10.Y - v367 - 4)
          or height5

        if v369 == self.Width and v370 == self.Height then
          return
        end

        self.Moved[self.Holder] = true
        f15(self.Holder, "Position", fromOffset(v366 + v369 / 2, v367 + v370 / 2))
        self:_applySize(v369, v370)
      end, p161)
    end

    function index5:_buildResize()
      local v371 = 0
      local flag11 = false
      local root5 = self.Root
      local anchorPoint2 = new(1, 1)
      local position15 = new2(1, -2, 1, -2)

      local v378 = f46(root5, "grip", 12, function()
        return (v371 > 0 or flag11) and copy.InactiveText or copy.Outline
      end, "Tab", { AnchorPoint = anchorPoint2, Position = position15, ZIndex = 15 })

      local function f94(name4, position16, size6, anchorPoint3, p163, p164)
        local instance51 = getInstance2("TextButton", {
          Name = name4,
          AnchorPoint = anchorPoint3,
          Position = position16,
          Size = size6,
          ZIndex = 16,
        }, self.Root)

        f39(instance51, function()
          v371 = v371 + 1
          v378.Update()
        end, function()
          v371 = v371 - 1
          v378.Update()
        end)

        local function f95()
          flag11 = true
          v378.Update()

          self:_beginResize(p163, p164, function()
            flag11 = false
            v378.Update()
          end)
        end

        instance51.MouseButton1Down:Connect(f95)
        table.insert(self.ResizeHandles, instance51)
      end

      f94("ResizeRight", new2(1, 3, 0, 12), new2(0, 6, 1, -30), new(1, 0), 1, 0)
      f94("ResizeBottom", new2(0, 12, 1, 3), new2(1, -30, 0, 6), new(0, 1), 0, 1)
      f94("ResizeCorner", new2(1, 3, 1, 3), fromOffset(18, 18), new(1, 1), 1, 1)
    end

    function index5:_makeDraggable(p165, key27, p166)
      p165.InputBegan:Connect(function(input7)
        if not f31(input7) then
          return
        end

        local v379 = f32()
        local position17 = key27.Position

        if p166 and not p166(v379) then
          return
        end

        f35(function(p167)
          local v380 = p167 - v379

          if v380.Magnitude < 1 and not self.Moved[key27] then
            return
          end

          self.Moved[key27] = true
          local x13 = position17.X
          local offset6 = x13.Offset

          f14(
            key27, "Position",
            self:_clamped(key27, offset6 + v380.X, position17.Y.Offset + v380.Y), "Follow"
          )
        end)
      end)
    end

    function index5:_overControl(p168)
      if self.Search.Open then
        return true
      end

      if self.OpenDropdown and f34(self.OpenDropdown.Panel, p168) then
        return true
      end

      if self.ActivePopup and f34(self.ActivePopup.Frame, p168) then
        return true
      end

      if f34(self.SearchButton, p168) then
        return true
      end

      for _, v381 in self.ResizeHandles do
        if f34(v381, p168) then
          return true
        end
      end

-- https://leakd.fr
      for _, v382 in self.Tabs do
        if f34(v382.Button, p168) then
          return true
        end
      end

      if self.CurrentTab then
        for _, v383 in self.CurrentTab.Columns do
          if f34(v383.Scroll, p168) then
            for _, v384 in v383.Sections do
              if f34(v384.Root, p168) then
                return true
              end
            end
          end
        end
      end

      return false
    end

    function index5:_popupFrame(p169, p170)
      local instance52 = getInstance2("Frame", {
        Size = fromOffset(p169, p170),
        Visible = false,
        Active = true,
      }, self.Popups)

      local instance53 = getInstance2("TextButton", {
        Bg = "Background",
        Size = new2(1, 0, 1, 0),
        Radius = metrics.PopupRadius,
        Border = "Outline",
      }, instance52)

      makeShadow(instance53, "Large")
      local v385 = {}

      self:_makeDraggable(instance53, instance52, function(p171)
        for _, v386 in v385 do
          if f34(v386, p171, 6) then
            return false
          end
        end

        return true
      end)

      return instance52, instance53, v385
    end

    function index5:_buildKeybindMenu()
      local pad5 = metrics.Pad
      local gap = metrics.Gap
      local inputH = metrics.InputH
      local v389 = 202 - pad5 * 2
      local v390 = (v389 - gap) / 2
      local frame5, v391, list9 = self:_popupFrame(202, pad5 * 2 + inputH * 2 + gap)
      local keybindMenu2 = { Frame = frame5, Fader = f41(frame5), Target = nil }

      local instance54 = getInstance2("Frame", {
        Bg = "Accent",
        Size = fromOffset(v390 - 2, inputH - 2),
        Position = fromOffset(pad5 + v390 + gap + 1, pad5 + 1),
        Radius = metrics.Radius,
        Border = "Outline",
      }, v391)

      makeGradient(instance54)

      local instance55 = getInstance2("TextButton", {
        Position = fromOffset(pad5, pad5),
        Size = fromOffset(v390, inputH),
        ZIndex = 2,
      }, v391)

      f28(instance55, v390, { Text = "On Toggle", RowH = inputH })

      local instance56 = getInstance2("TextButton", {
        Position = fromOffset(pad5 + v390 + gap, pad5),
        Size = fromOffset(v390, inputH),
        ZIndex = 2,
      }, v391)

      f28(instance56, v390, { Text = "On Hold", RowH = inputH })

      local instance57 = getInstance2("TextButton", {
        Position = fromOffset(pad5 + 1, pad5 + inputH + gap + 1),
        Size = fromOffset(v389 - 2, inputH - 2),
        Radius = metrics.Radius,
        Border = "Outline",
        BackgroundTransparency = 0,
      }, v391)

      f47(instance57, "Element")
      makeGradient(instance57)

      table.insert(list9, instance55)
      table.insert(list9, instance56)
      table.insert(list9, instance57)

      local v392 = floor2(v389 / 2)
      f46(instance57, "reset", 14, "Text", "Element", { Position = fromOffset(v392 - 32, 5) })

      f27(instance57, {
        Text = "Reset",
        X = v392 - 12,
        RowH = inputH - 2,
        W = 50,
      })

      function keybindMenu2.Paint(p172)
        local target4 = keybindMenu2.Target

        if not target4 then
          return
        end

        f16(
          instance54, "Position",
          fromOffset((target4.Mode == "Hold" and pad5 + v390 + gap or pad5) + 1, pad5 + 1),
          p172, "Knob"
        )
      end

      instance55.MouseButton1Click:Connect(function()
        if keybindMenu2.Target then
          keybindMenu2.Target.Mode = "Toggle"
          keybindMenu2.Paint(true)
        end
      end)

      instance56.MouseButton1Click:Connect(function()
        if keybindMenu2.Target then
          keybindMenu2.Target.Mode = "Hold"
          keybindMenu2.Paint(true)
        end
      end)

      instance57.MouseButton1Click:Connect(function()
        if keybindMenu2.Target then
          keybindMenu2.Target:Set(nil)
        end

        self:ClosePopup()
      end)

      self.KeybindMenu = keybindMenu2
    end

    function index5:_buildPicker()
      local pad6 = metrics.Pad
      local gap2 = metrics.Gap
      local v395 = 216 - pad6 * 3 - 12
      local v396 = pad6 + 168 + pad6
      local y8 = v396 + 12 + pad6
      local v397 = y8 + metrics.Row + gap2
      local frame6, v399, list10 = self:_popupFrame(216, v397 + metrics.InputH + pad6)

      local picker2 = {
        Frame = frame6,
        Fader = f41(frame6),
        Target = nil,
        H = 0,
        S = 0,
        V = 1,
        Alpha = 0,
        Dragging = false,
      }

      local instance58 = getInstance2("Frame", {
        BackgroundTransparency = 0,
        Position = fromOffset(pad6 + 1, pad6 + 1),
        Size = fromOffset(v395 - 2, 166),
        Radius = metrics.Radius,
        Border = "Outline",
      }, v399)

      local color4 = Color3.new(1, 1, 1)
      local size7 = new2(1, 0, 1, 0)

      local instance59 = getInstance2("Frame", {
        BackgroundTransparency = 0,
        BackgroundColor3 = color4,
        Size = size7,
        Radius = metrics.Radius,
      }, instance58)

      getInstance2("UIGradient", { Transparency = NumberSequence.new(0, 1) }, instance59)
      local color5 = Color3.new(0, 0, 0)
      local size8 = new2(1, 0, 1, 0)

      local instance60 = getInstance2("Frame", {
        BackgroundTransparency = 0,
        BackgroundColor3 = color5,
        Size = size8,
        Radius = metrics.Radius,
      }, instance58)

      getInstance2(
        "UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0) }, instance60
      )

      local function f96(p173)
        local pickerKnob = metrics.PickerKnob

        local instance61 = getInstance2("Frame", {
          Name = "Knob",
          BackgroundTransparency = 0,
          AnchorPoint = new(0.5, 0.5),
          Size = fromOffset(pickerKnob, pickerKnob),
          Radius = 99,
          ZIndex = 3,
        }, p173)

        f22(getInstance2("UIStroke", { Thickness = 2 }, instance61), "Color", "Text")
        makeShadow(instance61, "PickerKnob")
        return instance61
      end

      local v402 = f96(instance58)
      picker2.SVKnob = v402
      local v403 = (metrics.PickerKnob + 4) / 2 - 1

      local function f97(p174)
        return round(v403 - v403 * 2 * p174)
      end

      local function f98(p175, p176, p177)
        return getClamped((p175 - p176 - v403) / (p177 - v403 * 2))
      end

      local instance62 = getInstance2("Frame", {
        BackgroundTransparency = 0,
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = fromOffset(pad6 * 2 + v395 + 1, pad6 + 1),
        Size = fromOffset(10, 166),
        Radius = metrics.Radius,
        Border = "Outline",
      }, v399)

      local list11 = {}

      for i8 = 0, 6 do
        table.insert(
          list11, ColorSequenceKeypoint.new(i8 / 6, Color3.fromHSV(i8 / 6 % 1, 1, 1))
        )
      end

      getInstance2(
        "UIGradient", { Rotation = 90, Color = ColorSequence.new(list11) }, instance62
      )

      local v404 = f96(instance62)

      local instance63 = getInstance2("Frame", {
        Bg = "Background",
        Position = fromOffset(pad6 + 1, v396 + 1),
        Size = fromOffset(216 - pad6 * 2 - 2, 10),
        Radius = metrics.Radius,
        Border = "Outline",
      }, v399)

      local instance64 = getInstance2("CanvasGroup", {
        Name = "AlphaClip",
        BackgroundTransparency = 0,
        BackgroundColor3 = Color3.new(1, 1, 1),
        Size = new2(1, 0, 1, 0),
        Radius = metrics.Radius,
      }, instance63)

      for i9 = 0, 48 do
        for i10 = 0, 2 do
          if (i9 + i10) % 2 == 1 then
            getInstance2("Frame", {
              BackgroundTransparency = 0,
              BackgroundColor3 = fromRGB(190, 190, 190),
              Position = fromOffset(i9 * 4, i10 * 4),
              Size = fromOffset(4, 4),
            }, instance64)
          end
        end
      end

      local instance65 = getInstance2(
        "Frame", { BackgroundTransparency = 0, Size = new2(1, 0, 1, 0) }, instance64
      )

      getInstance2("UIGradient", { Transparency = NumberSequence.new(0, 1) }, instance65)
      local v405 = f96(instance63)
      f27(v399, { Text = "Animations", X = pad6, Y = y8 })

      local instance66 = getInstance2("Frame", {
        Position = fromOffset(pad6, v397),
        Size = fromOffset(216 - pad6 * 2, metrics.InputH),
      }, v399)

      for _, v406 in { instance58, instance62, instance63, instance66 } do
        table.insert(list10, v406)
      end

      local f99

      local function f100()
        f99()

        if picker2.Target then
          local target5 = picker2.Target
          local fromHSV = Color3.fromHSV
          local h = picker2.H
          local s = picker2.S
          target5:Set(fromHSV(h, s, picker2.V), picker2.Alpha)
        end
      end

      function f99()
        local color6 = Color3.fromHSV(picker2.H, picker2.S, picker2.V)
        local color7 = Color3.fromHSV(picker2.H, 1, 1)
        instance58.BackgroundColor3 = color7

        v402.BackgroundColor3 = color6
        v402.Position = new2(picker2.S, f97(picker2.S), 1 - picker2.V, f97(1 - picker2.V))

        v404.Position = new2(0.5, 0, picker2.H, f97(picker2.H))
        v404.BackgroundColor3 = color7

        instance65.BackgroundColor3 = color6

        v405.Position = new2(picker2.Alpha, f97(picker2.Alpha), 0.5, 0)
        v405.BackgroundColor3 = color6
      end

      function picker2.Sync()
        local target6 = picker2.Target

        if not target6 then
          return
        end

        local h2, s2, v407 = target6.Value:ToHSV()

        if s2 > 0 and v407 > 0 then
          picker2.H = h2
        end

        local alpha2 = target6.Alpha

        picker2.S = s2
        picker2.V = v407
        picker2.Alpha = alpha2 or 0

        f99()

        if picker2.Animation then
          picker2.Animation:Set(target6.Animation or "None", true)
        end
      end

      local function f101(p178, _, p179)
        local position18 = fromOffset(-6, -6)
        local size9 = new2(1, 12, 1, 12)

        local instance67 = getInstance2(
          "TextButton", { Position = position18, Size = size9, ZIndex = 5 }, p178
        )

        instance67.InputBegan:Connect(function(input8)
          if not f31(input8) then
            return
          end

          picker2.Dragging = true
          p179(f32())
          f35(p179, function() picker2.Dragging = false end)
        end)
      end

      f101(instance58, v402, function(p180)
        picker2.S = f98(p180.X, instance58.AbsolutePosition.X, instance58.AbsoluteSize.X)
        picker2.V = 1 - f98(p180.Y, instance58.AbsolutePosition.Y, instance58.AbsoluteSize.Y)
        f100()
      end)

      f101(instance62, v404, function(p181)
        picker2.H = math.min(f98(
          p181.Y, instance62.AbsolutePosition.Y, instance62.AbsoluteSize.Y
        ), 0.9999)

        f100()
      end)

      f101(instance63, v405, function(p182)
        picker2.Alpha = f98(p182.X, instance63.AbsolutePosition.X, instance63.AbsoluteSize.X)
        f100()
      end)

      self.Picker = picker2

      picker2.Animation = getOpenDropdown(self, instance66, {
        Options = { "None", "Rainbow", "Pulse" },
        Default = "None",
        MaxRows = 3,
        Callback = function(value7)
          if picker2.Target then
            picker2.Target.Animation = value7
          end
        end,
      })

      function picker2.OnClose()
        picker2.Animation:Toggle(false)
      end
    end

    function index5:_buildSearch()
      local pad7 = metrics.Pad
      local color8 = Color3.new(0, 0, 0)
      local size10 = new2(1, 0, 1, 0)
      local windowRadius = metrics.WindowRadius

      local instance68 = getInstance2("TextButton", {
        BackgroundTransparency = 0.45,
        BackgroundColor3 = color8,
        Size = size10,
        Visible = false,
        ZIndex = 20,
        Radius = windowRadius,
      }, self.Root)

      local instance69 = getInstance2("TextButton", {
        Bg = "Background",
        Position = self:_modalPosition(0),
        Size = fromOffset(420, 340),
        Radius = metrics.WindowRadius,
        Border = "Outline",
      }, instance68)

      local v428 = f27(instance69, {
        Text = "Search",
        TextSize = 14,
        Weight = Enum.FontWeight.SemiBold,
        X = pad7 * 2,
        Y = pad7 + 2,
        RowH = 20,
      })

      local instance70 = getInstance2("Frame", {
        Bg = "Inline",
        Position = fromOffset(pad7 * 2 + 1, 43),
        Size = fromOffset(420 - pad7 * 4 - 2, 34),
        Radius = metrics.PillRadius,
        Border = "Outline",
      }, instance69)

      f46(instance70, "search", 14, "InactiveText", "Inline", { Position = fromOffset(10, 10) })

      local instance71 = getInstance2("TextBox", {
        Fg = "Text",
        PlaceholderText = "Type to search...",
        Position = fromOffset(34, getRounded(34, 13)),
        Size = new2(1, -45, 0, 20),
        ClearTextOnFocus = false,
      }, instance70)

      f22(instance71, "PlaceholderColor3", "InactiveText")

      local instance72 = getInstance2("ScrollingFrame", {
        Position = fromOffset(pad7 * 2, 88),
        Size = fromOffset(420 - pad7 * 4 + 6, 252 - pad7),
        CanvasSize = fromOffset(0, 0),
        ScrollBarThickness = 2,
        ScrollBarImageTransparency = 0,
      }, instance69)

      f22(instance72, "ScrollBarImageColor3", "Accent")

      local v429 = f28(instance69, 420, { Fg = "InactiveText", Text = "No results", Y = 170 })
      v429.Visible = false

      local search3 = {
        Overlay = instance68,
        Modal = instance69,
        Fader = f41(instance68),
        Open = false,
        Rows = {},
        Dirty = false,
        Box = instance71,
        Order = {},
      }

      local function f102(p183)
        self:CloseSearch()
        local section = p183.Section or p183
        self:SelectTab(section.Tab)

        section.Column
          :ScrollTo(section.Y + (p183.Section and section.HeaderH + p183.Y or 0) - 40)

        local instance73

        if p183.Frame then
          instance73 = getInstance2("Frame", {
            Bg = "Accent",
            BackgroundTransparency = 0.7,
            Position = fromOffset(-6, -3),
            Size = new2(1, 12, 1, 6),
            Radius = metrics.Radius,
            ZIndex = 0,
          }, p183.Frame)

          task.delay(0.2, function()
            f14(instance73, "BackgroundTransparency", 1, "Soft", {
              Done = function() instance73:Destroy() end,
            })
          end)
        end
      end

      local function f103(p184)
        p184.Retired = true
        p184.Frame:Destroy()
      end

      local function f104(p185, text11, text12, y9)
        local instance74 = getInstance2("TextButton", {
          Bg = "HoveredElement",
          BackgroundTransparency = 1,
          Position = fromOffset(10, y9),
          Size = fromOffset(420 - pad7 * 4, 44),
          Radius = metrics.Radius,
        }, instance72)

        seen3[instance74] = true

        local v430 = {
          Frame = instance74,
          Y = y9,
          Retired = false,
          Bar = getInstance2("Frame", {
            Bg = "Accent",
            BackgroundTransparency = 1,
            Position = fromOffset(4, 8),
            Size = fromOffset(3, 28),
            Radius = metrics.SmallRadius,
          }, instance74),
          Name = f27(instance74, {
            Text = text11,
            TextSize = 13,
            X = 14,
            Y = 5,
            RowH = 18,
            TextTransparency = 1,
            Right = 10,
            Truncate = Enum.TextTruncate.AtEnd,
          }),
          Sub = f27(instance74, {
            Fg = "InactiveText",
            Text = text12,
            TextSize = 11,
            X = 14,
            Y = 22,
            RowH = 16,
            TextTransparency = 1,
            Right = 10,
            Truncate = Enum.TextTruncate.AtEnd,
          }),
        }

        f39(
          instance74, function() f14(instance74, "BackgroundTransparency", 0.4, "Fast") end,
          function() f14(instance74, "BackgroundTransparency", 1, "Fast") end
        )

        instance74.MouseButton1Click:Connect(function() f102(p185) end)
        return v430
      end

      local function f105()
        local text13 = instance71.Text

        f25(v428, text13 ~= "" and text13 or "Search")
        f25(self.SearchLabel, text13 ~= "" and text13 or "Search...")

        local seen5 = {}
        local order = {}

        if text13 ~= "" then
          local lower = string.lower(text13)

          local function f106(key28, name5, p186)
            if #order < 30 and name5 and string.find(string.lower(name5), lower, 1, true) then
              seen5[key28] = true
              table.insert(order, { key28, name5, p186 })
            end
          end

          for _, v431 in self.Sections do
            f106(v431, v431.Name, v431.Tab.Name .. " / " .. v431.Name .. "  ·  Section")
          end

          for _, v432 in self.Index do
            f106(
              v432, v432.Name,
              v432.Section.Tab.Name .. " / " .. v432.Section.Name .. "  ·  " .. v432.Kind
            )
          end
        end

        for v433, v434 in search3.Rows do
          if not seen5[v433] then
            search3.Rows[v433] = nil
            f103(v434)
          end
        end

        local count = 0

        for v435, v436 in order do
          local v437 = v436[1]
          local v438 = (v435 - 1) * 48
          local v439 = search3.Rows[v437]

          if v439 then
            v439.Y = v438
            f14(v439.Frame, "Position", fromOffset(0, v438), "Smooth")
          else
            v439 = f104(v437, v436[2], v436[3], v438)
            search3.Rows[v437] = v439
            count = count + 1

            task.delay(math.min(count, 8) * 0.025, function()
              if v439.Retired then
                return
              end

              f14(v439.Frame, "Position", fromOffset(0, v439.Y), "Smooth")
              f14(v439.Bar, "BackgroundTransparency", 0, "Smooth")
              f14(v439.Name, "TextTransparency", 0, "Smooth")
              f14(v439.Sub, "TextTransparency", 0, "Smooth")
            end)
          end
        end

        instance72.CanvasSize = fromOffset(0, #order * 48)
        search3.Order = order
        v429.Visible = text13 ~= "" and #order == 0
      end

      instance71:GetPropertyChangedSignal("Text"):Connect(function() search3.Dirty = true end)

      instance71.FocusLost:Connect(function(p187)
        local keyCode = Enum.KeyCode

        if userInputService2:IsKeyDown(keyCode.Escape) then
          self:CloseSearch()
        elseif p187 then
          if search3.Dirty then
            search3.Dirty = false
            f105()
          end

          if search3.Order[1] then
            f102(search3.Order[1][1])
          end
        end
      end)

      instance68.MouseButton1Click:Connect(function() self:CloseSearch() end)
      search3.Sync = f105
      self.Search = search3
    end

    function index5:OpenSearch()
      local search4 = self.Search

      if search4.Open then
        return
      end

      search4.Open = true
      self:CloseFloating()
      search4.Modal.Position = self:_modalPosition(10)
      f14(search4.Modal, "Position", self:_modalPosition(0), "Smooth")

      search4.Fader:Show()
      search4.Box:CaptureFocus()
    end

    function index5:CloseSearch()
      local search5 = self.Search

      if not search5.Open then
        return
      end

      search5.Open = false
      search5.Box:ReleaseFocus()

      f14(search5.Modal, "Position", self:_modalPosition(7), "Fast")
      search5.Fader:Hide()
    end

    function index5:SetVisible(p188)
      if self.Visible == p188 then
        return
      end

      self.Visible = p188
      self:CloseFloating()
      self.ModalButton.Visible = p188

      if not self.Scale.Parent then
        if not p188 then
          self.Scale.Scale = 1
        end

        self.Scale.Parent = self.Holder
      end

      if p188 then
        f14(self.Scale, "Scale", 1, "Smooth", {
          Done = function()
            if self.Visible then
              self.Scale.Parent = nil
            end
          end,
        })

        self.Fader:Show()
      else
        f14(self.Scale, "Scale", 0.97, "Fast")
        self.Fader:Hide()
      end
    end

    function index5:Toggle()
      self:SetVisible(not self.Visible)
    end

    local v443 = {}

    local function f107(p189)
      return "Blossom/" .. p189 .. ".json"
    end

    function index5:_serialize()
      local v444 = {}

      for v445, v446 in self.Flags do
        local value8 = v446.Value

        if v446.Swatch then
          value8 = { Color = v446.Value:ToHex(), Alpha = v446.Alpha }
        elseif v446.Chip then
          value8 = { Key = v446.Key and v446.Key.Name or false, Mode = v446.Mode }
        elseif v446.Multi then
          local list12 = {}

          for v447, v448 in v446.Value do
            if v448 then
              table.insert(list12, v447)
            end
          end

          value8 = list12
        end

        if value8 ~= nil then
          v444[v445] = value8
        end
      end

      return httpService:JSONEncode(v444)
    end

    function index5:_deserialize(p190)
      for v449, v450 in httpService:JSONDecode(p190), nil, nil do
        local v451 = self.Flags[v449]

        if v451 then
          if v451.Swatch then
            local fromHex = Color3.fromHex
            v451:Set(fromHex(v450.Color), v450.Alpha)
          elseif v451.Chip then
            v451.Mode = v450.Mode or v451.Mode
            local v452

            if v450.Key then
              v452 = string.find(v450.Key, "MouseButton", 1, true)
                  and Enum.UserInputType[v450.Key]
                or Enum.KeyCode[v450.Key]
            end

            v451:Set(v452)
          else
            v451:Set(v450)
          end
        end
      end
    end

    function index5:ListConfigs()
      local list13 = {}

      if typeof(listfiles) == "function" and typeof(isfolder) == "function"
        and isfolder("Blossom") then
        for _, v453 in listfiles("Blossom") do
          local match = string.match(v453, "([^/\\]+)%.json$")

          if match then
            table.insert(list13, match)
          end
        end
      else
        for v454 in v443 do
          table.insert(list13, v454)
        end
      end

      table.sort(list13)
      return list13
    end

    function index5:SaveConfig(key29)
      local serialize = self:_serialize()

      if typeof(writefile) == "function" then
        if typeof(isfolder) == "function" and not isfolder("Blossom") then
          makefolder("Blossom")
        end

        writefile(f107(key29), serialize)
      else
        v443[key29] = serialize
      end
    end

    function index5:LoadConfig(key30)
      local v455 = typeof(readfile) == "function" and typeof(isfile) == "function"
        and isfile(f107(key30))

      local v456

      if v455 then
        v456 = readfile(f107(key30))
      else
        v456 = v443[key30]
      end

      if v456 then
        self:_deserialize(v456)
        return true
      end

      return false
    end

    function index5:DeleteConfig(key31)
      if typeof(delfile) == "function" and typeof(isfile) == "function" and isfile(f107(key31)) then
        delfile(f107(key31))
      end

      v443[key31] = nil
    end

    local v457

    local function f108()
      if typeof(readfile) == "function" and typeof(isfile) == "function" then
        return isfile("Blossom/autoload.txt") and readfile("Blossom/autoload.txt") or nil
      end

      return v457
    end

    local function f109(p191)
      if typeof(writefile) ~= "function" then
        v457 = p191
      elseif p191 then
        if typeof(isfolder) == "function" and not isfolder("Blossom") then
          makefolder("Blossom")
        end

        writefile("Blossom/autoload.txt", p191)
      elseif typeof(delfile) == "function" and isfile("Blossom/autoload.txt") then
        delfile("Blossom/autoload.txt")
      end
    end

    function index5.BuildSettings(p192, p193)
      local v458 = f108()
      local v459 = v458 ~= nil
      local config = v458

      local profilesSection = p193:Section({ Name = "Profiles", Icon = "cube", Side = 1 })
      profilesSection:Label({ Name = "Configs" })

      local listConfigs = p192:ListConfigs()
      local v466

      local listbox = profilesSection:Listbox({
        Height = 177,
        Empty = "No configs yet",
        Options = listConfigs,
        Callback = function(value9) v466 = value9 end,
      })

      local textbox = profilesSection:Textbox({ Placeholder = "Config name", NoSave = true })
      local configDropdown

      local function f110()
        local listConfigs2 = p192:ListConfigs()
        listbox:SetOptions(listConfigs2)
        configDropdown:SetOptions(listConfigs2)
      end

      profilesSection:Button({
        Name = "Create",
        Callback = function()
          local text14 = textbox.Instance.Text

          if text14 == "" then
            p192:Notify({ Text = "Enter a config name first." })
            return
          end

          p192:SaveConfig(text14)
          f110()
          p192:Notify(('Created "%s".'):format(text14))
        end,
      })

      profilesSection:Button({
        Name = "Load",
        Callback = function()
          if v466 and p192:LoadConfig(v466) then
            p192:Notify(('Loaded "%s".'):format(v466))
          end
        end,
      })

      profilesSection:Button({
        Name = "Delete",
        Callback = function()
          if v466 then
            p192:DeleteConfig(v466)
            p192:Notify(('Deleted "%s".'):format(v466))

            v466 = nil
            f110()
          end
        end,
      })

      profilesSection:Button({
        Name = "Overwrite",
        Callback = function()
          if v466 then
            p192:SaveConfig(v466)
            p192:Notify(('Overwrote "%s".'):format(v466))
          end
        end,
      })

      local function f111()
        f109(v459 and config or nil)
      end

      local autoloadSection = p193:Section({ Name = "Autoload", Icon = "cube", Side = 1 })
      local default2 = v459

      autoloadSection:Toggle({
        Name = "Load on start",
        Default = default2,
        NoSave = true,
        Callback = function(value10)
          v459 = value10
          f111()
        end,
      })

      local listConfigs3 = p192:ListConfigs()

      configDropdown = autoloadSection:Dropdown({
        Name = "Config",
        Options = listConfigs3,
        Default = v458,
        Empty = "No configs yet",
        NoSave = true,
        Callback = function(value11)
          config = value11
          f111()
        end,
      })

      local themingSection = p193:Section({ Name = "Theming", Icon = "cube", Side = 2 })

      themingSection:Dropdown({
        Name = "Theme",
        Options = v43,
        Default = p192.ThemeName,
        MaxRows = 11,
        NoSave = true,
        Callback = function(value12) p192:ApplyTheme(value12) end,
      })

      themingSection:Dropdown({
        Name = "Casing",
        Options = options,
        Default = "Normal",
        NoSave = true,
        Callback = function(value13) p192:SetCasing(value13) end,
      })

      themingSection:Divider()

      for _, v467 in v44 do
        local v468 = v467[2]
        local name6 = v467[1]
        local default3 = copy[v468]

        local colorpicker = themingSection:Colorpicker({
          Name = name6,
          Default = default3,
          NoSave = true,
          Callback = function(value14) p192:SetThemeColor(v468, value14) end,
        })

        table.insert(p192.ThemeRows, { Key = v468, Color = colorpicker })
      end

      local menuSection = p193:Section({ Name = "Menu", Icon = "cube", Side = 2 })

      local menuKeyKeybind = menuSection:Keybind({
        Name = "Menu Key",
        Default = p192.MenuKey,
        NoSave = true,
      })

      function menuKeyKeybind.OnKeyChanged()
        p192.MenuKey = menuKeyKeybind.Key
      end

      menuSection:Toggle({
        Name = "Watermark",
        Default = true,
        NoSave = true,
        Callback = function(value15) p192.Watermark.Visible = value15 end,
      })

      menuSection:Toggle({
        Name = "Hotkey List",
        Default = true,
        NoSave = true,
        Callback = function(value16) p192.Hotkeys.Visible = value16 end,
      })

      menuSection:Dropdown({
        Name = "Font",
        Options = options2,
        Default = "Inter",
        NoSave = true,
        Callback = function(value17) p192:SetFont(value17) end,
      })

      local v469 = semiBold
      local name7 = v469.Name

      menuSection:Dropdown({
        Name = "Text Weight",
        Options = options3,
        Default = name7,
        NoSave = true,
        Callback = function(value18) p192:SetTextWeight(value18) end,
      })

      if v458 then
        task.defer(function()
          if p192:LoadConfig(v458) then
            p192:Notify(('Autoloaded "%s".'):format(v458))
          end
        end)
      end
    end

    function index5:_buildWatermark(p194)
      local localPlayer2 = players.LocalPlayer

      local instance75 = getInstance2("Frame", {
        Bg = "Background",
        Size = fromOffset(298, 28),
        Radius = metrics.FloatRadius,
        Border = "Outline",
        Active = true,
      }, self.Screen)

      f46(instance75, "logo", 16, "Accent", "Background", { Position = fromOffset(8, 6) })

      local function f112(text15, textSize3, weight2)
        return f27(instance75, {
          Text = text15,
          TextSize = textSize3,
          Weight = weight2,
          RowH = 28,
          W = 10,
        })
      end

      local function f113()
        return getInstance2("Frame", {
          Bg = "Outline",
          Position = fromOffset(0, 7),
          Size = fromOffset(1, 14),
        }, instance75)
      end

      local v470 = f112(p194.Script or "blossom.lua", 12, Enum.FontWeight.Medium)
      local v471 = f113()
      local v472 = f112(p194.Build or "release", 12, Enum.FontWeight.SemiBold)
      local v473 = f113()
      local v474 = f46(instance75, "user", 13, "Text", "Background")
      local displayName = localPlayer2.DisplayName

      local v475 = f112(
        ("%s (@%s)"):format(displayName, localPlayer2.Name), 11, Enum.FontWeight.SemiBold
      )

      local function f114()
        local v476 = 31

        for _, v477 in { { v470, v471 }, { v472, v473 } } do
          local rounded3 = math.ceil(v477[1].TextBounds.X)

          v477[1].Size = fromOffset(rounded3 + 1, 28)
          v477[1].Position = fromOffset(v476, v477[1].Position.Y.Offset)

          local v478 = v476 + (rounded3 + 8)
          v477[2].Position = fromOffset(v478, 7)
          v476 = v478 + 9
        end

        v474.Root.Position = fromOffset(v476, 7)
        local v479 = v476 + 20
        local rounded4 = math.ceil(v475.TextBounds.X)

        v475.Size = fromOffset(rounded4 + 1, 28)
        v475.Position = fromOffset(v479, v475.Position.Y.Offset)

        instance75.Size = fromOffset(v479 + rounded4 + metrics.Pad, 28)
        self:_placeOverlays()
      end

      for _, v480 in { v470, v472, v475 } do
        v480:GetPropertyChangedSignal("TextBounds"):Connect(f114)
      end

      self.Watermark = instance75
      self.WatermarkLayout = f114
      self:_makeDraggable(instance75, instance75)
    end

    function index5:_buildHotkeys()
      local instance76 = getInstance2("Frame", { Size = fromOffset(200, 300) }, self.Screen)

      local instance77 = getInstance2("Frame", {
        Bg = "Background",
        Position = fromOffset(1, 1),
        Size = fromOffset(88, 25),
        Radius = metrics.FloatRadius,
        Border = "Outline",
        Active = true,
      }, instance76)

      f46(instance77, "key", 14, "Accent", "Background", { Position = fromOffset(9, 5) })

      local v481 = f27(instance77, {
        Text = "Hotkeys",
        TextSize = 12,
        Weight = Enum.FontWeight.SemiBold,
        X = 31,
        RowH = 25,
      })

      local function f115()
        instance77.Size = fromOffset(math.ceil(v481.TextBounds.X) + 41, 25)
      end

      v481:GetPropertyChangedSignal("TextBounds"):Connect(f115)
      f115()

      self.Hotkeys = instance76
      self:_makeDraggable(instance77, instance76)
    end

    function index5:_placeOverlays()
      local absoluteSize11 = self.Screen.AbsoluteSize

      if absoluteSize11.X <= 0 then
        return
      end

      if not self.Moved[self.Holder] then
        self.Holder.Position = fromOffset(
          floor2(absoluteSize11.X / 2), floor2(absoluteSize11.Y / 2)
        )
      end

      if self.Watermark and not self.Moved[self.Watermark] then
        self.Watermark.Position = fromOffset(floor2((absoluteSize11.X
            - self.Watermark.Size.X.Offset)
          / 2), absoluteSize11.Y - 44)
      end

      if self.Hotkeys and not self.Moved[self.Hotkeys] then
        self.Hotkeys.Position = fromOffset(14, floor2((absoluteSize11.Y - 300) / 2))
      end
    end

    function index5:Destroy()
      for _, v482 in self.Connections do
        v482:Disconnect()
      end

      table.clear(seen)
      table.clear(v108)

      for _, v483 in list3 do
        v483.Dead = true
      end

      table.clear(list3)
      table.clear(v47)

      if connect then
        connect:Disconnect()
        connect = nil
      end

      if v109 == self then
        v109 = nil
      end

      if v103 == self.Screen then
        v103 = nil
      end

      self.Screen:Destroy()
    end

    local v484 = {
      Themes = themes,
      ThemeOrder = v43,
      Metrics = metrics,
      Fonts = fonts,
    }

    function v484.new(p195)
      local v485 = p195 or {}
      local v486 = typeof(getgenv) == "function" and getgenv() or nil

      if v485.Theme and themes[v485.Theme] then
        for v487, v488 in themes[v485.Theme] do
          copy[v487] = v488
        end
      end

      if v485.Font then
        font = fonts[v485.Font] or v485.Font
      end

      local minSize = v485.MinSize

      local v489 = minSize
      v489 = minSize or new(metrics.MinWindowW, metrics.MinWindowH)

      local v490 = new(v489.X - v489.X % 2, v489.Y - v489.Y % 2)
      local size11 = v485.Size

      local v491 = size11
      v491 = size11 or new(metrics.WindowW, metrics.WindowH)

      local width4 = f93(v491.X, v490.X, math.huge)
      local height6 = f93(v491.Y, v490.Y, math.huge)
      local v492 = setmetatable
      local columnW3 = (width4 - metrics.ContentX - metrics.Pad * 3) / 2
      local resizeJobs = {}
      local resizeHandles = {}
      local title = v485.Title or "Blossom"
      local tabs = {}
      local sections = {}
      local columns = {}
      local index9 = {}
      local binds = {}
      local flags = {}
      local themeRows = {}
      local colors = {}
      local hotkeyEntries = {}
      local hotkeyOrder = {}
      local notifyStack = {}

      local v493 = v492({
        Width = width4,
        Height = height6,
        MinSize = v490,
        ColumnW = columnW3,
        ResizeJobs = resizeJobs,
        ResizeHandles = resizeHandles,
        Title = title,
        Tabs = tabs,
        Sections = sections,
        Columns = columns,
        Index = index9,
        Binds = binds,
        Colors = colors,
        Flags = flags,
        ThemeRows = themeRows,
        HotkeyEntries = hotkeyEntries,
        HotkeyOrder = hotkeyOrder,
        NotifyStack = notifyStack,
        Connections = {},
        Jobs = {},
        Moved = {},
        PendingThemeKeys = {},
        FlagOwners = {},
        ThemeClock = 0,
        SidebarY = metrics.FirstCategory,
        SidebarHasTabs = false,
        SidebarAfterCategory = false,
        Visible = true,
        ThemeName = v485.Theme or "Blossom",
        MenuKey = v485.MenuKey or Enum.KeyCode.RightShift,
        LastPopupTime = 0,
        DropdownClosedAt = 0,
      }, index5)

      f19()
      v109 = v493

      if v486 then
        v486.__BlossomWindow = v493
      end

      local instance78 = getInstance2("ScreenGui", {
        Name = "Blossom",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 100,
      })

      f87(instance78)
      v493.Screen = instance78
      v103 = instance78

      local instance79 = getInstance2("Frame", {
        Name = "Window",
        AnchorPoint = new(0.5, 0.5),
        Size = fromOffset(v493.Width, v493.Height),
        ZIndex = 10,
      }, instance78)

      v493.Holder = instance79
      v493.Scale = getInstance2("UIScale", { Scale = 0.97 })

      local instance80 = getInstance2("Frame", {
        Bg = "Background",
        Active = true,
        Size = new2(1, 0, 1, 0),
        Radius = metrics.WindowRadius,
        Border = "Outline",
      }, instance79)

      makeShadow(instance80, "Large")

      v493.Root = instance80
      v493.Fader = f41(instance79)

      v493.ModalButton = getInstance2(
        "TextButton", { Modal = true, Size = fromOffset(1, 1) }, instance79
      )

      local instance81 = getInstance2(
        "Frame", { Size = new2(0, metrics.SidebarW, 1, 0) }, instance80
      )

      v493.Sidebar = instance81

      f46(instance81, "logo", 20, "Accent", "Background", {
        Position = fromOffset(metrics.Pad * 2, 15),
      })

      f27(instance81, {
        Text = v493.Title,
        TextSize = 16,
        Weight = Enum.FontWeight.Bold,
        X = 51,
        Y = 11,
        RowH = 28,
        W = 85,
      })

      v493.Indicator = getInstance2("Frame", {
        Bg = "Inline",
        Size = fromOffset(metrics.TabW - 2, metrics.TabH - 2),
        Radius = metrics.PillRadius,
        Border = "Outline",
        Visible = false,
      }, instance81)

      local instance82 = getInstance2("TextButton", {
        Position = new2(0, metrics.Pad + 1, 1, -(metrics.Pad + metrics.SearchH) + 1),
        Size = fromOffset(metrics.TabW - 2, metrics.SearchH - 2),
        Radius = metrics.PillRadius,
        Border = "Outline",
        BackgroundTransparency = 0,
      }, instance81)

      f47(instance82, "Inline")
      v493.SearchButton = instance82
      f46(instance82, "search", 14, "InactiveText", "Inline", { Position = fromOffset(6, 6) })

      v493.SearchLabel = f27(instance82, {
        Fg = "InactiveText",
        Text = "Search...",
        X = 30,
        RowH = metrics.SearchH - 2,
        Right = 6,
      })

      instance82.MouseButton1Click:Connect(function() v493:OpenSearch() end)

      getInstance2("Frame", {
        Bg = "Outline",
        Position = fromOffset(metrics.SidebarW, 0),
        Size = new2(0, 1, 1, 0),
      }, instance80)

      local instance83 = getInstance2("Frame", {
        Bg = "Tab",
        Position = fromOffset(metrics.ContentX, 0),
        Size = new2(1, -metrics.ContentX, 1, 0),
        Radius = metrics.WindowRadius,
      }, instance80)

      getInstance2(
        "Frame", { Name = "CornerPatch", Bg = "Tab", Size = new2(0, 12, 1, 0) }, instance83
      )

      v493.Pages = getInstance2("Frame", {
        Name = "Pages",
        Position = fromOffset(0, metrics.Pad),
        Size = new2(1, 0, 1, -metrics.Pad * 2),
        ClipsDescendants = true,
      }, instance83)

      v493.Veil = getInstance2("Frame", {
        Bg = "Tab",
        BackgroundTransparency = 1,
        Size = new2(1, 0, 1, 0),
        ZIndex = 5,
      }, v493.Pages)

      v493.DragLayer = getInstance2(
        "Frame", { Name = "Drag", Size = new2(1, 0, 1, 0), ZIndex = 30 }, instance78
      )

      v493.Popups = getInstance2(
        "Frame", { Name = "Popups", Size = new2(1, 0, 1, 0), ZIndex = 40 }, instance78
      )

      v493.Dropdowns = getInstance2(
        "Frame", { Name = "Dropdowns", Size = new2(1, 0, 1, 0), ZIndex = 45 }, instance78
      )

      v493.Notifications = getInstance2("Frame", {
        Name = "Notifications",
        Position = fromOffset(16, 16),
        Size = fromOffset(400, 600),
        ZIndex = 50,
      }, instance78)

      v493:_buildWatermark(v485)
      v493:_buildHotkeys()
      v493:_buildKeybindMenu()
      v493:_buildPicker()
      v493:_buildSearch()

      if v485.Resizable ~= false then
        v493:_buildResize()
      end

      v493:_placeOverlays()
      v493.WatermarkLayout()

      local insert = table.insert
      local connections = v493.Connections

      insert(connections, instance78:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        v493:_placeOverlays()
      end))

      v493:_makeDraggable(instance80, instance79, function(p196)
        return not v493:_overControl(p196)
      end)

      local insert2 = table.insert

      insert2(v493.Connections, userInputService2.InputBegan:Connect(function(input9, p197)
        if f31(input9) then
          local v494 = f32()
          local openDropdown4 = v493.OpenDropdown
          local v495 = openDropdown4 and f34(openDropdown4.Panel, v494)

          if openDropdown4 and not v495 then
            if f34(openDropdown4.Input, v494) then
              local input10 = openDropdown4.Input
              local v496 = os
              local dropdownClosedAt = v496.clock()

              v493.DropdownClosedBy = input10
              v493.DropdownClosedAt = dropdownClosedAt
            end

            f32(v493())
            v14(f32)
            return
          end

          if v493.ActivePopup and not v495 and not f34(v493.ActivePopup.Frame, v494, 6) then
            v493:ClosePopup()
          end
        end

        local listening4 = v493.Listening

        if listening4 then
          local v497 = input9.UserInputType == Enum.UserInputType.Keyboard

          if v497 or input9.UserInputType == Enum.UserInputType.MouseButton2
            or input9.UserInputType == Enum.UserInputType.MouseButton3 then
            v493.Listening = nil
            listening4.Listening = false

            if v497 and input9.KeyCode == Enum.KeyCode.Escape then
              listening4.Key = nil
            else
              listening4.Key = v497 and input9.KeyCode or input9.UserInputType
            end

            listening4.Refresh()
          elseif f31(input9) then
            v493.Listening = nil
            listening4.Listening = false
            listening4.Refresh()
          end

          return
        end

        if p197 then
          return
        end

        if input9.KeyCode == v493.MenuKey then
          v493:Toggle()
        end

        for _, v498 in v493.Binds do
          if v498.Key and (v498.Key == input9.KeyCode or v498.Key == input9.UserInputType)
            and v498.OnPress then
            v498.OnPress()
          end
        end
      end))

      local insert3 = table.insert

      insert3(v493.Connections, userInputService2.InputEnded:Connect(function(input11)
        for _, v499 in v493.Binds do
          if v499.Key and (v499.Key == input11.KeyCode or v499.Key == input11.UserInputType)
            and v499.OnRelease then
            v499.OnRelease()
          end
        end
      end))

      local insert4 = table.insert

      insert4(v493.Connections, userInputService2.InputChanged:Connect(function(input12)
        if input12.UserInputType ~= Enum.UserInputType.MouseWheel or not v493.Visible
          or v493.Search.Open or not v493.CurrentTab then
          return
        end

        local v500 = f32()
        local openDropdown5 = v493.OpenDropdown

        if openDropdown5 then
          if f34(openDropdown5.Panel, v500) then
            return
          end

          openDropdown5:Toggle(false)
        end

        for _, v501 in v493.CurrentTab.Columns do
          if f34(v501.Scroll, v500) then
            local target7 = v501.Target
            v501:ScrollTo(target7 - input12.Position.Z * 60)
          end
        end
      end))

      local total2 = 0
      local v502 = 0

      local function f116(p198)
        total2 = total2 + p198
        v502 = v502 + p198
        v493:_flushThemeColors(p198)

        if v493.OpenDropdown then
          v493.OpenDropdown.Follow()
        end

        if v493.CurrentTab then
          for _, v503 in v493.CurrentTab.Columns do
            local y10 = v503.Scroll.CanvasPosition.Y
            local v504 = y10 > 1
            local v505 = y10 < v503.ContentH - v503.Scroll.AbsoluteSize.Y - 1

            if v504 ~= v503.ShowTop then
              v503.ShowTop = v504
              f14(v503.FadeTop, "BackgroundTransparency", v504 and 0 or 1, "Fast")
            end

            if v505 ~= v503.ShowBottom then
              v503.ShowBottom = v505
              f14(v503.FadeBottom, "BackgroundTransparency", v505 and 0 or 1, "Fast")
            end
          end
        end

        if v493.Search.Dirty then
          v493.Search.Dirty = false
          v493.Search.Sync()
        end

        if v502 >= 0.033333333333333 then
          v502 = 0

          for _, v506 in v493.Colors do
            if v506.Animation == "Rainbow" then
              local v507 = { v506.Value:ToHSV() }
              local fromHSV2 = Color3.fromHSV
              local v508 = total2
              local highest3 = math.max(v507[2], 0.5)
              v506:Set(fromHSV2(v508 * 0.25 % 1, highest3, math.max(v507[3], 0.6)))
            elseif v506.Animation == "Pulse" then
              local hue, saturation = v506.Value:ToHSV()
              local fromHSV3 = Color3.fromHSV
              v506:Set(fromHSV3(hue, saturation, 0.65 + math.sin(total2 * 4) * 0.35))
            end
          end
        end
      end

      seen[f116] = true
      table.insert(v493.Jobs, f116)
      instance79.Visible = false
      v493.Visible = false
      local watermark = v493.Watermark
      local hotkeys = v493.Hotkeys
      watermark.Visible = false
      hotkeys.Visible = false

      task.defer(function()
        if v493.Screen.Parent == nil then
          return
        end

        v493:SetVisible(true)

        f41(v493.Watermark):Show()
        f41(v493.Hotkeys):Show()
      end)

      return v493
    end

    return v484
  end

  v509 = f10()
  genv = getgenv()

  if genv.__mcsmp_unload then
    pcall(genv.__mcsmp_unload)
  end

  local v510 = game
  players2 = v510:GetService("Players")
  localPlayer3 = players2.LocalPlayer
  currentCamera = workspace.CurrentCamera
end

local mc = localPlayer3.PlayerScripts:WaitForChild("MC")

do
  local v511 = game
  local replicatedStorage = v511:GetService("ReplicatedStorage")
  mc2 = replicatedStorage:WaitForChild("MC")
  v512 = require(mc2.Config)
end

local function getVector(p199, p200, p201)
  return Vector3.new(p200.X, math.clamp(p199.Y, p200.Y + 0.15, p200.Y + p201 - 0.15), p200.Z)
end

v513 = require(mc2.Physics)
v514 = require(mc.World)
v515 = require(mc.Controller)
v516 = require(mc.Input)
v517 = require(mc.Hands)
require(mc.Net)
v518 = require(mc2.Combat)
block = v512.BLOCK
reach = v512.REACH

local function f117(model)
  local v519 = model ~= localPlayer3.Character
  local v520 = v519

  if v519 then
    local alive = model:GetAttribute("Alive")
    local v521 = alive

    if alive then
      local getAttribute = model.GetAttribute
      local v522 = getAttribute(model, "Mode") == localPlayer3:GetAttribute("Mode")
      local v523 = v522 and model:GetAttribute("Gamemode") ~= "spectator"
      v521 = v523
    end

    v520 = v521
  end

  return v520
end

v524 = {}
list14 = {}

local function f118()
  local v525 = v515.state ~= nil
  local v526 = v525

  if v525 then
    local v527 = localPlayer3.Character ~= nil
    local enabled = v527

    if v527 then
      local character = localPlayer3.Character
      enabled = character:GetAttribute("Alive") and not v515.locked and v516.enabled
    end

    v526 = enabled
  end

  return v526
end

do
  local folder = v514.folder
  dummies = folder:WaitForChild("Dummies")
end

local function f119(p202)
  local getPlayerFromCharacter = players2:GetPlayerFromCharacter(p202) or p202
  local health = getPlayerFromCharacter:GetAttribute("Health")
  local getAttribute2 = getPlayerFromCharacter.GetAttribute
  local attribute = getAttribute2(getPlayerFromCharacter, "MaxHealth")
  return health or 0, attribute or 20, getPlayerFromCharacter:GetAttribute("Absorption") or 0
end

local function getDisplayName(targetHud)
  local getPlayerFromCharacter2 = players2:GetPlayerFromCharacter(targetHud)
  return getPlayerFromCharacter2 and getPlayerFromCharacter2.DisplayName or targetHud.Name
end

local rootOFFSET = v512.ROOT_OFFSET

local function getAngle(p203)
  local unit = p203.Unit
  return math.atan2(-unit.X, -unit.Z), math.asin(math.clamp(unit.Y, -1, 1))
end

local height7 = v512.HEIGHT

local function f120(p204, yaw)
  return (p204 - yaw + math.pi) % (2 * math.pi) - math.pi
end

local sneakHEIGHT = v512.SNEAK_HEIGHT
local glideHEIGHT = v512.GLIDE_HEIGHT
local width5 = v512.WIDTH

local function f121()
  local state = v515.state
  return state and state.pos + Vector3.new(0, state.sneaking and 1.27 or 1.62, 0)
end

local function f122()
  local inv = v517.inv
  local v531 = inv.hotbar[inv.selected]
  return v531 and v531.id
end

local function f123()
  local list15 = {}

  for _, v532 in workspace:GetChildren() do
    local model2 = v532:IsA("Model")
    local entityId = model2 and v532:GetAttribute("EntityId")

    if entityId then
      list15[#list15 + 1] = v532
    end
  end

  for _, v533 in dummies:GetChildren() do
    if v533:GetAttribute("EntityId") then
      list15[#list15 + 1] = v533
    end
  end

  return list15
end

local function getVector2(p205, p206, p207, p208)
  local v534 = p208 / 2

  return Vector3.new(
    math.clamp(p205.X, p206.X - v534, p206.X + v534), math.clamp(p205.Y, p206.Y, p206.Y + p207),
    math.clamp(p205.Z, p206.Z - v534, p206.Z + v534)
  )
end

local function f124(targetHud2)
  local primaryPart = targetHud2.PrimaryPart

  if not primaryPart then
    return
  end

  local sizeScale = targetHud2:GetAttribute("SizeScale") or 1

  local boxHeight = targetHud2:GetAttribute("BoxHeight")
    or (targetHud2:GetAttribute("Gliding") or targetHud2:GetAttribute("Spinning"))
      and glideHEIGHT
    or targetHud2:GetAttribute("Sneaking") and sneakHEIGHT
    or height7

  return (primaryPart.Position - Vector3.new(0, rootOFFSET, 0)) / block, boxHeight * sizeScale, (targetHud2:GetAttribute("BoxWidth") or width5) * sizeScale
end

local function getLookVector()
  return CFrame.fromEulerAnglesYXZ(v515.pitch, v515.yaw, 0).LookVector
end

v535 = {
  Enabled = false,
  Players = true,
  Dummies = true,
  MaxDist = 300,
  Box = true,
  BoxMode = "2D",
  BoxColor = Color3.new(1, 1, 1),
  Name = true,
  Health = true,
  Distance = true,
  TagFont = "Minecraft",
  TagSize = 16,
  HealthBar = true,
  HeldItem = true,
  Armor = true,
  Tracers = false,
  TracerFrom = "Bottom",
  TracerColor = Color3.new(1, 1, 1),
  Glow = false,
  GlowColor = Color3.new(1, 1, 1),
  Chams = false,
  ChamColor = Color3.fromRGB(255, 85, 85),
  LowHp = true,
  LowHpAt = 6,
  LowHpColor = Color3.fromRGB(255, 60, 60),
  ReachColor = true,
  InReachColor = Color3.fromRGB(85, 255, 85),
  ReachRing = false,
  Projectiles = false,
  PearlPath = false,
  TargetHud = true,
}

v536 = {
  Aim = false,
  AimHold = true,
  AimFov = 60,
  AimRange = 6,
  AimSpeed = 8,
  Aura = false,
  AuraCooldown = true,
  AuraCps = 10,
  AuraRotate = false,
  Silent = false,
  SilentFov = 90,
  Crit = false,
  Trigger = false,
  NoWeb = false,
  NoSlow = false,
  NoFall = false,
  Pot = false,
  HealAt = 8,
  Smash = false,
  Reach = false,
  ReachValue = 3,
  Velocity = false,
  VelH = 0,
  VelV = 100,
  Totem = false,
  Gapple = false,
  GappleAt = 8,
}

screenGui = Instance.new("ScreenGui")
screenGui.Name = httpService:GenerateGUID(false)
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = gethui and gethui() or coreGui

folder2 = Instance.new("Folder")

do
  folder2.Name = httpService:GenerateGUID(false)
  local v537 = game
  folder2.Parent = v537:GetService("CoreGui")
  rbxassetFontsFamiliesPressStart2PJson = Font.new("rbxasset://fonts/families/PressStart2P.json")
  local new3 = Font.new
  local fontWeight = Enum.FontWeight
  v538 = new3("rbxasset://fonts/families/GothamSSm.json", fontWeight.Medium)
end

local function makeFrame(instance84)
  local frame7 = Instance.new("Frame")
  frame7.BorderSizePixel = 0
  frame7.Visible = false

  for v539, v540 in instance84 do
    frame7[v539] = v540
  end

  frame7.Parent = instance84.Parent or screenGui
  return frame7
end

local function f125(p209, vector, vector2, backgroundColor32, p210)
  local v541 = vector2 - vector

  p209.Position = UDim2.fromOffset((vector.X + vector2.X) / 2, (vector.Y + vector2.Y) / 2)
  p209.Size = UDim2.fromOffset(v541.Magnitude + p210 / 2, p210)
  p209.Rotation = math.deg(math.atan2(v541.Y, v541.X))
  p209.BackgroundColor3 = backgroundColor32
  p209.Visible = true
end

local function makeStroke(parent7, color9, thickness)
  local uiStroke5 = Instance.new("UIStroke")
  uiStroke5.Color = color9
  uiStroke5.Thickness = thickness
  uiStroke5.LineJoinMode = Enum.LineJoinMode.Miter
  uiStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uiStroke5.Parent = parent7

  return uiStroke5
end

local function getVector3(position19)
  local worldToViewportPoint = currentCamera:WorldToViewportPoint(position19)
  return Vector2.new(worldToViewportPoint.X, worldToViewportPoint.Y), worldToViewportPoint.Z > 0
end

local function makeTextLabel(zindex)
  local textLabel = Instance.new("TextLabel")
  textLabel.BackgroundTransparency = 1
  textLabel.RichText = true
  textLabel.TextColor3 = Color3.new(1, 1, 1)
  textLabel.AutomaticSize = Enum.AutomaticSize.XY
  textLabel.Size = UDim2.new()
  textLabel.ZIndex = zindex or 4

  return textLabel
end

local function f126(p211)
  return makeFrame({
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = Color3.new(1, 1, 1),
    ZIndex = p211 or 2,
  })
end

local color10 = Color3.fromRGB(77, 73, 77)
local color11 = Color3.fromRGB(85, 255, 255)
local color12 = Color3.fromRGB(216, 216, 216)
local color13 = Color3.fromRGB(255, 215, 0)
local color14 = Color3.fromRGB(130, 130, 130)
local color15 = Color3.fromRGB(150, 90, 50)
local color16 = Color3.fromRGB(70, 170, 80)
local color17 = Color3.fromRGB(170, 120, 255)

local function getColor(clamped5)
  return Color3.fromHSV(math.clamp(clamped5, 0, 1) * 0.33, 0.85, 1)
end

local v542 = {
  netherite = color10,
  diamond = color11,
  iron = color12,
  golden = color13,
  chainmail = color14,
  leather = color15,
  turtle = color16,
  elytra = color17,
}

local function makeHighlight()
  local v543 = {}
  v543.boxOut = makeFrame({ BackgroundTransparency = 1, ZIndex = 1 })

  makeStroke(v543.boxOut, Color3.new(0, 0, 0), 3)

  v543.box = makeFrame({ BackgroundTransparency = 1, ZIndex = 2 })
  v543.boxStroke = makeStroke(v543.box, Color3.new(1, 1, 1), 1)
  v543.corners = {}

  for i11 = 1, 8 do
    v543.corners[i11] = { out = f126(1), line = f126(2) }
  end

  v543.edges = {}

  for i12 = 1, 12 do
    v543.edges[i12] = f126(2)
  end

  v543.eye = f126(3)
  v543.look = f126(3)
  v543.hpBack = makeFrame({ BackgroundColor3 = Color3.new(0, 0, 0), ZIndex = 1 })

  v543.hpFill = makeFrame({
    BackgroundColor3 = Color3.new(0, 1, 0),
    ZIndex = 2,
    Parent = v543.hpBack,
    Visible = true,
  })

  v543.absFill = makeFrame({
    BackgroundColor3 = Color3.fromRGB(255, 200, 40),
    ZIndex = 3,
    Parent = v543.hpBack,
    Visible = true,
  })

  v543.tag = makeFrame({
    AnchorPoint = Vector2.new(0.5, 1),
    BackgroundColor3 = Color3.new(0, 0, 0),
    BackgroundTransparency = 0.6,
    AutomaticSize = Enum.AutomaticSize.XY,
    ZIndex = 3,
  })

  local uiPadding = Instance.new("UIPadding")
  local udim = UDim.new(0, 3)
  local udim3 = UDim
  local paddingRight = udim3.new(0, 3)
  local udim4 = UDim
  local paddingTop = udim4.new(0, 2)
  local udim5 = UDim
  local paddingBottom = udim5.new(0, 2)

  uiPadding.PaddingLeft = udim
  uiPadding.PaddingRight = paddingRight
  uiPadding.PaddingTop = paddingTop
  uiPadding.PaddingBottom = paddingBottom
  uiPadding.Parent = v543.tag

  v543.tagText = makeTextLabel(4)
  v543.tagText.Parent = v543.tag

  v543.armor = makeFrame({
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    Size = UDim2.fromOffset(30, 6),
    ZIndex = 3,
  })

  v543.armorSq = {}

  for i13 = 1, 4 do
    local frame8 = makeFrame({
      Parent = v543.armor,
      Position = UDim2.fromOffset((i13 - 1) * 8, 0),
      Size = UDim2.fromOffset(6, 6),
      ZIndex = 4,
      Visible = true,
    })

    makeStroke(frame8, Color3.new(0, 0, 0), 1)
    v543.armorSq[i13] = frame8
  end

  v543.item = makeTextLabel(4)
  v543.item.AnchorPoint = Vector2.new(0.5, 0)
  v543.item.TextStrokeTransparency = 0.4
  v543.item.Visible = false
  v543.item.Parent = screenGui
  v543.tracer = f126(1)
  v543.hl = Instance.new("Highlight")
  v543.hl.Enabled = false
  v543.hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
  v543.hl.Parent = folder2

  return v543
end

local v544 = { "head", "chest", "legs", "feet" }

local function getGsub2(name8)
  local gsub2 = name8:gsub("_", " ")
  return gsub2:gsub("(%a)([%w]*)", function(text16, p212) return text16:upper() .. p212 end)
end

v547 = {}

local function getList(targetHud3)
  local armor = targetHud3:GetAttribute("Armor")

  if type(armor) ~= "string" then
    return nil
  end

  local v549 = v547[targetHud3]

  if v549 and v549.raw == armor then
    return v549.list
  end

  local ok2, data = pcall(httpService.JSONDecode, httpService, armor)
  local list16 = {}

  for v550, v551 in v544 do
    local id = ok2
    id = ok2 and data[v551] and data[v551].id

    local v552 = id and (v542[id:match("^(%a+)_")] or v542[id])
    list16[v550] = v552 or false
  end

  v547[targetHud3] = { raw = armor, list = list16 }
  return list16
end

local function f127(p213)
  for _, v553 in {
    p213.boxOut, p213.box, p213.hpBack, p213.tag, p213.item, p213.tracer, p213.eye, p213.look,
    p213.hl, p213.armor,
  } do
    v553:Destroy()
  end

  for _, v554 in p213.corners do
    v554.out:Destroy()
    v554.line:Destroy()
  end

  for _, v555 in p213.edges do
    v555:Destroy()
  end
end

local function f128(p214)
  local boxOut = p214.boxOut
  local box = p214.box
  local hpBack = p214.hpBack
  local tag = p214.tag
  local item17 = p214.item
  local tracer = p214.tracer
  local armor2 = p214.armor
  boxOut.Visible = false
  box.Visible = false
  hpBack.Visible = false
  tag.Visible = false
  item17.Visible = false
  tracer.Visible = false
  armor2.Visible = false
  local eye = p214.eye
  local look = p214.look
  eye.Visible = false
  look.Visible = false

  for _, v570 in p214.corners do
    local out = v570.out
    local line = v570.line
    out.Visible = false
    line.Visible = false
  end

  for _, v571 in p214.edges do
    v571.Visible = false
  end
end

v572 = {}

local function f129(targetHud4)
  for _, v573 in targetHud4:GetChildren() do
    if v573:IsA("Model") then
      return getGsub2(v573.Name)
    end
  end
end

local list17 = {}

for _, v574 in { -1, 1 } do
  for _, v575 in { 0, 1 } do
    for _, v576 in { -1, 1 } do
      list17[#list17 + 1] = Vector3.new(v574, v575, v576)
    end
  end
end

local function f130()
  local list18 = {}

  for _, v577 in f123() do
    if f117(v577) then
      local v578 = v577.Parent == dummies

      if v578 and v535.Dummies or not v578 and v535.Players then
        list18[#list18 + 1] = v577
      end
    end
  end

  return list18
end

local v579 = {
  { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 1, 3 }, { 2, 4 }, { 5, 7 }, { 6, 8 }, { 1, 5 },
  { 2, 6 }, { 3, 7 }, { 4, 8 },
}

local function f131(text17, instance85, p215, viewportSize)
  local v580, v581, v582 = f124(instance85)

  if not v580 then
    return false
  end

  local v583, v584, absorption = f119(instance85)
  local magnitude = (getVector2(p215, v580, v581, v582) - p215).Magnitude

  if magnitude > v535.MaxDist then
    return false
  end

  local lowHp = v535.LowHp and v583 + absorption <= v535.LowHpAt
  local reachColor = v535.ReachColor and magnitude <= v512.REACH

  local lowHpColor = lowHp and v535.LowHpColor or reachColor and v535.InReachColor
    or v535.BoxColor

  text17.hl.Adornee = instance85
  local lowHpColor2 = lowHp and v535.LowHpColor or v535.GlowColor

  if v535.Chams then
    local hl = text17.hl
    local hl2 = text17.hl
    hl.FillColor = lowHp and v535.LowHpColor or v535.ChamColor
    hl2.FillTransparency = 0.55
    local hl3 = text17.hl
    local hl4 = text17.hl
    local glow = v535.Glow
    hl3.OutlineColor = lowHpColor2
    hl4.OutlineTransparency = glow and 0 or 1
    text17.hl.Enabled = true
  elseif v535.Glow then
    text17.hl.FillTransparency = 1
    local hl5 = text17.hl
    local hl6 = text17.hl
    hl5.OutlineColor = lowHpColor2
    hl6.OutlineTransparency = 0
    text17.hl.Enabled = true
  else
    text17.hl.Enabled = false
  end

  local v585 = v580 * block
  local v586 = v581 * block
  local v587 = v582 / 2 * block
  local v588 = {}
  local huge2 = math.huge
  local huge3 = math.huge
  local highest4 = -math.huge
  local highest5 = -math.huge
  local lowest3 = huge2

  for v589, v590 in list17 do
    local vector3, v591 = getVector3(v585
      + Vector3.new(v590.X * v587, v590.Y * v586, v590.Z * v587))

    if not v591 then
      f128(text17)
      return true
    end

    v588[v589] = vector3
    lowest3 = math.min(lowest3, vector3.X)
    huge3 = math.min(huge3, vector3.Y)
    highest4 = math.max(highest4, vector3.X)
    highest5 = math.max(highest5, vector3.Y)
  end

  local rounded5 = math.floor(lowest3)
  local rounded6 = math.floor(huge3)
  local rounded7 = math.ceil(highest4)
  local rounded8 = math.ceil(highest5)
  local v592 = rounded7 - rounded5
  local v593 = rounded8 - rounded6
  local v594 = (rounded5 + rounded7) / 2
  local box2 = v535.Box and v535.BoxMode == "2D"
  local box3 = v535.Box and v535.BoxMode == "Corner"
  local box4 = v535.Box and v535.BoxMode == "3D Hitbox"
  local boxOut2 = text17.boxOut
  local box5 = text17.box
  boxOut2.Visible = box2
  box5.Visible = box2

  if box2 then
    local box6 = text17.box
    local box7 = text17.box
    local udim6 = UDim2.fromOffset(rounded5, rounded6)
    local udim22 = UDim2
    local size12 = udim22.fromOffset(v592, v593)
    box6.Position = udim6
    box7.Size = size12
    local boxOut3 = text17.boxOut
    local boxOut4 = text17.boxOut
    local box8 = text17.box
    local position20 = box8.Position
    local box9 = text17.box
    local size13 = box9.Size
    boxOut3.Position = position20
    boxOut4.Size = size13
    text17.boxStroke.Color = lowHpColor
  end

  if box3 then
    local highest6 = math.max(v592 / 4, 3)
    local highest7 = math.max(v593 / 5, 3)

    for v595, v596 in {
      { Vector2.new(rounded5, rounded6), Vector2.new(rounded5 + highest6, rounded6) },
      { Vector2.new(rounded5, rounded6), Vector2.new(rounded5, rounded6 + highest7) },
      { Vector2.new(rounded7, rounded6), Vector2.new(rounded7 - highest6, rounded6) },
      { Vector2.new(rounded7, rounded6), Vector2.new(rounded7, rounded6 + highest7) },
      { Vector2.new(rounded5, rounded8), Vector2.new(rounded5 + highest6, rounded8) },
      { Vector2.new(rounded5, rounded8), Vector2.new(rounded5, rounded8 - highest7) },
      { Vector2.new(rounded7, rounded8), Vector2.new(rounded7 - highest6, rounded8) },
      { Vector2.new(rounded7, rounded8), Vector2.new(rounded7, rounded8 - highest7) },
    } do
      f125(text17.corners[v595].out, v596[1], v596[2], Color3.new(0, 0, 0), 3)
      f125(text17.corners[v595].line, v596[1], v596[2], lowHpColor, 1)
    end
  else
    for _, v597 in text17.corners do
      local out2 = v597.out
      local line2 = v597.line
      out2.Visible = false
      line2.Visible = false
    end
  end

  if box4 then
    for v598, v599 in v579 do
      f125(text17.edges[v598], v588[v599[1]], v588[v599[2]], lowHpColor, 1)
    end

    local v600 = v585 + Vector3.new(0, v586 * 0.9, 0)
    local vector4 = getVector3(v600 - Vector3.new(v587, 0, 0))
    local vector5 = getVector3(v600 + Vector3.new(v587, 0, 0))
    f125(text17.eye, vector4, vector5, Color3.fromRGB(255, 60, 60), 1)
    local head = instance85:FindFirstChild("Head")
    local lookVector = head
    local humanoidRootPart = instance85:FindFirstChild("HumanoidRootPart")
    lookVector = head and head.CFrame.LookVector

    local lookVector2 = lookVector
    lookVector2 = lookVector or humanoidRootPart and humanoidRootPart.CFrame.LookVector

    local vector6 = getVector3(v600)
    local vector7, v601 = getVector3(v600 + (lookVector2 or Vector3.zero) * 2 * block)

    if lookVector2 and v601 then
      f125(text17.look, vector6, vector7, Color3.fromRGB(70, 120, 255), 1)
    else
      text17.look.Visible = false
    end
  else
    for _, v602 in text17.edges do
      v602.Visible = false
    end

    local eye2 = text17.eye
    local look2 = text17.look
    eye2.Visible = false
    look2.Visible = false
  end

  text17.hpBack.Visible = v535.HealthBar

  if v535.HealthBar then
    local clamped6 = v584 > 0 and math.clamp(v583 / v584, 0, 1) or 0
    local hpBack2 = text17.hpBack
    local hpBack3 = text17.hpBack
    local udim7 = UDim2.fromOffset(rounded5 - 6, rounded6 - 1)
    local udim23 = UDim2
    local size14 = udim23.fromOffset(4, v593 + 2)
    hpBack2.Position = udim7
    hpBack3.Size = size14
    local hpFill = text17.hpFill
    local hpFill2 = text17.hpFill
    local udim8 = UDim2.new(0, 1, 1 - clamped6, 1)
    local udim24 = UDim2
    local size15 = udim24.new(0, 2, clamped6, -2)
    hpFill.Position = udim8
    hpFill2.Size = size15
    text17.hpFill.BackgroundColor3 = getColor(clamped6)
    local clamped7 = v584 > 0 and math.clamp(absorption / v584, 0, 1) or 0
    text17.absFill.Visible = clamped7 > 0
    local absFill = text17.absFill
    local absFill2 = text17.absFill
    local udim9 = UDim2.new(0, 1, 1 - clamped7, 1)
    local udim25 = UDim2
    local size16 = udim25.new(0, 2, clamped7, -2)
    absFill.Position = udim9
    absFill2.Size = size16
  end

  local list19 = {}

  if v535.Name then
    local v603 = #list19 + 1
    local v604 = lowHp

    if lowHp then
      local format = string.format

      v604 = format(
        '<font color="#%s">%s</font>', v535.LowHpColor:ToHex(), getDisplayName(instance85)
      )
    end

    list19[v603] = v604 or getDisplayName(instance85)
  end

  if v535.Health then
    local color18 = absorption > 0 and Color3.fromRGB(255, 200, 40)
      or getColor(v584 > 0 and v583 / v584 or 0)

    list19[#list19 + 1] = string.format(
      '<font color="#%s">%.1f HP</font>', color18:ToHex(), v583 + absorption
    )
  end

  if v535.Distance then
    list19[#list19 + 1] = string.format(
      '<font color="#AAAAAA">%dm</font>', math.floor(magnitude + 0.5)
    )
  end

  text17.tag.Visible = #list19 > 0

  if #list19 > 0 then
    text17.tagText.FontFace = v535.TagFont == "Minecraft"
        and rbxassetFontsFamiliesPressStart2PJson
      or v538

    text17.tagText.TextSize = v535.TagSize
    text17.tagText.Text = table.concat(list19, " ")
    text17.tag.Position = UDim2.fromOffset(v594, rounded6 - 3)
  end

  local v605 = rounded8 + 3
  local armor3 = v535.Armor

  local v606 = armor3
  v606 = armor3 and getList(instance85)

  text17.armor.Visible = v606 ~= nil

  if v606 then
    for v607, v608 in v606 do
      text17.armorSq[v607].BackgroundColor3 = v608 or Color3.new(0, 0, 0)
      text17.armorSq[v607].BackgroundTransparency = v608 and 0 or 0.7
    end

    text17.armor.Position = UDim2.fromOffset(v594, v605)
    v605 = v605 + 9
  end

  local heldItem = v535.HeldItem and f129(instance85)
  text17.item.Visible = heldItem ~= nil

  if heldItem then
    text17.item.FontFace = v535.TagFont == "Minecraft" and rbxassetFontsFamiliesPressStart2PJson
      or v538

    text17.item.TextSize = v535.TagSize
    text17.item.Text = '<font color="#55FFFF">' .. heldItem .. "</font>"
    text17.item.Position = UDim2.fromOffset(v594, v605)
  end

  text17.tracer.Visible = v535.Tracers

  if v535.Tracers then
    local vector8 = v535.TracerFrom == "Bottom"
        and Vector2.new(viewportSize.X / 2, viewportSize.Y)
      or v535.TracerFrom == "Center" and viewportSize / 2
      or Vector2.new(viewportSize.X / 2, 0)

    f125(text17.tracer, vector8, Vector2.new(v594, rounded8), lowHpColor, 1)
  end

  return true
end

v609 = {}

for i14 = 1, 40 do
  v609[i14] = f126(1)
end

local function f132(p216)
  local v610 = v512.REACH * block
  local v611

  for i15 = 0, 40 do
    local v612 = i15 / 40 * math.pi * 2

    local vector9, v613 = getVector3(p216 + Vector3.new(
      math.cos(v612) * v610, 0.05, math.sin(v612) * v610
    ))

    if i15 > 0 then
      if v613 and v611 then
        f125(v609[i15], v611, vector9, v535.InReachColor, 1)
      else
        v609[i15].Visible = false
      end
    end

    v611 = v613 and vector9 or nil
  end
end

local v614 = {}
local folder3 = v514.folder
local projectiles = folder3:WaitForChild("Projectiles")

local v615 = {
  pearl = Color3.fromRGB(60, 200, 150),
  arrow = Color3.fromRGB(255, 255, 255),
  trident = Color3.fromRGB(85, 255, 255),
  potion = Color3.fromRGB(255, 85, 255),
}

local function f133()
  local seen6 = {}

  if v535.Projectiles then
    for _, v616 in projectiles:GetChildren() do
      local vector10, visible = getVector3(v616:GetPivot().Position)
      local instance86 = v614[v616]

      if not instance86 then
        instance86 = makeTextLabel(5)
        instance86.AnchorPoint = Vector2.new(0.5, 0.5)
        instance86.TextStrokeTransparency = 0.3
        instance86.Parent = screenGui

        v614[v616] = instance86
      end

      seen6[v616] = true
      local kind3 = v616:GetAttribute("Kind") or "?"

      instance86.Visible = visible

      instance86.FontFace = v535.TagFont == "Minecraft"
          and rbxassetFontsFamiliesPressStart2PJson
        or v538

      instance86.TextSize = v535.TagSize
      instance86.TextColor3 = v615[kind3] or Color3.new(1, 1, 1)
      instance86.Text = "[" .. kind3 .. "]"
      instance86.Position = UDim2.fromOffset(vector10.X, vector10.Y)
    end
  end

  for v617, v618 in v614 do
    if not seen6[v617] then
      v618:Destroy()
      v614[v617] = nil
    end
  end
end

do
  local v619 = {}

  for i16 = 1, 60 do
    v619[i16] = f126(2)
  end

  local frame9 = makeFrame({
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.fromOffset(8, 8),
    BackgroundTransparency = 1,
    ZIndex = 3,
  })

  makeStroke(frame9, Color3.fromRGB(60, 200, 150), 2)

  local function f134()
    if not (v535.PearlPath and v515.state and f122() == "ender_pearl") then
      for _, v620 in v619 do
        v620.Visible = false
      end

      frame9.Visible = false
      return
    end

    local v621 = f121() - Vector3.new(0, 0.1, 0)

    local v622 = getLookVector() * 1.5 + Vector3.new(
      v515.state.vel.X, v515.state.onGround and 0 or v515.state.vel.Y, v515.state.vel.Z
    )

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Include
    raycastParams.FilterDescendantsInstances = { v514.folder.Solid }

    local v623
    local count2 = 0

    for i17 = 1, 200 do
      local v624 = v621 + v622
      local raycast = workspace:Raycast(v621 * block, v622 * block, raycastParams)

      if raycast then
        v624 = raycast.Position / block
      end

      count2 = count2 + 1
      local vector11, v625 = getVector3(v621 * block)
      local vector12, v626 = getVector3(v624 * block)

      if count2 <= #v619 then
        if v625 and v626 then
          f125(v619[count2], vector11, vector12, Color3.fromRGB(60, 200, 150), 2)
        else
          v619[count2].Visible = false
        end
      end

      v621 = v624

      if raycast then
        v623 = v621
        break
      end

      v622 = v622 * 0.99 - Vector3.new(0, 0.03, 0)
    end

    for i18 = count2 + 1, #v619 do
      v619[i18].Visible = false
    end

    frame9.Visible = false

    if v623 then
      local vector13, visible2 = getVector3(v623 * block)
      frame9.Visible = visible2
      frame9.Position = UDim2.fromOffset(vector13.X, vector13.Y)
    end
  end

  local frame10 = makeFrame({
    BackgroundColor3 = Color3.fromRGB(16, 16, 20),
    BackgroundTransparency = 0.25,
    Size = UDim2.fromOffset(200, 62),
    ZIndex = 10,
  })

  makeStroke(frame10, Color3.fromRGB(60, 60, 70), 1)

  local function f135(p217, p218)
    local textLabel2 = makeTextLabel(p218 or 11)
    textLabel2.Position = UDim2.fromOffset(8, p217)
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.Parent = frame10

    return textLabel2
  end

  local v627 = f135(6)

  local v628 = f135(6)
  v628.AnchorPoint = Vector2.new(1, 0)
  v628.Position = UDim2.new(1, -8, 0, 6)

  local parent8 = makeFrame({
    Parent = frame10,
    Position = UDim2.fromOffset(8, 24),
    Size = UDim2.new(1, -16, 0, 6),
    BackgroundColor3 = Color3.new(0, 0, 0),
    ZIndex = 11,
    Visible = true,
  })

  local frame11 = makeFrame({
    Parent = parent8,
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Color3.new(0, 1, 0),
    ZIndex = 12,
    Visible = true,
  })

  local frame12 = makeFrame({
    Parent = parent8,
    Size = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(255, 200, 40),
    ZIndex = 13,
    Visible = true,
  })

  local v629 = f135(36)

  local v630 = f135(36)
  v630.AnchorPoint = Vector2.new(1, 0)
  v630.Position = UDim2.new(1, -8, 0, 36)

  local v631 = {}

  for i19 = 1, 4 do
    local frame13 = makeFrame({
      Parent = frame10,
      Position = UDim2.fromOffset(8 + (i19 - 1) * 9, 50),
      Size = UDim2.fromOffset(7, 7),
      ZIndex = 11,
      Visible = true,
    })

    makeStroke(frame13, Color3.new(0, 0, 0), 1)
    v631[i19] = frame13
  end

  local instance87
  local v632 = 0

  local function f136(p219)
    local lookVector3 = getLookVector()
    local v633, v634

    for _, v635 in f123() do
      if f117(v635) then
        local v636, v637, v638 = f124(v635)

        if v636 then
          local vector14 = getVector2(p219, v636, v637, v638)
          local magnitude2 = (vector14 - p219).Magnitude
          local dot = (getVector(p219, v636, v637) - p219).Unit:Dot(lookVector3)

          if magnitude2 <= 8 and dot > 0.7 and (not v633 or dot > v633) then
            v634 = v635
            v633 = dot
          end
        end
      end
    end

    if v634 then
      local v639 = os
      local v640 = v639.clock()
      instance87 = v634
      v632 = v640
    elseif instance87
      and (os.clock() - v632 > 2 or not instance87.Parent or not f117(instance87)) then
      instance87 = nil
    end

    return instance87
  end

  local function f137(text18)
    local targetHud5 = v535.TargetHud and text18 and f136(text18)
    frame10.Visible = targetHud5 ~= nil

    if not targetHud5 then
      return
    end

    local v641, v642, v643 = f124(targetHud5)

    if not v641 then
      frame10.Visible = false
      return
    end

    local v644, v645, absorption2 = f119(targetHud5)

    local fontFace = v535.TagFont == "Minecraft" and rbxassetFontsFamiliesPressStart2PJson
      or v538

    local textSize4 = v535.TagFont == "Minecraft" and 8 or 13

    for _, v646 in { v627, v628, v629, v630 } do
      v646.FontFace = fontFace
      v646.TextSize = textSize4
    end

    v627.Text = getDisplayName(targetHud5)

    v628.Text = string.format(
      '<font color="#AAAAAA">%.1fm</font>',
      (getVector2(text18, v641, v642, v643) - text18).Magnitude
    )

    local clamped8 = v645 > 0 and math.clamp(v644 / v645, 0, 1) or 0

    frame11.Size = UDim2.new(clamped8, 0, 1, 0)
    frame11.BackgroundColor3 = getColor(clamped8)

    frame12.Size = UDim2.new(v645 > 0 and math.clamp(absorption2 / v645, 0, 1) or 0, 0, 1, 0)

    v629.Text = string.format(
      '<font color="#%s">%.1f</font> <font color="#AAAAAA">/ %d</font>%s',
      getColor(clamped8):ToHex(), v644, v645,
      absorption2 > 0 and string.format(' <font color="#FFC828">+%.0f</font>', absorption2)
        or ""
    )

    local v647 = f129(targetHud5)
    v630.Text = v647 and '<font color="#55FFFF">' .. v647 .. "</font>" or ""
    local list20 = getList(targetHud5)

    for i20 = 1, 4 do
      local backgroundColor33 = list20 and list20[i20]
      v631[i20].BackgroundColor3 = backgroundColor33 or Color3.new(0, 0, 0)
      v631[i20].BackgroundTransparency = backgroundColor33 and 0 or 0.7
    end

    local viewportSize2 = currentCamera.ViewportSize

    frame10.Position = UDim2.fromOffset(
      math.floor(viewportSize2.X / 2 + 40), math.floor(viewportSize2.Y / 2 + 20)
    )
  end

  local v648 = #v524
  local renderStepped = runService.RenderStepped

  v524[v648 + 1] = renderStepped:Connect(function()
    local seen7 = {}
    local v649 = f121()

    if v535.Enabled and v649 then
      local viewportSize3 = currentCamera.ViewportSize

      for _, v650 in f130() do
        local v651 = v572[v650]

        local v652 = v651
        v652 = v651 or makeHighlight()

        v572[v650] = v652

        if f131(v652, v650, v649, viewportSize3) then
          seen7[v650] = true
        end
      end
    end

    for v653, v654 in v572 do
      if not seen7[v653] then
        f128(v654)
        v654.hl.Enabled = false

        if not v653.Parent then
          f127(v654)
          v572[v653] = nil
          v547[v653] = nil
        end
      end
    end

    if v535.Enabled and v535.ReachRing and v515.state then
      f132(v515.state.pos * block)
    else
      for _, v655 in v609 do
        v655.Visible = false
      end
    end

    f133()
    f134()
    f137(v649)
  end)
end

do
  local function f138(p220)
    local yaw2 = v515.yaw
    local pitch = v515.pitch
    local v657, v658

    for _, v659 in f123() do
      if f117(v659) then
        local v660, v661, v662 = f124(v659)

        if v660 and (getVector2(p220, v660, v661, v662) - p220).Magnitude <= v536.AimRange then
          local angle, v663 = getAngle(getVector(p220, v660, v661) - p220)
          local degrees = math.deg(math.sqrt(f120(angle, yaw2) ^ 2 + (v663 - pitch) ^ 2))

          if degrees <= v536.AimFov / 2 and (not v657 or degrees < v657) then
            v658 = { angle, v663 }
            v657 = degrees
          end
        end
      end
    end

    return v658
  end

  local renderPriority = Enum.RenderPriority
  local camera = renderPriority.Camera

  runService:BindToRenderStep("mcsmpAim", camera.Value, function(p221)
    if not v536.Aim or not f118() then
      return
    end

    if v536.AimHold and not v516.isDown("attack") then
      return
    end

    local v664 = f138((f121()))

    if not v664 then
      return
    end

    local v665 = 1 - math.exp(-v536.AimSpeed * p221)

    v515.yaw = v515.yaw + f120(v664[1], v515.yaw) * v665
    v515.pitch = v515.pitch + (v664[2] - v515.pitch) * v665
  end)

  list14[#list14 + 1] = function() runService:UnbindFromRenderStep("mcsmpAim") end
end

local attack = debug.getupvalue(v516.onPressed, 1).attack

local function f139(p222, silentFov)
  local yaw3 = v515.yaw
  local pitch2 = v515.pitch
  local v668, v669

  for _, v670 in f123() do
    if f117(v670) then
      local v671, v672, v673 = f124(v670)

      if v671 then
        local vector15 = getVector(p222, v671, v672)
        local v674 = v514.rayBox(p222, (vector15 - p222).Unit, v671, v672, 0, v673)

        if v674 and v674 <= v512.REACH then
          local angle2, v675 = getAngle(vector15 - p222)
          local degrees2 = math.deg(math.sqrt(f120(angle2, yaw3) ^ 2 + (v675 - pitch2) ^ 2))

          if degrees2 <= silentFov / 2 and (not v669 or degrees2 < v669) then
            v668 = vector15
            v669 = degrees2
          end
        end
      end
    end
  end

  return v668
end

do
  local flag12 = false
  local v677

  local function f140()
    if v677 then
      local pitch3 = v677[2]

      v515.yaw = v677[1]
      v515.pitch = pitch3

      v677 = nil
    end
  end

  local function f141()
    flag12 = true
    local v678 = f121()

    if not v678 then
      return
    end

    local silent = v676 or v536.Silent and f139(v678, v536.SilentFov)

    if not silent then
      return
    end

    v677 = { v515.yaw, v515.pitch }
    local yaw4, pitch4 = getAngle(silent - v678)

    v515.yaw = yaw4
    v515.pitch = pitch4
  end

  table.insert(attack, 1, f141)
  table.insert(attack, f140)

  list14[#list14 + 1] = function()
    table.remove(attack, table.find(attack, f141))
    table.remove(attack, table.find(attack, f140))
  end

  local v680
  local v681

  local function f142(p223)
    local v682 = flag12
    flag12 = false

    if v536.Crit and v682 and not p223.inWater and v517.strength(0) > 0.9 then
      v680 = { p223.fallDistance, p223.onGround, p223.sprinting }

      p223.fallDistance = math.max(p223.fallDistance, 0.1)
      p223.onGround = false
      p223.sprinting = false
    end

    if v679 then
      v681 = { v515.yaw, v515.pitch }
      local pitch5 = v679[2]

      v515.yaw = v679[1]
      v515.pitch = pitch5

      v679 = nil
    end
  end

  local function f143(p224)
    if v680 then
      local onGround = v680[2]
      local sprinting = v680[3]

      p224.fallDistance = v680[1]
      p224.onGround = onGround
      p224.sprinting = sprinting

      v680 = nil
    end

    if v681 then
      local pitch6 = v681[2]

      v515.yaw = v681[1]
      v515.pitch = pitch6

      v681 = nil
    end
  end

  table.insert(v515.beforeTick, 1, f142)
  table.insert(v515.beforeTick, f143)

  list14[#list14 + 1] = function()
    table.remove(v515.beforeTick, table.find(v515.beforeTick, f142))
    table.remove(v515.beforeTick, table.find(v515.beforeTick, f143))
  end
end

do
  local flag13 = false
  local now = 0
  local v683 = #v524
  local heartbeat = runService.Heartbeat

  v524[v683 + 1] = heartbeat:Connect(function()
    if flag13 then
      v516.setVirtual("attack", false)
      flag13 = false
      return
    end

    if not v536.Aura or not f118() then
      return
    end

    if v536.AuraCooldown then
      if v517.strength(0) < 0.95 then
        return
      end
    elseif os.clock() - now < 1 / v536.AuraCps then
      return
    end

    local v684 = f121()
    local v685 = f139(v684, 360)

    if not v685 then
      return
    end

    if v536.AuraRotate then
      local yaw5, pitch7 = getAngle(v685 - v684)
      v515.yaw = yaw5
      v515.pitch = pitch7
    else
      v676 = v685
    end

    v516.setVirtual("attack", true)
    v676 = nil
    flag13 = true
    now = os.clock()
  end)

  list14[#list14 + 1] = function()
    if flag13 then
      v516.setVirtual("attack", false)
    end
  end

  local flag14 = false
  local v686 = #v524
  local heartbeat2 = runService.Heartbeat

  v524[v686 + 1] = heartbeat2:Connect(function()
    if flag14 then
      v516.setVirtual("attack", false)
      flag14 = false
      return
    end

    if not v536.Trigger or v536.Aura or not f118() or v517.strength(0) < 0.95 then
      return
    end

    local v687 = v514.pick(f121(), getLookVector(), v512.REACH)

    if not v687 or not f117(v687.model) then
      return
    end

    v516.setVirtual("attack", true)
    flag14 = true
  end)

  list14[#list14 + 1] = function()
    if flag14 then
      v516.setVirtual("attack", false)
    end
  end

  local overlaps = v513.overlaps

  function v513.overlaps(p225, p226, p227, p228, ...)
    if p228 == "web" and v536.NoWeb then
      return false
    end

    return overlaps(p225, p226, p227, p228, ...)
  end

  list14[#list14 + 1] = function() v513.overlaps = overlaps end
end

local useMULT = v512.USE_MULT

local function f144()
  v512.USE_MULT = v536.NoSlow and 1 or useMULT
end

do
  list14[#list14 + 1] = function() v512.USE_MULT = useMULT end
  local remotes = mc2:WaitForChild("Remotes")
  local action = remotes:WaitForChild("Action")

  function genv.__mcsmp_action_filter(p229)
    return v536.NoFall and type(p229) == "table" and p229.a == "land"
  end

  local v688

  if not genv.__mcsmp_nc_hooked and hookmetamethod then
    genv.__mcsmp_nc_hooked = true
    v688 = nil

    v688 = hookmetamethod(game, "__namecall", newcclosure(function(p230, ...)
      local mcsmpActionFilter = genv.__mcsmp_action_filter

      if mcsmpActionFilter and p230 == action and not checkcaller()
        and getnamecallmethod() == "FireServer" and mcsmpActionFilter(...) then
        return
      end

      return v688(p230, ...)
    end))
  end

  list14[#list14 + 1] = function() genv.__mcsmp_action_filter = nil end
end

local function f145()
  v512.REACH = v536.Reach and v536.ReachValue or reach
end

do
  list14[#list14 + 1] = function() v512.REACH = reach end
  local knockback = v513.knockback

  function v513.knockback(p231, p232, p233, p234)
    local vel = p231.vel
    knockback(p231, p232, p233, p234)

    if v536.Velocity then
      local v689 = p231.vel - vel

      p231.vel = vel + Vector3.new(
        v689.X * v536.VelH / 100, v689.Y * v536.VelV / 100, v689.Z * v536.VelH / 100
      )
    end
  end

  list14[#list14 + 1] = function() v513.knockback = knockback end
end

local function f146(p235)
  v516.setVirtual(p235, true)
  task.wait()
  v516.setVirtual(p235, false)
end

local function f147()
  local tickCount = v515.tickCount

  repeat
    task.wait()
  until v515.tickCount > tickCount
end

local function f148(p236)
  for i21 = 1, 9 do
    local v690 = v517.inv.hotbar[i21]

    if v690 and table.find(p236, v690.id) then
      return i21
    end
  end
end

do
  flag15 = false
  local f149

  local function f150()
    local offhand = v517.inv.offhand

    if offhand and offhand.id == "totem_of_undying" then
      return
    end

    local v691 = f148({ "totem_of_undying" })

    if not v691 then
      return
    end

    flag15 = true
    local inv2 = v517.inv
    local selected = inv2.selected
    f149(v691)
    f146("swap")
    f147()
    f149(selected)
    flag15 = false
  end

  function f149(p237)
    if v517.inv.selected ~= p237 then
      f146("hotbar" .. p237)
      f147()
    end
  end

  local function f151()
    local v692 = { f119(localPlayer3.Character) }

    if v692[1] + v692[3] > v536.GappleAt then
      return
    end

    local v693 = f148({ "enchanted_golden_apple", "golden_apple" })

    if not v693 then
      return
    end

    flag15 = true
    local selected2 = v517.inv.selected
    f149(v693)
    local count3 = v517.inv.hotbar[v693] and v517.inv.hotbar[v693].count or 0
    v516.setVirtual("use", true)
    local now2 = os.clock()
    local v694

    repeat
      task.wait()
      local v695 = os.clock() - now2 > 2.2

      v694 = v695 or not f118()
        or (v517.inv.hotbar[v693] and v517.inv.hotbar[v693].count or 0) < count3
    until v694

    v516.setVirtual("use", false)
    f147()
    f149(selected2)
    flag15 = false
  end

  local v696 = {
    strength = { "strength" },
    swiftness = { "swiftness", "speed" },
    fire_resistance = { "fire_resistance" },
    regeneration = { "regeneration" },
  }

  local v697 = { healing = true, instant_health = true, health = true }
  local v698 = {}

  local function f153()
    local effects = localPlayer3:GetAttribute("Effects") or ""
    local v700, _, absorption3 = f119(localPlayer3.Character)

    for i22 = 1, 9 do
      local v701 = v517.inv.hotbar[i22]
      local potion = v701 and v701.id == "splash_potion" and v701.potion

      if potion and os.clock() - (v698[potion] or 0) > 3 then
        local v702

        if v697[potion] then
          v702 = v700 + absorption3 <= v536.HealAt
        elseif v696[potion] then
          local v703 = v696[potion]
          v702 = true

          for _, v704 in v703 do
            if effects:find(v704) then
              v702 = false
            end
          end
        end

        if v702 then
          v698[potion] = os.clock()
          f152(i22)
          return
        end
      end
    end
  end

  function f152(p238)
    flag15 = true
    local inv3 = v517.inv
    local selected3 = inv3.selected
    f149(p238)
    v679 = { v515.yaw, -math.pi / 2 + 0.01 }
    f146("use")
    f147()
    f149(selected3)
    flag15 = false
  end

  local selected4
  local v705 = #v524
  local heartbeat3 = runService.Heartbeat

  v524[v705 + 1] = heartbeat3:Connect(function()
    local state2 = v515.state

    if not state2 then
      return
    end

    local v706 = selected4
    local v707

    if v706 and (state2.onGround or state2.inWater) then
      if not flag15 then
        v707 = selected4
        selected4 = nil

        task.spawn(function()
          flag15 = true
          f149(v707)
          flag15 = false
        end)
      end

      return
    end

    if not v536.Smash or flag15 or not f118() or state2.gliding
      or state2.fallDistance <= v518.SMASH_MIN_FALL then
      return
    end

    local v708 = f148({ "mace" })

    if not v708 then
      return
    end

    local v709 = f121()

    if v517.inv.selected ~= v708 then
      for _, v710 in f123() do
        if f117(v710) then
          local v711 = f124(v710)

          if v711 and v711.Y < v709.Y
            and Vector2.new(v711.X - v709.X, v711.Z - v709.Z).Magnitude < 8 then
            selected4 = selected4 or v517.inv.selected

            task.spawn(function()
              flag15 = true
              f149(v708)
              flag15 = false
            end)

            return
          end
        end
      end

      return
    end

    local v712 = f139(v709, 360)

    if not v712 then
      return
    end

    flag15 = true
    v676 = v712
    v516.setVirtual("attack", true)
    v676 = nil

    task.spawn(function()
      task.wait()
      v516.setVirtual("attack", false)
      f147()
      flag15 = false
    end)
  end)
end

do
  local flag16 = true

  task.spawn(function()
    while flag16 do
      task.wait(0.1)
      local v713 = not flag15 and f118()
    end
  end)

  list14[#list14 + 1] = function() flag16 = false end

  v714 = v509.new({
    Title = "Unstable SMP",
    Script = "mcsmp.lua",
    Build = "pvp",
    Theme = "Blossom",
    MenuKey = Enum.KeyCode.Insert,
  })

  v714:Category("Combat")

  combatTab = v714:Tab({ Name = "Combat", Icon = "target" })
end

aimAssistSection = combatTab:Section({ Name = "Aim Assist", Icon = "target", Side = 1 })

aimAssistSection:Toggle({
  Name = "Aim Assist",
  Default = v536.Aim,
  Callback = function(value19) v536.Aim = value19 end,
})

aimAssistSection:Toggle({
  Name = "Only While Attacking",
  Default = v536.AimHold,
  Callback = function(value20) v536.AimHold = value20 end,
})

aimAssistSection:Slider({
  Name = "FOV",
  Min = 10,
  Max = 180,
  Default = v536.AimFov,
  Suffix = "°",
  Callback = function(value21) v536.AimFov = value21 end,
})

do
  aimAssistSection:Slider({
    Name = "Range",
    Min = 3,
    Max = 12,
    Default = v536.AimRange,
    Suffix = " blocks",
    Callback = function(value22) v536.AimRange = value22 end,
  })

  aimAssistSection:Slider({
    Name = "Speed",
    Min = 1,
    Max = 30,
    Default = v536.AimSpeed,
    Callback = function(value23) v536.AimSpeed = value23 end,
  })

  local silentAimSection = combatTab:Section({ Name = "Silent Aim", Icon = "key", Side = 1 })

  silentAimSection:Toggle({
    Name = "Silent Aim",
    Default = v536.Silent,
    Callback = function(value24) v536.Silent = value24 end,
  })

  silentAimSection:Slider({
    Name = "Silent FOV",
    Min = 10,
    Max = 360,
    Default = v536.SilentFov,
    Suffix = "°",
    Callback = function(value25) v536.SilentFov = value25 end,
  })

  silentAimSection:Toggle({
    Name = "Criticals",
    Default = v536.Crit,
    Callback = function(value26) v536.Crit = value26 end,
  })

  local trigger = v536.Trigger

  silentAimSection:Toggle({
    Name = "Trigger Bot",
    Default = trigger,
    Callback = function(value27) v536.Trigger = value27 end,
  })
end

do
  local killAuraSection = combatTab:Section({ Name = "Kill Aura", Icon = "bomb", Side = 1 })

  killAuraSection:Toggle({
    Name = "Kill Aura",
    Default = v536.Aura,
    Keybind = Enum.KeyCode.R,
    Callback = function(value28) v536.Aura = value28 end,
  })

  local auraCooldown = v536.AuraCooldown

  killAuraSection:Toggle({
    Name = "Wait For Full Charge",
    Default = auraCooldown,
    Callback = function(value29) v536.AuraCooldown = value29 end,
  })

  local auraRotate = v536.AuraRotate

  killAuraSection:Toggle({
    Name = "Rotate Camera",
    Default = auraRotate,
    Callback = function(value30) v536.AuraRotate = value30 end,
  })

  killAuraSection:Slider({
    Name = "CPS (no charge wait)",
    Min = 1,
    Max = 20,
    Default = v536.AuraCps,
    Callback = function(value31) v536.AuraCps = value31 end,
  })
end

do
  local reachSection = combatTab:Section({ Name = "Reach", Icon = "wrench", Side = 2 })
  local reach2 = v536.Reach

  reachSection:Toggle({
    Name = "Reach",
    Default = reach2,
    Callback = function(value32)
      v536.Reach = value32
      f145()
    end,
  })

  reachSection:Slider({
    Name = "Distance",
    Min = 3,
    Max = 6,
    Decimals = 1,
    Default = v536.ReachValue,
    Suffix = " blocks",
    Callback = function(value33)
      v536.ReachValue = value33
      f145()
    end,
  })

  reachSection:Label({ Name = "Server may check reach - risky" })
end

do
  local velocitySection = combatTab:Section({ Name = "Velocity", Icon = "cube", Side = 2 })

  velocitySection:Toggle({
    Name = "Velocity",
    Default = v536.Velocity,
    Callback = function(value34) v536.Velocity = value34 end,
  })

  local velH = v536.VelH

  velocitySection:Slider({
    Name = "Horizontal",
    Min = 0,
    Max = 100,
    Default = velH,
    Suffix = "%",
    Callback = function(value35) v536.VelH = value35 end,
  })

  local velV = v536.VelV

  velocitySection:Slider({
    Name = "Vertical",
    Min = 0,
    Max = 100,
    Default = velV,
    Suffix = "%",
    Callback = function(value36) v536.VelV = value36 end,
  })
end

do
  local movementSection = combatTab:Section({ Name = "Movement", Icon = "layout", Side = 2 })

  movementSection:Toggle({
    Name = "No Web Slow",
    Default = v536.NoWeb,
    Callback = function(value37) v536.NoWeb = value37 end,
  })

  movementSection:Toggle({
    Name = "No Slow (eating/using)",
    Default = v536.NoSlow,
    Callback = function(value38)
      v536.NoSlow = value38
      f144()
    end,
  })

  movementSection:Toggle({
    Name = "No Fall Damage",
    Default = v536.NoFall,
    Callback = function(value39) v536.NoFall = value39 end,
  })
end

do
  local maceSection = combatTab:Section({ Name = "Mace", Icon = "bomb", Side = 2 })

  maceSection:Toggle({
    Name = "Auto Smash",
    Default = v536.Smash,
    Callback = function(value40) v536.Smash = value40 end,
  })

  maceSection:Keybind({
    Name = "Wind Launch",
    Default = Enum.KeyCode.X,
    Callback = function()
      if flag15 or not f118() then
        return
      end

      local v715 = f148({ "wind_charge" })

      if v715 then
        task.spawn(f152, v715)
      end
    end,
  })
end

do
  autoSection = combatTab:Section({ Name = "Auto", Icon = "robot", Side = 2 })
  local totem = v536.Totem

  autoSection:Toggle({
    Name = "Auto Totem",
    Default = totem,
    Callback = function(value41) v536.Totem = value41 end,
  })
end

autoSection:Toggle({
  Name = "Auto Gapple",
  Default = v536.Gapple,
  Callback = function(value42) v536.Gapple = value42 end,
})

autoSection:Toggle({
  Name = "Auto Pot",
  Default = v536.Pot,
  Callback = function(value43) v536.Pot = value43 end,
})

do
  local healAt = v536.HealAt

  autoSection:Slider({
    Name = "Heal Pot Below",
    Min = 2,
    Max = 20,
    Default = healAt,
    Suffix = " HP",
    Callback = function(value44) v536.HealAt = value44 end,
  })
end

do
  local gappleAt = v536.GappleAt

  autoSection:Slider({
    Name = "Gapple Below",
    Min = 2,
    Max = 20,
    Default = gappleAt,
    Suffix = " HP",
    Callback = function(value45) v536.GappleAt = value45 end,
  })

  v714:Category("Visuals")
  espTab = v714:Tab({ Name = "ESP", Icon = "user" })
end

do
  mainSection = espTab:Section({ Name = "Main", Icon = "target", Side = 1 })
  local enabled2 = v535.Enabled

  mainSection:Toggle({
    Name = "Enabled",
    Default = enabled2,
    Keybind = Enum.KeyCode.RightBracket,
    Callback = function(value46) v535.Enabled = value46 end,
  })

  mainSection:Toggle({
    Name = "Players",
    Default = v535.Players,
    Callback = function(value47) v535.Players = value47 end,
  })
end

do
  mainSection:Toggle({
    Name = "Dummies",
    Default = v535.Dummies,
    Callback = function(value48) v535.Dummies = value48 end,
  })

  local maxDist = v535.MaxDist

  mainSection:Slider({
    Name = "Max Distance",
    Min = 16,
    Max = 1000,
    Default = maxDist,
    Suffix = " blocks",
    Callback = function(value49) v535.MaxDist = value49 end,
  })
end

boxSection = espTab:Section({ Name = "Box", Icon = "cube", Side = 1 })

boxSection:Toggle({
  Name = "Box",
  Default = v535.Box,
  Color = v535.BoxColor,
  ColorCallback = function(boxColor) v535.BoxColor = boxColor end,
  Callback = function(value50) v535.Box = value50 end,
})

do
  local boxMode = v535.BoxMode

  boxSection:Dropdown({
    Name = "Style",
    Options = { "2D", "Corner", "3D Hitbox" },
    Default = boxMode,
    Callback = function(value51) v535.BoxMode = value51 end,
  })
end

do
  local healthBar = v535.HealthBar

  boxSection:Toggle({
    Name = "Health Bar",
    Default = healthBar,
    Callback = function(value52) v535.HealthBar = value52 end,
  })

  local tracers = v535.Tracers
  local tracerColor = v535.TracerColor

  boxSection:Toggle({
    Name = "Tracers",
    Default = tracers,
    Color = tracerColor,
    ColorCallback = function(tracerColor2) v535.TracerColor = tracerColor2 end,
    Callback = function(value53) v535.Tracers = value53 end,
  })
end

boxSection:Dropdown({
  Name = "Tracer From",
  Options = { "Bottom", "Center", "Top" },
  Default = v535.TracerFrom,
  Callback = function(value54) v535.TracerFrom = value54 end,
})

alertsSection = espTab:Section({ Name = "Alerts", Icon = "bomb", Side = 1 })

do
  local lowHp2 = v535.LowHp
  local lowHpColor3 = v535.LowHpColor

  local toggle = alertsSection.Toggle

  toggle(alertsSection, {
    Name = "Low Health",
    Default = lowHp2,
    Color = lowHpColor3,
    ColorCallback = function(lowHpColor4) v535.LowHpColor = lowHpColor4 end,
    Callback = function(value55) v535.LowHp = value55 end,
  })
end

do
  alertsSection:Slider({
    Name = "Low Health At",
    Min = 1,
    Max = 20,
    Default = v535.LowHpAt,
    Suffix = " HP",
    Callback = function(value56) v535.LowHpAt = value56 end,
  })

  local reachColor2 = v535.ReachColor
  local inReachColor = v535.InReachColor

  alertsSection:Toggle({
    Name = "In Reach Color",
    Default = reachColor2,
    Color = inReachColor,
    ColorCallback = function(inReachColor2) v535.InReachColor = inReachColor2 end,
    Callback = function(value57) v535.ReachColor = value57 end,
  })
end

alertsSection:Toggle({
  Name = "Reach Ring",
  Default = v535.ReachRing,
  Callback = function(value58) v535.ReachRing = value58 end,
})

nametagSection = espTab:Section({ Name = "Nametag", Icon = "user", Side = 2 })

do
  nametagSection:Toggle({
    Name = "Name",
    Default = v535.Name,
    Callback = function(value59) v535.Name = value59 end,
  })

  local health2 = v535.Health

  nametagSection:Toggle({
    Name = "Health",
    Default = health2,
    Callback = function(value60) v535.Health = value60 end,
  })

  nametagSection:Toggle({
    Name = "Distance",
    Default = v535.Distance,
    Callback = function(value61) v535.Distance = value61 end,
  })
end

nametagSection:Toggle({
  Name = "Armor",
  Default = v535.Armor,
  Callback = function(value62) v535.Armor = value62 end,
})

nametagSection:Toggle({
  Name = "Held Item",
  Default = v535.HeldItem,
  Callback = function(value63) v535.HeldItem = value63 end,
})

do
  local tagFont = v535.TagFont

  nametagSection:Dropdown({
    Name = "Font",
    Options = { "Minecraft", "Clean" },
    Default = tagFont,
    Callback = function(value64) v535.TagFont = value64 end,
  })

  local v716 = { Small = 8, Normal = 16, Large = 24 }

  nametagSection:Dropdown({
    Name = "Text Size",
    Options = { "Small", "Normal", "Large" },
    Default = "Normal",
    Callback = function(value65) v535.TagSize = v716[value65] end,
  })
end

do
  local glowSection = espTab:Section({ Name = "Glow", Icon = "smile", Side = 2 })

  glowSection:Toggle({
    Name = "Glowing Outline",
    Default = v535.Glow,
    Color = v535.GlowColor,
    ColorCallback = function(glowColor) v535.GlowColor = glowColor end,
    Callback = function(value66) v535.Glow = value66 end,
  })

  local chams = v535.Chams
  local chamColor = v535.ChamColor

  glowSection:Toggle({
    Name = "Chams Fill",
    Default = chams,
    Color = chamColor,
    ColorCallback = function(chamColor2) v535.ChamColor = chamColor2 end,
    Callback = function(value67) v535.Chams = value67 end,
  })
end

do
  local projectilesSection = espTab:Section({ Name = "Projectiles", Icon = "globe", Side = 2 })

  projectilesSection:Toggle({
    Name = "Projectile ESP",
    Default = v535.Projectiles,
    Callback = function(value68) v535.Projectiles = value68 end,
  })

  projectilesSection:Toggle({
    Name = "Target HUD",
    Default = v535.TargetHud,
    Callback = function(value69) v535.TargetHud = value69 end,
  })

  local pearlPath = v535.PearlPath

  projectilesSection:Toggle({
    Name = "Pearl Landing",
    Default = pearlPath,
    Callback = function(value70) v535.PearlPath = value70 end,
  })
end

do
  v714:Category("Settings")

  local buildSettings = v714.BuildSettings
  buildSettings(v714, v714:Tab({ Name = "Settings", Icon = "gear" }))

  function genv.__mcsmp_unload()
    for _, v717 in v524 do
      v717:Disconnect()
    end

    for _, v718 in v572 do
      f127(v718)
    end

    table.clear(v572)
    screenGui:Destroy()
    folder2:Destroy()
    pcall(v714.Destroy, v714)
    genv.__mcsmp_unload = nil
  end
end

-- https://leakd.fr
