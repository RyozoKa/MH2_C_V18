//=============================================================================
// RocketCan.
//=============================================================================
class NewRocketCan extends Ammo;

var bool bOpened;

auto state Pickup
{
	function Touch( Actor Other )
	{
		local Vector Dist2D;

		if ( bOpened )
		{
			Super.Touch(Other);
			return;
		}	
		if ( (Pawn(Other) == None) || !Pawn(Other).bIsPlayer )
			return;
		Dist2D = Other.Location - Location;
		Dist2D.Z = 0;
		if ( VSize(Dist2D) <= 48.0 )
			Super.Touch(Other);
		else if ( !bOpened )
		{
			SetCollisionSize(27.0, CollisionHeight);
			SetLocation(Location); //to force untouch
			bOpened = true;
			PlayAnim('Open', 0.1);
		}
	}

	function Landed(vector HitNormal)
	{
		Super.Landed(HitNormal);
		if ( !bOpened )
		{
			bCollideWorld = false;
			SetCollisionSize(172,CollisionHeight);
		}
	}
}

defaultproperties
{
     AmmoAmount=100
     MaxAmmo=1000
     UsedInWeaponSlot(5)=1
     PickupMessage=""
     PickupViewMesh=LodMesh'UnrealShare.RocketCanMesh'
     MaxDesireability=0.300000
     PickupSound=Sound'UnrealShare.Pickups.AmmoSnd'
     Icon=Texture'UnrealShare.Icons.I_RocketAmmo'
     Physics=PHYS_Falling
     Mesh=LodMesh'UnrealShare.RocketCanMesh'
     CollisionRadius=27.000000
     CollisionHeight=12.000000
     bCollideActors=True
}
