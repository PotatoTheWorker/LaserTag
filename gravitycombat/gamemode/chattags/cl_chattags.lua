tags = {
    {"noobieequipped", "Newbie", Color(102, 255, 0), Color(0, 0, 0), Color(0, 0, 0)},
    {"whatareyoudoingbroequipped", "Sex is a Myth", Color(0, 155, 0), Color(155, 0, 0), Color(0, 0, 155)},
    {"beginnerequipped", "Beginner", Color(83, 136, 156), Color(41, 68, 78), Color(41, 68, 78)},
    {"intermediateequipped", "Intermediate", Color(4, 108, 84), Color(2, 54, 41), Color(2, 54, 41)},
    {"proequipped", "Pro", Color(231, 92, 35), Color(35, 174, 231), Color(35, 174, 231)},
    {"expertequipped", "Expert", Color(105, 1, 4), Color(63, 0, 2), Color(63, 0, 2)},
    {"godlyequipped", "Godly", Color(255, 255, 255), Color(230, 185, 8), Color(230, 185, 8)},
    {"persistentequipped", "Persistent", Color(82, 160, 74), Color(82, 160, 74), Color(82, 160, 74)},
    {"nolifeequipped", "No Life", Color(205, 208, 228), Color(205, 208, 228), Color(205, 208, 228)},
    {"bugsquasherequipped", "Bug Squasher", Color(132, 167, 0), Color(65, 83, 0), Color(63, 83, 0)},
    {"ultimatenouequipped", "Ultimate No U", Color(249, 142, 255), Color(251, 198, 255), Color(251, 198, 255)},
    {"sk8terboi69equipped", "Sk8terBoi69", Color(46, 70, 147), Color(72, 84, 121), Color(72, 84, 121)},
    {"bigpairequipped", "Big Pair", Color(103, 225, 211), Color(163, 237, 228), Color(163, 237, 228)},
    {"therisendongequipped", "The Risen Dong", Color(98, 13, 146), Color(0, 0, 0), Color(75, 75, 75)},
    {"serversexequipped", "Servers Ex", Color(255, 0, 0), Color(0, 0, 0), Color(0, 0, 0)},
    {"thorsbanhammerequipped", "Thors Ban Hammer", Color(255, 95, 0), Color(255, 95, 0), Color(255, 95, 0)}
}

hook.Add("OnPlayerChat", "retard", function(ply, strText, bTeamOnly)
    if IsValid(ply) and ply:IsPlayer() then
        for k, v in pairs(tags) do
            if (ply:GetNWInt(v[1]) == 1) then
                local nickteam = team.GetColor(ply:Team())
                if !bTeamOnly then
                    chat.AddText(v[4], "[", v[3], v[2], v[5], "] ", nickteam, ply, Color(255, 255, 255), ": ", strText)
                    return true
                else
                    chat.AddText(v[4], "[", v[3], v[2], v[5], "] ", nickteam, "(TEAM) ", ply, Color(255, 255, 255), ": ", strText)
                    return true
                end
            end
        end
    end

    if !IsValid(ply) and !ply:IsPlayer() then
        local ConsoleColor = Color(0, 255, 0)
        chat.AddText(ConsoleColor, "Console", Color(255, 255, 255), ": ", strText)
        return true
    end
end)