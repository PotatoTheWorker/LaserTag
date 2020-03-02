function GM:OnPlayerChat(ply, strText, bTeamOnly, bPlayerIsDead)
    local tagtab = {}

    if (bPlayerIsDead) then
        table.insert(tagtab, Color(255, 30, 40))
        table.insert(tagtab, "*DEAD* ")
    end

    if (bPlayerIsDead) and (ply:GetNWBool("noobieequipped") == true) then
        table.insert(tagtab, Color(255, 30, 40))
        table.insert(tagtab, "*DEAD* ")
        table.insert(tagtab, Color(102, 255, 0))
        table.insert(tagtab, "[NEWBIE] ")
    end

    if (bTeamOnly) then
        table.insert(tab, Color(30, 160, 40))
        table.insert(tab, "(TEAM) ")
    end

    if (IsValid(player)) then
        table.insert(tab, ply)
    else
        table.insert(tab, "Console")
    end

    table.insert(tab, Color(255, 255, 255))
    table.insert(tab, ": " .. strText)

    chat.AddText(unpack(tab))

    return true
end