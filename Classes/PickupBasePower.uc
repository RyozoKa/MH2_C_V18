//=============================================================================
// PickupBasePower.
//=============================================================================
class PickupBasePower expands PickupBase;

var name WearedOffEvent;
var name DroppedEvent;
var name ReActivateEvent;

var texture BrightFluid, DarkFluid, BrightSkin;
var LightChargerOn LOn[4];
var class<LightChargerOn> LightOn;
var PowerUpsBaseOv ActOv;

var float TimeToBBack, TimeToCount;
var bool bSpawnedI;
var bool bCheckedPres;
var float TimeCounterB, StampCounterB;

var float LOnGlow;

var int PickupCharge;

var bool bWheel;

var bool FixA;

var RotatingPower rpm;

replication
{
	reliable if (Role == ROLE_Authority)
		rpm, TimeCounterB, StampCounterB, LOnGlow;
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

	if (!bRandom)
		TimeToBBack = PickupRespawnTime;
	else
		TimeToBBack = RandRespawnTime;

	bSpawnedI = True;
	

	if ((BeginDelayTime > 0 || bSpawnTriggered || bTriggerToggle) && !(bSPMode && bWeaponStay && !bNeverStays && I.IsA('Weapon')))
	{
		if (PickupClass.default.RespawnSound == None)
			Level.Game.PlaySpawnEffect(I);
		else
			XPlaySpawnEffect(I);
	}

	I.bRotatingPickup = bRotPickup;
	I.bRotatingPickup = bRotPickup;
	I.bFixedRotationDir = bRotPickup;
	I.RespawnTime = PickupRespawnTime;
	
	if (!I.IsA('BattleSuit'))
		I.Charge = PickupCharge;
	else
		BattleSuit(I).TimeActive = PickupCharge;

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

	if (I.IsA('UBerseker'))
	{
		UBerseker(I).WearedOffEvent = WearedOffEvent;
		UBerseker(I).DroppedEvent = DroppedEvent;
		UBerseker(I).ReActivateEvent = ReActivateEvent;
	}
	else if (I.IsA('BattleSuit'))
	{
		BattleSuit(I).WearedOffEvent = WearedOffEvent;
		BattleSuit(I).DroppedEvent = DroppedEvent;
		BattleSuit(I).ReActivateEvent = ReActivateEvent;
	}
	else if (I.IsA('UBersInvisibility'))
	{
		UBersInvisibility(I).WearedOffEvent = WearedOffEvent;
		UBersInvisibility(I).DroppedEvent = DroppedEvent;
		UBersInvisibility(I).ReActivateEvent = ReActivateEvent;
	}
	else if (I.IsA('UBersUDamage'))
	{
		UBersUDamage(I).WearedOffEvent = WearedOffEvent;
		UBersUDamage(I).DroppedEvent = DroppedEvent;
		UBersUDamage(I).ReActivateEvent = ReActivateEvent;
	}
}


simulated function Tick(float DeltaTime)
{
local byte jx;

	Super.Tick(DeltaTime);

	if (Level.NetMode != NM_DedicatedServer)
	{

	if (rpm != None && (Rotation.Pitch != 0 || Rotation.Roll != 0))
	{
	TimeCounterB += DeltaTime;

	If (TimeCounterB > 1/100)
	{
		StampCounterB += TimeCounterB;

		rpm.SetRotation(rTurn(Rotation, StampCounterB * rpm.RotationRate));

		if (rpm.RotationRate.Yaw != 0)
		{
			If (StampCounterB * rpm.RotationRate.Yaw > 65535)
				StampCounterB = 0;
		}

		TimeCounterB = 0;
	}
	}
	}

	if (bGameStarted && Mesh == Mesh'UTPowerUpBase2M')
	{

	if (TimeToBBack > 0 && !bSpawnedI && TimeToCount <= TimeToBBack )
		TimeToCount += DeltaTime;

	if (!bTriggeredMachine && !bSpawnTriggered && !bTriggerToggle && !bSpawnedI && TimeToCount <= TimeToBBack)
	{
		if ((TimeToBBack - TimeToCount) < 5)
		{
			For (jx=0; jx<4; jx++)
				LOn[jx].bHidden = False;
			ActOv.bHidden = False;
			
			if ((TimeToBBack - TimeToCount) >= 4)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = (5 - (TimeToBBack - TimeToCount)) * LOn[jx].Default.ScaleGlow;
					LOnGlow = (5 - (TimeToBBack - TimeToCount)) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = (5 - (TimeToBBack - TimeToCount)) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 3)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = ((TimeToBBack - TimeToCount) - 3) * LOn[jx].Default.ScaleGlow;
					LOnGlow = ((TimeToBBack - TimeToCount) - 3) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = ((TimeToBBack - TimeToCount) - 3) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 2)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = (3 - (TimeToBBack - TimeToCount)) * LOn[jx].Default.ScaleGlow;
					LOnGlow = (3 - (TimeToBBack - TimeToCount)) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = (3 - (TimeToBBack - TimeToCount)) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 1)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = ((TimeToBBack - TimeToCount) - 1) * LOn[jx].Default.ScaleGlow;
					LOnGlow = ((TimeToBBack - TimeToCount) - 1) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = ((TimeToBBack - TimeToCount) - 1) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 0)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = (1 - (TimeToBBack - TimeToCount)) * LOn[jx].Default.ScaleGlow;
					LOnGlow = (1 - (TimeToBBack - TimeToCount)) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = (1 - (TimeToBBack - TimeToCount)) * ActOv.Default.ScaleGlow;
			}
		}
	}
	else if (!bTriggeredMachine && !bSpawnedI && TimeToCount <= TimeToBBack && I!=None)
	{
		if ((TimeToBBack - TimeToCount) < 5)
		{
			For (jx=0; jx<4; jx++)
				LOn[jx].bHidden = False;
			ActOv.bHidden = False;
			
			if ((TimeToBBack - TimeToCount) >= 4)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = (5 - (TimeToBBack - TimeToCount)) * LOn[jx].Default.ScaleGlow;
					LOnGlow = (5 - (TimeToBBack - TimeToCount)) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = (5 - (TimeToBBack - TimeToCount)) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 3)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = ((TimeToBBack - TimeToCount) - 3) * LOn[jx].Default.ScaleGlow;
					LOnGlow = ((TimeToBBack - TimeToCount) - 3) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = ((TimeToBBack - TimeToCount) - 3) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 2)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = (3 - (TimeToBBack - TimeToCount)) * LOn[jx].Default.ScaleGlow;
					LOnGlow = (3 - (TimeToBBack - TimeToCount)) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = (3 - (TimeToBBack - TimeToCount)) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 1)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = ((TimeToBBack - TimeToCount) - 1) * LOn[jx].Default.ScaleGlow;
					LOnGlow = ((TimeToBBack - TimeToCount) - 1) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = ((TimeToBBack - TimeToCount) - 1) * ActOv.Default.ScaleGlow;
			}
			else if ((TimeToBBack - TimeToCount) >= 0)
			{
				For (jx=0; jx<4; jx++)
					//LOn[jx].ScaleGlow = (1 - (TimeToBBack - TimeToCount)) * LOn[jx].Default.ScaleGlow;
					LOnGlow = (1 - (TimeToBBack - TimeToCount)) * Class'LightChargerOn'.Default.ScaleGlow;
				ActOv.ScaleGlow = (1 - (TimeToBBack - TimeToCount)) * ActOv.Default.ScaleGlow;
			}
		}
	}

	}
}

simulated function SpawnLightsFX()
{
local int ji;
local vector X, Y, Z;

	GetAxes(Rotation, X, Y, Z);

	For (ji=0; ji<4; ji++)
	{
		if (ji == 0)
			LOn[ji] = Spawn(LightOn, Self,, Location + 28*X);
		else if (ji == 1)
			LOn[ji] = Spawn(LightOn, Self,, Location + 28*Y);
		else if (ji == 2)
			LOn[ji] = Spawn(LightOn, Self,, Location - 28*X);
		else if (ji == 3)
			LOn[ji] = Spawn(LightOn, Self,, Location - 28*Y);

	LOn[ji].bHidden = True;
	}
}


simulated function SpawnLightsN( byte ji)
{
local vector X, Y, Z;

	GetAxes(Rotation, X, Y, Z);

	if (ji == 0)
		LOn[ji] = Spawn(LightOn, Self,, Location + 28*X);
	else if (ji == 1)
		LOn[ji] = Spawn(LightOn, Self,, Location + 28*Y);
	else if (ji == 2)
		LOn[ji] = Spawn(LightOn, Self,, Location - 28*X);
	else if (ji == 3)
		LOn[ji] = Spawn(LightOn, Self,, Location - 28*Y);

}

function SpawnFXOv( bool bHideEffect)
{
	ActOv = Spawn(Class'PowerUpsBaseOv');
	ActOv.MultiSkins[2] = BrightSkin;
	ActOv.MultiSkins[3] = BrightFluid;
	ActOv.bHidden = bHideEffect;
}

simulated function SpawnRotationalHolder()
{
	rpm = Spawn(Class'RotatingPower', Self);

	if (Rotation.Pitch == 0 && Rotation.Roll == 0)
	{
		rpm.bFixedRotationDir = True;
		rpm.SetPhysics(PHYS_Rotating);
	}
}


simulated function Timer()
{
local int j;
local bool IsThere;
local PlayerPawn p;
local Bot B;
local vector X, Y, Z;
local int ji;
local float RandResp;

	If (!EndDataTrade)
	{
		EndDataTrade = True;	

		if (bWheel)
			SpawnRotationalHolder();	
	
		if (BeginDelayTime > 0)
			TimeToBBack = BeginDelayTime;

		SpawnLightsFX();
		SpawnFXOv(BeginDelayTime > 0);
		
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
			bGameStarted = True;
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

		bSpawnedI = IsThere;

		/*if (ActOv != None)
		{
			if (!ActOv.bHidden && !bSpawnedI && TimeToCount > TimeToBBack)
				bCheckedPres = False;
		}*/

		if (!bCheckedPres && !bSpawnedI)
		{
			bCheckedPres = True;
			TimeToCount = 0;
		}
		else if (bCheckedPres && bSpawnedI)
			bCheckedPres = False;

		if (Mesh == Mesh'UTPowerUpBase2M')
		{
		if (TimeToBBack - TimeToCount <= 0 && !bSpawnedI && !FixA)
			FixA = True;
		else if (TimeToBBack - TimeToCount <= 0 && !bSpawnedI && FixA)
		{
			bSpawnedI = False;
			bCheckedPres = False;
			TimeToCount = 0;
			FixA = False;
		}
		}


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

		if (Mesh == Mesh'UTPowerUpBase2M')
		{
		if (IsThere)
		{
			//MultiSkins[2] = BrightSkin;
			//MultiSkins[3] = BrightFluid;
			GetAxes(Rotation, X, Y, Z);
			For (ji=0; ji<4; ji++)
			{
				if (LOn[ji]!=None)
					LOn[ji].bHidden = False;
				else
					SpawnLightsN(ji);

				//LOn[ji].ScaleGlow = LOn[ji].Default.ScaleGlow;
				LOnGlow = Class'LightChargerOn'.Default.ScaleGlow;
			}

			if (ActOv == None)
				SpawnFXOv(False);
			else
			{
				ActOv.bHidden = False;
				ActOv.ScaleGlow = ActOv.Default.ScaleGlow;
			}

		}
		else if ((TimeToBBack - TimeToCount) >= 5)
		{
			//MultiSkins[2] = None;
			//MultiSkins[3] = DarkFluid;
			For (ji=0; ji<4; ji++)
			{
				if (LOn[ji]!=None)
					LOn[ji].bHidden = True;
			}

			ActOv.bHidden = True;
		}
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

defaultproperties
{
}
