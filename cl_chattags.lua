local rvalue = nil
local name = nil
local control = 1
local ply = LocalPlayer()

local btable = {}

btable[1] = {
    value = "noobieequipped",
    name = "[Newbie] ",
    color = Color(102, 255, 0, 255)
}

btable[2] = {
    value = "whatareyoudoingbroequipped",
    name = "[What are you doing step bro???!!] ",
    color = Color(155, 0, 0, 255)
}

function GM:OnPlayerChat(ply, strText, bTeamOnly, bPlayerIsDead)
    if IsValid(ply) and ply:IsPlayer() then
        for k, v in pairs(btable) do
            if ply:GetNWInt(v.value) == 1 then
                local nickteam = team.GetColor(ply:Team())
                if !bTeamOnly then
                    chat.AddText(v.color, v.name, nickteam, ply, Color(255, 255, 255), ": ", strText)
                    return true
                else
                    chat.AddText(v.color, v.name, nickteam, "(TEAM) ", ply, Color(255, 255, 255), ": ", strText)
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
end