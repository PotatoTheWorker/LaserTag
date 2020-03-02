-- can be zero = cbz
local ply = FindMetaTable("Player")
cbzstats = {}

cbzstats[1] = {
    name = "SPoints",
    fallback = 100,
    iname = "points"
}

cbzstats[2] = {
    name = "SStaticShield-Lives",
    fallback = 0,
    iname = "staticshield-lives"
}

cbzstats[3] = {
    name = "SLivesUpgradeAmount",
    fallback = 0,
    iname = "livesupgradeamount"
}

cbzstats[4] = {
    name = "SLivesUpgradeBarWidth",
    fallback = 0,
    iname = "livesupgradebarwidth"
}

cbzstats[5] = {
    name = "SShieldUpgradeAmount",
    fallback = 0,
    iname = "shieldupgradeamount"
}

cbzstats[6] = {
    name = "SShieldUpgradeBarWidth",
    fallback = 0,
    iname = "shieldupgradebarwidth"
}

cbzstats[7] = {
    name = "SMovementUpgradeAmount",
    fallback = 0,
    iname = "movementupgradeamount"
}

cbzstats[8] = {
    name = "SMovementUpgradeBarWidth",
    fallback = 0,
    iname = "movementupgradebarwidth"
}

cbzstats[9] = {
    name = "SJumpHeightUpgradeAmount",
    fallback = 0,
    iname = "jumpheightupgradeamount"
}

cbzstats[10] = {
    name = "SJumpHeightUpgradeBarWidth",
    fallback = 0,
    iname = "jumpheightupgradebarwidth"
}

cbzstats[11] = {
    name = "SPointsMultiUpgradeAmount",
    fallback = 0,
    iname = "pointsmultiupgradeamount"
}

cbzstats[12] = {
    name = "SPointsMultiUpgradeBarWidth",
    fallback = 0,
    iname = "pointsmultiupgradebarwidth"
}

cbzstats[13] = {
    name = "SPlayTime",
    fallback = 0,
    iname = "playtime"
}

regstats = {}

regstats[1] = {
    name = "SStaticLives",
    fallback = 3,
    iname = "staticlives"
}

regstats[2] = {
    name = "SWalkSpeed",
    fallback = 200,
    iname = "walkspeed"
}

regstats[3] = {
    name = "SRunSpeed",
    fallback = 350,
    iname = "runspeed"
}

regstats[4] = {
    name = "SJumpHeight",
    fallback = 200,
    iname = "jumpheight"
}

regstats[5] = {
    name = "SHit-Points",
    fallback = 1,
    iname = "hit-points"
}

regstats[6] = {
    name = "SKill-Points",
    fallback = 2,
    iname = "kill-points"
}

regstats[7] = {
    name = "SLivesPrice",
    fallback = 250,
    iname = "livesprice"
}

regstats[8] = {
    name = "SShieldPrice",
    fallback = 1200,
    iname = "shieldprice"
}

regstats[9] = {
    name = "SMovementPrice",
    fallback = 450,
    iname = "movementprice"
}

regstats[10] = {
    name = "SJumpHeightPrice",
    fallback = 600,
    iname = "jumpheightprice"
}

regstats[11] = {
    name = "SPointsMultiPrice",
    fallback = 2500,
    iname = "pointsmultiprice"
}

tagbools = {}

tagbools[1] = {
    name = "SNoobieUnlocked",
    fallback = true,
    iname = "noobieunlocked"
}

function ply:StatsSetup(key, val)
    key = string.format("%s[%s]", self:SteamID(), key)

    cookie.Set(key, val)
end

function ply:StatsSetupRetrival(key, default)
    key = string.format("%s[%s]", self:SteamID(), key)

    return cookie.GetString(key, default)
end

function ply:StatsSave(key, val)
    for k, v in pairs(cbzstats) do
        self:StatsSetup(v.name, self:GetNWInt(v.iname))
    end

    for k, v in pairs(regstats) do
        self:StatsSetup(v.name, self:GetNWInt(v.iname))
    end

    for k, v in pairs(tagbools) do
        self:StatsSetup(v.name, self:GetNWBool(v.iname))
    end
end

function ply:StatsLoad()
    for k, v in pairs(cbzstats) do
        if (self:StatsSetupRetrival(v.name) == nil) then
            self:StatsSetup(v.name, self:GetNWInt(v.iname))
            self:SetNWInt(v.iname, self:StatsSetupRetrival(v.name) + v.fallback)
        else
            self:SetNWInt(v.iname, self:StatsSetupRetrival(v.name))
        end
    end

    for k, v in pairs(regstats) do
        if (self:StatsSetupRetrival(v.name) == nil) then
            self:StatsSetup(v.name, self:GetNWInt(v.iname))
            self:SetNWInt(v.iname, self:StatsSetupRetrival(v.name) + v.fallback)
        else
            self:SetNWInt(v.iname, self:StatsSetupRetrival(v.name))
        end
    end

    for k, v in pairs(tagbools) do
        if (self:StatsSetupRetrival(v.name) == nil) then
            self:StatsSetup(v.name, v.fallback)
            self:SetNWBool(v.iname, self:StatsSetupRetrival(v.name))
        else
            self:SetNWBool(v.iname, self:StatsSetupRetrival(v.name))
        end
        print(self:StatsSetupRetrival(v.name))
    end
end