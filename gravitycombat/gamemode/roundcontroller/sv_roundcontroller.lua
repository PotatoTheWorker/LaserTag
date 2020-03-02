local round_type = 0
local juggernaut = 0
util.AddNetworkString("UpdateRoundType")

function preRoundStuff(ply)
    round_type = math.random(1, 6)
    roundSelector()
    if (round_type ~= 0) then return end
end

function roundSelector()
    if (round_type == 1) then
        teamDeathMatch()
    elseif (round_type == 2) then
        oneInTheChamber()
    elseif (round_type == 3) then
        juggernaut()
    elseif (round_type == 4) then
        singleLifeModeFFA()
    elseif (round_type == 5) then
        singleLifeModeTDM()
    elseif (round_type == 6) then
        freeForAll()
    end
end

function preRoundRound(ply)
    for k, v in ipairs(player.GetAll()) do
        v:StripWeapons()
        v:StripAmmo()
        v:GodEnable()
    end

    round_type = 0
end

function teamDeathMatch(ply)
    for k, v in ipairs(player.GetAll()) do
        v:SetTeam(math.random(2, 5))
        v:Spawn()
        v:GiveAmmo(9999, "pistol", true)
    end

    print("TDM")
end

function oneInTheChamber(ply)
    for k, v in ipairs(player.GetAll()) do
        v:SetTeam(8)
        v:Spawn()
        v:SetAmmo(0, "pistol")
    end

    print("OITC")
end

function juggernaut(ply)
    local chosen = table.Random(player.GetAll())

    for k, v in ipairs(player.GetAll()) do
        v:SetTeam(7)
        v:Spawn()
        v:GiveAmmo(9999, "pistol", true)
    end

    chosen:SetTeam(6)
    chosen:Spawn()
    chosen:GiveAmmo(9999, "pistol", true)
    print("Jugg")
end

function singleLifeModeFFA(ply)
    for k, v in ipairs(player.GetAll()) do
        v:SetTeam(8)
        v:Spawn()
        v:GiveAmmo(9999, "pistol", true)
    end

    print("SLMFFA")
end

function singleLifeModeTDM(ply)
    for k, v in ipairs(player.GetAll()) do
        v:SetTeam(math.random(2, 5))
        v:Spawn()
        v:GiveAmmo(9999, "pistol", true)
    end

    print("SLMTDM")
end

function freeForAll(ply)
    for k, v in ipairs(player.GetAll()) do
        v:SetTeam(8)
        v:Spawn()
        v:GiveAmmo(9999, "pistol", true)
    end

    print("FFA")
end

function getRoundType()
    return round_type
end

function sendClientRoundType()
    net.Start("UpdateRoundType")
    net.WriteInt(round_type, 4)
    net.Broadcast()
end