GM.Name = "Gravity Combat"
GM.Author = "Soviet Doggo"
team.SetUp(0, "Spectator", Color(250, 218, 94, 255))
team.SetUp(1, "Waiting", Color(34, 139, 34, 255))
team.SetUp(2, "Red", Color(155, 28, 49, 255))
team.SetUp(3, "Green", Color(19, 98, 7, 255))
team.SetUp(4, "Blue", Color(65, 105, 225, 255))
team.SetUp(5, "Yellow", Color(250, 218, 94, 255))
team.SetUp(6, "Juggernaut", Color(95, 158, 160, 255))
team.SetUp(7, "Unknown", Color(75, 75, 75, 255))
team.SetUp(8, "FFA", Color(255, 255, 0, 255))

function GM:Initialize()
    self.BaseClass.Initialize(self)
end