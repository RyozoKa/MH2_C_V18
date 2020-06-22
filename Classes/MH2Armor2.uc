//=============================================================================
// Armor2 powerup.
//=============================================================================
class MH2Armor2 extends Armor2;

#Exec Texture file=Textures/FrostArmorSkin.pcx name=FrostArmorSkin
#Exec Texture file=Textures/FrostArmor.pcx name=FrostArmor
function bool HandlePickupQuery( inventory Item )
{
	local inventory S;

	if ( item.class == class ) 
	{
		S = Pawn(Owner).FindInventoryType(class'UT_Shieldbelt');	
		if (  S==None )
		{
			if ( Charge<Item.Charge )	
				Charge = Item.Charge;
		}
		else
			Charge = Clamp(S.Default.Charge - S.Charge, Charge, Item.Charge );
		if ( PickupMessageClass == None )
			Pawn(Owner).ClientMessage(PickupMessage, 'Pickup');
		else
			Pawn(Owner).ReceiveLocalizedMessage( PickupMessageClass, 0, None, None, Self.Class );
		Item.PlaySound (PickupSound,,2.0);
		Item.SetReSpawn();
		return true;				
	}
	if ( Inventory == None )
		return false;

	return Inventory.HandlePickupQuery(Item);
}

function inventory SpawnCopy( pawn Other )
{
	local inventory Copy, S;

	Copy = Super.SpawnCopy(Other);
	S = Other.FindInventoryType(class'UT_Shieldbelt');	
	if ( S != None )
	{
		Copy.Charge = Min(Copy.Charge, S.Default.Charge - S.Charge);
		if ( Copy.Charge <= 0 )
		{ 
			S.Charge -= 1;
			Copy.Charge = 1;
		}
	}
	return Copy;
}

State Sleeping
{
	ignores Touch;

	function BeginState()
	{
		BecomePickup();
		bHidden = true;
		if(MH2Base(Owner) != none)
			MH2Base(Owner).SpawnParticles();
	}
	function EndState()
	{
		local int i;

		bSleepTouch = false;
		for ( i=0; i<4; i++ )
			if ( (Touching[i] != None) && Touching[i].IsA('Pawn') )
				bSleepTouch = true;
		MH2Base(Owner).pp.Destroy();
	}			
Begin:
	Sleep( ReSpawnTime );
	PlaySound( Sound'MH2_C_Pickups.InvisibiltyRespawn', SLOT_Ambient, 16 );	
	Sleep( Level.Game.PlaySpawnEffect(self) );
	GoToState( 'Pickup' );
}

defaultproperties
{
     bRotatingPickup=True
     PickupMessage="Superb Body armor"
     ItemName="Frost Armor"
     Charge=200
     ArmorAbsorption=96
     Icon=Texture'MH2_EXU.Icons.FrostArmor'
     DrawScale=1.100000
     MultiSkins(1)=Texture'MH2_EXU.Inventory.FrostArmorSkin'
     CollisionRadius=33.000000
     CollisionHeight=33.000000
     RotationRate=(Yaw=15000)
}
