local Players = game:GetService("Players")
local correctPlaceId = 286090429

local infjmp = true
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

 local espTab = Window:CreateTab("ESP", nil)
 local espSection = espTab:CreateSection("Main")


local ESPEnabled = false


local ESP = nil
local ESPScriptUrl = "https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"

local Esp = espTab:CreateToggle({
    Name = "playeur Name",
    Callback = function()
       

        local function API_Check()
            if Drawing == nil then
                return "No"
            else
                return "Yes"
            end
        end
        
        local Find_Required = API_Check()
        
        if Find_Required == "No" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "ESP script could not be loaded because your exploit is unsupported.";
                Duration = math.huge;
                Button1 = "OK"
            })
        
            return
        end
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Camera = workspace.CurrentCamera
        
        local Typing = false
        
        _G.SendNotifications = true   
        _G.DefaultSettings = false   
        
        _G.TeamCheck = false  
        
        _G.ESPVisible = true
        _G.TextColor = Color3.fromRGB(255, 80, 10)   
        _G.TextSize = 14   
        _G.Center = true   
        _G.Outline = true  
        _G.OutlineColor = Color3.fromRGB(0, 0, 0)   
        _G.TextTransparency = 0.7   
        _G.TextFont = Drawing.Fonts.UI  
        
        _G.DisableKey = Enum.KeyCode.Q   
        
        local function CreateESP()
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= Players.LocalPlayer.Name then
                    local ESP = Drawing.new("Text")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
        
                            ESP.Size = _G.TextSize
                            ESP.Center = _G.Center
                            ESP.Outline = _G.Outline
                            ESP.OutlineColor = _G.OutlineColor
                            ESP.Color = _G.TextColor
                            ESP.Transparency = _G.TextTransparency
                            ESP.Font = _G.TextFont
        
                            if OnScreen == true then
                                local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                local Dist = (Part1 - Part2).Magnitude
                                ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        ESP.Visible = _G.ESPVisible
                                    else
                                        ESP.Visible = false
                                    end
                                else
                                    ESP.Visible = _G.ESPVisible
                                end
                            else
                                ESP.Visible = false
                            end
                        else
                            ESP.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        ESP.Visible = false
                    end)
                end
            end
        
            Players.PlayerAdded:Connect(function(Player)
                Player.CharacterAdded:Connect(function(v)
                    if v.Name ~= Players.LocalPlayer.Name then 
                        local ESP = Drawing.new("Text")
            
                        RunService.RenderStepped:Connect(function()
                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                                local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
            
                                ESP.Size = _G.TextSize
                                ESP.Center = _G.Center
                                ESP.Outline = _G.Outline
                                ESP.OutlineColor = _G.OutlineColor
                                ESP.Color = _G.TextColor
                                ESP.Transparency = _G.TextTransparency
            
                                if OnScreen == true then
                                    local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                    local Dist = (Part1 - Part2).Magnitude
                                    ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                    ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            ESP.Visible = _G.ESPVisible
                                        else
                                            ESP.Visible = false
                                        end
                                    else
                                        ESP.Visible = _G.ESPVisible
                                    end
                                else
                                    ESP.Visible = false
                                end
                            else
                                ESP.Visible = false
                            end
                        end)
            
                        Players.PlayerRemoving:Connect(function()
                            ESP.Visible = false
                        end)
                    end
                end)
            end)
        end
        
        if _G.DefaultSettings == true then
            _G.TeamCheck = false
            _G.ESPVisible = true
            _G.TextColor = Color3.fromRGB(40, 90, 255)
            _G.TextSize = 14
            _G.Center = true
            _G.Outline = false
            _G.OutlineColor = Color3.fromRGB(0, 0, 0)
            _G.DisableKey = Enum.KeyCode.Q
            _G.TextTransparency = 0.75
        end
        
        UserInputService.TextBoxFocused:Connect(function()
            Typing = true
        end)
        
        UserInputService.TextBoxFocusReleased:Connect(function()
            Typing = false
        end)
        
        
        local Success, Errored = pcall(function()
            CreateESP()
        end)
        
        if Success and not Errored then
            if _G.SendNotifications == true then
            end
        elseif Errored and not Success then
            if _G.SendNotifications == true then
            end
            TestService:Message("The ESP script has errored, please notify Exunys with the following information :")
            warn(Errored)
            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
        end


    end
 })

 local Esp = espTab:CreateToggle({
    Name = "Box Playeur",
    Callback = function()
        

        local function API_Check()
            if Drawing == nil then
                return "No"
            else
                return "Yes"
            end
        end
        
        local Find_Required = API_Check()
        
        if Find_Required == "No" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "Boxes script could not be loaded because your exploit is unsupported.";
                Duration = math.huge;
                Button1 = "OK"
            })
        
            return
        end
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Camera = workspace.CurrentCamera
        
        local Typing = false
        
        _G.SendNotifications = true  
        _G.DefaultSettings = false  
        
        _G.TeamCheck = false  
        
        _G.BoxesVisible = true  
        _G.LineColor = Color3.fromRGB(255, 41, 41)   
        _G.LineThickness = 1  
        _G.LineTransparency = 0.7   
        _G.SizeIncrease = 1  
        
        _G.DisableKey = Enum.KeyCode.Q  



        local function CreateBoxes()
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= Players.LocalPlayer.Name then
                    local TopLeftLine = Drawing.new("Line")
                    local TopRightLine = Drawing.new("Line")
                    local BottomLeftLine = Drawing.new("Line")
                    local BottomRightLine = Drawing.new("Line")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 
                            TopLeftLine.Thickness = _G.LineThickness
                            TopLeftLine.Transparency = _G.LineTransparency
                            TopLeftLine.Color = _G.LineColor
        
                            TopRightLine.Thickness = _G.LineThickness
                            TopRightLine.Transparency = _G.LineTransparency
                            TopRightLine.Color = _G.LineColor
        
                            BottomLeftLine.Thickness = _G.LineThickness
                            BottomLeftLine.Transparency = _G.LineTransparency
                            BottomLeftLine.Color = _G.LineColor
        
                            BottomRightLine.Thickness = _G.LineThickness
                            BottomRightLine.Transparency = _G.LineTransparency
                            BottomRightLine.Color = _G.LineColor
                            
                            local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease
        
                            local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                            local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                            local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
                            local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
        
                            if TopLeftVisible == true then
                                TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        TopLeftLine.Visible = _G.BoxesVisible
                                    else
                                        TopLeftLine.Visible = false
                                    end
                                else
                                    TopLeftLine.Visible = _G.BoxesVisible
                                end
                            else
                                TopLeftLine.Visible = false
                            end
        
                            if TopRightVisible == true and _G.BoxesVisible == true then
                                TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        TopRightLine.Visible = _G.BoxesVisible
                                    else
                                        TopRightLine.Visible = false
                                    end
                                else
                                    TopRightLine.Visible = _G.BoxesVisible
                                end
                            else
                                TopRightLine.Visible = false
                            end
        
                            if BottomLeftVisible == true and _G.BoxesVisible == true then
                                BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        BottomLeftLine.Visible = _G.BoxesVisible
                                    else
                                        BottomLeftLine.Visible = false
                                    end
                                else
                                    BottomLeftLine.Visible = _G.BoxesVisible
                                end
                            else
                                BottomLeftLine.Visible = false
                            end
        
                            if BottomRightVisible == true and _G.BoxesVisible == true then
                                BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        BottomRightLine.Visible = _G.BoxesVisible
                                    else
                                        BottomRightLine.Visible = false
                                    end
                                else
                                    BottomRightLine.Visible = _G.BoxesVisible
                                end
                            else
                                BottomRightLine.Visible = false
                            end
                        else
                            TopRightLine.Visible = false
                            TopLeftLine.Visible = false
                            BottomLeftLine.Visible = false
                            BottomRightLine.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        TopRightLine.Visible = false
                        TopLeftLine.Visible = false
                        BottomLeftLine.Visible = false
                        BottomRightLine.Visible = false
                    end)
                end
            end
        
            Players.PlayerAdded:Connect(function(Player)
                Player.CharacterAdded:Connect(function(v)
                    if v.Name ~= Players.LocalPlayer.Name then
                        local TopLeftLine = Drawing.new("Line")
                        local TopRightLine = Drawing.new("Line")
                        local BottomLeftLine = Drawing.new("Line")
                        local BottomRightLine = Drawing.new("Line")
            
                        RunService.RenderStepped:Connect(function()
                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 
                                TopLeftLine.Thickness = _G.LineThickness
                                TopLeftLine.Transparency = _G.LineTransparency
                                TopLeftLine.Color = _G.LineColor
            
                                TopRightLine.Thickness = _G.LineThickness
                                TopRightLine.Transparency = _G.LineTransparency
                                TopRightLine.Color = _G.LineColor
            
                                BottomLeftLine.Thickness = _G.LineThickness
                                BottomLeftLine.Transparency = _G.LineTransparency
                                BottomLeftLine.Color = _G.LineColor
            
                                BottomRightLine.Thickness = _G.LineThickness
                                BottomRightLine.Transparency = _G.LineTransparency
                                BottomRightLine.Color = _G.LineColor
                                
                                local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease
            
                                local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                                local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                                local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
                                local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
            
                                if TopLeftVisible == true then
                                    TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                    TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            TopLeftLine.Visible = _G.BoxesVisible
                                        else
                                            TopLeftLine.Visible = false
                                        end
                                    else
                                        TopLeftLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    TopLeftLine.Visible = false
                                end
            
                                if TopRightVisible == true and _G.BoxesVisible == true then
                                    TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                    TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            TopRightLine.Visible = _G.BoxesVisible
                                        else
                                            TopRightLine.Visible = false
                                        end
                                    else
                                        TopRightLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    TopRightLine.Visible = false
                                end
            
                                if BottomLeftVisible == true and _G.BoxesVisible == true then
                                    BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                    BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            BottomLeftLine.Visible = _G.BoxesVisible
                                        else
                                            BottomLeftLine.Visible = false
                                        end
                                    else
                                        BottomLeftLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    BottomLeftLine.Visible = false
                                end
            
                                if BottomRightVisible == true and _G.BoxesVisible == true then
                                    BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                    BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            BottomRightLine.Visible = _G.BoxesVisible
                                        else
                                            BottomRightLine.Visible = false
                                        end
                                    else
                                        BottomRightLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    BottomRightLine.Visible = false
                                end
                            else
                                TopRightLine.Visible = false
                                TopLeftLine.Visible = false
                                BottomLeftLine.Visible = false
                                BottomRightLine.Visible = false
                            end
                        end)
            
                        Players.PlayerRemoving:Connect(function()
                            TopRightLine.Visible = false
                            TopLeftLine.Visible = false
                            BottomLeftLine.Visible = false
                            BottomRightLine.Visible = false
                        end)
                    end
                end)
            end)
        end
        
        if _G.DefaultSettings == true then
            _G.TeamCheck = false
            _G.BoxesVisible = true
            _G.LineColor = Color3.fromRGB(40, 90, 255)
            _G.LineThickness = 1
            _G.LineTransparency = 0.5
            _G.SizeIncrease = 1.5
            _G.DisableKey = Enum.KeyCode.Q
        end
        
        UserInputService.TextBoxFocused:Connect(function()
            Typing = true
        end)
        
        UserInputService.TextBoxFocusReleased:Connect(function()
            Typing = false
        end)
    
        
        local Success, Errored = pcall(function()
            CreateBoxes()
        end)
        
        if Success and not Errored then
            if _G.SendNotifications == true then
            end
        elseif Errored and not Success then
            if _G.SendNotifications == true then
            end
            TestService:Message("The boxes script has errored, please notify Exunys with the following information :")
            warn(Errored)
            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
        end



    end
 })
