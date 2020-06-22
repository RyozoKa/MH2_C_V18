//=============================================================================
// StingerAmmo.
//=============================================================================
class NewStingerAmmo extends Ammo;

defaultproperties
{
     AmmoAmount=100
     MaxAmmo=1000
     UsedInWeaponSlot(3)=1
     PickupMessage=""
     PickupViewMesh=LodMesh'UnrealShare.TarydiumPickup'
     PickupSound=Sound'UnrealShare.Pickups.AmmoSnd'
     Icon=Texture'UnrealShare.Icons.I_StingerAmmo'
     Mesh=LodMesh'UnrealShare.TarydiumPickup'
     CollisionRadius=22.000000
     CollisionHeight=6.000000
     bCollideActors=True
}
