- Script Jesús con Mini Panel Móvil
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local NoclipBtn = Instance.new("TextButton")
local XRayBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "JesúsPanel"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 200, 0, 220)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Script Jesús"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Botón Velocidad
SpeedBtn.Parent = Frame
SpeedBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
SpeedBtn.Size = UDim2.new(0.8, 0, 0, 35)
SpeedBtn.Text = "Velocidad: OFF"
SpeedBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local speedOn = false
SpeedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    if speedOn then
        SpeedBtn.Text = "Velocidad: ON"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 60
    else
        SpeedBtn.Text = "Velocidad: OFF"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

-- Botón Noclip
NoclipBtn.Parent = Frame
NoclipBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
NoclipBtn.Size = UDim2.new(0.8, 0, 0, 35)
NoclipBtn.Text = "Noclip: OFF"
NoclipBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local noclipOn = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    NoclipBtn.Text = noclipOn and "Noclip: ON" or "Noclip: OFF"
    NoclipBtn.BackgroundColor3 = noclipOn and Color3.fromRGB(40, 150, 40) or Color3.fromRGB(150, 40, 40)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipOn and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Botón Cerrar/Abrir
CloseBtn.Parent = Frame
CloseBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
CloseBtn.Size = UDim2.new(0.8, 0, 0, 35)
CloseBtn.Text = "Cerrar Panel"
CloseBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

CloseBtn.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)
