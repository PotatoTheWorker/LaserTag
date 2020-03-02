function GM:PlayerHurt(victim, attacker)

    if (attacker:IsPlayer()) then
        
        if (tonumber(victim:GetNWInt( "shield-lives" )) > 0) then
            victim:SetNWInt( "shield-lives", victim:GetNWInt( "shield-lives") - 1)
        else
            victim:SetNWInt("lives", victim:GetNWInt("lives") - 1)
        end
    end

    if (victim:IsPlayer() and victim:GetNWInt("lives") == 0) then
        victim:KillSilent()
        attacker:SetNWInt("points", attacker:GetNWInt("points") + attacker:GetNWInt("kill-points"))
        victim:ChatPrint("You have been killed by:"..attacker:GetName())
    end

end