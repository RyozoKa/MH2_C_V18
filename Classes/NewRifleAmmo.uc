//=============================================================================
//Replaced RifleAmmo.
//=============================================================================
class NewRifleAmmo extends Ammo;

defaultproperties
{
     AmmoAmount=100
     MaxAmmo=1000
     UsedInWeaponSlot(9)=1
     PickupMessage=""
     PickupViewMesh=LodMesh'UnrealI.RifleBullets'
     MaxDesireability=0.240000
     PickupSound=Sound'UnrealShare.Pickups.AmmoSnd'
     Icon=Texture'UnrealI.Icons.I_RIFLEAmmo'
     Mesh=LodMesh'UnrealI.RifleBullets'
     CollisionRadius=15.000000
     CollisionHeight=20.000000
     bCollideActors=True
}
