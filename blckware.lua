local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Neverlose/source.lua"))()
-- Toggle UI: Library:Toggle()

local Window = Library:Window({
    text = "NEVERLOSE"
})

local TabSection = Window:TabSection({
    text = "Functions"
})

local Tab = TabSection:Tab({
    text = "Visual",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
    text = "Main"
})

Section:Button({
    text = "Master Switch",
    callback = function()
        print("Clicked button")
    end,
})

Section:Toggle({
    text = "ESP",
    state = false, -- Default boolean
    callback = function(boolean)
        loadstring("https://raw.githubusercontent.com/romay2k/LuaXT/refs/heads/main/espfeature")()
        print("Toggle current: ",boolean)
    end
})

Section:Dropdown({
    text = "ESP Type",
    list = {"Box", "Name","Line","Weapon"},
    default = "Box",
    callback = function(String)
        print(String)
    end
})

local Section = Tab:Section({
    text = "Customize"
})

Section:Textbox({
    text = "Load Config ID",
    value = "Default",
    callback = function(String)
        print(String)
    end
})

Section:Colorpicker({
    text = "Color",
    color = Color3.new(1,1,1),
    callback = function(HSV)
        print(HSV)
    end
})

--[[
    blacklisted keybind:
        Return
        Space
        Tab
        W,A,S,D,I,O
        Unknown
]]

Section:Keybind({
    text = "Keybind",
    default = Enum.KeyCode.Insert,
    callback = function(defaultBind)
        print("Triggered keybind")
        print(defaultBind)
    end
})

local Tab = TabSection:Tab({
    text = "Aimbot",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
        text = "Main"
})

Section:Button({
    text = "Master Switch",
    callback = function()
        print("Clicked button")
    end,
})

Section:Toggle({
    text = "Aimbot",
    state = false, -- Default boolean
    callback = function(boolean)
        print("Toggle current: ",boolean)
    end
})

Section:Toggle({
    text = "Silent Aim",
    state = false, -- Default boolean
    callback = function(boolean)
        print("Toggle current: ",boolean)
    end
})

Section:Slider({
    text = "Smooth",
    min = 10,
    max = 100,
    -- [[Float = 0,]] Idk what it does
    callback = function(number)
        print(number)
    end
})


local Section = Tab:Section({
    text = "Customize"
})

Section:Textbox({
    text = "Load Config ID",
    value = "Default",
    callback = function(String)
        print(String)
    end
})

Section:Dropdown({
    text = "Config",
    list = {"Legit", "Semi-Rage","Rage"},
    default = "Default",
    callback = function(String)
        print(String)
    end
})

Section:Toogle({
        text = "FOV",
        state = false,
})

Section:Colorpicker({
    text = "FOV Color",
    color = Color3.new(1,1,1),
    callback = function(HSV)
        print(HSV)
    end
})

--[[
    blacklisted keybind:
        Return
        Space
        Tab
        W,A,S,D,I,O
        Unknown
]]

Section:Keybind({
    text = "Keybind",
    default = Enum.KeyCode.Insert,
    callback = function(defaultBind)
        print("Triggered keybind")
        print(defaultBind)
    end
})

local Tab = TabSection:Tab({
    text = "Credits",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
    text = "Discord - matheus2k25"
})

local Section = Tab:Section({
    text = "Youtube - 7heuz.crf"
})
