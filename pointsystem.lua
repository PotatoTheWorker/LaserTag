local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 255)
local blackt = Color(20, 20, 20, 195)
local twhite = Color(255, 255, 255, 25)
local green = Color(19, 98, 7, 255)

local tagtable = {}

tagtable[1] = {
    tag = "Newbie",
    description = "Unlocked by joining the server for the first time.",
    uname = "noobieunlocked",
    hname = "newbie"
}

tagtable[2] = {
    tag = "No Life",
    description = "Unlocked for reaching 1000 or more playtime hours.",
    uname = "nolifeunlocked",
    hname = "nolife"
}

tagtable[3] = {
    tag = "What are you doing step bro???!!",
    description = "Unlocked by being a Discord Admin",
    uname = "Whatareyoudoingstepbrounlocked",
    hname = "whatareyoudoingstepbro"
}

tagtable[4] = {
    tag = "Pro",
    description = "Unlocked by obtaining 500 wins",
    uname = "prounlocked",
    hname = "pro"
}

tagtable[5] = {
    tag = "Ultimate No U",
    description = "Unlocked by being a Moderator",
    uname = "ultimatenouunlocked",
    hname = "ultimatenou"
}

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

surface.CreateFont("TinyHudFont", {
    font = "Arial",
    extended = false,
    size = SmallestTextScale(),
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

function shopMenu(ply, strText, bTeam, bDead)
    strText = string.lower(strText)
    local statshoverwidth = 0
    local statshoverheight = 0
    local upgradeshoverwidth = 0
    local upgradeshoverheight = 0
    local settingshoverwidth = 0
    local settingshoverheight = 0
    local tagshoverwidth = 0
    local tagshoverheight = 0
    local upgradeliveswidth = 0
    local upgradelivesheight = 0
    local upgradeshieldwidth = 0
    local upgradeshieldheight = 0
    local upgradewalkspeedwidth = 0
    local upgradewalkspeedheight = 0
    local upgradejumpheightwidth = 0
    local upgradejumpheightheight = 0
    local upgradespointswidth = 0
    local upgradespointsheight = 0
    local upgradeid = 0
    local equipid = 0
    if (ply ~= LocalPlayer()) then return end

    if (strText == "!menu") then
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

        local menubase = vgui.Create("DFrame")
        menubase:SetPos(ScrW() / 5.65, ScrH() / 7)
        menubase:SetSize(ScrW() / 1.5, ScrH() / 1.365)
        menubase:SetScreenLock(true)
        menubase:SetDraggable(false)
        menubase:SetTitle("")
        menubase:ShowCloseButton(false)
        menubase:MakePopup()

        menubase.Paint = function(s, w, h)
            surface.SetDrawColor(blackt)
            surface.DrawRect(0, 0, w, h)
        end

        local menubaseclose = vgui.Create("DButton", menubase)
        menubaseclose:SetText("")
        menubaseclose:SetSize(25, 25)
        menubaseclose:SetPos(1250, 5)
        menubaseclose:SetColor(black)

        menubaseclose.Paint = function(panel, w, h)
            draw.SimpleText("X", "BasicHudFont", 5, 2, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        end

        menubaseclose.DoClick = function()
            menubase:Remove()
            bars:Remove()
        end

        local stats = vgui.Create("DButton", menubase)
        stats:SetText("")
        stats:SetSize(125, 50)
        stats:SetPos(menubase:GetWide() / 2.3, 50)
        stats:SetColor(white)

        stats.Paint = function(panel, w, h)
            draw.SimpleText("Stats", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                statshoverwidth = Lerp(RealFrameTime() * 10, statshoverwidth, 125)
                statshoverheight = Lerp(RealFrameTime() * 10, statshoverheight, 50)
            else
                statshoverwidth = Lerp(RealFrameTime() * 10, statshoverwidth, 0)
                statshoverheight = Lerp(RealFrameTime() * 10, statshoverheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, statshoverwidth, statshoverheight)
        end

        local upgrades = vgui.Create("DButton", menubase)
        upgrades:SetText("")
        upgrades:SetSize(125, 50)
        upgrades:SetPos(menubase:GetWide() / 2.3, 150)
        upgrades:SetColor(black)

        upgrades.Paint = function(panel, w, h)
            draw.SimpleText("Upgrades", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                upgradeshoverwidth = Lerp(RealFrameTime() * 10, upgradeshoverwidth, 125)
                upgradeshoverheight = Lerp(RealFrameTime() * 10, upgradeshoverheight, 50)
            else
                upgradeshoverwidth = Lerp(RealFrameTime() * 10, upgradeshoverwidth, 0)
                upgradeshoverheight = Lerp(RealFrameTime() * 10, upgradeshoverheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, upgradeshoverwidth, upgradeshoverheight)
        end

        local settings = vgui.Create("DButton", menubase)
        settings:SetText("")
        settings:SetSize(125, 50)
        settings:SetPos(menubase:GetWide() / 2.3, 250)
        settings:SetColor(black)

        settings.Paint = function(panel, w, h)
            draw.SimpleText("Settings", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                settingshoverwidth = Lerp(RealFrameTime() * 10, settingshoverwidth, 125)
                settingshoverheight = Lerp(RealFrameTime() * 10, settingshoverheight, 50)
            else
                settingshoverwidth = Lerp(RealFrameTime() * 10, settingshoverwidth, 0)
                settingshoverheight = Lerp(RealFrameTime() * 10, settingshoverheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, settingshoverwidth, settingshoverheight)
        end

        local tags = vgui.Create("DButton", menubase)
        tags:SetText("")
        tags:SetSize(125, 50)
        tags:SetPos(menubase:GetWide() / 2.3, 350)
        tags:SetColor(black)

        tags.Paint = function(panel, w, h)
            draw.SimpleText("Tags", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                tagshoverwidth = Lerp(RealFrameTime() * 10, tagshoverwidth, 125)
                tagshoverheight = Lerp(RealFrameTime() * 10, tagshoverheight, 50)
            else
                tagshoverwidth = Lerp(RealFrameTime() * 10, tagshoverwidth, 0)
                tagshoverheight = Lerp(RealFrameTime() * 10, tagshoverheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, tagshoverwidth, tagshoverheight)
        end

        stats.DoClick = function()
            upgrades:Remove()
            menubase:Remove()
            settings:Remove()
            tags:Remove()
            local statsmenu = vgui.Create("DFrame")
            statsmenu:SetPos(ScrW() / 5.65, ScrH() / 7)
            statsmenu:SetSize(ScrW() / 1.5, ScrH() / 1.365)
            statsmenu:SetScreenLock(true)
            statsmenu:SetDraggable(false)
            statsmenu:SetTitle("")
            statsmenu:ShowCloseButton(false)
            statsmenu:MakePopup()

            statsmenu.Paint = function(s, w, h)
                surface.SetDrawColor(blackt)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(white)
                surface.DrawOutlinedRect(50, 50, 50, 50)
            end

            local closestats = vgui.Create("DButton", statsmenu)
            closestats:SetText("")
            closestats:SetSize(25, 25)
            closestats:SetPos(1250, 5)
            closestats:SetColor(black)

            closestats.Paint = function(panel, w, h)
                draw.SimpleText("X", "BasicHudFont", 5, 2, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            end

            closestats.DoClick = function()
                statsmenu:Remove()
                bars:Remove()
            end
        end

        upgrades.DoClick = function()
            settings:Remove()
            stats:Remove()
            menubase:Remove()
            tags:Remove()
            local upgradesmenu = vgui.Create("DFrame")
            upgradesmenu:SetPos(ScrW() / 5.65, ScrH() / 7)
            upgradesmenu:SetSize(ScrW() / 1.5, ScrH() / 1.365)
            upgradesmenu:SetScreenLock(true)
            upgradesmenu:SetDraggable(false)
            upgradesmenu:SetTitle("")
            upgradesmenu:ShowCloseButton(false)
            upgradesmenu:MakePopup()

            upgradesmenu.Paint = function(s, w, h)
                surface.SetDrawColor(blackt)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(green)
                surface.DrawRect(150, 50, ply:GetNWInt("livesupgradebarwidth"), 50)
                surface.DrawRect(150, 125, ply:GetNWInt("shieldupgradebarwidth"), 50)
                surface.DrawRect(150, 200, ply:GetNWInt("movementupgradebarwidth"), 50)
                surface.DrawRect(150, 275, ply:GetNWInt("jumpheightupgradebarwidth"), 50)
                surface.DrawRect(150, 350, ply:GetNWInt("pointsmultiupgradebarwidth"), 50)
                surface.SetDrawColor(white)
                surface.DrawOutlinedRect(150, 50, 250, 50)
                surface.DrawOutlinedRect(150, 125, 250, 50)
                surface.DrawOutlinedRect(150, 200, 250, 50)
                surface.DrawOutlinedRect(150, 275, 250, 50)
                surface.DrawOutlinedRect(150, 350, 250, 50)
                surface.SetDrawColor(white)
                draw.SimpleText("Cost: " .. ply:GetNWInt("livesprice"), "BasicHudFont", 475, 75, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(ply:GetNWInt("livesupgradeamount") .. " / 4", "BasicHudFont", 350, 75, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Cost: " .. ply:GetNWInt("shieldprice"), "BasicHudFont", 475, 150, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(ply:GetNWInt("shieldupgradeamount") .. " / 3", "BasicHudFont", 350, 150, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Cost: " .. ply:GetNWInt("movementprice"), "BasicHudFont", 475, 225, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(ply:GetNWInt("movementupgradeamount") .. " / 4", "BasicHudFont", 350, 225, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Cost: " .. ply:GetNWInt("jumpheightprice"), "BasicHudFont", 475, 300, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(ply:GetNWInt("jumpheightupgradeamount") .. " / 4", "BasicHudFont", 350, 300, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Cost: " .. ply:GetNWInt("pointsmultiprice"), "BasicHudFont", 475, 375, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(ply:GetNWInt("pointsmultiupgradeamount") .. " / 4", "BasicHudFont", 350, 375, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("+ 1", "BasicHudFont", 700, 75, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("+ 1", "BasicHudFont", 700, 150, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("+ 25", "BasicHudFont", 700, 225, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("+ 40", "BasicHudFont", 700, 300, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("+ 1", "BasicHudFont", 700, 375, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            local upgradelives = vgui.Create("DButton", upgradesmenu)
            upgradelives:SetText("")
            upgradelives:SetSize(125, 50)
            upgradelives:SetPos(550, 50)
            upgradelives:SetColor(white)

            upgradelives.DoClick = function()
                upgradeid = 1
                sendToServer()
            end

            upgradelives.Paint = function(panel, w, h)
                draw.SimpleText("Upgrade", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                upgradeliveswidth = Lerp(RealFrameTime() * 10, upgradeliveswidth, 125)
                upgradelivesheight = Lerp(RealFrameTime() * 10, upgradelivesheight, 50)
            else
                upgradeliveswidth = Lerp(RealFrameTime() * 10, upgradeliveswidth, 0)
                upgradelivesheight = Lerp(RealFrameTime() * 10, upgradelivesheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, upgradeliveswidth, upgradelivesheight)
            end

            local upgradelivesimage = vgui.Create("DImage", upgradesmenu)
            upgradelivesimage:SetPos(75, 50)
            upgradelivesimage:SetSize(50, 50)
            upgradelivesimage:SetImage("materials/gravitycombat/lives.png")

            local upgradeshield = vgui.Create("DButton", upgradesmenu)
            upgradeshield:SetText("")
            upgradeshield:SetSize(125, 50)
            upgradeshield:SetPos(550, 125)
            upgradeshield:SetColor(white)

            upgradeshield.DoClick = function()
                upgradeid = 2
                sendToServer()
            end

            upgradeshield.Paint = function(panel, w, h)
                draw.SimpleText("Upgrade", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                upgradeshieldwidth = Lerp(RealFrameTime() * 10, upgradeshieldwidth, 125)
                upgradeshieldheight = Lerp(RealFrameTime() * 10, upgradeshieldheight, 50)
            else
                upgradeshieldwidth = Lerp(RealFrameTime() * 10, upgradeshieldwidth, 0)
                upgradeshieldheight = Lerp(RealFrameTime() * 10, upgradeshieldheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, upgradeshieldwidth, upgradeshieldheight)
            end

            local upgradeshieldimage = vgui.Create("DImage", upgradesmenu)
            upgradeshieldimage:SetPos(62, 110)
            upgradeshieldimage:SetSize(75, 75)
            upgradeshieldimage:SetImage("materials/gravitycombat/shield.png")

            local upgradewalkspeed = vgui.Create("DButton", upgradesmenu)
            upgradewalkspeed:SetText("")
            upgradewalkspeed:SetSize(125, 50)
            upgradewalkspeed:SetPos(550, 200)
            upgradewalkspeed:SetColor(white)

            upgradewalkspeed.DoClick = function()
                upgradeid = 3
                sendToServer()
            end

            upgradewalkspeed.Paint = function(panel, w, h)
                draw.SimpleText("Upgrade", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                upgradewalkspeedwidth = Lerp(RealFrameTime() * 10, upgradewalkspeedwidth, 125)
                upgradewalkspeedheight = Lerp(RealFrameTime() * 10, upgradewalkspeedheight, 50)
            else
                upgradewalkspeedwidth = Lerp(RealFrameTime() * 10, upgradewalkspeedwidth, 0)
                upgradewalkspeedheight = Lerp(RealFrameTime() * 10, upgradewalkspeedheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, upgradewalkspeedwidth, upgradewalkspeedheight)
            end

            local upgrademovementimage = vgui.Create("DImage", upgradesmenu)
            upgrademovementimage:SetPos(65, 185)
            upgrademovementimage:SetSize(75, 75)
            upgrademovementimage:SetImage("materials/gravitycombat/running.png")


            local upgradejumpheight = vgui.Create("DButton", upgradesmenu)
            upgradejumpheight:SetText("")
            upgradejumpheight:SetSize(125, 50)
            upgradejumpheight:SetPos(550, 275)
            upgradejumpheight:SetColor(white)

            upgradejumpheight.DoClick = function()
                upgradeid = 4
                sendToServer()
            end

            upgradejumpheight.Paint = function(panel, w, h)
                draw.SimpleText("Upgrade", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                upgradejumpheightwidth = Lerp(RealFrameTime() * 10, upgradejumpheightwidth, 125)
                upgradejumpheightheight = Lerp(RealFrameTime() * 10, upgradejumpheightheight, 50)
            else
                upgradejumpheightwidth = Lerp(RealFrameTime() * 10, upgradejumpheightwidth, 0)
                upgradejumpheightheight = Lerp(RealFrameTime() * 10, upgradejumpheightheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, upgradejumpheightwidth, upgradejumpheightheight)
            end

            local upgradejumpheightimage = vgui.Create("DImage", upgradesmenu)
            upgradejumpheightimage:SetPos(65, 255)
            upgradejumpheightimage:SetSize(75, 75)
            upgradejumpheightimage:SetImage("materials/gravitycombat/jumpheight.png")

            local upgradepoints = vgui.Create("DButton", upgradesmenu)
            upgradepoints:SetText("")
            upgradepoints:SetSize(125, 50)
            upgradepoints:SetPos(550, 350)
            upgradepoints:SetColor(white)

            upgradepoints.DoClick = function()
                upgradeid = 5
                sendToServer()
            end

            upgradepoints.Paint = function(panel, w, h)
                draw.SimpleText("Upgrade", "BasicHudFont", 62.5, 25, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if (panel:IsHovered()) then
                upgradespointswidth = Lerp(RealFrameTime() * 10, upgradespointswidth, 125)
                upgradespointsheight = Lerp(RealFrameTime() * 10, upgradespointsheight, 50)
            else
                upgradespointswidth = Lerp(RealFrameTime() * 10, upgradespointswidth, 0)
                upgradespointsheight = Lerp(RealFrameTime() * 10, upgradespointsheight, 0)
            end

            surface.SetDrawColor(twhite)
            surface.DrawRect(0, 0, upgradespointswidth, upgradespointsheight)
            end

            local upgradepointsimage = vgui.Create("DImage", upgradesmenu)
            upgradepointsimage:SetPos(75, 350)
            upgradepointsimage:SetSize(50, 50)
            upgradepointsimage:SetImage("materials/gravitycombat/points.png")

            local closeupgrades = vgui.Create("DButton", upgradesmenu)
            closeupgrades:SetText("")
            closeupgrades:SetSize(25, 25)
            closeupgrades:SetPos(1250, 5)
            closeupgrades:SetColor(white)

            closeupgrades.Paint = function(panel, w, h)
                draw.SimpleText("X", "BasicHudFont", 5, 2, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            end

            closeupgrades.DoClick = function()
                upgradesmenu:Remove()
                bars:Remove()
            end
        end

        settings.DoClick = function()
            upgrades:Remove()
            stats:Remove()
            menubase:Remove()
            tags:Remove()
            local settingsmenu = vgui.Create("DFrame")
            settingsmenu:SetPos(ScrW() / 5.65, ScrH() / 7)
            settingsmenu:SetSize(ScrW() / 1.5, ScrH() / 1.365)
            settingsmenu:SetScreenLock(true)
            settingsmenu:SetDraggable(false)
            settingsmenu:SetTitle("")
            settingsmenu:ShowCloseButton(false)
            settingsmenu:MakePopup()

            settingsmenu.Paint = function(s, w, h)
                surface.SetDrawColor(blackt)
                surface.DrawRect(0, 0, w, h)
            end

            local closesettings = vgui.Create("DButton", settingsmenu)
            closesettings:SetText("")
            closesettings:SetSize(25, 25)
            closesettings:SetPos(1250, 5)
            closesettings:SetColor(white)

            closesettings.Paint = function(panel, w, h)
                draw.SimpleText("X", "BasicHudFont", 5, 2, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            end

            closesettings.DoClick = function()
                settingsmenu:Remove()
                bars:Remove()
            end
        end

        tags.DoClick = function()
            upgrades:Remove()
            stats:Remove()
            menubase:Remove()
            settings:Remove()
            local tagsmenu = vgui.Create("DFrame")
            tagsmenu:SetPos(ScrW() / 5.65, ScrH() / 7)
            tagsmenu:SetSize(ScrW() / 1.5, ScrH() / 1.365)
            tagsmenu:SetScreenLock(true)
            tagsmenu:SetDraggable(false)
            tagsmenu:SetTitle("")
            tagsmenu:ShowCloseButton(false)
            tagsmenu:MakePopup()

            tagsmenu.Paint = function(s, w, h)
                local ypos = tagsmenu:GetTall() * .06
                surface.SetDrawColor(blackt)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(white)
                for k , v in pairs(tagtable) do
                    draw.SimpleText(v.tag, "BasicHudFont", 50, ypos, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                    draw.SimpleText(v.description, "TinyHudFont", 465, ypos, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                    if (ply:GetNWBool(v.uname)) then
                        draw.SimpleText("Unlocked", "TinyHudFont", 950, ypos, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                    else
                        draw.SimpleText("Locked", "TinyHudFont", 967, ypos, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                    end
                    ypos = ypos + tagsmenu:GetTall() / 20
                end
            end

            local typos = tagsmenu:GetTall() * .06
            for k, v in pairs(tagtable) do
                local tagsequipwidth = 0
                local tagsequipheight = 0
                local equiptag = vgui.Create("DButton", tagsmenu)
                equiptag:SetPos(1050, typos)
                equiptag:SetSize(75, 30)
                equiptag:SetText("")
                equiptag:SetColor(white)

                equiptag.Paint = function(panel, w, h)
                    draw.SimpleText("Equip", "TinyHudFont", 40, 15, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                    if (panel:IsHovered()) then
                        tagsequipwidth = Lerp(RealFrameTime() * 10, tagsequipwidth, 125)
                        tagsequipheight = Lerp(RealFrameTime() * 10, tagsequipheight, 50)
                    else
                        tagsequipwidth = Lerp(RealFrameTime() * 10, tagsequipwidth, 0)
                        tagsequipheight = Lerp(RealFrameTime() * 10, tagsequipheight, 0)
                    end

                    surface.SetDrawColor(twhite)
                    surface.DrawRect(0, 0, tagsequipwidth, tagsequipheight)
                end

                equiptag.DoClick = function()
                    equipid = k
                    sendToServer()
                end
                typos = typos + tagsmenu:GetTall() / 20
            end

            local closetags = vgui.Create("DButton", tagsmenu)
            closetags:SetText("")
            closetags:SetSize(25, 25)
            closetags:SetPos(1250, 5)
            closetags:SetColor(white)

            closetags.Paint = function(panel, w, h)
                draw.SimpleText("X", "BasicHudFont", 5, 2, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            end

            closetags.DoClick = function()
                tagsmenu:Remove()
                bars:Remove()
            end
        end

        function sendToServer()
            net.Start("sendToServer")
            net.WriteInt(upgradeid, 5)
            net.WriteInt(equipid, 12)
            net.SendToServer()
        end

        return true
    end
end

hook.Add("OnPlayerChat", "OpenShop", shopMenu)