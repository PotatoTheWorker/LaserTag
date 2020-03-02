include("shared.lua")
include("cl_hud.lua")

--include other files
include("roundcontroller/cl_roundcontroller.lua")
include("pointsystem/pointsystem.lua")

function notEnoughPoints()
notification.AddLegacy( "You do not have enough points to buy this!", NOTIFY_HINT, 5 )
surface.PlaySound( "buttons/button15.wav" )
Msg( "You do not have enough points to buy this!\n" )
end