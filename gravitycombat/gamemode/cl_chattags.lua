local bool = nil
local name = nil
local ply = LocalPlayer()

local btable = {}

btable[1] = {
    value = ply:GetNWBool("noobieequipped")
}

local ntable = {}

ntable[1] = {
    name = "[Newbie] "
}

function getBool()
    for k, v in pairs(btable) do
        bool = v.value
    end

    return bool
end

function getName()
    for k, v in pairs(ntable) do
        if (getBool()) then
            name = v.name
        end
    end

    return name
end

function GM:OnPlayerChat(ply, strText, bTeamOnly, bPlayerIsDead)
    local tagtab = {}

    if (bPlayerIsDead) then
        table.insert(tagtab, Color(255, 30, 40))
        table.insert(tagtab, "*DEAD* ")
    end

    if (getBool()) then
        table.insert(tagtab, Color(102, 255, 0))
        table.insert(tagtab, getName())
    end

    if (bTeamOnly) then
        table.insert(tagtab, Color(30, 160, 40))
        table.insert(tagtab, "(TEAM) ")
    end

    if (IsValid(ply)) then
        table.insert(tagtab, ply)
    else
        table.insert(tagtab, "Console")
    end

    table.insert(tagtab, Color(255, 255, 255))
    table.insert(tagtab, ": " .. strText)

    chat.AddText(unpack(tagtab))

    return true
end