//Fixed Epics fuckups
class PP_Fix extends Pawn;

function bool AddInventory( inventory NewItem )
{
	// Skip if already in the inventory.
	local inventory Inv;
	
	// The item should not have been destroyed if we get here.
	if (NewItem ==None )
		//log("tried to add none inventory to "$self);
		return false;	//Ofc is more important to add a stupid log than to return function properly from screwing inventory.
	for( Inv=Inventory; Inv!=None; Inv=Inv.Inventory )
		if( Inv == NewItem )
			return false;

	// Add to front of inventory chain.
	NewItem.SetOwner(self);
	NewItem.Inventory = Inventory;
	Inventory = NewItem;

	return true;
}

function JumpOffPawn()
{
	if(Base.IsA('ScriptedPawn') || IsA('ScriptedPawn'))
	{
		Velocity += 60 * VRand();
		Velocity.Z = 180;
		SetPhysics(PHYS_Falling);
	}
}

defaultproperties
{
}
