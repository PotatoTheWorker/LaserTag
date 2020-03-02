AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_hud.lua")
include("shared.lua")
-- include other scripts
AddCSLuaFile("roundcontroller/cl_roundcontroller.lua")
AddCSLuaFile("pointsystem/pointsystem.lua")
include("roundcontroller/sv_roundcontroller.lua")
include("livescontroller/livescontroller.lua")
include("playerstats.lua")
local round_type = 0
local player_amount = 0
local roundtime = 0
local lobbytime = 0
local id = 0

util.AddNetworkString("sendToServer")
util.AddNetworkString("UpdateRoundType")


net.Receive("UpdateRoundType", function(len)
    round_type = net.ReadInt(4)
end)

net.Receive("sendToServer", function(len, ply)
    id = tonumber(net.ReadInt(5))
    if (id == 1) and (tonumber(ply:GetNWInt("points")) >= tonumber(ply:GetNWInt("livesprice"))) then -- lives
        if (tonumber(ply:GetNWInt("livesupgradeamount")) == 4) then return end
        ply:SetNWInt("lives", math.Clamp(ply:GetNWInt("lives") + 1, 0, 7))
        ply:SetNWInt("staticlives", math.Clamp(ply:GetNWInt("staticlives") + 1, 0, 7))
        ply:SetNWInt("points", ply:GetNWInt("points") - ply:GetNWInt("livesprice"))
        ply:SetNWInt("livesprice", math.Clamp(ply:GetNWInt("livesprice") + 250, 0, 1250))
        ply:SetNWInt("livesupgradeamount", math.Clamp(ply:GetNWInt("livesupgradeamount") + 1, 0, 4))
        ply:SetNWInt("livesupgradebarwidth", math.Clamp(ply:GetNWInt("livesupgradebarwidth") + 62.5, 0, 250))
    elseif (id == 2) and (tonumber(ply:GetNWInt("points")) >= tonumber(ply:GetNWInt("shieldprice"))) then -- shield
        if (tonumber(ply:GetNWInt("shieldupgradeamount")) == 3) then return end
        ply:SetNWInt("shield-lives", math.Clamp(ply:GetNWInt("shield-lives") + 1, 0, 3))
        ply:SetNWInt("staticshield-lives", math.Clamp(ply:GetNWInt("staticshield-lives") + 1, 0, 3))
        ply:SetNWInt("points", ply:GetNWInt("points") - ply:GetNWInt("shieldprice"))
        ply:SetNWInt("shieldprice", math.Clamp(ply:GetNWInt("shieldprice") + 1200, 0, 4800))
        ply:SetNWInt("shieldupgradeamount", math.Clamp(ply:GetNWInt("shieldupgradeamount") + 1, 0, 3))
        ply:SetNWInt("shieldupgradebarwidth", math.Clamp(ply:GetNWInt("shieldupgradebarwidth") + 83.3, 0, 250))
    elseif (id == 3) and (tonumber(ply:GetNWInt("points")) >= tonumber(ply:GetNWInt("movementprice"))) then -- movement speed
        if (tonumber(ply:GetNWInt("movementupgradeamount")) == 4) then return end
        ply:SetNWInt("walkspeed", math.Clamp(ply:GetNWInt("walkspeed") + 25, 0, 300))
        ply:SetNWInt("runspeed", math.Clamp(ply:GetNWInt("runspeed") + 25, 0, 450))
        ply:SetNWInt("points", ply:GetNWInt("points") - ply:GetNWInt("movementprice"))
        ply:SetNWInt("movementprice", math.Clamp(ply:GetNWInt("movementprice") + 300, 0, 2250))
        ply:SetNWInt("movementupgradeamount", math.Clamp(ply:GetNWInt("movementupgradeamount") + 1, 0, 4))
        ply:SetNWInt("movementupgradebarwidth", math.Clamp(ply:GetNWInt("movementupgradebarwidth") + 62.5, 0, 250))
    elseif (id == 4) and (tonumber(ply:GetNWInt("points")) >= tonumber(ply:GetNWInt("jumpheightprice")))then -- jump height
        if (tonumber(ply:GetNWInt("jumpheightupgradeamount")) == 4) then return end
        ply:SetNWInt("jumpheight", math.Clamp(ply:GetNWInt("jumpheight") + 40, 0, 360))
        ply:SetNWInt("points", ply:GetNWInt("points") - ply:GetNWInt("jumpheightprice"))
        ply:SetNWInt("jumpheightprice", math.Clamp(ply:GetNWInt("jumpheightprice") + 450, 0, 3000))
        ply:SetNWInt("jumpheightupgradeamount", math.Clamp(ply:GetNWInt("jumpheightupgradeamount") + 1, 0, 4))
        ply:SetNWInt("jumpheightupgradebarwidth", math.Clamp(ply:GetNWInt("jumpheightupgradebarwidth") + 62.5, 0, 250))
    elseif (id == 5) and (tonumber(ply:GetNWInt("points")) >= tonumber(ply:GetNWInt("pointsmultiprice"))) then -- points multiplier
        if (tonumber(ply:GetNWInt("pointsmultiupgradeamount")) == 4) then return end
        ply:SetNWInt("hit-points", math.Clamp(ply:GetNWInt("hit-points") + 1, 1, 5))
        ply:SetNWInt("kill-points", math.Clamp(ply:GetNWInt("kill-points") + 1, 2, 6))
        ply:SetNWInt("points", ply:GetNWInt("points") - ply:GetNWInt("pointsmultprice"))
        ply:SetNWInt("pointsmultiprice", math.Clamp(ply:GetNWInt("pointsmultiprice") + 2500, 0, 12500))
        ply:SetNWInt("pointsmultiupgradeamount", math.Clamp(ply:GetNWInt("pointsmultiupgradeamount") + 1, 0, 4))
        ply:SetNWInt("pointsmultiupgradebarwidth", math.Clamp(ply:GetNWInt("pointsmultiupgradebarwidth") + 62.5, 0, 250))
    end
    eid = tonumber(net.ReadInt(12))
    if (eid == 1) then
        ply:SetNWBool("noobieequipped", true)
    end
end)

function GM:PlayerConnect()
    -- stuff can go here later
end

function GM:PlayerDisconnected(ply)
    ply:StatsSave()
    ply:StatsSave()
    timer.Destroy("SetPlayTime")
    player_amount = player_amount - 1
end

function GM:PlayerInitialSpawn(ply)
    ply:StatsLoad()
    print("Player " .. ply:Name() .. " has spawned!")
    ply:SetModel("models/player/gman_high.mdl")
    timer.Create("SetPlayTime", 1, 0, function()
        ply:SetNWInt("playtime", ply:GetNWInt("playtime") + 1)
    end)

    if (round_type == 0) then
        player_amount = player_amount + 1
        if (player_amount == 5) then
            preRoundStuff()
        end
    end
end

function GM:PlayerSpawn(ply)
    ply:SetNWInt("lives", ply:GetNWInt("staticlives"))
    ply:SetNWInt("shield-lives", ply:GetNWInt("staticshield-lives"))
    ply:SetWalkSpeed(ply:GetNWInt("walkspeed"))
    ply:SetRunSpeed(ply:GetNWInt("runspeed"))
    ply:SetJumpPower(ply:GetNWInt("jumpheight"))
    ply:SetupHands()
    ply:Give("weapon_gravitypistol")
    ply:SetAmmo(99999, "pistol")
    ply:SetModel("models/player/gman_high.mdl")
end

function GM:PlayerShouldTakeDamage(victim, attacker)
    if (attacker:IsPlayer()) then
        if (victim:Team() and attacker:Team() == 8) then
            attacker:SetNWInt("points", attacker:GetNWInt("points") + attacker:GetNWInt("hit-points"))
            return true 
        end

        if (victim:Team() == attacker:Team()) then return false end

        if (victim:Team() ~= attacker:Team()) then 
            attacker:SetNWInt("points", attacker:GetNWInt("points") + attacker:GetNWInt("hit-points"))
            return true 
        end
    end
end