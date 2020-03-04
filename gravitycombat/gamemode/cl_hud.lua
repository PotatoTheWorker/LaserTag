local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudAmmo"] = true,
    ["CHudDeathNotice"] = true,
}

hook.Add("HUDShouldDraw", "HideHUD", function(name)
    if (hide[name]) then return false end
end)

function LargerTextScale()
    return ScrH() / 30
end

function SmallerTextScale()
    return ScrH() / 35
end

function SmallestTextScale()
    return ScrH() / 50
end

local player_amount = 0

for k, v in pairs(player.GetAll()) do
    player_amount = player_amount + 1
end

surface.CreateFont("BasicHudFont", {
    font = "Arial",
    extended = false,
    size = SmallerTextScale(),
    weight = 750,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})

surface.CreateFont("TestFont", {
    font = "Arial",
    extended = false,
    size = LargerTextScale(),
    weight = 750,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})

surface.CreateFont("WeaponFont", {
    font = "Arial",
    extended = false,
    size = LargerTextScale(),
    weight = 750,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})

local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 255)
local blackt = Color(20, 20, 20, 195)
local darkw = Color(0, 0, 0, 125)
local playerteamcolor

hook.Add("HUDPaint", "testtext", function()
    local ply = LocalPlayer()
    local wep = ply:GetActiveWeapon()

    function shortnumberstring(number)
        local steps = {{1, ""}, {1e3, "k"}, {1e6, "m"}, {1e9, "b"}, {1e12, "t"}}

        for _, b in ipairs(steps) do
            if b[1] <= number + 1 then
                steps.use = _
            end
        end

        local result = string.format("%.1f", number / steps[steps.use][1])

        if tonumber(result) >= 1e3 and steps.use < #steps then
            steps.use = steps.use + 1
            result = string.format("%.1f", tonumber(result) / 1e3)
        end

        result = string.sub(result, 0, string.sub(result, -1) == "0" and -3 or -1) -- Remove .0 (just if it is zero!)

        return result .. steps[steps.use][2]
    end

    time = 60
    surface.SetDrawColor(white)
    surface.DrawRect(ScrW() / 2.002, ScrH() / 2.006, ScrW() / 768, ScrH() / 144)
    surface.DrawRect(ScrW() / 2.002, ScrH() / 2.026, ScrW() / 768, ScrH() / 144)
    surface.DrawRect(ScrW() / 2.012, ScrH() / 2.006, ScrH() / 144, ScrW() / 768)
    surface.DrawRect(ScrW() / 2.002, ScrH() / 2.006, ScrH() / 144, ScrW() / 768)
    surface.SetDrawColor(blackt)
    surface.DrawRect(ScrW() / 50, ScrH() / 1.15, ScrW() / 19.15, ScrH() / 14.25)
    surface.DrawRect(ScrW() / 12, ScrH() / 1.15, ScrW() / 19.25, ScrH() / 14.25)
    surface.DrawRect(ScrW() / 1.16, ScrH() / 1.15, ScrW() / 7.68, ScrH() / 14.25)
    surface.DrawRect(ScrW() / 50, ScrH() / 1.05, ScrW() / 8.65, ScrH() / 25)
    surface.SetDrawColor(white)
    surface.DrawRect(ScrW() / 54, ScrH() / 1.065, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 54, ScrH() / 1.088, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 16.624, ScrH() / 1.153, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 14, ScrH() / 1.153, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 12.2, ScrH() / 1.065, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 12.2, ScrH() / 1.088, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 8.15, ScrH() / 1.153, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 7.4, ScrH() / 1.153, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 8.15, ScrH() / 1.0535, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 7.4, ScrH() / 1.0535, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 54, ScrH() / 1.009, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 54, ScrH() / 1.0325, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 1.0195, ScrH() / 1.153, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 1.0075, ScrH() / 1.153, ScrH() / 300, ScrW() / 75)
    surface.DrawRect(ScrW() / 1.162, ScrH() / 1.065, ScrW() / 75, ScrH() / 300)
    surface.DrawRect(ScrW() / 1.162, ScrH() / 1.088, ScrH() / 300, ScrW() / 75)
    draw.DrawText(ply:GetNWInt("lives"), "TestFont", ScrW() / 22, ScrH() / 1.12, white, TEXT_ALIGN_CENTER)
    draw.DrawText(ply:GetNWInt("shield-lives"), "TestFont", ScrW() / 9.1, ScrH() / 1.12, white, TEXT_ALIGN_CENTER)
    draw.DrawText("Lives", "BasicHudFont", ScrW() / 34, ScrH() / 1.15)
    draw.DrawText("Time: " .. "Timer will output to here", "BasicHudFont", ScrW() / 2.2, ScrH() / 150)
    draw.DrawText("Shield", "BasicHudFont", ScrW() / 11, ScrH() / 1.15)
    draw.DrawText("Points: " .. shortnumberstring(ply:GetNWInt("points")), "BasicHudFont", ScrW() / 40, ScrH() / 1.0455, white, TEXT_ALIGN_LEFT)
    surface.DrawRect(ScrW() / 1.16, ScrH() / 1.106, ScrW() / 7.7, ScrH() / 300)

    if (ply:GetActiveWeapon():IsValid()) then
        if (ply:GetActiveWeapon():GetPrintName() ~= nil) then
            draw.DrawText(ply:GetActiveWeapon():GetPrintName(), "WeaponFont", ScrW() / 1.0095, ScrH() / 1.15, white, TEXT_ALIGN_RIGHT)
        end

        if (ply:GetActiveWeapon():Clip1() ~= -1) then
            local secammo = ply:GetAmmoCount(wep:GetPrimaryAmmoType())

            if secammo > 1500 then
                secammo = "INF"
            end

            draw.DrawText(ply:GetActiveWeapon():Clip1() .. " / " .. secammo, "WeaponFont", ScrW() / 1.0095, ScrH() / 1.105, white, TEXT_ALIGN_RIGHT)
        else
            return
        end
    end
end)

function entityTeamColor()
    local playerteam = ""
    local ply = LocalPlayer()

    if (ply:GetEyeTrace().Entity:IsPlayer()) then
        playerteam = ply:GetEyeTrace().Entity:Team()
    end

    if (playerteam ~= nil) then
        playerteamcolor = team.GetColor(playerteam)

        return playerteamcolor
    end
end

function getTeamName()
    local ply = LocalPlayer()
    team = ply:Team()
    teamname = {"Waiting", "Red", "Green", "Blue", "Yellow", "Juggernaut", "Unknown", "FFA"}

    if (teamname[team] == nil) then
        team = "Spectator"

        return team
    else
        return teamname[team]
    end
end

function GM:HUDDrawTargetID()
    local ply = LocalPlayer()
    local plyentity = ply:GetEyeTrace()

    if ply:GetEyeTrace().Entity:IsPlayer() then
        surface.SetDrawColor(blackt)
        surface.DrawRect(ScrW() / 2.13, ScrH() / 1.95, ScrW() / 16.4, ScrH() / 18)
        surface.SetDrawColor(white)
        surface.DrawRect(ScrW() / 1.927, ScrH() / 1.962, ScrW() / 75, ScrH() / 300)
        surface.DrawRect(ScrW() / 1.885, ScrH() / 1.962, ScrH() / 300, ScrW() / 75)
        surface.DrawRect(ScrW() / 2.138, ScrH() / 1.76, ScrW() / 75, ScrH() / 300)
        surface.DrawRect(ScrW() / 2.138, ScrH() / 1.825, ScrH() / 300, ScrW() / 75)

        if (ply:Team() and plyentity.Entity:Team() == 8) then
            draw.DrawText("Enemy", "BasicHudFont", ScrW() / 2.002, ScrH() / 1.95, entityTeamColor(), TEXT_ALIGN_CENTER)
            draw.DrawText(ply:GetEyeTrace().Entity:Name(), "BasicHudFont", ScrW() / 2.002, ScrH() / 1.87, entityTeamColor(), TEXT_ALIGN_CENTER)
        elseif (ply:Team() == plyentity.Entity:Team()) then
            draw.DrawText("Friendly", "BasicHudFont", ScrW() / 2.002, ScrH() / 1.95, entityTeamColor(), TEXT_ALIGN_CENTER)
            draw.DrawText(ply:GetEyeTrace().Entity:Name(), "BasicHudFont", ScrW() / 2.002, ScrH() / 1.87, entityTeamColor(), TEXT_ALIGN_CENTER)
        elseif (ply:Team() ~= plyentity.Entity:Team()) then
            draw.DrawText("Enemy", "BasicHudFont", ScrW() / 2.002, ScrH() / 1.95, entityTeamColor(), TEXT_ALIGN_CENTER)
            draw.DrawText(ply:GetEyeTrace().Entity:Name(), "BasicHudFont", ScrW() / 2.002, ScrH() / 1.87, entityTeamColor(), TEXT_ALIGN_CENTER)
        end
    end
end

scoreboard = scoreboard or {}

function scoreboard:show()
    local blur = vgui.Create("DFrame")
    blur:SetPos(ScrW() / 5.95, ScrH() / 10)
    blur:SetSize(ScrW() / 1.5, ScrH() / 1.3)
    blur:SetTitle("")
    blur:ShowCloseButton(false)
    blur:SetScreenLock(true)
    blur:SetDraggable(false)

    function blur:Init()
        self.startTime = SysTime()
    end

    function blur:Paint()
        Derma_DrawBackgroundBlur(self, self.startTime)
    end

    local bars = vgui.Create("DFrame")
    bars:SetPos(ScrW() / 5.95, ScrH() / 10)
    bars:SetSize(ScrW() / 1.45, ScrH() / 1.25)
    bars:SetTitle("")
    bars:ShowCloseButton(false)
    bars:SetScreenLock(true)
    bars:SetDraggable(false)

    bars.Paint = function()
        surface.SetDrawColor(white)
        surface.DrawRect(1298, 43, 3.6, 25.6)
        surface.DrawRect(1276.99, 43, 25.6, 3.6)
        surface.DrawRect(14, 838, 25.6, 3.6)
        surface.DrawRect(14, 816.99, 3.6, 25.6)
    end

    local header = vgui.Create("DLabel")
    header:SetFont("BasicHudFont")
    header:SetText("Savior Servers Laser Tag")
    header:SetTextColor(white)
    header:Dock(TOP)
    header:SetHeight(50)
    header:SetContentAlignment(5)
    header:SetExpensiveShadow(3, black)
    header:DockMargin(0, 110, 0, 0)
    local background = vgui.Create("DFrame")
    background:SetPos(ScrW() / 5.65, ScrH() / 7)
    background:SetSize(ScrW() / 1.5, ScrH() / 1.365)
    background:SetTitle("")
    background:ShowCloseButton(false)
    background:SetScreenLock(true)
    background:SetDraggable(false)
    background:MakePopup()

    background.Paint = function(s, w, h)
        surface.SetDrawColor(blackt)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText("Name", "BasicHudFont", 100, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Points", "BasicHudFont", 285, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Kills", "BasicHudFont", 395, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Deaths", "BasicHudFont", 514, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Team", "BasicHudFont", 673, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Ping", "BasicHudFont", 1165, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local ypos = background:GetTall() * .04
    local scroll = vgui.Create("DScrollPanel", background)
    scroll:SetPos(0, background:GetTall() * .03)
    scroll:SetSize(background:GetWide(), background:GetTall() * .97)

    for k, v in pairs(player.GetAll()) do
        local playerpanel = vgui.Create("DPanel", scroll)
        playerpanel:SetPos(0, ypos)
        playerpanel:SetSize(background:GetWide(), background:GetTall() * .05)
        local color = team.GetColor(v:Team())

        playerpanel.Paint = function(s, w, h)
            if IsValid(v) then
                surface.SetDrawColor(color)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(darkw)
                surface.DrawRect(0, 0, w, h)
                draw.SimpleText(v:Name(), "BasicHudFont", w / 12, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(shortnumberstring(v:GetNWInt("points")), "BasicHudFont", w / 4.5, h / 2.1, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:Frags(), "BasicHudFont", w / 3.25, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:Deaths(), "BasicHudFont", w / 2.5, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(team.GetName(v:Team()), "BasicHudFont", w / 1.9, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:Ping(), "BasicHudFont", w / 1.1, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end

        ypos = ypos + playerpanel:GetTall() * 1.1
    end

    function scoreboard:hide()
        background:Remove()
        blur:Remove()
        bars:Remove()
        header:Remove()
    end
end

function GM:ScoreboardShow()
    scoreboard:show()
end

function GM:ScoreboardHide()
    scoreboard:hide()
end