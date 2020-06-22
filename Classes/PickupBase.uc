//=============================================================================
// PickupBase.
//=============================================================================
class PickupBase expands Decoration;


var class<Inventory> PickupClass;
var float BeginDelayTime;
var vector SpawnOffset;
var bool bRotPickup, bAlready, bGameStarted;
var PickParticles XParticles[4];
var bool bStay;
var rotator PickupRotOffset;
var bool bSpawnTriggered, AlreadySpawned, bTriggerToggle, EventDone, EventDoneB;
var bool FirstSpawn, EndDataTrade;
var bool bSpawnEventOnce;
var bool bAutoAlignPickup;

var bool bRandom;
var Class<Inventory> RandomPickups[16];
var float RandRespawnTime;
var float TimeCounter, StampCounter;
var bool bUseRandomRespawnTime;
var float RandRespawnTimeMin;
var float RandRespawnTimeMax;
var float PickupRespawnTime;

var name CollectedEvent;
var name SpawnEvent;

var float RetriggerWaitTime;
var float TimeCountR;
var bool bTriggeredMachine;

var InventorySpot PMarker;

var bool bSPMode;
var float RespawnTimeCounter;

var bool bWeaponStay;
var bool bNeverStays;

var bool bForceRot;
var bool bModdedWeap;

var Inventory I;

replication
{
	// Things the server should send to the client.
	reliable if(Role==ROLE_Authority)
		I, TimeCounter, StampCounter, bRotPickup, RespawnTimeCounter, bAutoAlignPickup, bModdedWeap;
}


function PostBeginPlay()
{
	SetTimer(0.2, False);
}

function float XPlaySpawnEffect(inventory Inv)
{
    spawn(class 'EnhancedReSpawnX',Inv,, Inv.Location );
    return 0.3;
}


function Trigger( actor Other, pawn EventInstigator )
{
	if (bTriggeredMachine && !AlreadySpawned && I==None)
	{
		bGameStarted = True;
		AlreadySpawned = True;
		bAlready = True;
		SetTimer(0.3, True);
		SetPickup();
	}
	else
	{
	if ((bSpawnTriggered && !AlreadySpawned) || (bTriggerToggle && !AlreadySpawned && I==None))
	{
		bGameStarted = True;
		AlreadySpawned = True;
		bAlready = True;
		SetTimer(0.3, True);
		SetPickup();
	}
	else if (bTriggerToggle && !AlreadySpawned && I!=None)
	{
		bGameStarted = True;
		AlreadySpawned = False;
		bAlready = True;
		SetTimer(0.3, True);

		if (!bSPMode)
		{
			if (I.IsA('BattleSuit'))
				BattleSuit(I).TimeActive = 0;
			else
				I.Charge = 0;

			I.Destroy();
		}
		else if (bSPMode && !I.bHidden)
		{
			if (I.IsA('BattleSuit'))
				BattleSuit(I).TimeActive = 0;
			else
				I.Charge = 0;

			I.Destroy();
		}

		I = None;
	}
	}
}

simulated function SetPickup()
{
local vector X, Y, Z;
local int ji;
local Actor Target;
local Inventory Ix;
local vector RelLoc;

	GetAxes(Rotation, X, Y, Z);

	If (!bRandom)
	{
		if (bAutoAlignPickup)
			I = Spawn(PickupClass,, Tag, Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z), Rotation + PickupRotOffset);
		else
			I = Spawn(PickupClass,, Tag, Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z), PickupRotOffset);
	}
	else
	{
		For (ji=0; ji<16; ji++)
		{
			if(RandomPickups[ji] == None)
				break;
		}

		PickupClass = RandomPickups[Rand(ji)];

		if (bAutoAlignPickup)
			I = Spawn(PickupClass,, Tag, Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z), Rotation + PickupRotOffset);
		else
			I = Spawn(PickupClass,, Tag, Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z), PickupRotOffset);
	}

	//Fix for inventory replacement mutators using the CheckReplacement function
	if (I == None)
	{
		if (bAutoAlignPickup)
			RelLoc = Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z);
		else
			RelLoc = Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z);

		ForEach VisibleCollidingActors (Class'Inventory', Ix, 8.0, RelLoc)
		{
			if (Ix.IsA('Pickup') || Ix.IsA('Weapon'))
			{
				//I = Ix;
				PickupClass = Ix.Class;
				Ix.Destroy();

				bModdedWeap = True;
				
				if (bAutoAlignPickup)
					I = Spawn(PickupClass,, Tag, Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z), Rotation + PickupRotOffset);
				else
					I = Spawn(PickupClass,, Tag, Location + (SpawnOffset.X * X + SpawnOffset.Y * Y + SpawnOffset.Z * Z), PickupRotOffset);

				break;
			}
		}
	}
	

	if (Weapon(I) != None && Role == ROLE_Authority)
	{
		if (bWeaponStay && !bNeverStays)
			Weapon(I).bWeaponStay = True;
		else if (bNeverStays)
			Weapon(I).bWeaponStay = False;

		/*if (Level.NetMode != NM_Standalone && Level.Game.IsA('DeathMatchPlus') )
			Weapon(I).bWeaponStay = (bWeaponStay || DeathMatchPlus(Level.Game).bMultiWeaponStay) && !bNeverStays;
		else        
			Weapon(I).bWeaponStay = (bWeaponStay || Level.Game.bCoopWeaponMode) && !bNeverStays;*/
	}

	if ((BeginDelayTime > 0 || bSpawnTriggered || bTriggerToggle) && !(bSPMode && bWeaponStay && !bNeverStays && I.IsA('Weapon')))
	{
		if (PickupClass.default.RespawnSound == None)
			Level.Game.PlaySpawnEffect(I);
		else
			XPlaySpawnEffect(I);
	}
	
	I.RespawnTime = PickupRespawnTime;

	if (!bForceRot)
	{
		I.bRotatingPickup = bRotPickup;
		I.bRotatingPickup = bRotPickup;
		I.bFixedRotationDir = bRotPickup;
	}
	else
	{

		if (bModdedWeap)
		{
			I.bRotatingPickup = False;
			I.bFixedRotationDir = False;
		}
		else
		{
			I.bRotatingPickup = True;
			I.bFixedRotationDir = True;
			I.RotationRate.Yaw = 30000;
		}
	
	}

	If (I != None && (Rotation.Pitch != 0 || Rotation.Roll != 0) && bRotPickup && bAutoAlignPickup)
	{
		I.bRotatingPickup = False;
		I.bFixedRotationDir = False;
	}
	
	If (!FirstSpawn && SpawnEvent!='' && bSpawnEventOnce)
	{
		ForEach AllActors( class 'Actor', Target, SpawnEvent)
                		Target.Trigger( Self, Instigator );
	}


	FirstSpawn = True;

	if (PMarker != None)
	{
		PMarker.markedItem = I;
		I.MyMarker = PMarker;
	}
}


simulated function Timer()
{
local int j;
local bool IsThere;
local PlayerPawn p;
local Bot B;
local float RandResp;

	If (!EndDataTrade)
	{
		EndDataTrade = True;
		
		If (!bTriggerToggle && !bSpawnTriggered)
			SetTimer(0.3, True);
		else if (bTriggerToggle)
			bSpawnTriggered = False;
	}
	else
	{

	if (!bAlready)
	{

		if (!bGameStarted && BeginDelayTime > 0)
		{
		
		ForEach AllActors (class'PlayerPawn',p)
		{
			if (Level.Game.IsA('DeathMatchPlus'))
			{
				if (!( P.IsA('Spectator') || P.Health <= 0 ||
				(DeathMatchPlus(Level.Game).bRequireReady && (DeathMatchPlus(Level.Game).CountDown > 0)) ))
				{
					bGameStarted = True;
					SetTimer(BeginDelayTime, False);
				}
			}
			else
			{
				bGameStarted = True;
				SetTimer(BeginDelayTime, False);
			}

		}

		ForEach AllActors (class'Bot',B)
		{
			if (Level.Game.IsA('DeathMatchPlus'))
			{
				if (!B.bHidden)
				{
					bGameStarted = True;
					SetTimer(BeginDelayTime, False);
				}
			}

		}

		}
		else
		{
			bAlready=True;
			SetPickup();
			SetTimer(0.3, True);
		}

	}
	else
	{
		if (I != None)
			IsThere = !I.bHidden;
		else
			IsThere = False;


		if (CollectedEvent != '' && !EventDone && !IsThere && FirstSpawn)
		{
			EventDone = True;
			ForEach AllActors( class 'Actor', Target, CollectedEvent)
                		Target.Trigger( Self, I.Instigator );
		}
		else if (CollectedEvent != '' && EventDone && IsThere && FirstSpawn)
			EventDone = False;


		if (!bSpawnEventOnce && !EventDoneB && IsThere && SpawnEvent!='')
		{
			EventDoneB = True;
			ForEach AllActors( class 'Actor', Target, SpawnEvent)
                		Target.Trigger( Self, Instigator );
		}
		else if (!bSpawnEventOnce && EventDoneB && !IsThere && SpawnEvent!='')
			EventDoneB = False;



		if (bRandom && !bTriggerToggle && !bSpawnTriggered && !IsThere && I!=None && !bTriggeredMachine)
		{

			if (!bSPMode)
			{
				if (I.IsA('BattleSuit'))
					BattleSuit(I).TimeActive = 0;
				else
					I.Charge = 0;

				I.Destroy();
			}


			I = None;
			bAlready = False;

			if (bUseRandomRespawnTime)
			{
				RandResp = Max(0.5, RandRange( RandRespawnTimeMin, RandRespawnTimeMax));
				SetTimer(RandResp, False);
			}
			else
				SetTimer(RandRespawnTime, False);
		}
		else if (!IsThere && I!=None && bTriggeredMachine)
		{
			if (!bSPMode)
			{
				if (I.IsA('BattleSuit'))
					BattleSuit(I).TimeActive = 0;
				else
					I.Charge = 0;

				I.Destroy();
			}

			I = None;
		}

		

		if(!bStay && XParticles[0] != None)
		{
			For (j=0; j<4; j++)
			{
				if (XParticles[j] != None)
				XParticles[j].bHidden = IsThere;
			}
		}
	}

	}
}


simulated event Tick( float DeltaTime)
{
local vector X, Y, Z;

	//Single Player respawn controlling
	//*****************************************************************
	if (bSPMode && I!=None && I.bHidden && !bRandom && !bTriggeredMachine)
	{
		if (bSPMode && bWeaponStay && !bNeverStays && I.IsA('Weapon'))
		{
			I = None;
			SetPickup();
		}
		else
		{
			RespawnTimeCounter = PickupClass.default.RespawnTime + 1;
			I = None;
		}
	}
	else if (bSPMode && I==None && RespawnTimeCounter > 0 && !bRandom && !bTriggeredMachine)
	{
		RespawnTimeCounter -= DeltaTime;

		if (RespawnTimeCounter <= 1)
		{
			RespawnTimeCounter = 0;
			SetPickup();
		}
	}
	//*****************************************************************

	if (bRotPickup && Level.NetMode != NM_DedicatedServer)
	{

	if (I != None && (Rotation.Pitch != 0 || Rotation.Roll != 0) && bAutoAlignPickup && !bModdedWeap)
	{
	TimeCounter += DeltaTime;

	If (TimeCounter > 1/100)
	{
		StampCounter += TimeCounter;

		I.SetRotation(rTurn(Rotation, StampCounter * I.RotationRate));

		if (I.RotationRate.Yaw != 0)
		{
			If (StampCounter * I.RotationRate.Yaw > 65535)
				StampCounter = 0;
		}

		TimeCounter = 0;
	}
	}
	else if (bModdedWeap && I != None)
	{
		TimeCounter += DeltaTime;

	If (TimeCounter > 1/100)
	{
		StampCounter += TimeCounter;

		I.SetRotation(rTurn(Rotation, StampCounter * rot(0,30000,0)));

		If (StampCounter * 30000 > 65535)
			StampCounter = 0;

		TimeCounter = 0;
	}

	}
	
	}

	if (EndDataTrade)
	{
	if ((bSpawnTriggered || bTriggerToggle || bTriggeredMachine) && RetriggerWaitTime >= 0 && AlreadySpawned)
	{
		TimeCountR += DeltaTime;

		if (TimeCountR >= RetriggerWaitTime)
		{
			TimeCountR = 0;
			AlreadySpawned = False;
		}
	}
	}
}


simulated function rotator rTurn(rotator rHeading,rotator rTurnAngle)
{
    // Generate a turn in object coordinates 
    //     this should handle any gymbal lock issues
 
    local vector vForward,vRight,vUpward;
    local vector vForward2,vRight2,vUpward2;
    local rotator T;
    local vector  V;
 
    GetAxes(rotation,vForward,vRight,vUpward);
    //  rotate in plane that contains vForward&vRight
    T.Yaw=rTurnAngle.Yaw; V=vector(T);
    vForward2=V.X*vForward + V.Y*vRight;
    vRight2=V.X*vRight - V.Y*vForward;
    vUpward2=vUpward;
 
    // rotate in plane that contains vForward&vUpward
    T.Yaw=rTurnAngle.Pitch; V=vector(T);
    vForward=V.X*vForward2 + V.Y*vUpward2;
    vRight=vRight2;
    vUpward=V.X*vUpward2 - V.Y*vForward2;
 
    // rotate in plane that contains vUpward&vRight
    T.Yaw=rTurnAngle.Roll; V=vector(T);
    vForward2=vForward;
    vRight2=V.X*vRight + V.Y*vUpward;
    vUpward2=V.X*vUpward - V.Y*vRight;
 
    T=OrthoRotation(vForward2,vRight2,vUpward2);
 
   return(T);
}

defaultproperties
{
     bStatic=False
     bStasis=False
     RemoteRole=ROLE_SimulatedProxy
     DrawType=DT_Mesh
}
