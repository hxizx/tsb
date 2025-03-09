game.Loaded:Connect(function()
wait(10)
-- Reference necessary services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Function to loop through tools and trigger the move
local function triggerConsoleMove()
    local Backpack = Player:WaitForChild("Backpack")
    local Character = Player.Character or Player.CharacterAdded:Wait()

    -- Loop through tools in the Backpack and Character
    for _, tool in ipairs(Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local args = {
                [1] = {
                    ["Tool"] = tool,
                    ["Goal"] = "Console Move",
                    ["ToolName"] = tool.Name
                }
            }

            -- Fire the Communicate remote event
            if Character:FindFirstChild("Communicate") then
                Character.Communicate:FireServer(unpack(args))
                
            end

            wait(0) -- Delay between each tool action
        end
    end
end

-- Start looping and triggering the move, only if player name matches
while true do
    if Player.Name == user then
        triggerConsoleMove()
    end
    wait(0) -- Delay before looping through tools again
end

end)
