-- Script Jesús con Mini Panel Flotante
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Script Jesús", "DarkTheme")

-- Tab Principal
local MainTab = Window:NewTab("Funciones")
local MainSection = MainTab:NewSection("Controles")

-- Variables de Estado
local NoclipActive = false
local XRayActive = false

-- 1. Velocidad
MainSection:NewSlider("Velocidad", "Ajusta tu velocidad", 100, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

-- 2. Salto
MainSection:NewSlider("Salto", "Ajusta la fuerza de salto", 200, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

-- 3. Noclip (On / Off)
MainSection:NewToggle("Noclip (Paredes)", "Atraviesa paredes", function(state)
    NoclipActive = state
end)

game:GetService("RunService").Stepped:Connect(function()
    if NoclipActive and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 4. X-Ray (On / Off)
MainSection:NewToggle("X-Ray (Transparencia)", "Ver a través de paredes", function(state)
    XRayActive = state
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") and not object:IsDescendantOf(game.Players.LocalPlayer.Character) then
            object.LocalTransparencyModifier = XRayActive and 0.5 or 0
        end
    end
end)

-- 5. Anti-AFK (Siempre activo)
local VirtualUser = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Notificación
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Jesús";
    Text = "¡Mini Panel Cargado!";
    Duration = 5;
})
