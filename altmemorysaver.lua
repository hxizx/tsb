game.Loaded:Connect(function()
    local playerName = game.Players.LocalPlayer.Name
    if playerName ~= "olddyboldyl" then
        while task.wait() do
            if iswindowactive() then
                setfpscap(240)
            else
                setfpscap(5)
            end
        end
    end
end)
