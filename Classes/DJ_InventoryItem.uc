class DJ_InventoryItem extends TournamentPickup;

var int nofJumps;
var int maxJumps;
var int jumpHeight;
var string keyNames[15];
var int nofJumpKeys;

// Jumptype:
// 0 = Jump at apex
// 1 = Jump while going up and at apex
// 2 = Jump always
var int  jumpType;

replication
{
   reliable if( Role==ROLE_Authority )
      ClientPlayAnim;
   reliable if( Role<ROLE_Authority )
      DoubleJump;
}

simulated function PreBeginPlay()
{
   local PlayerPawn P;

   if (Level.Netmode == NM_DedicatedServer) return;
   foreach AllActors(class 'PlayerPawn', P)
   if (Viewport(P.Player) != None)
      break;

   if (P == None)
   {
      log("DJ: NO LOCAL PLAYERPAWN !!!");
      Destroy();
   }
   InitializeKeys(P);
}

simulated function InitializeKeys(PlayerPawn P)
{
   local string keyName;
   local string keyBinding;
   local int i;

   nofJumpKeys = 0;
   for (i=0; i<255; i++)
   {
      keyName = P.ConsoleCommand("Keyname"@i);

      if ((InStr( P.ConsoleCommand("Keybinding"@keyName), "Jump") != -1) && (InStr( P.ConsoleCommand("Keybinding"@keyName), "DoubleJump") == -1))
      {
	 keyBinding = P.ConsoleCommand("Keybinding"@keyName);
	 P.ConsoleCommand("SET INPUT"@keyName@"DoubleJump|"$keyBinding);
	 nofJumpKeys++;
      }
      else if (InStr( P.ConsoleCommand("Keybinding"@keyName), "DoubleJump") != -1)
      {
	 nofJumpKeys++;
      }
   }
}

exec simulated function RestoreJumpKeys()
{
   local int i, restoredKeys;
   local int FoundAt, StripStart;
   local string keyName;
   local string keyString, tempKeyString;
   local Actor P;

   log ("DJ: -- RestoreJumpKeys --");
   if (Owner == None)
   {
      return;
   }
   restoredKeys = 0;
   for (i=0; i<255; i++)
   {
      keyName = Owner.ConsoleCommand("Keyname"@i);
      keyString = Owner.ConsoleCommand("Keybinding"@keyName);

      if (InStr( keyString, "DoubleJump|") != -1)
      {
	 FoundAt = InStr( KeyString, "DoubleJump|");
	 StripStart = FoundAt + Len("DoubleJump|");
	 tempKeyString = "";
	 if (FoundAt != 0)
	 {
	    tempKeyString = Left(keyString, FoundAt);
	 }
	 Owner.ConsoleCommand("SET INPUT"@keyName@tempKeyString$Right(keyString, Len(keyString) - (FoundAt + Len("DoubleJump|"))));
	 restoredKeys++;
      }
      else if (InStr( keyString, "DoubleJump |") != -1)
      {
	 FoundAt = InStr( KeyString, "DoubleJump |");
	 StripStart = FoundAt + Len("DoubleJump |");
	 tempKeyString = "";
	 if (FoundAt != 0)
	 {
	    tempKeyString = Left(keyString, FoundAt);
	 }
	 Owner.ConsoleCommand("SET INPUT"@keyName@tempKeyString$Right(keyString, Len(keyString) - (FoundAt + Len("DoubleJump |"))));
	 restoredKeys++;
      }
   }
   if (restoredKeys == 0)
   {
      PlayerPawn(Owner).ClientMessage("DoubleJumpUT: No keys could be restored.");
   }
   else
   {
      PlayerPawn(Owner).ClientMessage("DoubleJumpUT: Jump keys are restored.");
   }
}

function Tick (float DeltaTime)
{
 if (PlayerPawn(Owner) == None) return;
 if (PlayerPawn(Owner).Physics != PHYS_Falling)
 {
	nofJumps = 1;
 }
 Super.Tick( DeltaTime ) ;
}

exec function DoubleJump()
{
   local PlayerPawn P;
   local Inventory inv;
   if (PlayerPawn(Owner) == None || !bActive) return;
   P = PlayerPawn(Owner);
      for(inv=P.Inventory;inv!=none;inv=inv.Inventory)
        if(inv.IsA('UT_JumpBoots') && Inv.bActive) 
			return;
   if (P.Physics == PHYS_Falling)
   {
      if (nofJumps < maxJumps)
      {
	/* switch (jumpType)
	    {
	       case 0: // Jump only at apex
		  if (!(P.Physics == PHYS_Falling && Abs(P.Velocity.Z) < 100.0) && P.Physics != PHYS_Walking)
		  {
		     return;
		  }
		  break;
	       case 1: // Jump when going up and at apex
		  if (!(P.Physics == PHYS_Falling && P.Velocity.Z > -100.0) && P.Physics != PHYS_Walking)
		  {
       		     return;
	       	  }
		  break;
            }*/
	    P.Velocity.Z = P.JumpZ * jumpHeight;
    	    nofJumps++;
    	    P.PlaySound(P.JumpSound, SLOT_Talk, 1.5, true, 1200, 1.0 );
	    if ( (Level.Game != None) && (Level.Game.Difficulty > 0) )
	    {
	       P.MakeNoise(0.1 * Level.Game.Difficulty);
	    }
	    if (nofJumps == maxJumps)
	    {
		
	       if ( P.AnimSequence=='DodgeR' && P.HasAnim('ROLLRIGHT') )
	       {
		  P.PlayAnim('RollRight', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
		  if (Level.Netmode != NM_StandAlone)
		  {
		     ClientPlayAnim('RollRight', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
		  }
  	       }
	       else if ( P.AnimSequence=='DodgeL' && P.HasAnim('ROLLLEFT') )
	       {
		  P.PlayAnim('RollLeft', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
		  if (Level.Netmode != NM_StandAlone)
		  {
		     ClientPlayAnim('RollLeft', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
		  }
	       }
	       else if ( P.HasAnim('Flip') )
	       {
		  P.PlayAnim('Flip', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
		  if (Level.Netmode != NM_StandAlone)
                  {
		     ClientPlayAnim('Flip', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
		  }
	       }
            }
      }
   }
   else
   {
      P.DoJump();
      nofJumps = 1;
   }
}

simulated function ClientPlayAnim( name Sequence, optional float Rate, optional float TweenTime )
{
   Owner.PlayAnim(Sequence, Rate, TweenTime);
}

defaultproperties
{
     nofJumps=1
     ItemName="MH DoubleJump"
     AmbientGlow=0
}
