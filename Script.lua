-- Script Jesús Completo para Roblox (Delta)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- 1. Notificación de Inicio
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Jesús";
    Text = "¡Menú Completo Activado!";
    Duration = 5;
})

-- 2. Anti-AFK (Evita que el juego te saque por inactividad)
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
end)

-- 3. Velocidad y Salto Aumentados
local function applyStats()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 50
        LocalPlayer.Character.Humanoid.JumpPower = 120
    end
end
applyStats()
LocalPlayer.CharacterAdded:Connect(applyStats)

-- 4. Noclip (Atravesar paredes)
RunService.Stepped:Connect(function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 5. X-Ray (Ver a través de paredes/bloques)
for _, object in pairs(Workspace:GetDescendants()) do
    if object:IsA("BasePart") and not object:IsDescendantOf(LocalPlayer.Character) then
        object.LocalTransparencyModifier = 0.5
    end
end

-- 6. Función de Teleport (TP a otro jugador)
_G.TP = function(playerName)
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower():sub(1, #playerName) == playerName:lower() then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

print("Script Jesús cargado con éxito: Velocidad, Noclip, X-Ray, Anti-AFK y TP listos.")
