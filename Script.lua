-- Script Jesús para Roblox
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Notificación en pantalla
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Jesús";
    Text = "¡Script activado con éxito!";
    Duration = 5;
})

-- Mejoras de velocidad y salto
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
    LocalPlayer.Character.Humanoid.WalkSpeed = 32
    LocalPlayer.Character.Humanoid.JumpPower = 100
end

print("Script Jesús ejecutado correctamente.")

