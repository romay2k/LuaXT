local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local camera = workspace.CurrentCamera
local CoreGui = game.CoreGui
local ESPenabled = true
local espTransparency = 0.5

-- Remover qualquer rotação anterior
for _, v in pairs(humanoidRootPart:GetChildren()) do
	if v:IsA("BodyAngularVelocity") then
		v:Destroy()
	end
end

-- Adicionar rotação infinita no eixo Y
local spin = Instance.new("BodyAngularVelocity")
spin.Name = "Spinning"
spin.Parent = humanoidRootPart
spin.MaxTorque = Vector3.new(0, math.huge, 0) -- Permite rotação infinita no eixo Y
spin.AngularVelocity = Vector3.new(0, 40, 0) -- Velocidade de rotação (ajuste conforme necessário)





-- ESP
-- Função para obter o RootPart do personagem
local colourTable = {
	Green = Color3.fromRGB(0, 255, 0),
	Blue = Color3.fromRGB(0, 0, 255),
	Red = Color3.fromRGB(255, 0, 0),
	Yellow = Color3.fromRGB(255, 255, 0),
	Orange = Color3.fromRGB(255, 165, 0),
	Purple = Color3.fromRGB(128, 0, 128)
}
local colourChosen = colourTable.Blue -- Change "Red" to whatever colour you like from the table above, feel free to add other colours as well.
_G.ESPToggle = true -- This is the variable used for enabling/disabling ESP. If you are using a GUI library, or your own custom GUI, then set this variable to the callback function. 

-- Services and lp
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")



local function getCharacter(player)
	return Workspace:FindFirstChild(player.Name)
end

-- Add highlights to players
local function addHighlightToCharacter(player, character)
	if player == LocalPlayer then return end  -- Skip local player
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart and not humanoidRootPart:FindFirstChild("Highlight") then
		local highlightClone = Instance.new("Highlight")  -- Create a new Highlight instance
		highlightClone.Name = "Highlight"
		highlightClone.Adornee = character
		highlightClone.Parent = humanoidRootPart
		highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlightClone.FillColor = colourChosen
		highlightClone.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlightClone.FillTransparency = 0.5
	end
end

-- Remove highlights from player
local function removeHighlightFromCharacter(character)
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart then
		local highlightInstance = humanoidRootPart:FindFirstChild("Highlight")
		if highlightInstance then
			highlightInstance:Destroy()
		end
	end
end

-- Function to update highlights based on the value of _G.ESPToggle
local function updateHighlights()
	for _, player in pairs(Players:GetPlayers()) do
		local character = getCharacter(player)
		if character then
			if _G.ESPToggle then
				addHighlightToCharacter(player, character)
			else
				removeHighlightFromCharacter(character)
			end
		end
	end
end

-- Connect events through RenderStepped to loop
RunService.RenderStepped:Connect(function()
	updateHighlights()
end)

-- Add highlight to joining players
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		if _G.ESPToggle then
			addHighlightToCharacter(player, character)
		end
	end)
end)

-- Remove highlights from leaving players
Players.PlayerRemoving:Connect(function(playerRemoved)
	local character = playerRemoved.Character
	if character then
		removeHighlightFromCharacter(character)
	end
end)

-- The following code may be deleted if you are using a custom GUI library. 










--AngleDowm
-- @ttwiz_z


--// Configuration

local ShowNotifications = false
local AimKey = Enum.KeyCode.LeftShift
local AimPart = "Head"
local TeamCheck = true
local ESP = true
local TriggerDistance = 99999
local triggerbot = true

--// Services

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")

--// Constants

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Camera = workspace.CurrentCamera

--// Fields

local Aiming = false
local Target = nil



--// Binding Key

UserInputService.InputBegan:Connect(function(Input)
	if not UserInputService:GetFocusedTextBox() and Input.KeyCode == AimKey and not Aiming then
		Aiming = true
	end
end)

UserInputService.InputEnded:Connect(function(Input)
	if not UserInputService:GetFocusedTextBox() and Input.KeyCode == AimKey and Aiming then
		Aiming = false
		Target = nil
	end
end)


--// Checking Target

local function IsReady(Target)
	if Target and Target:FindFirstChildWhichIsA("Humanoid") and Target:FindFirstChildWhichIsA("Humanoid").Health > 0 and not Target:FindFirstChildWhichIsA("ForceField") and Target:FindFirstChild(AimPart) then
		if TeamCheck and Players:GetPlayerFromCharacter(Target).TeamColor == Player.TeamColor then
			return false
		end
		return true, Target, Target:FindFirstChild(AimPart)
	else
		return false
	end
end


--// String Generation

local function GenerateString()
	return string.lower(string.reverse(string.sub(HttpService:GenerateGUID(false), 1, 8)))
end


--// ESP Creation

local function CreateESP(Character)
	if ESP and not Character:FindFirstChildWhichIsA("SelectionBox") then
		local Hitbox = Instance.new("SelectionBox", Character)
		task.spawn(function()
			while task.wait() do
				for Index = 1, 230 do
					if not Character:FindFirstChildWhichIsA("SelectionBox") then
						break
					elseif Target ~= Character then
						Debris:AddItem(Hitbox, 0)
						break
					end
					Hitbox.Name = GenerateString()
					Hitbox.Color3 = Color3.fromHSV(Index / 230, 1, 1)
					task.wait()
				end
			end
		end)
		Hitbox.LineThickness = 0.05
		Hitbox.Adornee = Character
	end
end


--// Aimbot Loop

RunService.RenderStepped:Connect(function()
	pcall(function()
		if Aiming then
			
			for _, _Player in next, Players:GetPlayers() do
				local IsCharacterReady, Character, Part = IsReady(_Player.Character)
				if _Player ~= Player and IsCharacterReady then
					local Vector, IsInViewport = Camera:WorldToViewportPoint(Part.Position)
					if IsInViewport then
						local Magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).Magnitude
						if Magnitude < TriggerDistance and not Target then
							Target = Character
							CreateESP(Target)
						end
					end
				end
			end
			local IsTargetReady, self, Part = IsReady(Target)
			if IsTargetReady then
				Camera.CFrame = CFrame.new(Camera.CFrame.Position, Part.Position)
			else
				Target = nil
			end
		end
	end)
end)


