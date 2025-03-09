game.Loaded:Connect(function()
--[[
Permanent Noclip Script for Roblox (LocalScript)
This script ensures noclip mode persists even after the character respawns.
Make sure to run this in a permitted environment where you have permission to use custom scripts.
]]

-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local isNoclipping = true -- Noclip is enabled by default

-- Function to apply noclip
local function applyNoclip()
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end

-- Apply noclip on respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    if isNoclipping then
        wait(0.1) -- Wait for the character to load fully
        applyNoclip()
    end
end)

-- Noclip loop
game:GetService("RunService").Stepped:Connect(function()
    if isNoclipping and character then
        applyNoclip()
    end
end)

-- Apply noclip initially
applyNoclip()

end)
