wait(2)

local yourPlayer = game.Players.LocalPlayer

-- Function to outline a player
function outlinePlayers()
    local players = game.Players:GetPlayers() -- Get up-to-date player list

    for _, player in pairs(players) do
        if player ~= yourPlayer then
            local character = player.Character or workspace:FindFirstChild(player.Name)
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local parts

                if humanoid then
                    if humanoid.RigType == Enum.HumanoidRigType.R6 then
                        parts = {"Torso", "Left Arm", "Right Arm", "Head", "Left Leg", "Right Leg"}
                    elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
                        parts = {
                            "UpperTorso", "LowerTorso", "LeftUpperLeg", "RightUpperLeg", 
                            "LeftLowerLeg", "RightLowerLeg", "LeftUpperArm", "RightUpperArm", 
                            "LeftLowerArm", "RightLowerArm", "Head"
                        }
                    end
                end

                if parts then
                    for _, partName in pairs(parts) do
                        local part = character:FindFirstChild(partName)
                        if part then
                            local selectionBox = Instance.new("SelectionBox")
                            selectionBox.Adornee = part
                            selectionBox.Color3 = Color3.fromRGB(144, 72, 144)
                            selectionBox.Parent = part
                        end
                    end
                end

                wait(0.2)
            end
        end
    end
end

outlinePlayers()
