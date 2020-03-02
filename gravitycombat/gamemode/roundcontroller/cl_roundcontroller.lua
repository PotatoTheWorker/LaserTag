local round_type = 0

net.Receive("UpdateRoundType", function(len)
    round_type = net.ReadInt(4)
end)


function getRoundStatus()
    return round_type
end