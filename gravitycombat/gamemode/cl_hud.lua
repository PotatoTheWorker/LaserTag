local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 255)
local blacktransparent = Color(20, 20, 20, 195)
local darkwhite = Color(0, 0, 0, 125)
local playerteamcolor
local ply = LocalPlayer()
local scrw = ScrW()
local scrh = ScrH()
local playerteam = ""
local pteam = ""

local hidebasehud = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudAmmo"] = true,
    ["CHudDeathNotice"] = true,
}

hook.Add("HUDShouldDraw", "HideBaseHud", function(name)
    if (hidebasehud[name]) then return false end
end)

function largerTextScale()
    return ScrH() / 30
end

function smallerTextScale()
    return ScrH() / 35
end

function smallestTextScale()
    return ScrH() / 50
end

function shortenNumbers(number)
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

    result = string.sub(result, 0, string.sub(result, - 1) == "0" and -3 or -1)

    return result .. steps[steps.use][2]
end

function playerTeamColor()
    local ply = LocalPlayer()
    if (ply:GetEyeTrace().Entity:IsPlayer()) then
        playerteam = ply:GetEyeTrace().Entity:Team()
    end

    if (playerteam ~= nil) then
        playerteamcolor = team.GetColor(playerteam)

        return playerteamcolor
    end
end

function playerTeamName()
    pteam = ply:Team()
    teamname = {"Waiting", "Red", "Green", "Blue", "Yellow", "Juggernaut", "Unknown", "FFA"}

    if (teamname[pteam] == nil) then
        pteam = "Spectator"

        return pteam
    else
        return teamname[pteam]
    end
end

surface.CreateFont("SmallerHudFont", {
    font = "Arial",
    extended = false,
    size = smallerTextScale(),
    weight = 750,
    antialias = true,
})

surface.CreateFont("LargerHudFont", {
    font = "Arial",
    extended = false,
    size = largerTextScale(),
    weight = 750,
    antialias = true,
})

surface.CreateFont("WeaponFont", {
    font = "Arial",
    extended = false,
    size = largerTextScale(),
    weight = 750,
    antialias = true,
})

hook.Add("HUDPaint", "GeneralHUD", function()
    local ply = LocalPlayer()
    local wep = ply:GetActiveWeapon()

    surface.SetDrawColor(white)
    surface.DrawRect(scrw / 2, scrh / 2, scrw / 750, scrh / 140)
    surface.DrawRect(scrw / 2, scrh / 2.017, scrw / 750, scrh / 140)
    surface.DrawRect(scrw / 2, scrh / 2, scrh / 140, scrw / 750)
    surface.DrawRect(scrw / 2.01, scrh / 2, scrh / 140, scrw / 750)

    surface.SetDrawColor(blacktransparent)
    surface.DrawRect(scrw / 50, scrh / 1.15, scrw / 19.15, scrh / 14.25)
    surface.DrawRect(scrw / 12, scrh / 1.15, scrw / 19.25, scrh / 14.25)
    surface.DrawRect(scrw / 1.16, scrh / 1.15, scrw / 7.68, scrh / 14.25)
    surface.DrawRect(scrw / 1.16, scrh / 1.05, scrw / 7.68, scrh / 25)
    surface.DrawRect(scrw / 50, scrh / 1.05, scrw / 8.65, scrh / 25)

    surface.SetDrawColor(white)
    surface.DrawRect(scrw / 54, scrh / 1.065, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 54, scrh / 1.088, scrh / 300, scrw / 75)
    surface.DrawRect(scrw / 16.6, scrh / 1.153, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 13.9, scrh / 1.153, scrh / 300, scrw / 75)

    surface.DrawRect(scrw / 12.2, scrh / 1.065, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 12.2, scrh / 1.088, scrh / 300, scrw / 75)
    surface.DrawRect(scrw / 8.11, scrh / 1.153, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 7.4, scrh / 1.153, scrh / 300, scrw / 75)

    surface.DrawRect(scrw / 8.11, scrh / 1.053, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 7.4, scrh / 1.053, scrh / 300, scrw / 75)
    surface.DrawRect(scrw / 54, scrh / 1.008, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 54, scrh / 1.029, scrh / 300, scrw / 75)

    surface.DrawRect(scrw / 1.02, scrh / 1.153, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 1.0075, scrh / 1.153, scrh / 300, scrw / 75)
    surface.DrawRect(scrw / 1.162, scrh / 1.065, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 1.162, scrh / 1.088, scrh / 300, scrw / 75)
    surface.DrawRect(scrw / 1.16, scrh / 1.106, scrw / 7.7, scrh / 300)

    surface.DrawRect(scrw / 1.02, scrh / 1.053, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 1.0075, scrh / 1.053, scrh / 300, scrw / 75)
    surface.DrawRect(scrw / 1.162, scrh / 1.0088, scrw / 75, scrh / 300)
    surface.DrawRect(scrw / 1.162, scrh / 1.032, scrh / 300, scrw / 75)

    draw.DrawText("Lives", "SmallerHudFont", scrw / 21.5, scrh / 1.155, white, TEXT_ALIGN_CENTER)
    draw.DrawText("Shield", "SmallerHudFont", scrw / 9.1, scrh / 1.155, white, TEXT_ALIGN_CENTER)
    draw.DrawText(ply:GetNWInt("lives"), "LargerHudFont", scrw / 22.05, scrh / 1.12, white, TEXT_ALIGN_CENTER)
    draw.DrawText(ply:GetNWInt("shield-lives"), "LargerHudFont", scrw / 9.2, scrh / 1.12, white, TEXT_ALIGN_CENTER)
    draw.DrawText("Points: "..shortenNumbers(ply:GetNWInt("points")), "SmallerHudFont", scrw / 40, scrh / 1.045, white, TEXT_ALIGN_LEFT)

    if (ply:GetActiveWeapon():IsValid()) then
        if (ply:GetActiveWeapon():GetPrintName() ~= nil) then
            draw.DrawText(ply:GetActiveWeapon():GetPrintName(), "WeaponFont", scrw / 1.0095, scrh / 1.15, white, TEXT_ALIGN_RIGHT)
        end

        if (ply:GetActiveWeapon():Clip1() ~= -1) then
            local secammo = ply:GetAmmoCount(wep:GetPrimaryAmmoType())

            if secammo > 1500 then
                secammo = "INF"
            end

            draw.DrawText(ply:GetActiveWeapon():Clip1() .. " / " .. secammo, "WeaponFont", scrw / 1.0095, scrh / 1.105, white, TEXT_ALIGN_RIGHT)
        else
            return
        end
    end
end)

function GM:HUDDrawTargetID()
    local ply = LocalPlayer()
    local plyentity = ply:GetEyeTrace()

    if ply:GetEyeTrace().Entity:IsPlayer() then
        surface.SetDrawColor(blacktransparent)
        surface.DrawRect(scrw / 2.13, scrh / 1.95, scrw / 16.4, scrh / 18)
        surface.SetDrawColor(white)
        surface.DrawRect(scrw / 1.927, scrh / 1.962, scrw / 75, scrh / 300)
        surface.DrawRect(scrw / 1.885, scrh / 1.962, scrh / 300, scrw / 75)
        surface.DrawRect(scrw / 2.138, scrh / 1.76, scrw / 75, scrh / 300)
        surface.DrawRect(scrw / 2.138, scrh / 1.825, scrh / 300, scrw / 75)

        if (ply:Team() and plyentity.Entity:Team() == 8) then
            draw.DrawText("Enemy", "SmallerHudFont", scrw / 2.002, scrh / 1.905, playerTeamColor(), TEXT_ALIGN_CENTER)
            --draw.DrawText(ply:GetEyeTrace().Entity:Name(), "SmallerHudFont", ScrW() / 2.002, ScrH() / 1.87, playerTeamColor(), TEXT_ALIGN_CENTER)
        elseif (ply:Team() == plyentity.Entity:Team()) then
            draw.DrawText("Friendly", "SmallerHudFont", scrw / 2.002, scrh / 1.905, playerTeamColor(), TEXT_ALIGN_CENTER)
            --draw.DrawText(ply:GetEyeTrace().Entity:Name(), "SmallerHudFont", ScrW() / 2.002, ScrH() / 1.87, playerTeamColor(), TEXT_ALIGN_CENTER)
        elseif (ply:Team() ~= plyentity.Entity:Team()) then
            draw.DrawText("Enemy", "SmallerHudFont", scrw / 2.002, scrh / 1.905, playerTeamColor(), TEXT_ALIGN_CENTER)
            --draw.DrawText(ply:GetEyeTrace().Entity:Name(), "SmallerHudFont", ScrW() / 2.002, ScrH() / 1.87, playerTeamColor(), TEXT_ALIGN_CENTER)
        end
    end
end

scoreboard = scoreboard or {}

function scoreboard:show()
    local blur = vgui.Create("DFrame")
    blur:SetPos(scrw / 5.95, scrh / 10)
    blur:SetSize(scrw / 1.5, scrh / 1.3)
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
    bars:SetPos(scrw / 5.95, scrh / 10)
    bars:SetSize(scrw / 1.45, scrh / 1.25)
    bars:SetTitle("")
    bars:ShowCloseButton(false)
    bars:SetScreenLock(true)
    bars:SetDraggable(false)

    bars.Paint = function()
        surface.SetDrawColor(white)
        surface.DrawRect(scrw / 1.506, scrh / 25, scrw / 75, scrh / 300)
        surface.DrawRect(scrw / 1.48, scrh / 25, scrh / 300, scrw / 75)
        surface.DrawRect(scrw / 150, scrh / 1.326, scrh / 300, scrw / 75)
        surface.DrawRect(scrw / 150, scrh / 1.292, scrw / 75, scrh / 300)
    end

    local header = vgui.Create("DLabel")
    header:SetFont("SmallerHudFont")
    header:SetText("Savior Servers Laser Tag")
    header:SetTextColor(white)
    header:Dock(TOP)
    header:SetHeight(50)
    header:SetContentAlignment(5)
    header:SetExpensiveShadow(3, black)
    header:DockMargin(0, scrh / 12, 0, 0)
    local background = vgui.Create("DFrame")
    background:SetPos(scrw / 5.65, scrh / 7)
    background:SetSize(scrw / 1.5, scrh / 1.365)
    background:SetTitle("")
    background:ShowCloseButton(false)
    background:SetScreenLock(true)
    background:SetDraggable(false)
    background:MakePopup()

    background.Paint = function(s, w, h)
        surface.SetDrawColor(blacktransparent)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText("Name", "SmallerHudFont", w / 12, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Points", "SmallerHudFont", w / 3.25, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Kills", "SmallerHudFont", w / 2.3, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Deaths", "SmallerHudFont", w / 1.8, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Team", "SmallerHudFont", w / 1.4, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Ping", "SmallerHudFont", w / 1.1, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
                surface.SetDrawColor(darkwhite)
                surface.DrawRect(0, 0, w, h)
                draw.SimpleText(v:Name(), "SmallerHudFont", w / 50, h / 7, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                draw.SimpleText(shortenNumbers(v:GetNWInt("points")), "SmallerHudFont", w / 3.25, h / 2.1, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:Frags(), "SmallerHudFont", w / 2.3, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:Deaths(), "SmallerHudFont", w / 1.8, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(team.GetName(v:Team()), "SmallerHudFont", w / 1.4, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:Ping(), "SmallerHudFont", w / 1.1, h / 2.2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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