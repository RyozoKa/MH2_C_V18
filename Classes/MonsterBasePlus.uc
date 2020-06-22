class MonsterBasePlus expands Mutator
	config(MH2_C_V18);

	
//External libraries
/*
//Default UT files
#exec OBJ LOAD FILE="..\Music\firebr.umx"
#exec OBJ LOAD FILE="..\Textures\GenFX.utx"

//Weapons packages
#exec OBJ LOAD FILE="..\System\BPak.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\UT4BarretRifleV1.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\UKBadBoy.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\ColorShock.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\MJD.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\oldskool.u" PACKAGE=MH2_C_V18	//Contains fixed versions of projectiles
//#exec OBJ LOAD FILE="..\System\MHWeapons.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\MH2_EXU.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\BPSE.u" PACKAGE=MH2_C_V18

#exec OBJ LOAD FILE="..\Syste\MonsterHunt.u" PACKAGE=MH2_C_V18

//Custom music files
#exec OBJ LOAD FILE="..\Music\LasGone.umx" PACKAGE=MH2_C_V18

//Other mutators
#exec OBJ LOAD FILE="..\System\TeleporterFix103.u" 

//Other pickups
#exec OBJ LOAD FILE="..\System\MH2_C_Pickups.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\MH2_C_Meshes.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\Textures\MH2_C_Anims.utx" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\Textures\MH2_C_MyTex.utx" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\Textures\MH2_C_Pickups.utx" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\Textures\MH2_C_Textures.utx" PACKAGE=MH2_C_V18
*/
#exec AUDIO IMPORT FILE="Sounds/youhavewon.wav" name="Win"
#exec AUDIO IMPORT FILE="Sounds/youhavelost.wav" name="Fail"
//#exec TEXTURE IMPORT NAME=JSquid1 FILE=Textures\JSquid1.PCX Mips=Off Flags=2 //GROUP=Skins
/*#exec MESH IMPORT MESH=ExSquid1 ANIVFILE=Models\ExSquid1_a.3d DATAFILE=Models\ExSquid1_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=ExSquid1 X=0 Y=0 Z=-100 YAW=-64 ROLL=-64

#exec MESH SEQUENCE MESH=ExSquid1 SEQ=All		STARTFRAME=0 NUMFRAMES=142
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Dead1	STARTFRAME=0 NUMFRAMES=21 RATE=15.00
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=TakeHit	STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Fighter	STARTFRAME=21 NUMFRAMES=15 RATE=15.00
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Flopping	STARTFRAME=21 NUMFRAMES=15 RATE=15.00
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Grab	STARTFRAME=36 NUMFRAMES=13 RATE=15.00 GROUP=Attack
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Hold	STARTFRAME=49 NUMFRAMES=15 RATE=15.00
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Release	STARTFRAME=64 NUMFRAMES=6
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Slap	STARTFRAME=70 NUMFRAMES=13 RATE=15.00 GROUP=Attack
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=spin	STARTFRAME=83 NUMFRAMES=10 RATE=15.00
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Swim	STARTFRAME=93 NUMFRAMES=20 RATE=15.00
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Thrust	STARTFRAME=113 NUMFRAMES=18 RATE=15.00 GROUP=Attack
#exec MESH SEQUENCE MESH=ExSquid1 SEQ=Turn	STARTFRAME=131 NUMFRAMES=11 RATE=15.00*/

//#exec MESHMAP SCALE MESHMAP=ExSquid1 X=0.1 Y=0.1 Z=0.2
//#exec MESHMAP SETTEXTURE MESHMAP=ExSquid1 NUM=1 TEXTURE=JSquid1

//#exec MESH NOTIFY MESH=ExSquid1 SEQ=Grab      TIME=0.54 FUNCTION=GrabTarget
//#exec MESH NOTIFY MESH=ExSquid1 SEQ=Slap      TIME=0.36 FUNCTION=SlapTarget
//#exec MESH NOTIFY MESH=ExSquid1 SEQ=Thrust    TIME=0.23 FUNCTION=ThrustTarget

//#exec OBJ LOAD FILE=..\System\OLweapons.u PACKAGE=OLweapons
#exec AUDIO IMPORT FILE="Sounds\HitSoundEnemy.wav" NAME="HitsoundEnemy"
#exec AUDIO IMPORT FILE="Sounds\HitSoundTeam.wav" NAME="HitsoundTeam"

var DeathMatchPlus MyGame;
var bool bPostInitialized;
var int AmpCount;
var int kakuCount;
var int LevelMonster;
var int MySkill;
var int Ways;
//config vars
//Server creds
var config string UserName;
var config string ServerPassword;
//Damages
var config int FItems;
var config float MoverDelay;
var config bool bUseCoopTranslocator;
var config bool bUseCrapSpree;


var config int AmpTime;
var config int kakuTime;
var config int HealthTime;

var int AmpCounter;
var int KakuCounter;
var int HealthCounter;

var config bool StopPlayerCollision;
var config int NumCapacity;
var config bool bRemoveBlocking;

//Monsters behaviour 
var config float MHealthMultiplier;
var config int MaxMonsterHealth;

//Player General Setup
var config int StartingAmmoAmmount;
var config bool PlayerNeverAutoSwitchWeapon;
var config bool bUseAntiboost;
var config bool bUseWarnTeamDamage;
var config bool bHitsounds;

//Players Health
var config int MaxHealth;
var config int DefaultHealth;
var config float SelfDamageScale;

//Double Jump
var config bool DoubleJump;
var config int maxJumps;
var config int jumpType;
var config float jumpHeight;

var config class<CSWeapons16> WeaponClasses[32];

// Native functions


//Fast check if sphere collides the world
native(1962) final function bool CollideSphere(vector Location, int Radius);

native(2036) final function DeleteMap(string Filename);

native(1959) final function bool ReplaceState(class<Object> Dest, class<Object> Source, name State, name With);


native(1960) final function bool AddState(class<Object> Dest, class<Object> Source, name State);

//This is a function replacer that lets you iterate over the functions from Dest class all the way to BaseClass to find the function.
native(1961) final function bool ReplaceLastFunction(class<Object> Dest, class<Object> Source, class<Object> BaseClass, name function, name withfunction, optional name InState, optional name WithState);

native(1963) final iterator function AllClasses(out Class OutClass, optional class<Object> BaseClass);

//XC engine natives
native(3560) static final function bool ReplaceFunction( class<Object> ReplaceClass, class<Object> WithClass, name ReplaceFunction, name WithFunction, optional name InState);

native(3561) static final function bool RestoreFunction( class<Object> RestoreClass, name RestoreFunction, optional name InState);

function PostBeginPlay()
{
	local ScriptedPawn S;
	local ThingFactory Thfa;
	local CreatureFactory CF;
	local BlockMonsters Bmo;
	local CTFFlag Flag;
	local class<CreatureFactory> CreatureFactory;
	local CreatureFactory NewCF;
    local CStats StatsMutta;
	local Trigger T;
	local bool bHasTL;
	local ScriptedPawn RandomPawn;
	local class<Object> CurCls;
	
    if(bPostInitialized) return;
	bPostInitialized=true;
	
	SaveConfig();
	//+--------------------------------------------------------------------------------------------------------------------------------+
	//Add mutators...
	log("Adding Mutators.", 'BaseMutator');
	StatsMutta=Spawn(class'MH2_C_V18.CStats');
	
	MonsterHunt2(Level.Game).StatsMut=StatsMutta;
	AddMutator(StatsMutta);
	//AddMutator(Spawn(class'csmut16'));
	//AddMutator(Spawn(class'StuffSwapper.Stuffswapper'));
	Spawn(class'TeleporterFix103.TeleporterFix');
    //AddMutator(Spawn(class'MH2_C_V18.spec_mutator'));
	//........
	
	
	
	
	ReplaceLastFunction(class'ScriptedPawn',class'SPFix',class'ScriptedPawn', 'Timer','Timer','TacticalMove','TacticalMove');
	ReplaceState(class'ScriptedPawn',class'SPFix','Retreating','Retreating');
	ReplaceFunction(class'AssertMover',class'AssertMoverFix','DoOpen','DoOpen_Fix');
	ReplaceFunction(class'AssertMover',class'AssertMoverFix','DoClose','DoClose_Fix');
	ReplaceFunction(class'Pawn',class'PP_Fix','AddInventory','AddInventory');
	ReplaceFunction(class'Pawn',class'PP_Fix','JumpOffPawn','JumpOffPawn');	//Why the fuck did Epic redefine the exact same function in PP?
	ReplaceFunction(class'PlayerPawn', class'PPP_Fix', 'SwitchWeapon', 'SwitchWeapon');
	ReplaceFunction(class'PlayerPawn', class'PPP_Fix', 'PrevWeapon', 'PrevWeapon');
	ReplaceFunction(class'PlayerPawn', class'PPP_Fix', 'NextWeapon', 'NextWeapon');
	//---
	LevelMonster = MonsterHunt2(Level.Game).SkillMonster;	
		log ("Difficulty is set to:"@LevelMonster);

	if ( LevelMonster == 1)
		MySkill = 0;
	if (LevelMonster == 2 || LevelMonster == 3)
		MySkill = 1;
	if (LevelMonster == 4 || LevelMonster == 5)
		MySkill = 2;
	if (LevelMonster == 6 || LevelMonster == 7)
		MySkill = 3;
	
	Level.game.registerdamagemutator(Self);
	Level.game.registermessagemutator(Self);
	if(DefaultHealth < 150)
		DefaultHealth = 150;
	//HealthKillRegen = HealthRegenPerKill;

	SetTimer(1, True);

	if(Level.Game.HUDType != None)
	{
		Level.Game.HUDType = class'CMonsterHUD';
	}

	foreach AllActors(class 'ScriptedPawn', S)
	{

		//Here we attempt to make a teamleader from any random SP.
		if(S.bIsBoss)
		{
			S.bTeamLeader = true;
			bHasTL = true;
		}
		//Set last pawn here
		RandomPawn = S;
		//Fix BabyCow
		if(BabyCow(S) != none && BabyCow(S).mom == none)
			S.Destroy();	//Destroy this baby and let mother give birth.
		else if(Cow(S) != none)
			Cow(S).bHasBaby=true;
		S.SetCollisionSize(S.Default.CollisionRadius,S.Default.CollisionHeight);
		if (S.DrawScale > 2)
			{
			S.DrawScale = 2;
			}
		if (S.DrawScale < 0.6)
			{
			S.DrawScale = 0.6;
			}
		if (S.Orders == 'Roaming') 	//They don't need to move before to be triggered by a HUMAN or will die
			{				//like idiots, even can ruin my party. Roaming is less logic. Will enter in waiting state soon anyway.
			S.Orders = ''; //:P
			S.GoToState('Waiting');	//No move until I come for you, enough with stupidities.
			}
		if(S.class == class'cow' || S.class == class'nali' || S.class == class'nalitwo')
		{
			if(S.Event != '' && S.Event != 'None')
			{
				T = Spawn(class'trigger',,,S.location + vect(5, 5, 0) );
				T.Event = S.Event;
				T.DrawScale = S.DrawScale;
				T.TriggerType = T.ETriggerType.TT_PlayerProximity;
				T.bHidden = false;
				
			}
		}
	}
	if(!bHasTL)
		RandomPawn.bTeamLeader = true;
	if (NumCapacity > 100)
		{
	NumCapacity = 100;
	log ("NumCapacity too high, applying default value 100.", 'BaseMutator');
		}
	if (FItems < 5)
		{
		log ("Value for MaxItems of a Factory is too low, check your INI, adjusted to 5", 'BaseMutator');
		FItems = 5;
		}
	if (FItems > 25)
		{
		log ("Value for MaxItems of a Factory is close to spam, check your INI, adjusted to 24", 'BaseMutator');
		FItems = 25;
		}
//------------------------------------------------------------------------------------

		Level.DefaultGameType = class 'MH2_C_V18.MonsterHunt2';
		Level.bNeverPreCache=False;
		log("Server Computer's name is"@Level.ComputerName, 'BaseMutator');
		log("Engine Version is"@Level.EngineVersion);
		Level.bLonePlayer = False;
		Level.bHighDetailMode = True;
		Level.bDropDetail = False; // Will see?
		Level.bAggressiveLOD = False;
		Level.bLowRes = False; // I think we have better now
		DeathMatchPlus(Level.Game).bAltscoring = False; // not looking for more trouble......
		Level.Game.bLoggingGame = False; //I think is better
//--------------------------------------------------------------------------------------------

	foreach AllActors (class 'ThingFactory', Thfa)
		{
		if (Thfa != None)
			{
			Thfa.bCovert = False; //:P No bullshit check
			log ("Checking ------->"@Thfa, 'BaseMutator');
			if (Thfa.MaxItems > FItems && Thfa.capacity < NumCapacity + 1)
			{
				Thfa.MaxItems = FItems;
				log ("Excessive fabricating capacity adjusted.");
			}
			else if(Thfa.capacity > NumCapacity || Thfa.capacity < 1)
			{
				Thfa.capacity = NumCapacity;
				log ("Detected abnormal value in fabricating.");
				if (Thfa.MaxItems > FItems) 	//There are enough places ?
				{
					Thfa.MaxItems = FItems;		//If yes, let's cut off the crap spam.
					log ("Excessive fabricating in Thing Factory");
				}
				if (Thfa.interval < 0.3)
				{
					Thfa.interval = 0.3;
				}
			}

			if (Thfa.prototype == class 'BiterFishSchool')
				{
					Thfa.MaxItems = 0;
				}
			if (Thfa.prototype == class 'Bird1')
				{
					Thfa.MaxItems = 0;
				}

		//TODO: Replace function instead of factory
		//------------------------------------------
		// Values are checked, let's replace this crappy Thing factories......
        		if(Thfa.IsA('CreatureFactory')) continue;
        		    if (ClassIsChildOf(Thfa.prototype,class'Engine.Pawn')) // Yeah one might use a thingfactory for something else
					{
					log("Attempting to replace a ThingFactory used for Pawns, with a CreatureFactory");
					CreatureFactory=class'UnrealShare.CreatureFactory';
					    if(CreatureFactory != none)
						{
						log("CreatureFactory class is != none");
						    NewCF = Spawn(CreatureFactory,,,Thfa.Location,Thfa.Rotation);
							NewCF.bGameRelevant=True;
							log("New CreatureFactory is:"@NewCF);
							NewCF.Interval=Thfa.interval;
           					NewCF.MaxItems=Thfa.MaxItems;
		        			NewCF.bCovert=False;
				         	NewCF.Tag=Thfa.Tag;
	         				NewCF.Capacity=Thfa.Capacity;
        					NewCF.event=Thfa.event;
           				    NewCF.Prototype=Thfa.Prototype;
							Thfa.Destroy();
						}
					}
	    	}
		}
//Executing next round against stupid ideeas. Removing bullshits... 3, 2, 1, PROCEED !
		log ("Checking dumb ideeas implemented in factories...");
	foreach AllActors (class 'CreatureFactory', CF)
		{
		if ( CF != None )
			{		//Init fixation procedures
			if (CF.Orders == 'Roaming')
				{
				CF.Orders = 'Attacking'; //La, la, la...
				log ("Illegal orders discovered and restored to defaults at "@CF);
				}
			CF.AddedCoopCapacity = 0; //MH, ehe...
			}
		}
		log ("Values checked ... Proceed to next step...");
if (bRemoveBlocking)
	{
	foreach AllActors(class 'BlockMonsters', Bmo)
		{
		if (Bmo != None)
			{
			log ("Found blocker: "@Bmo);
			Bmo.bBlockActors = False;
			log ("Unlocked. Good hunting, ladies!");
			}
		}
	}

	foreach AllActors(class 'CTFFlag', Flag)
		{
		if (flag != none)
			{
		log("MH2_C_V18: checking CTFFlags... Hit!@"@Flag.name@ "--> AutoFixed!(Destroy)");
		Flag.Destroy();
	log("Wow, flag was killed. Some mappers drunks didn't removed flag from remoded maps. Losers !");
			}
		}

	fixmovers();
	log ("Movers were checked, will proceed to next step...");

	spawn(class'PawnNotify');
	spawn(class'DecalNotify');
	MyGame = DeathMatchPlus(Level.Game);//Eh? Can't remember..
	
	//Set our weapon classes here
	

	
	
	Super.PostBeginPlay();
	log ("BaseMutator ended Initialization...");
/*	if ( NextMutator != None && NextMutator != Self )
		NextMutator.PostBeginPlay();
*/


	//Replace broken functions
	ForEach AllClasses(CurCls, class'ScriptedPawn')
	{
		ReplaceLastFunction(CurCls,class'SPFix', class'ScriptedPawn' ,'AttitudeToCreature','AttitudeToCreature_fix');
		ReplaceLastFunction(CurCls,class'SPFix', class'ScriptedPawn', 'PickDestination','PickDestination','TacticalMove', 'TacticalMove');
		ReplaceLastFunction(CurCls,class'SPFix', class'ScriptedPawn', 'AttitudeTo','AttitudeTo_Fix');
		ReplaceLastFunction(CurCls,class'SPFix', class'ScriptedPawn', 'ChooseTeamAttackFor','ChooseTeamAttackFor_Fix');
	}
	
	ForEach AllClasses(CurCls, class'Weapon')
	{
		ReplaceLastFunction(CurCls,class'WPFix', class'Weapon' ,'GiveAmmo','GiveAmmo');
		ReplaceLastFunction(CurCls,class'WPFix', class'Weapon' ,'TravelPostAccept','TravelPostAccept');
		log("Checked "$ CurCls);
	}
}

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
	local bool bResult;

	//if ( (NextMutator != None) )
	//	bResult = NextMutator.IsRelevant(Other, bSuperRelevant);

	return true;
}

function final SetPawnDifficulty( int Diff, ScriptedPawn S )
{										
	local int DiffScale;
	local Actor SP;

	
	switch (Diff)
	{
		case 0:
			DiffScale = 80;
			break;
		case 1:
			DiffScale = 90;
			break;
		case 2:
			DiffScale = 100;
			break;
		case 3:
			DiffScale = 110;
			break;
		case 4:
			DiffScale = 120;
			break;
		case 5:
			DiffScale = 130;
			break;
		case 6:
			DiffScale = 140;
			break;
		case 7:
			DiffScale = 150;
			break;
	}
// Recheck dumb mapping ideeas
	if (S.PeripheralVision < -3) S.PeripheralVision = -3;
	if (S.PeripheralVision > -0.2) S.PeripheralVision = -0.2;
	if (S.HearingThreshold < 0.6) S.HearingThreshold = 0.6;
	if (S.Aggressiveness < 0.8) S.Aggressiveness = 0.8;
	if(S.health < S.default.health * MHealthMultiplier)
		S.Health *= MHealthMultiplier;
		
	if (S.Health > MaxMonsterHealth)	//This was the best shit ever done, yea let's put up some dance.
	S.Health = MaxMonsterHealth; 		//This value won't be ever bigger, :P :P, btw, this is MY CODE...
	//S.default.Health = S.Health;
	//log("Health:"@S.Health@"  dfHealth:"@S.default.health@" dfcHealth:"@S.class.default.health@"    "@s);
	S.SightRadius = (S.Default.SightRadius * DiffScale) / 50;
	S.Aggressiveness = (S.Default.Aggressiveness * DiffScale) / 50;
	S.MeleeRange = (S.Default.MeleeRange * DiffScale) / 50; //Yea, idiots ! Fixed craps right now :P !
	S.ReFireRate = (S.Default.ReFireRate * DiffScale) / 50;
	S.CombatStyle = (S.Default.CombatStyle * DiffScale) / 50;
	S.ProjectileSpeed = (S.Default.ProjectileSpeed * DiffScale) / 50;
	S.GroundSpeed = (S.Default.GroundSpeed * DiffScale) / 50;
	S.AirSpeed = (S.Default.AirSpeed * DiffScale) / 50;
	S.WaterSpeed = (S.Default.WaterSpeed * DiffScale) / 50;
	if (S.GroundSpeed > 500) //We have a Rocket Monster ?	Errors or not we have to reset some craps
		S.GroundSpeed = 500; //Of course not
	if (S.HearingThreshold < 0.5)
			S.HearingThreshold = 0.5;
	if (S.SightRadius < 5000)
			S.SightRadius = 5000; //Damn, they can see us better
	if (S.AccelRate > 700)
			S.AccelRate = 700;
	if (S.AirSpeed > 500)
			S.AirSpeed = 500; //LOL
	if (S.WaterSpeed > 400)
			S.WaterSpeed = 400; //Again
	if (S.IsA('Brute'))
		Brute(S).WhipDamage = (Brute(S).WhipDamage * DiffScale) / 100;
	if (S.IsA('Gasbag'))
		Gasbag(S).PunchDamage = (Gasbag(S).PunchDamage * DiffScale) / 100;
	if (S.IsA('Titan'))
		Titan(S).PunchDamage = (Titan(S).PunchDamage * DiffScale) / 100;
	if (S.IsA('Krall'))
		Krall(S).StrikeDamage = (Krall(S).StrikeDamage * DiffScale) / 100;
	if (S.IsA('Manta'))
		{
		Manta(S).StingDamage = (Manta(S).StingDamage * DiffScale) / 100;
		if (S.RangedProjectile == None) S.bHasRangedAttack = False;
		}
	if (S.IsA('Mercenary'))
	{
		Mercenary(S).PunchDamage = (Mercenary(S).PunchDamage * DiffScale) / 100;
		Mercenary(S).bHasInvulnerableShield = False; 	//No more God-mode Mercs
		Mercenary(S).invulnerableCharge = 0.2;		//Just in case of an unexpected error
	}
	if (S.IsA('Skaarj'))
		Skaarj(S).ClawDamage = (Skaarj(S).ClawDamage * DiffScale) / 100;
	if (S.IsA('Pupae'))
		{
		Pupae(S).BiteDamage = (Pupae(S).BiteDamage * DiffScale) / 100;
		if (S.RangedProjectile == None) S.bHasRangedAttack = False;
		}
	if (S.IsA('Queen'))
		Queen(S).ClawDamage = (Queen(S).ClawDamage * DiffScale) / 100;
	if (S.IsA('Slith'))
		Slith(S).ClawDamage = (Slith(S).ClawDamage * DiffScale) / 100;
	if (S.IsA('Warlord'))
		Warlord(S).StrikeDamage = (Warlord(S).StrikeDamage * DiffScale) / 100;
//Other projectiles - missing decals is pissing me off
//Accesed nones - Too many :P, time to remove a few craps
//And not the last wish, How about some smoke at Warlord, I want to see them better
//Next section about the replication will be fixed in Base
//------------------
	if (S.RangedProjectile == class 'UnrealShare.BruteProjectile')
		S.RangedProjectile = class 'MH2_C_V18.ExBruteProjectile';
	if (S.RangedProjectile == class 'oldskool.olBruteProjectile')
		S.RangedProjectile = class 'MH2_C_V18.ExBruteProjectile';
//------------------
	if (S.RangedProjectile == class 'UnrealI.MercRocket')
		S.RangedProjectile = class 'MH2_C_V18.ExMercRocket';
	if (S.RangedProjectile == class 'oldskool.olMercRocket')
		S.RangedProjectile = class 'MH2_C_V18.ExMercRocket';
//------------------
	if (S.RangedProjectile == class 'UnrealI.WarlordRocket')
		S.RangedProjectile = class 'MH2_C_V18.ExWarlordRocket';
 	if (S.RangedProjectile == class 'oldskool.olWarlordRocket')
		S.RangedProjectile = class 'MH2_C_V18.ExWarlordRocket';
//------------------
	if (S.RangedProjectile == class 'UnrealI.GasBagBelch')
		S.RangedProjectile = class 'oldskool.olGasBagBelch';
	if (S.RangedProjectile == class 'UnrealI.KraalBolt')
		S.RangedProjectile = class 'oldskool.olKraalBolt';
	if (S.RangedProjectile == class 'UnrealI.EliteKrallBolt')
		S.RangedProjectile = class 'oldskool.ol1337krallBolt';
	if (S.RangedProjectile == class 'Unrealshare.SkaarjProjectile')
		S.RangedProjectile = class 'oldskool.olSkaarjProjectile';
	if (S.RangedProjectile == class 'UnrealI.queenprojectile')
		S.RangedProjectile = class 'oldskool.olqueenprojectile';
	if (S.RangedProjectile == class 'UnrealShare.Tentacleprojectile')
		S.RangedProjectile = class 'oldskool.olTentacleProjectile';
	if (S.RangedProjectile == class 'UnrealShare.SlithProjectile')
		S.RangedProjectile = class 'oldskool.olSlithProjectile';
	if (S.RangedProjectile == class 'UnrealShare.SeekingRocket')
		S.RangedProjectile = class 'MonsterHunt.OSRocket'; //Yep, let's see better.
	if (S.RangedProjectile == class 'UnrealShare.Rocket')
		S.RangedProjectile = class 'MonsterHunt.OSRocket';
	if (S.RangedProjectile == class 'MonsterHunt.OSSeekingRocket') //This is bullshit, no smoke-trails.
		S.RangedProjectile = class 'MonsterHunt.OSRocket';
	if (S.RangedProjectile == class 'UnrealShare.TazerProj')
		S.RangedProjectile = class 'MonsterHunt.OLTazerProj';
	if (S.RangedProjectile == class 'UnrealI.RazorBlade')
		S.RangedProjectile = class 'MonsterHunt.OSRazorBlade';
	if (S.RangedProjectile == class 'UnrealI.RazorBladeAlt')
		S.RangedProjectile = class 'MonsterHunt.OSRazorBladeAlt';
	if (S.RangedProjectile == class 'UnrealShare.DispersionAmmo')
		S.RangedProjectile = class 'MonsterHunt.OSDispersionAmmo';
	if (S.RangedProjectile == class 'UnrealShare.DAmmo2')
		S.RangedProjectile = class 'MonsterHunt.OSDAmmo2';
	if (S.RangedProjectile == class 'UnrealShare.DAmmo3')
		S.RangedProjectile = class 'MonsterHunt.OSDAmmo3';
	if (S.RangedProjectile == class 'UnrealShare.DAmmo4')
		S.RangedProjectile = class 'MonsterHunt.OSDAmmo4';
	if (S.RangedProjectile == class 'UnrealShare.DAmmo5')
		S.RangedProjectile = class 'MonsterHunt.OSDAmmo5';
	if (S.RangedProjectile == class 'UnrealI.FlakShell')
		S.RangedProjectile = class 'MonsterHunt.OSFlakShell';
	if (S.RangedProjectile == class 'UnrealShare.Grenade')
		S.RangedProjectile = class 'MonsterHunt.OSGrenade';
	if (S.RangedProjectile == class 'UnrealShare.StingerProjectile')
		S.RangedProjectile = class 'MonsterHunt.OSStingerProjectile';
	if (S.RangedProjectile == class 'UnrealShare.BioDrop')
		S.RangedProjectile = class 'MonsterHunt.OSBioDrop';
	if (S.RangedProjectile == class 'UnrealShare.BigBiogel')
		S.RangedProjectile = class 'MonsterHunt.OSBigBiogel';

//	if (S.RangedProjectile == class 'railrocket')
//		S.RangedProjectile = class 'MonsterHunt.OSDAmmo2'; //Accesed nones ? LOL, bye to your good ideeas, :P
	if (S.BaseEyeHeight < S.CollisionHeight/1.5)
		S.BaseEyeHeight = S.CollisionHeight/1.5;
	//S.bHateWhenTriggered = True;
	S.Intelligence = BRAINS_HUMAN;
	S.bInitialFear=False; //A Ninja Knows no Fear - That said Lo Wang :P
	S.Skill = MySkill;
	S.bMoraleBoosted = True; //Home Sweet Home, can be everywhere ?
	if (S.CarcassType != None) //I'm glad about new options
		S.CarcassType = class'MH2_C_V18.ExCreatureCarcass';
	
	if (S.bCanWalk && !S.bCanFly && !S.Region.Zone.IsA('WaterZone')) //Anybody heard about Normality ? I guess not.
		S.SetPhysics(PHYS_Falling); //Um,...
	else if(S.Region.Zone.IsA('WaterZone'))
		S.SetPhysics(PHYS_Swimming);
	
	S.bAlwaysRelevant=false;//Yep you heard me....
	S.TeamTag = S.Class.Name;	//A team tag is necessary to stop huge amounts of script errors in some maps. What it does is, it makes sure the TeamLeader is assigned, and each class needs a unique TeamTag
							//That is shared between the objects of the same class
	
	S.bTeamLeader = True;
	foreach AllActors(S.Class, SP)
	{
		if(ScriptedPawn(SP).bTeamLeader && SP != S && SP.Class == S.Class)
			S.bTeamLeader = False;
	}
	
	
	if(S.Class != class'Cow' && S.Class != class'Nali' && S.Class != class'BabyCow' && S.Class != class'NaliPriest')
		MonsterHunt2(Level.Game).TotalMonsters++;
		
	/*if (S.IsA('Squid'))
      {
		if (S.Mesh != LodMesh 'ExSquid1')
		{
			if (S.Fatness > S.default.Fatness)
				S.Fatness = S.default.Fatness;
			S.Mesh = None;
			S.Mesh = LodMesh 'ExSquid1';
		}
		if (S.Skin == None)
		{
			S.Skin = Texture'UnrealI.Skins.JSquid1';
		}
      }*/
	
}

function bool AlwaysKeep(Actor Other)
{
	//Stupid shit created by one mr THUNDERBOLT
	if(Other != none && Other.IsA('PrecipitationGenerator'))
	{
		Other.Destroy();
		return false;
	}
	if(Other.IsA('ScriptedPawn'))
		MonsterHunt2(Level.Game).AddToTeam(1,Pawn(Other));
	if (Playerpawn(Other) != none)//TournamentPlayer or Spectator in this case.
    {
      Playerpawn(Other).PlayerReplicationInfoClass=Class'MHReplicationInfo';
	  Playerpawn(Other).bAlwaysRelevant=True;
	  return true;	//PP is always relevant..
    }
	else if (Bot(Other) != none)
   {
      Bot(Other).PlayerReplicationInfoClass=Class'BotReplicationInfo';
	  Bot(Other).bAlwaysRelevant=True;
	  //FIXME: Add check for wanted bots..
	  return true;
   }
	else if ( ScriptedPawn(Other) != none)	//Anybody in da house :P, including BeetleJuice...
	{
		ScriptedPawn(Other).NetPriority = 3.00000;
		ScriptedPawn(Other).bGameRelevant = True;
		ScriptedPawn(Other).NetUpdateFrequency = 30.000000;
		//ScriptedPawn(Other).Role=Role_Authority;
		//ScriptedPawn(Other).UnderWaterTime = ScriptedPawn(Other).health*MHealthMultiplier;
		if(Other.Class != class'nali' && Other.Class != class'cow' && Other.Class != class'BabyCow' && Other.Class != class'nalipriest')
 		SetPawnDifficulty(LevelMonster, ScriptedPawn(Other));
		Pawn(Other).DropWhenKilled=none;//I dont want that, thank you.
		if(Other.IsA('SkaarjSniper'))
		{
			class'MH2_C_V18.NewOLRifle'.default.AmmoName=class'MH2_C_V18.NewRifleAmmo';
			SkaarjSniper(Other).WeaponType=class'MH2_C_V18.NewOLRifle';
		}
		else if(Other.IsA('SkaarjGunner'))
		{
			class'MH2_C_V18.NewOLEightball'.default.AmmoName=class'MH2_C_V18.NewRocketCan';
			SkaarjGunner(Other).WeaponType=class'MH2_C_V18.NewOLEightball';
		}
		if(Other.IsA('SkaarjInfantry'))
		{
			class'MH2_C_V18.NewOLStinger'.default.AmmoName=class'MH2_C_V18.NewStingerAmmo';
			SkaarjInfantry(Other).WeaponType=class'MH2_C_V18.NewOLStinger';
		}
		else if(Other.IsA('SkaarjOfficer'))
		{
			class'MH2_C_V18.NewOLRazorJack'.default.AmmoName=class'MH2_C_V18.NewRazorAmmo';
			SkaarjOfficer(Other).WeaponType=class'MH2_C_V18.NewOLRazorJack';
		}
	}
	return False;
}

function final String GetPackageName(class Package)// returns a class's package name
{
 local int pos, num;
 local String FullName;
 
    FullName=string(Package);
 pos = InStr(FullName,".");
 FullName=Left(FullName,pos);
 return FullName;
}

function final CheckPickups(Actor Other)
{
local MH2Base News;
	if(MH2Base(Other) != none) return;
//Deal with healths.....
	if(MedBox(Other) != none && MH2MedBox(Other) == none)
	{
		News=Spawn(Class'MH2Base',,,Other.Location,Other.Rotation);
		if(News != none)
		{
			News.PickupClass=Class'MH2MedBox';
			if(Class<MedBox>(News.PickupClass).default.HealingAmount<MedBox(Other).HealingAmount)
				Class<MedBox>(News.PickupClass).default.HealingAmount=MedBox(Other).HealingAmount;
			if(Class<MedBox>(News.PickupClass).default.RespawnTime<MedBox(Other).RespawnTime)
				Class<MedBox>(News.PickupClass).default.RespawnTime=MedBox(Other).RespawnTime;
			Class<MH2MedBox>(News.PickupClass).default.HealMax=DefaultHealth;
			News.Mesh=LodMesh'UT2HealthCharger';
			News.SetHave();
			News.SetTex( Texture'GenFX.LensFlar.Flare2' );//Stupid junk
			News.SetScale(0.100000);
			News.SetCollisionSize(3,3);
			News.PostBeginPlay();//Anyone knows why this is not called by the engine? Damn it.....
			Other.Destroy();
			return;
		}
	}

	else if(HealthPack(Other) != none && MH2HealthPack(Other) == none )
	{
		News=Spawn(Class'MH2Base',,,Other.Location,Other.Rotation);
		if(News != none)
		{
			News.PickupClass=Class'MH2HealthPack';
			if(Class<MH2HealthPack>(News.PickupClass).default.HealingAmount<HealthPack(Other).HealingAmount)
				Class<MH2HealthPack>(News.PickupClass).default.HealingAmount=HealthPack(Other).HealingAmount;
			if(Class<MH2HealthPack>(News.PickupClass).default.RespawnTime<HealthPack(Other).RespawnTime)
				Class<MH2HealthPack>(News.PickupClass).default.RespawnTime=HealthPack(Other).RespawnTime;
			Class<MH2HealthPack>(News.PickupClass).default.HealMax=MaxHealth;
			News.Mesh=LodMesh'UT2HealthCharger';
			News.SetHave();
			News.SetCollisionSize(3,3);
			News.SetTex( Texture'GenFX.LensFlar.Dot_C' );
			News.SetScale(0.100000);
			News.PostBeginPlay();	
			Other.Destroy();
			return;
		}
	}
	
	else if(HealthVial(Other) != none && MH2HealthVial(Other) == none )
	{
		Spawn(Class'MH2HealthVial',Other.Owner,,Other.location,Other.Rotation).HealMax = MaxHealth;
		Other.Destroy();	
		return;
	}
	
	else if(Armor2(Other) != none && MH2Armor2(Other) == none)
	{
		News=Spawn(Class'MH2Base',,,Other.Location,Other.Rotation);
		if(News != none)
		{
			News.PickupClass=Class'MH2Armor2';
			News.Mesh=LodMesh'ShieldChargerMesh';
			News.SetHave();
			News.SetCollisionSize(6,6);
			News.SetTex( Texture'GenFX.LensFlar.Dot_C' );
			News.SetScale(0.100000);
			News.PostBeginPlay();
			Other.Destroy();
		}
		return;
	}
	
	//Check weapon pickups
	if(Weapon(Other) != None && IsDefaultWeapon(Weapon(Other)) && !Other.IsA('CSWeapons16') && Other.location != vect(0,0,0)) //Let's try this out
	{
		
		ReplaceWithOther(Other,WeaponClasses[Rand(17)]);
		//We can replace them with something if we want
		Other.Destroy();
		return;
	}
	else if(Other.IsA('Ammo') && Other.Location != vect(0,0,0))	
		Other.Destroy();

}

function final bool IsDefaultWeapon(Weapon W)
{
	return 	W.Class == class'ChainSaw' 			|| 
			W.Class == class'enforcer' 			|| 
			W.Class == class'ImpactHammer' 		|| 
			W.Class == class'minigun2' 			|| 
			W.Class == class'PulseGun' 			|| 
			W.Class == class'ripper' 			|| 
			W.Class == class'ShockRifle' 		|| 
			W.Class == class'SniperRifle' 		|| 
			W.Class == class'ut_biorifle' 		|| 
			W.Class == class'UT_Eightball' 		|| 
			W.Class == class'UT_FlakCannon' 	|| 
			W.Class == class'WarheadLauncher';
}

/*---------------------------------------------------------------------------------------------
Function called for every actor newly spawned.
-----------------------------------------------------------------------------------------------*/
//This is inverse. Returns true if replaced, false otherwise. Default mutator returns false if replaced.. true otherwise
function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local Inventory Inv;

	//Check weither to move on or not.
	if(Other == none)
		return false;
		
	if(CSWeapons16(Other) != none)
	{
		if(CSWeapons16(Other).ClipCount < 45)
		{
			CSWeapons16(Other).ClipCount = 45;
			CSWeapons16(Other).default.ClipCount = 45;
		}
		if(Other.IsA('C4'))
		{
			CSWeapons16(Other).ClipCount = 5;
			CSWeapons16(Other).default.ClipCount = 5;
		}
		else if(Other.IsA('GrenadeFrag'))
		{
			CSWeapons16(Other).ClipCount = 10;
			CSWeapons16(Other).default.ClipCount = 10;
		}
		return false;
	}
	
	if(Other.IsA('DJ_InventoryItem'))return false;
	//Don't allow scripted pawns to throw their weapons
	if(Other.IsA('Weapon') && !Other.isA('TournamentWeapon'))
	{
		if(Other.Location == vect(0,0,0))
			return false;
		else
			return true;	//Remove this.
	}
	else if(Other.IsA('BoulderSpawner')) return true;//Accesses nones
	
	//Replace pickups before game start
//	if(!MonsterHunt2(Level.Game).bStartedHunt)
//	{
		CheckPickups(Other);//Call this here so we don't kill engine with if/else...
		if(Other.bDeleteMe) return true;
//	}
	
	//Replace other stuff
	else if(Other.IsA('Bird1')) //Nasty crap detected in Engine.Mutator - Always is about engine - LOL
	{
		ReplaceWithOther(Other,Class'MH2_C_V18.Bird2');
		return true;
	}
	else if(Other.Class == Class 'BiterFishSchool')
	{
		ReplaceWithOther(Other,Class'MH2_C_V18.BiterFishSchool2');
		return true;
	}
	else if(Other.IsA('CreatureChunks') && !Other.IsA('ExCreatureChunks'))
		return true;		//LOL, I think is time to end this party

	else if(Other.IsA('UTCreatureChunks') && (!Other.bStatic || !Other.bNoDelete))
		return true; //:P
	else if(Other.IsA('Nali') && !Other.IsA('NaliTwo'))
	{
		ReplaceWithOther(Other,Class'MH2_C_V18.NaliTwo');
		return true;
	}
    else if(Other.IsA('NaliPriest') && !Other.IsA('NaliTwo'))
	{
		ReplaceWithOther(Other,Class'MH2_C_V18.NaliTwo');
		return true;
	}
    else if(Other.IsA('NaliRabbit') && !Other.IsA('NaliRabbitTwo'))
    {
		ReplaceWithOther(Other,Class'MH2_C_V18.NaliRabbitTwo');
		return true;
	} 
    if(Other.IsA('Pickup') && !Other.IsA('Ammo'))
    {
		Pickup(Other).bAutoActivate = true;
        Pickup(Other).bCanHaveMultipleCopies=false;
    }
	if(Other.IsA('VisibleTeleporter')){
		VisibleTeleporter(Other).MultiSkins[0]=none;
		VisibleTeleporter(Other).MultiSkins[1]=FireTexture'UnrealShare.Effect1.FireEffect1a';
	}
    else if((Other.IsA('Flashlight') || Other.IsA('SearchLight')) && !Other.IsA('LimeLight') && !Other.IsA('LimeLight2') )
    {
        ReplaceWithOther(Other,Class'MH2_C_V18.LimeLight');
		return true;
    }
	else if(Other.class == class 'WeaponPowerUp')
	{
	//	ReplaceWithOther(Other,Class'MH2_C_V18.osWeaponPowerUp');
		return true;
	}
	else if(Other.class ==class'Dampener')
	{
	//	ReplaceWithOther(Other,Class'MH2_C_V18.osWeaponPowerUp');
		return true;
	}
	else if(Other.class == Class'ForceField')
	{
	//	ReplaceWithOther(Other,Class'MH2_C_V18.osWeaponPowerUp');
		return true;
	}
	
	//Configuration
	if(Other.IsA('TorchFlame'))
		Other.NetUpdateFrequency = 30;
	if(Other.IsA('Inventory'))
	{
		Inventory(other).NetPriority = 1.400000;
		Inventory(other).NetUpdateFrequency = 30.000000;
	}
	else if(Other.IsA('Projectile'))
	{
		Projectile(Other).NetPriority = 2.500000;
		//Projectile(Other).RemoteRole = ROLE_SimulatedProxy; Reduce network?
	}
	else if(Other.IsA('Decoration'))
	{
		Decoration(Other).NetPriority = 2.000000;
		Decoration(Other).NetUpdateFrequency = 25.000000;
		Decoration(Other).RemoteRole = ROLE_SimulatedProxy;
	}
	if(Other.bIsPawn)
	{
		Pawn(Other).GroundSpeed *= 1.2;
		Pawn(Other).WaterSpeed *= 1.2;
		Pawn(Other).AirSpeed *= 1.2;
		Pawn(Other).AccelRate *= 1.2;
	}
	return false;
}

function final bool ServerAttemptLogin(string User, string Password, PlayerPawn Admin)
{
if(User == Username && Password == ServerPassword){
	if(!Admin.bAdmin)
		BroadcastMessage(Admin.PlayerReplicationInfo.PlayerName@"has logged in as an administrator.");
	Admin.bAdmin=True;
	Admin.PlayerReplicationInfo.bAdmin=True;
	return true;}
return false;
}

function ScoreKill(pawn Killer, pawn Other)   
{
	if(Killer == None || Other == None)return; // sui - or fall in lava ? Who give a shit anyway ?
	if(!Killer.bIsHuman)return; // bot iran
	if((Killer.IsA('PlayerPawn')) && Other.IsA('ScriptedPawn')) MHReplicationInfo(Killer.PlayerReplicationInfo).KilledMonster++; // Only give point if killing opponent.
	if(Killer.PlayerReplicationInfo.bIsABot) return; // bot irane-
	if(Killer.IsA('ScriptedPawn') && Other.IsA('ScriptedPawn')) return;	//added
	if (Killer.bIsPlayer && Other.bIsPlayer )return; // tk
	if (Killer.IsA('TeamCannon')) return;

	if (Other.Spree > 1 && Other.bIsPlayer)
		EndSpree(Killer, Other);
	if(Other.bIsPlayer)Other.Spree = 0;
	if ( (Killer != None) && Killer.IsA('PlayerPawn') && (Killer != Other) && Other.IsA('ScriptedPawn'))
	{
		
		// if(Killer.Health <= MaxHealth)Killer.Health += Rand(HealthRegenPerKill)+HealthRegenPerKillMin;
	//	if(Killer.Health <= MaxHealth)
		//	{
	//		Killer.Health += HealthRegenPerKill;
	//		}
		if(Killer.Health > MaxHealth)          //New check for max health
			Killer.Health = MaxHealth;

		if (bUseCrapSpree)
		{
			Killer.Spree+=1;
			if ( Killer.Spree > 14 )
			NotifySpree(Killer, Killer.Spree);
			if ( (TournamentPlayer(Killer).Level.TimeSeconds - TournamentPlayer(Killer).LastKillTime < 3))
			{
				TournamentPlayer(Killer).MultiLevel++;
				if(TournamentPlayer(Killer).MultiLevel > 40)
					TournamentPlayer(Killer).MultiLevel = 40;
				TournamentPlayer(Killer).ReceiveLocalizedMessage( class'NSMH_AGMultiKillMessage', TournamentPlayer(Killer).MultiLevel );
				CheckBroadCast(Killer,TournamentPlayer(Killer).MultiLevel);
			}
			else
				TournamentPlayer(Killer).MultiLevel = 0;
			TournamentPlayer(Killer).LastKillTime = TournamentPlayer(Killer).Level.TimeSeconds;
		}
	}
}

function CheckBroadCast(Pawn Killer,int num)
{
	//if(Killer.bIsPlayer && !Killer.PlayerReplicationInfo.bIsABot)
	//BroadCastMessage(Killer.PlayerReplicationInfo.PlayerName@GetText(num));
}

function string GetText(int Switch)
{
	switch (Switch)
	{
		case 1:
			return " has Double Kill!";
			break;
		case 2:
			return " has Triple Kill!";
			break;
		case 3:
			return " has Multi Kill!";
			break;
		case 4:
			return " has Mega Kill!";
			break;
		case 5:
			return " has ULTRA KILL!";
			break;
		case 6:
			return " has M O N S T E R  K I L L !!!";
			break;
		case 7:
			return " has L U D I C R O U S   K I L L !!!";
			break;
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		case 18:
		case 19:
		case 20:
		case 21:
		case 22:
		case 23:
		case 24:
		case 25:
		case 26:
		case 27:
		case 28:
		case 29:
		case 30:
		case 31:
		case 32:
		case 33:
		case 34:
		case 35:
		case 36:
		case 37:
		case 38:
		case 39:
			return " has H O L Y  S H I T !!!";
			break;
		case 40:
		case 41:
			return " is  J U S T  H U N T I N G !!!";
			break;
	}
	return "";
}

function NotifySpree(Pawn Other, int num)
{
	local Pawn P;

	if ( num == 15 )
		num = 0;
	else if ( num == 35 )
		num = 1;
	else if ( num == 60 )
		num = 2;
	else if ( num == 90 )
		num = 3;
	else if ( num == 125 )
		num = 4;
	else if ( num == 250 )
		num = 5;
	else
		return;

	for ( P=Level.PawnList; P!=None; P=P.NextPawn )
		if ( P.IsA('TournamentPlayer') )
			P.ReceiveLocalizedMessage( class'NSMH_AGKillingSpreeMessage', Num, Other.PlayerReplicationInfo );
}

function EndSpree(Pawn Killer, Pawn Other)
{
	local Pawn P;
//	BroadcastMessage("Endspree Killer"@Killer@" Other"@ Other);
	if ( !Other.bIsPlayer || Killer.PlayerReplicationInfo.bIsABot)
		return;
	for ( P=Level.PawnList; P!=None; P=P.NextPawn )
	if (P.IsA('TournamentPlayer'))
	{
/*		if(Other.IsA('ScriptedPawn'))
			P.ReceiveLocalizedMessage( class'NSMH_AGKillingSpreeMessage', Other.Spree, Killer.PlayerReplicationInfo, Killer.PlayerReplicationInfo );
		else // pk end
*/
			P.ReceiveLocalizedMessage( class'NSMH_AGKillingSpreeMessage', Other.Spree, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo );
	}
/*	Other.Spree = 0;
	if (TournamentPlayer(Other) != None)
	{
		TournamentPlayer(Other).MultiLevel = 0;
	}
*/
}

function MutatorTakeDamage( out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation,
out Vector Momentum, name DamageType)
{
	local Pawn P;
	local byte OwnerTeamNumber, VictimTeamNumber;
	local Vector v;
	local float chancehit, totaloffset;
	
	if(Victim != None && InstigatedBy != None && Victim.IsA('PlayerPawn') && InstigatedBy.IsA('PlayerPawn'))
	{
		if(Victim == InstigatedBy)
			ActualDamage *= SelfDamageScale;
		else
			ActualDamage = 0;
		return;
	}
	if (Victim != None && InstigatedBy != None)
	{
		if((Victim.class == class'NaliRabbit' || Victim.class == class'NaliPriest' ||Victim.class == class'BabyCow' ||Victim.class == class'cow' || Victim.class == class'nalitwo' || Victim.class == class'nali') && !InstigatedBy.IsA('ScriptedPawn'))
		{
			Victim.health += Min(ActualDamage*0.1,1);
			ActualDamage = 0;
			return;
		}
		if(Victim.IsA('PlayerPawn') && InstigatedBy.IsA('ScriptedPawn'))
			MHReplicationInfo(PlayerPawn(Victim).PlayerReplicationInfo).HealthCounter = 5;
		//Add the monster health taken to the players score
			
			// Stop scoring above monsters health value
			if (ActualDamage > Victim.Health)
				ActualDamage = Victim.Health;
			if(PlayerPawn(InstigatedBy) != none && PlayerPawn(InstigatedBy).Weapon != none && PlayerPawn(InstigatedBy).Weapon.IsA('CSWeapons16') && Victim.IsA('ScriptedPawn'))
				ActualDamage *= 10;
				
			if (InstigatedBy.IsA('PlayerPawn'))
			{
				//ActualDamage /= (Level.Game.NumPlayers );	//Scale damage based on number of players Chris TODO: Remove this, and focus on 
				InstigatedBy.PlayerReplicationInfo.Score += ActualDamage;
				if (PlayerPawn(InstigatedBy)!= none && MHReplicationInfo(PlayerPawn(InstigatedBy).PlayerReplicationInfo) != none)
					MHReplicationInfo(PlayerPawn(InstigatedBy).PlayerReplicationInfo).Enemy = Victim;
			}
	}
    
	if(Victim != None && InstigatedBy != None)
	{
		if(bUseAntiBoost)
		{
			if(Victim != None && InstigatedBy != None)
			{
				if(Victim.bIsPlayer && InstigatedBy.bIsPlayer)
					Momentum *= 0;
			}
		}
		Momentum *= 0.4;//Reduce bullshit
		if(Victim.IsA('ScriptedPawn') && InstigatedBy.IsA('ScriptedPawn'))	//This should never happen
		{
			ActualDamage=0;
			return;
		}
		// monster damage
		if(InstigatedBy.IsA('TeamCannon') && Victim.IsA('ScriptedPawn'))
		{
			ActualDamage = 0;
			return; // None damage = 0
		}
	
		if(bHitsounds ) // hitsounds code
		{
			if ( InstigatedBy.bIsPlayer && (Victim != InstigatedBy))
			{
				if( (Victim.IsA('PlayerPawn') || Victim.IsA('Bot')) && InstigatedBy.IsA('Playerpawn') )  // When player shoot other player
				{
					PlayerPawn(InstigatedBy).ClientPlaySound(Sound'MH2_C_V18.HitsoundTeam', true,false);
					PlayerPawn(InstigatedBy).ClientPlaySound(Sound'MH2_C_V18.HitsoundTeam', true,false);
				}
			if( Victim.IsA('ScriptedPawn') && InstigatedBy.IsA('Playerpawn') )  // When player shoots a monster
			{
				PlayerPawn(InstigatedBy).ClientPlaySound(Sound'MH2_C_V18.HitsoundEnemy', true,false);
			}
			}
		}
		if(ActualDamage > 0)
		{
			if(((Victim.IsA('PlayerPawn') && PlayerPawn(Victim).PlayerReplicationInfo.PlayerName != "Player") || (Victim.IsA('Bot') && Bot(Victim).PlayerReplicationInfo.PlayerName != "Player")) && InstigatedBy.IsA('PlayerPawn') && PlayerPawn(InstigatedBy).PlayerReplicationInfo.PlayerName != "Player" && Victim != InstigatedBy && bUseWarnTeamDamage )
			{// InstigatedBy > killer  Victim > killed
			//danger
				if ( InstigatedBy.IsA('TournamentPlayer') )
					InstigatedBy.ReceiveLocalizedMessage( class'MH2_C_V3Message',Victim.Health - ActualDamage, Victim.PlayerReplicationInfo );
	
					//BroadCastMessage("Dam: victim"@ActualDamage@Victim.PlayerReplicationInfo.PlayerName@"instigatedby"@InstigatedBy.PlayerReplicationInfo.PlayerName@DamageType);
				if(Victim.Health - ActualDamage<= 0 && Victim != InstigatedBy)
				{
				Log("TK? :(damage:"@ActualDamage@")killed"@Victim.PlayerReplicationInfo.PlayerName@"killer"@InstigatedBy.PlayerReplicationInfo.PlayerName@"type:"@DamageType);
					if ( Victim.IsA('TournamentPlayer') || Victim.IsA('Bot'))
					{
					for ( P = Level.PawnList; P != None; P = P.NextPawn )
						if ( P.IsA('TournamentPlayer') )
							P.ReceiveLocalizedMessage( class'MH2_C_V3Message',9999, InstigatedBy.PlayerReplicationInfo );
					}
				if ( InstigatedBy.IsA('TournamentPlayer') )
					InstigatedBy.ReceiveLocalizedMessage( class'MH2_C_V3Message',Victim.Health - ActualDamage, Victim.PlayerReplicationInfo );
				}
			}
		}
	}
	if ( NextDamageMutator != None )
		NextDamageMutator.MutatorTakeDamage(ActualDamage, Victim, InstigatedBy, HitLocation, Momentum, DamageType);
}

function ModifyPlayer(Pawn Other)
{
	local int randm;
	local inventory inv;
	local Weapon W;
	local DJ_InventoryItem DJ_Inv;
	local PiddledoperMP PMP;
	local Pawn PawnLink;
	local Seeds S;
	local Flare F;
	local CSWeapons16 Wps;
	local int i;
		local walldodge ws;
	if(Other == none || Other.PlayerReplicationInfo == none || Other.PlayerReplicationInfo.bWaitingPlayer || !MonsterHunt2(Level.Game).bStartedHunt)
		return;
	class'C4'.default.ClipCount = 5;
	
	if((Other.IsA('PlayerPawn')||Other.IsA('Bot')||Other.IsA('HumanBot')||!Other.IsA('SkaarjBot')||!Other.IsA('SkaarjPlayerBot')) && !Other.IsA('ScriptedPawn'))
	{
		Other.Health = 150;
		Other.default.health = 150;
		Other.bBlockPlayers = !StopPlayerCollision;
		ws = spawn(class'walldodge',,,);
		ws.giveto(other);
		if(Other.IsA('PlayerPawn'))
			PlayerPawn(Other).ServerNeverSwitchOnPickup(true);
		if (bUseCoopTranslocator && Other.IsA('PlayerPawn'))// I don't think Bots can use this anyway.......
			GiveWeapon(Other,class'cooptranslocatorv4.cooptranslocator');
		//===========================================Give player DoubleJump if Desired
		if(DoubleJump && Other.IsA('PlayerPawn'))
		{
			DJ_Inv = Spawn(class'DJ_InventoryItem', Other,, Other.Location);
			if( DJ_Inv != None )
			{
				DJ_Inv.RespawnTime = 0.0;
				DJ_Inv.GiveTo(Other);
				DJ_Inv.maxJumps = maxJumps;
				DJ_Inv.jumpType = jumpType;
				DJ_Inv.jumpHeight = jumpHeight;
				DJ_Inv.bActive = true;
			}
		}
		if(Other.IsA('PlayerPawn') || Other.IsA('Bot'))	//Startup weapons
		{
			//GiveWeapon(Other,class'RainbowShockRifle');  //2
			//GiveWeapon(Other,class'BRipper');    //4
/*			GiveWeapon(Other,class'EXUHyperFlakkerMP');//7
			GiveWeapon(Other,class'EXUSuperClusterFucker');
			PMP = PiddledoperMP(GiveWeapon(Other,class'PiddledoperMP'));
			if(PMP != none)
			{
				PMP.BringUp();
				Other.Weapon = PMP;//Why the hell was this not thought of? Epic?..
			}*/
			for(i = 0; i < 6; ++i)
			{
				if(WeaponClasses[i] == None)
					break;
				Wps = CSWeapons16(GiveWeapon(Other, WeaponClasses[i]));
				if(Wps.ClipCount < 45)
				{
					Wps.ClipCount = 45;
					Wps.default.ClipCount = 45;
				}
			}
			Wps.BringUp();
			Other.Weapon = Wps;
			Other.ChangedWeapon();
			Wps = CSWeapons16(GiveWeapon(Other, class'GrenadeFrag'));
			Wps.AmmoType.AmmoAmount = 10;
			Wps.AmmoType.MaxAmmo = 10;
			
		}
	}
	if ( NextMutator != None )
		NextMutator.ModifyPlayer(Other);
}

function final Weapon GiveWeapon(Pawn PlayerPawn, class<TournamentWeapon> WeaponClass )
{
	local Weapon NewWeapon;

	newWeapon = Spawn(WeaponClass);
	if( newWeapon != None )
	{
		if(PlayerNeverAutoSwitchWeapon)
		newWeapon.AutoSwitchPriority=0; //Never autoSwitch.
		newWeapon.RespawnTime = 0.0;
		newWeapon.bCanThrow = True;
		newWeapon.GiveTo(PlayerPawn);
		newWeapon.bHeldItem = true;
		newWeapon.AmbientGlow = 0;
		PlayerPawn.PendingWeapon = none;
		if ( !newWeapon.IsA('ImpactHammer') && !newWeapon.IsA('Translocator') ) 
		{
			newWeapon.GiveAmmo(PlayerPawn);
			newWeapon.AmmoType.AmmoAmount = StartingAmmoAmmount;
		}
		return newWeapon;
	}
}

function bool PreventDeath (Pawn Killed, Pawn Killer, name DamageType, Vector HitLocation)
{
	local bool pd;

	pd = Super.PreventDeath(Killed,Killer,DamageType,HitLocation);

	
	//if (Killed != none && !pd)
	//{
		//if (Killer != none || Killer == None || Killed == Killer )
		// DiscardInventory(Killed); //Will be disabled for now
	//}
	return pd;
}

function DiscardInventory (Pawn Other)
{
	local Actor dropped;
	local Inventory Inv;
	local class<Weapon> Initial1;
	local class<Weapon> Initial2;

	return;
	if (Other != none)
	{
		if ( Other.DropWhenKilled != None )
		{
		dropped=Spawn(Other.DropWhenKilled,,,Other.Location);
		Inv=Inventory(dropped);
		if ( Inv != None )
			{
			Inv.RespawnTime=0.00;
			Inv.BecomePickup();
			}
		if ( dropped != None )
			{
			dropped.NetPriority = 1.400000;
			dropped.NetUpdateFrequency = 10.000000;
			dropped.RemoteRole = ROLE_SimulatedProxy; //Hell man, our root of troubles in Net play
			dropped.SetPhysics(PHYS_Falling);
			dropped.bCollideWorld=True;
			dropped.Velocity=Other.Velocity + VRand() * 280;
			}
		if ( Inv != None )
			{
			Inv.GotoState('Pickup','dropped');
			}
		}
	Inv=Other.Inventory;
	Loop1:
		if ( Inv != None )
		{
			if ( Inv.IsA('Weapon') )
			{
				if ( (Inv.Class != Level.Game.BaseMutator.MutatedDefaultWeapon()) && ((Weapon(Inv).AmmoType == None) || (Weapon(Inv).AmmoType.AmmoAmount > 0)) && Weapon(Inv).bCanThrow)
				{
					if (Inv.class != class'Enforcer' && Inv.Class != class'DoubleEnforcer')
					DropWeapon(Other,Inv);
				}
			}
		Inv.Destroy();
		Inv=Inv.Inventory;
		goto Loop1;
    	}
   	}
}

function DropWeapon (Pawn Other, Inventory Inv)
{
	local Inventory DropInv;
	local int DropPitch;
	local int DropYaw;
	local Rotator DropRot;

	DropInv=Spawn(Inv.Class,,,Other.Location);
	if ( DropInv == None )
		{
		return;
		}
	DropRot=Other.ViewRotation;
	DropPitch=Rand(32768);
	DropYaw=Rand(65536);
	DropRot.Pitch=DropPitch;
	DropRot.Yaw=DropYaw;
	Weapon(DropInv).bWeaponStay = false;
	DropInv.Velocity=vector(DropRot) * (Rand(250) + 250);
	DropInv.RespawnTime=0.00;
	DropInv.BecomePickup();
	DropInv.NetPriority = 1.400000;
	DropInv.NetUpdateFrequency = 10.000000;
	DropInv.RemoteRole = ROLE_SimulatedProxy;
	DropInv.SetPhysics(PHYS_Falling);
	DropInv.bCollideWorld=True;
	DropInv.GotoState('Pickup','dropped');
}

function bool HandlePickupQuery (Pawn Other, Inventory Item, out byte bAllowPickup)
{	
	if (Other != none && Other.IsA('ScriptedPawn') )
	{
		return False;
	}
	if ( NextMutator != None )
	{
		return NextMutator.HandlePickupQuery(Other,Item,bAllowPickup);
	}
}

function final FixAI(Pawn P)
{
	local ScriptedPawn S;
	local Bot B;
	local Queen Q;
	local SkaarjTrooper ST;
	local Weapon Wp;
	ST = SkaarjTrooper(P);
	S = ScriptedPawn(P);
	B = Bot(P);
	Q = Queen(P);
	
	if(S != None && S.Enemy != None && PlayerPawn(S.Enemy) != None && PlayerPawn(S.Enemy).PlayerReplicationInfo.bFeigningDeath)
		S.GoToState('Roaming');

       if (Q != None)
       {
		if (Q.IsInState('Teleporting'))
			Q.GoToState('Roaming','');
	}
	if (S != None && S.ReducedDamagePct > 0)
		{
		S.ReducedDamageType = '';
		S.ReducedDamagePct = 0;
		}

	if (B != None && B.MoveTarget != None)
	{
		if ( B.IsInState('FallingState') && B.MoveTarget.IsA('Pathnode') )
		{
			B.MoveTimer = -1.0;
			B.MoveTarget = None;
		}
	}
}

function Timer ()
{							
	local Pawn P;
	local Inventory Inv;
	local PlayerPawn PP;
	local MHReplicationInfo RP;
	
	//MonsterAttackCheck();
	//MadStop();
	if (!MonsterHunt2(Level.Game).bStartedHunt) return; //Done. If game isn't started return timer here.
	if ( MonsterHunt2(Level.Game).bGameEnded ) return;

	for ( P=Level.PawnList; P!=None; P=P.NextPawn )
	{
		FixAI(P);
		if ( P.IsA('Bot') || P.IsA('PlayerPawn') )
		{
			if (P.Health > 0)
			{
				// ammo
				if(P.weapon != none && !P.Weapon.IsInState('Firing') && !P.Weapon.IsInState('AltFiring'))
					for( Inv=P.Inventory; Inv!=None; Inv=Inv.Inventory )
						if ( (Ammo(Inv)!=None) && Ammo(Inv).MaxAmmo > 10 )
								Ammo(Inv).AmmoAmount += 50;
							
				// health
				if(P.IsA('Bot'))
					if ( P.Health < 400 && !P.Region.Zone.bWaterZone)
					{
						P.Health += 20;
						if (P.health > 400)
							P.Health = 400;
					}
					
				if(P.IsA('PlayerPawn') && !P.Region.Zone.bWaterZone)
				{
					PP = PlayerPawn(P);
					if(PP.Health < 150) //Change this not to remain hardcoded
					{
						RP = MHReplicationInfo(PP.PlayerReplicationInfo);
						if(RP.HealthCounter > 0)
							--RP.HealthCounter;
						else
							PP.Health += Min(50, 150 - PP.Health);

					}
				}
			}
		}
	}
	
	++AmpCounter;
	++KakuCounter;
	++HealthCounter;
	
	if(AmpCounter == AmpTime)
	{
		PP = GetRandomPlayer();
		AmpCounter = 0;
		GiveAmp(PP);
		BroadCastMessage(PP.PlayerReplicationInfo.PlayerName @ "Got Amp!");
	}
	if(KakuCounter == KakuTime)
	{
		PP = GetRandomPlayer();
		KakuCounter = 0;
		GiveStealth(PP);
		BroadCastMessage(PP.PlayerReplicationInfo.PlayerName @ "Got Stealth!");
	}
	if(HealthCounter == HealthTime)
	{
		PP = GetRandomPlayer();
		HealthCounter = 0;
		GiveHealth(PP);
		BroadCastMessage(PP.PlayerReplicationInfo.PlayerName @ "Got Amp!");
	}
}

function final PlayerPawn GetRandomPlayer()
{
	local Pawn N;
	local PlayerPawn Dest;
	local PlayerPawn Candidate[32];
	local int num;

	for (N=Level.PawnList; N!=None; N=N.NextPawn)
	{
		Dest=PlayerPawn(N);
		if (Dest!=None && TournamentPlayer(Dest)!=none) 
		{
			Candidate[num++]=Dest;
		}
	}
	//This will never return none, since the loop in Timer checks weither there is any players or not already.
	return Candidate[Rand(Min(32,num))];
}

function final GiveAmp(Pawn PlayerPawn)
{
	local UDamage damage;
	if( (PlayerPawn.FindInventoryType(class'UDamage') != None) || (PlayerPawn.Health <= 0) )
		return;
	damage = spawn(class'UDamage',PlayerPawn,,PlayerPawn.Location);
	if( damage != None )
	{
		damage.RespawnTime = 0.0;
		damage.GiveTo(PlayerPawn);
		damage.Activate();
	}
}

function final GiveStealth (Pawn PlayerPawn)
{
	local Inventory Red;
	if(PlayerPawn == none)
	{
		log("Error! >>>> GiveRedeemer, pawn= none");
		return;
	}
	if (PlayerPawn.FindInventoryType(Class'UT_Invisibility') != None)
		return;
	Red=Spawn(Class'UT_Invisibility');
	Red.RespawnTime=0.00;
	Red.GiveTo(PlayerPawn);
	PlayerPawn.AddInventory(Red);
}

function final GiveHealth(Pawn PlayerPawn)
{
	PlayerPawn.Health+=500;
}

function Mutate(string MutateString, PlayerPawn Sender)
{
	local Pawn P;
	local NsWayPoint NW;
	local Inventory inv; 
	local bool ordered;
	local LimeLight2 S; 
    local Mover M;
	local MonsterReplicationInfoTwo GRI;
	local int index;
	local string Value;
	
	//Custom mapvote is deprecated now. May work on this sometime later.
	GRI=MonsterReplicationInfotwo(Level.Game.GameReplicationInfo);
	if(MutateString ~= "cssreload")
	{
		if(Sender != none && Sender.Weapon != none && Sender.Weapon.IsA('CSWeapons16'))
			CSWeapons16(Sender.Weapon).Reload();
	
	}
	
    else if(MutateString~="flashlight")
    {
	
		for(Inv = Sender.Inventory; Inv != none; Inv = Inv.Inventory)
		{
			if(Inv.IsA('FlashLight'))
				break;
		}

		if(Inv != none)
		{
			if(Inv.bActive)
				Inv.gotostate('Idle2');
			else
				Inv.Activate();
		}
	}    
	else if(MutateString~="seeds")
    {
	
		for(Inv = Sender.Inventory; Inv != none; Inv = Inv.Inventory)
		{
			if(Inv.IsA('Seeds'))
				break;
		}

		if(Inv != none)
		{
			if(Inv.bActive)
				Inv.gotostate('Idle2');
			else
				Inv.Activate();
		}
	}
	else if(MutateString~="flare")
    {
	
		for(Inv = Sender.Inventory; Inv != none; Inv = Inv.Inventory)
		{
			if(Inv.IsA('Flare'))
				break;
		}

		if(Inv != none)
		{
			if(Inv.bActive)
				Inv.gotostate('Idle2');
			else
				Inv.Activate();
		}
	}
	else if(MutateString~="jumpboots")
    {
	
		for(Inv = Sender.Inventory; Inv != none; Inv = Inv.Inventory)
		{
			if(Inv.IsA('UT_JumpBoots') || Inv.IsA('JumpBoots'))
				break;
		}

		if(Inv != none)
		{
			if(Inv.bActive)
				Inv.gotostate('Idle2');
			else
				Inv.Activate();
		}
	}
	else if(MutateString~="doublejump")
    {
		for(Inv = Sender.Inventory; Inv != none; Inv = Inv.Inventory)
		{
			if(Inv.IsA('DJ_InventoryItem'))
				break;
		}
		if(Inv != none)
			Inv.bActive = !Inv.bActive;
	}
	//else if(Left(MutateString,6)~= "delmap")
	//	DeleteMap(Mid(MutateString,7));
	
    else if(MutateString ~= "open")
      {
         Sender.ClientMessage("Movers in range opened (Action was logged to the server admin)...");
         foreach RadiusActors(class'Mover', M, 250, Sender.Location)
         {
            log("## ADMIN- Mover opened:"@M@"by player:"@Sender.PlayerReplicationInfo.PlayerName);
            M.DoOpen();
         }
      }
      else if(MutateString ~= "close")
      {
         Sender.ClientMessage("Movers in range closed (Action was logged to the server admin)...");
         foreach RadiusActors(class'Mover', M, 250, Sender.Location)
         {
            log("## ADMIN- Mover closed:"@M@" by player:"@Sender.PlayerReplicationInfo.PlayerName);
            M.DoClose();
         }
      }
	  else if(Left(MutateString,10) ~= "SetMessage")
		MonsterHunt2(Level.Game).StatsMut.ChangeMessage(Mid(MutateString,InStr(MutateString," ")),Sender);

	if ( NextMutator != None )
		NextMutator.Mutate(MutateString, Sender);
}


//FIXME: fix this
function final fixmovers()
{
	local mover M;

	foreach AllActors(class'Mover', M)
	{
	if (M != None)
		{
		M.bAlwaysRelevant = true;
		if (M.bTriggerOnceOnly && M.MoverEncroachType == ME_ReturnWhenEncroach)
			{
			M.MoverEncroachType = ME_IgnoreWhenEncroach;
			log ("Detected & Resolved a Mover Triggered Once With ReturnWhenEncroach >> "@M.name);
			}
		if (M.bUseTriggered == True)
			{
			M.bUseTriggered = False;
			log ("Detected & Resolved a Mover to not be cheated by GRAB command >> " @M.name);
			}
		if (M.bDamageTriggered)
			log(M@" >> is damage triggered");
		if (!M.bTriggerOnceOnly && M.MoverEncroachType == ME_CrushWhenEncroach)
			{
			M.MoverEncroachType = ME_ReturnWhenEncroach;
			M.EncroachDamage = 5000000;
			log ("Detected & Resolved a Mover to not be turned back without to suffer a big damage >> "@M.name);
			}
		if (!M.bTriggerOnceOnly && M.DelayTime < MoverDelay)
			{
			M.DelayTime = MoverDelay; //Expect some ping reaction for NetworkPlay
			}
		if (!M.bTriggerOnceOnly && M.BumpType == BT_PlayerBump)
			{
			M.BumpType = BT_PawnBump; //Enhanced mover, LOL, monsters will use it to hunt you back :P
			}
		}
	}
}

function final Actor ReplaceWithOther(actor Other, class<Actor> aClass)
{
	local Actor A;
	local inventory O, Alt;

	if ( Other.IsA('Inventory') && (Other.Location == vect(0,0,0)) )
		return Other;
	//Why use DLO and waste resources?
	
	if ( aClass != None )
	{
		Other.SetCollision(False,False,False);
		aClass.Default.bCollideWhenPlacing = False;
//		aClass.Default.bCollideWorld = False;
		A = Spawn(aClass,Other.Owner,Other.tag,Other.Location, Other.Rotation);
		if(A == none)
		{
			log("Failed to replace "$Other.Class$" With "$aClass);
			return Other;
		}
		if (A.bIsPawn)
		{
			A.DrawScale = Other.DrawScale;
			A.SetCollisionSize(Other.CollisionRadius, Other.CollisionHeight);
		}
	}
	if ( Other.IsA('Inventory') )
	{
		if ( Inventory(Other).MyMarker != None )
		{
			Inventory(Other).MyMarker.markedItem = Inventory(A);
			if ( Inventory(A) != None )
			{
				Inventory(A).MyMarker = Inventory(Other).MyMarker;
				A.SetLocation(A.Location 
					+ (A.CollisionHeight - Other.CollisionHeight) * vect(0,0,1));
			}
			Inventory(Other).MyMarker = None;
		}
		
		
		else if ( A.IsA('Inventory') )
		{
			Inventory(A).bHeldItem = True;
			Inventory(A).Respawntime = 0.0;
		}
	}
	if ( A != None )
	{
		A.event = Other.event;
		A.tag = Other.tag;
		Other.destroy();
		return A;
	}
	return Other;	//Failed to spawn
}

function bool MutatorBroadcastMessage( Actor Sender, Pawn Receiver, out coerce string Msg, optional bool bBeep, out optional name Type )
{
local Pawn P;
    
	//for(P=level.Pawnlist;P!=none;P=P.Nextpawn)
      // if(PlayerPawn(P)!=none && PlayerPawn(P).MyHUD.IsA('CMonsterHUD'))
		    
return true;
}

function bool MutatorBroadcastLocalizedMessage( Actor Sender, Pawn Receiver, out class<LocalMessage> Message, out optional int Switch, out optional PlayerReplicationInfo RelatedPRI_1, out optional PlayerReplicationInfo RelatedPRI_2, out optional Object OptionalObject )
{
	//if ( NextMessageMutator != None )
	//	return NextMessageMutator.MutatorBroadcastLocalizedMessage( Sender, Receiver, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject );
	//else
	
		return true;
}

function bool MutatorTeamMessage( Actor Sender, Pawn Receiver, PlayerReplicationInfo PRI, coerce string S, name Type, optional bool bBeep )
{
		return true;
}

defaultproperties
{
    Username="Christopher"
    ServerPassword="OMG"
    FItems=16
    MoverDelay=0.700000
    bUseCoopTranslocator=True
    bUseCrapSpree=True
    AmpTime=444
    KakuTime=333
    HealthTime=244
    NumCapacity=260
    bRemoveBlocking=True
    MHealthMultiplier=5.000000
    MaxMonsterHealth=20000
    StartingAmmoAmmount=1000
    PlayerNeverAutoSwitchWeapon=True
    bUseWarnTeamDamage=False
    bHitsounds=True
    MaxHealth=5000
    DefaultHealth=200
    SelfDamageScale=0.050000
    DoubleJump=True
    maxJumps=3
    jumpType=2
    jumpHeight=2.000000
	WeaponClasses(0)=class'AK47'
	WeaponClasses(1)=class'AWP'
	WeaponClasses(2)=class'UMP45'
	WeaponClasses(3)=class'Famas'
	WeaponClasses(4)=class'XM1014'
	WeaponClasses(5)=class'g3sg1'
	WeaponClasses(6)=class'Galil'
	WeaponClasses(7)=class'GrenadeFrag'
	WeaponClasses(8)=class'M249'
	WeaponClasses(9)=class'M3'
	WeaponClasses(10)=class'M4A1'
	WeaponClasses(11)=class'Mac10'
	WeaponClasses(12)=class'MP5'
	WeaponClasses(13)=class'P90'
	WeaponClasses(14)=class'sg550'
	WeaponClasses(15)=class'TMP'
	WeaponClasses(16)=class'C4'
}
