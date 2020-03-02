AddCSLuaFile()

SWEP.Author                     =   "Soviet Doggo"
SWEP.Base                       =   "weapon_base"
SWEP.PrintName                  =   "BASIC PISTOL"
SWEP.Instructions               =   [[shoot and people go up.]]
SWEP.ViewModel                  =   "models/weapons/c_pistol.mdl"
SWEP.ViewModelFlip              =   false
SWEP.UseHands                   = true
SWEP.WorldModel                 =   "models/weapons/w_pistol.mdl"
SWEP.SetHoldType                =   "pistol"
SWEP.Weight                     =   5
SWEP.AutoSwitchTo               =   true
SWEP.AutoSwitchFrom             =   false
SWEP.Slot                       =   1
SWEP.SlotPos                    =   0
SWEP.DrawAmmo                   =   true
SWEP.DrawCrosshair              =   true
SWEP.Spawnable                  =   true
SWEP.AdminSpawnable             =   true

SWEP.Primary.ClipSize           =   1
SWEP.Primary.DefaultClip        =   1
SWEP.Primary.Ammo               =   "Pistol"
SWEP.Primary.Automatic          =   false
SWEP.Primary.Recoil             =   0
SWEP.Primary.Damage             =   1
SWEP.Primary.NumShots           =   1
SWEP.Primary.Spread             =   0
SWEP.Primary.Cone               =   0
SWEP.Primary.Delay              =   2

SWEP.ShouldDropOnDie            =   false

local ShootSound = Sound("Weapon_pistol.Single")

function SWEP:Initialize()
    self:SetHoldType( "pistol" )
end

function SWEP:PrimaryAttack(ent, ply)
 
if ( !self:CanPrimaryAttack() ) then return end

local bullet = {} 
bullet.Num = self.Primary.NumberofShots 
bullet.Src = self.Owner:GetShootPos() 
bullet.Dir = self.Owner:GetAimVector() 
bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0)
bullet.Tracer = 1
bullet.Force = self.Primary.Force 
bullet.Damage = self.Primary.Damage 
bullet.AmmoType = self.Primary.Ammo 
 
local rnda = self.Primary.Recoil * -1 
local rndb = self.Primary.Recoil * math.random(-1, 1) 
 
self:ShootEffects()
 
self.Owner:FireBullets( bullet ) 
self:EmitSound(ShootSound)
self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) ) 
self:TakePrimaryAmmo(1) 
 
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay ) 
end 
function SWEP:CanSecondaryAttack()
    return false
end