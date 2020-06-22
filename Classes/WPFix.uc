//Fix GiveAmmo to set a hint so we don't delete it.
class WPFix expands Weapon;

function GiveAmmo( Pawn Other )
{
log("New GiveAmmo");
	if ( AmmoName == None )
		return;
	//Chris: So what if it's already set? Are we going to search for it again?? 
	if(AmmoType == None)
		AmmoType = Ammo(Other.FindInventoryType(AmmoName));
	if ( AmmoType != None )
		AmmoType.AddAmmo(PickUpAmmoCount);
	else
	{
		AmmoType = Spawn(AmmoName, self, '', vect(0,0,0), rot(0, 0, 0));	// Create ammo type required		
		Other.AddInventory(AmmoType);		// and add to player's inventory
		AmmoType.BecomeItem();
		AmmoType.AmmoAmount = PickUpAmmoCount; 
		AmmoType.GotoState('Idle2');
	}
}	

event TravelPostAccept()
{
	Super.TravelPostAccept();
	if ( Pawn(Owner) == None )
		return;
	if ( AmmoName != None )
	{
		if(AmmoType == None)
			AmmoType = Ammo(Pawn(Owner).FindInventoryType(AmmoName));
		if ( AmmoType == None )
		{		
			AmmoType = Spawn(AmmoName, self, '', vect(0,0,0), rot(0, 0, 0));	// Create ammo type required		
			Pawn(Owner).AddInventory(AmmoType);		// and add to player's inventory
			AmmoType.BecomeItem();
			AmmoType.AmmoAmount = PickUpAmmoCount; 
			AmmoType.GotoState('Idle2');
		}
	}
	if ( self == Pawn(Owner).Weapon )
		BringUp();
	else GoToState('Idle2');
}