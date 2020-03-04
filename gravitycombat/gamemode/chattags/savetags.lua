local ply = FindMetaTable("Player")
tagbools = {}

tagbools[1] = {
    name = "SNoobieUnlocked",
    fallback = 1,
    iname = "noobieunlocked"
}

tagbools[2] = {
    name = "SWhatAreYouDoingStepBroUnlocked",
    fallback = 0,
    iname = "whatareyoudoingbrounlocked"
}

tagbools[3] = {
    name = "SBeginnerUnlocked",
    fallback = 0,
    iname = "beginnerunlocked"
}

tagbools[4] = {
    name = "SIntermediateUnlocked",
    fallback = 0,
    iname = "intermediateunlocked"
}

tagbools[5] = {
    name = "SProUnlocked",
    fallback = 0,
    iname = "prounlocked"
}

tagbools[6] = {
    name = "SExpertUnlocked",
    fallback = 0,
    iname = "expertunlocked"
}

tagbools[7] = {
    name = "SGodlyUnlocked",
    fallback = 0,
    iname = "godlyunlocked"
}

tagbools[8] = {
    name = "SPersistentUnlocked",
    fallback = 0,
    iname = "persistentunlocked"
}

tagbools[9] = {
    name = "SNoLifeUnlocked",
    fallback = 0,
    iname = "nolifeunlocked"
}

tagbools[10] = {
    name = "SBugSquasherUnlocked",
    fallback = 0,
    iname = "bugsquasherunlocked"
}

tagbools[11] = {
    name = "SUltimateNoUUnlocked",
    fallback = 0,
    iname = "ultimatenouunlocked"
}

tagbools[12] = {
    name = "SSk8terBoi69Unlocked",
    fallback = 0,
    iname = "sk8terboi69unlocked"
}

tagbools[13] = {
    name = "SBigPairUnlocked",
    fallback = 0,
    iname = "bigpairunlocked"
}

tagbools[14] = {
    name = "STheRisenDongUnlocked",
    fallback = 0,
    iname = "therisendongunlocked"
}

tagbools[15] = {
    name = "SServersExUnlocked",
    fallback = 0,
    iname = "serversexunlocked"
}

tagbools[16] = {
    name = "SThorsBanHammerUnlocked",
    fallback = 0,
    iname = "thorsbannhammerunlocked"
}

equippedtags = {}

equippedtags[1] = {
    name = "SnoobieEquipped",
    fallback = 1,
    iname = "noobieequipped"
}

equippedtags[2] = {
    name = "SWhatAreYouDoingStepBroEquipped",
    fallback = 0,
    iname = "whatareyoudoingbroequipped"
}

equippedtags[3] = {
    name = "SBeginnerEquipped",
    fallback = 0,
    iname = "beginnerequipped"
}

equippedtags[4] = {
    name = "SIntermediateEquipped",
    fallback = 0,
    iname = "intermediateequipped"
}

equippedtags[5] = {
    name = "SProEquipped",
    fallback = 0,
    iname = "proequipped"
}

equippedtags[6] = {
    name = "SExpertEquipped",
    fallback = 0,
    iname = "expertequipped"
}

equippedtags[7] = {
    name = "SGodlyEquipped",
    fallback = 0,
    iname = "godlyequipped"
}

equippedtags[8] = {
    name = "SPersistentEquipped",
    fallback = 0,
    iname = "persistentequipped"
}

equippedtags[9] = {
    name = "SNoLifeEquipped",
    fallback = 0,
    iname = "nolifeequipped"
}

equippedtags[10] = {
    name = "SBugSquasherEquipped",
    fallback = 0,
    iname = "bugsquasherequipped"
}

equippedtags[11] = {
    name = "SUltimateNoUEquipped",
    fallback = 0,
    iname = "ultimatenouequipped"
}

equippedtags[12] = {
    name = "SSk8terBoi69Equipped",
    fallback = 0,
    iname = "sk8terboi69equipped"
}

equippedtags[13] = {
    name = "SBigPairEquipped",
    fallback = 0,
    iname = "bigpairequipped"
}

equippedtags[14] = {
    name = "STheRisenDongEquipped",
    fallback = 0,
    iname = "therisendongequipped"
}

equippedtags[15] = {
    name = "SServersExEquipped",
    fallback = 0,
    iname = "serversexequipped"
}

equippedtags[16] = {
    name = "SThorsBanHammerEquipped",
    fallback = 0,
    iname = "thorsbannhammerequipped"
}

function ply:TStatsSetup(key, val)
    key = string.format("%s[%s]", self:SteamID(), key)

    cookie.Set(key, val)
end

function ply:TStatsSetupRetrival(key, default)
    key = string.format("%s[%s]", self:SteamID(), key)

    return cookie.GetString(key, default)
end

function ply:TStatsSave()
    for k, v in pairs(tagbools) do
        self:TStatsSetup(v.name, self:GetNWBool(v.iname))
        print(self:TStatsSetupRetrival(v.name))
    end

    for k, v in pairs(equippedtags) do
        self:TStatsSetup(v.name, self:GetNWBool(v.iname))
        print(self:TStatsSetupRetrival(v.name))
    end

end

function ply:TStatsLoad()
    for k, v in pairs(tagbools) do
        if (self:TStatsSetupRetrival(v.name) == nil) then
            self:TStatsSetup(v.name, v.fallback)
            self:SetNWInt(v.iname, self:TStatsSetupRetrival(v.name))
        else
            self:SetNWInt(v.iname, self:TStatsSetupRetrival(v.name))
        end
        print(self:TStatsSetupRetrival(v.name))
    end

    for k, v in pairs(equippedtags) do
        if (self:TStatsSetupRetrival(v.name) == nil) then
            self:TStatsSetup(v.name, v.fallback)
            self:SetNWInt(v.iname, self:TStatsSetupRetrival(v.name))
        else
            self:SetNWInt(v.iname, self:TStatsSetupRetrival(v.name))
        end
        print(self:TStatsSetupRetrival(v.name))
    end
end