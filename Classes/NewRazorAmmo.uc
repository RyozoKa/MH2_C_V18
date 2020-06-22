//=============================================================================
// RazorAmmo.
//=============================================================================
class NewRazorAmmo extends Ammo;

var bool bOpened;

auto state Pickup
{
	function Touch( Actor Other )
	{
		local Vector Dist2D;

		if ( bOpened )
		 Super.Touch(Other);
		if ( (Pawn(Other) == None) || !Pawn(Other).bIsPlayer )
			return;
		Dist2D = Other.Location - Location;
		Dist2D.Z = 0;
		if ( VSize(Dist2D) <= 40.0 )
			Super.Touch(Other);
		else 
		{
			SetCollisionSize(20.0, CollisionHeight);
			SetLocation(Location); //to force untouch
			bOpened = true;
			PlayAnim('Open', 0.05);
		}
	}

	function Landed(vector HitNormal)
	{
		Super.Landed(HitNormal);
		if ( !bOpened )
		{
			bCollideWorld = false;
			SetCollisionSize(170,CollisionHeight);
		}
	}
}

defaultproperties
{
     AmmoAmount=100
     MaxAmmo=1000
     UsedInWeaponSlot(7)=1
     PickupMessage=""
     PickupViewMesh=LodMesh'UnrealI.RazorAmmoMesh'
     MaxDesireability=0.220000
     PickupSound=Sound'UnrealShare.Pickups.AmmoSnd'
     Icon=Texture'UnrealI.Icons.I_RazorAmmo'
     Physics=PHYS_Falling
     Mesh=LodMesh'UnrealI.RazorAmmoMesh'
     CollisionRadius=20.000000
     CollisionHeight=10.000000
     bCollideActors=True
}
