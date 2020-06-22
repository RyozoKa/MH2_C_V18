//Fixed Epics fuckups
class PPP_Fix extends PlayerPawn;

exec function SwitchWeapon (byte F )
{
	local weapon newWeapon;
	Log("Switch weapon");
	if ( bShowMenu || Level.Pauser!="" )
	{
		if ( myHud != None )
			myHud.InputNumber(F);
		return;
	}
	if ( Inventory == None )
		return;
	if ( (Weapon != None) && (Weapon.Inventory != None) )
		newWeapon = Weapon.Inventory.WeaponChange(F);
	//else
	//	newWeapon = None;	
	else if ( newWeapon == None )
		newWeapon = Inventory.WeaponChange(F);
	if ( newWeapon == None )
		return;

	if ( Weapon == None )
	{
		PendingWeapon = newWeapon;
		ChangedWeapon();
	}
	else if ( Weapon != newWeapon )
	{
		PendingWeapon = newWeapon;
		//if ( !Weapon.PutDown() )
		//	PendingWeapon = None;
		Weapon.PlayAnim('',0.0, 0.0);
		Weapon = newWeapon;
		log("WE DID IT");
	}
}

/* PrevWeapon()
- switch to previous inventory group weapon
*/
exec function PrevWeapon()
{
	local int prevGroup;
	local Inventory inv;
	local Weapon realWeapon, w, Prev;
	local bool bFoundWeapon;

	if( bShowMenu || Level.Pauser!="" )
		return;
	if ( Weapon == None )
	{
		SwitchToBestWeapon();
		return;
	}
	prevGroup = 0;
	realWeapon = Weapon;
	Weapon.GotoState('DownWeapon');
	if ( PendingWeapon != None )
		Weapon = PendingWeapon;
	PendingWeapon = None;
	
	for (inv=Inventory; inv!=None; inv=inv.Inventory)
	{
		w = Weapon(inv);
		if ( w != None )
		{
			if ( w.InventoryGroup == Weapon.InventoryGroup )
			{
				if ( w == Weapon )
				{
					bFoundWeapon = true;
					if ( Prev != None )
					{
						PendingWeapon = Prev;
						break;
					}
				}
				else if ( !bFoundWeapon && ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) )
					Prev = W;
			}
			else if ( (w.InventoryGroup < Weapon.InventoryGroup) 
					&& ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) 
					&& (w.InventoryGroup >= prevGroup) )
			{
				prevGroup = w.InventoryGroup;
				PendingWeapon = w;
			}
		}
	}
	bFoundWeapon = false;
	prevGroup = Weapon.InventoryGroup;
	if ( PendingWeapon == None )
		for (inv=Inventory; inv!=None; inv=inv.Inventory)
		{
			w = Weapon(inv);
			if ( w != None )
			{
				if ( w.InventoryGroup == Weapon.InventoryGroup )
				{
					if ( w == Weapon )
						bFoundWeapon = true;
					else if ( bFoundWeapon && (PendingWeapon == None) && ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) )
						PendingWeapon = W;
				}
				else if ( (w.InventoryGroup > PrevGroup) 
						&& ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) ) 
				{
					prevGroup = w.InventoryGroup;
					PendingWeapon = w;
				}
			}
		}

	Weapon = realWeapon;
	if ( PendingWeapon == None )
		return;

	Weapon.PutDown();
}

/* NextWeapon()
- switch to next inventory group weapon
*/
exec function NextWeapon()
{
	local int nextGroup;
	local Inventory inv;
	local Weapon realWeapon, w, Prev;
	local bool bFoundWeapon;

	if( bShowMenu || Level.Pauser!="" )
		return;
	if ( Weapon == None )
	{
		SwitchToBestWeapon();
		return;
	}
	nextGroup = 100;
	realWeapon = Weapon;
	//Weapon.PlayAnim('Idle',0.0, 0.0);
	Weapon.GotoState('DownWeapon');
	if ( PendingWeapon != None )
		Weapon = PendingWeapon;
	PendingWeapon = None;

	for (inv=Inventory; inv!=None; inv=inv.Inventory)
	{
		w = Weapon(inv);
		if ( w != None )
		{
			if ( w.InventoryGroup == Weapon.InventoryGroup )
			{
				if ( w == Weapon )
					bFoundWeapon = true;
				else if ( bFoundWeapon && ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) )
				{
					PendingWeapon = W;
					break;
				}
			}
			else if ( (w.InventoryGroup > Weapon.InventoryGroup) 
					&& ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) 
					&& (w.InventoryGroup < nextGroup) )
			{
				nextGroup = w.InventoryGroup;
				PendingWeapon = w;
			}
		}
	}

	bFoundWeapon = false;
	nextGroup = Weapon.InventoryGroup;
	if ( PendingWeapon == None )
		for (inv=Inventory; inv!=None; inv=inv.Inventory)
		{
			w = Weapon(Inv);
			if ( w != None )
			{
				if ( w.InventoryGroup == Weapon.InventoryGroup )
				{
					if ( w == Weapon )
					{
						bFoundWeapon = true;
						if ( Prev != None )
							PendingWeapon = Prev;
					}
					else if ( !bFoundWeapon && (PendingWeapon == None) && ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) )
						Prev = W;
				}
				else if ( (w.InventoryGroup < nextGroup) 
					&& ((w.AmmoType == None) || (w.AmmoType.AmmoAmount>0)) ) 
				{
					nextGroup = w.InventoryGroup;
					PendingWeapon = w;
				}
			}
		}

	Weapon = realWeapon;
	if ( PendingWeapon == None )
		return;

	Weapon.PutDown();
}

defaultproperties
{
}
