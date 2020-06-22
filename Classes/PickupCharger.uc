//=============================================================================
// PickupCharger.
//=============================================================================
class PickupCharger expands Inventory;

//Model Import
#exec mesh import mesh=UTPowerUpBase anivfile=Models\UTPowerUpBase_a.3d datafile=Models\UTPowerUpBase_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
#exec MESH LODPARAMS MESH=UTPowerUpBase STRENGTH=0.25
#exec mesh origin mesh=UTPowerUpBase x=0 y=0 z=0
#exec mesh sequence mesh=UTPowerUpBase seq=All startframe=0 numframes=1

#exec meshmap new meshmap=UTPowerUpBase mesh=UTPowerUpBase
#exec meshmap scale meshmap=UTPowerUpBase x=0.12203 y=0.12203 z=0.24407

//Skins import
#exec TEXTURE IMPORT NAME=InvSkin05 FILE=SKINS\PBbas03HA.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=InvSkin05 FILE=SKINS\PBbas03HA.pcx GROUP=Skins PALETTE=InvSkin05
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=0 TEXTURE=InvSkin05

#exec TEXTURE IMPORT NAME=NVialSk04 FILE=SKINS\PBcel08CS.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=NVialSk04 FILE=SKINS\PBcel08CS.pcx GROUP=Skins PALETTE=NVialSk04
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=1 TEXTURE=NVialSk04

#exec TEXTURE IMPORT NAME=PBaseSkin02 FILE=SKINS\PBbas04AL.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin02 FILE=SKINS\PBbas04AL.pcx GROUP=Skins PALETTE=PBaseSkin02
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=2 TEXTURE=PBaseSkin02

#exec TEXTURE IMPORT NAME=PBaseSkin03 FILE=SKINS\PBHourInduslight.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin03 FILE=SKINS\PBHourInduslight.pcx GROUP=Skins PALETTE=PBaseSkin03
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=3 TEXTURE=PBaseSkin03

#exec TEXTURE IMPORT NAME=PBaseSkin04 FILE=SKINS\PBflr12CStop.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin04 FILE=SKINS\PBflr12CStop.pcx GROUP=Skins PALETTE=PBaseSkin04
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=4 TEXTURE=PBaseSkin04

#exec TEXTURE IMPORT NAME=PBaseSkin05 FILE=SKINS\PBflr06bCS.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin05 FILE=SKINS\PBflr06bCS.pcx GROUP=Skins PALETTE=PBaseSkin05
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=5 TEXTURE=PBaseSkin05

#exec TEXTURE IMPORT NAME=InvSkin04 FILE=SKINS\PBbas18AL.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=InvSkin04 FILE=SKINS\PBbas18AL.pcx GROUP=Skins PALETTE=InvSkin04
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=6 TEXTURE=InvSkin04

#exec TEXTURE IMPORT NAME=PBaseSkin07 FILE=SKINS\PBbas01AL.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin07 FILE=SKINS\PBbas01AL.pcx GROUP=Skins PALETTE=PBaseSkin07
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=7 TEXTURE=PBaseSkin07

//-----------------------------------------------------------------------



var() class<Inventory> PickupClass;	//Pickup class to spawn
var() float BeginDelayTime;		//Time to wait after the begin of the game to spawn the pickup
var() vector SpawnOffset;		//Offset to spawn the pickup (NOT RELATIVE TO BASE ROTATION!)
var() bool bRotPickup;			//bRotationPickup equivalent
var() rotator PickupRotOffset;		//Pickup start rotation offset
var() float PickupRespawnTime;		//Custom respawn time
var() bool bAutoAlignPickup;		//Align pickup rotation to the charger rotation
var(Triggering) bool bSpawnTriggered;	//Trigger First Spawn
var(Triggering) bool bTriggerToggle;	//Activate or deactivate pickup
var(Triggering) name CollectedEvent;	//Collected Event
var(Triggering) name SpawnEvent;	//Spawn Event
var(Triggering) bool bSpawnEventOnce;	//Spawn Event only at first spawn?
var(Triggering) float RetriggerWaitTime;//Time to wait until next triggered spawn, set to 0 to make the pickup charger triggerable only once
var(Triggering) bool bTriggeredMachine; //Trigger a spawn of a pickup, but like if the pickup was a soda xD (once picked up, it won't respawn until you trigger this again)


var(PickupParticles) bool bHaveParticles;		//Have particles effects

var enum EParticleType 		//Choose the particle type animation
{
	PT_Default,
	PT_CylinderRotation,
	PT_CylinderRotation2,
	PT_CubeRotation,
	PT_CubeRotation2,
	PT_SphereRotation,
	PT_WhirlPlaneOut,
	PT_WhirlPlaneIn,
	PT_WhirlHoleOut,
	PT_WhirlHoleIn,
	PT_Custom
} PT;

var enum EAnimStyle
{
	AS_LoopNormal,
	AS_LoopSpecial
} AS;

struct PickupParticles
{
	//Main particles side
	var() bool bHaveThisParticle;			//Use these particles
	var() texture ParticleTex;			//Particles texture
	var() float ParticlesDrawScale, ParticleSpeed;	//Particles size and speed of anim
	var() vector ParticlesOffset;			//Offset from the charger
	var() EParticleType ParticleType;		//Particle base vertex mesh

	var() rotator ParticlesRotation;		//Particles custom rotation
	var() bool bRotating;				//Rotating vertex mesh
	var() rotator ParticlesRotationRate;		//Above, rotation rate

	//Sound
	var() Sound PSound;				//Particles ambient sound
	var() byte PSoundPitch, 			//Sound Pitch
		PSoundVolume, 				//Volume
		PSoundRadius;				//Radius

	//Custom vertex mesh side
	var() mesh VertexMesh;				//New particle vertex mesh if ParticleType=PT_Custom
	var() name VertexAnim;				//In the above case, this is what where the Anim Loop will be defined, it won't animate if None
	var() bool bSpecialLoop;			//Used in PT_Custom once again, when False is executed with tween anim for last>first
								// frames (normal), while when True it has a tween time of 0, and it's executed in a special way
};

var(PickupParticles) PickupParticles ParticlesEffects[4];
var(PickupParticles) bool bStay;	//When True, particles will stay even when the Pickup is there


var(WildCard) bool bRandom;
var(WildCard) Class<Inventory> RandomPickups[16];
var(WildCard) float RandRespawnTime;			//Static respawn time
var(WildCard) bool bUseRandomRespawnTime;
var(WildCard) float RandRespawnTimeMin;
var(WildCard) float RandRespawnTimeMax;

var(Weapons) bool bWeaponStay;	//Only for weapons
var(Weapons) bool bNeverStays;	//Set this for super weapons

var(SinglePlayer) bool bSPMode;

var PickupBase MarkedPick;
var bool bForceRot;

function PostBeginPlay(){}

//Deco base and particle handling
function PreBeginPlay()
{

local PickupBase PickB;
local PickParticles pp;
local int i;
local vector X, Y, Z;

	//Spawn base part
	PickB = Spawn(Class'PickupBase',,, Location, Rotation);
	PickB.Mesh = Mesh;
	
	For( i=0; i<8; i++)
	{
		PickB.MultiSkins[i] = MultiSkins[i];
	}

	For( i=0; i<16; i++)
	{
		PickB.RandomPickups[i] = RandomPickups[i];
	}

	PickB.SpawnOffset = SpawnOffset;
	PickB.bRotPickup = bRotPickup;
	PickB.AmbientGlow = AmbientGlow;
	PickB.DrawScale = DrawScale;
	PickB.bStay = bStay;
	PickB.ScaleGlow = ScaleGlow;
	PickB.AmbientGlow = AmbientGlow;
	PickB.LODBias = LODBias;
	PickB.PickupRotOffset = PickupRotOffset;
	PickB.Tag = Tag;
	PickB.bSpawnTriggered = bSpawnTriggered;
	PickB.bTriggerToggle = bTriggerToggle;
	PickB.bRandom = bRandom;
	PickB.RandRespawnTime = RandRespawnTime;
	PickB.CollectedEvent = CollectedEvent;
	PickB.SpawnEvent = SpawnEvent;
	PickB.bSpawnEventOnce = bSpawnEventOnce;
	PickB.RetriggerWaitTime = RetriggerWaitTime;
	PickB.bTriggeredMachine = bTriggeredMachine;
	PickB.RandRespawnTimeMin = RandRespawnTimeMin;
	PickB.RandRespawnTimeMax = RandRespawnTimeMax;
	PickB.bUseRandomRespawnTime = bUseRandomRespawnTime;
	PickB.bAutoAlignPickup = bAutoAlignPickup;
	PickB.Texture = Texture;
	PickB.bSPMode = bSPMode;
	PickB.bWeaponStay = bWeaponStay;
	PickB.bNeverStays = bNeverStays;

	SetTimer(0.1, False);
	MarkedPick = PickB;
	

	//Particles part
	if (bHaveParticles)
	{
		For (i=0; i<4; i++)
		{
		
		if (ParticlesEffects[i].bHaveThisParticle)
		{
			GetAxes(Rotation, X, Y, Z);

			pp = Spawn(Class'PickParticles',,, Location + (ParticlesEffects[i].ParticlesOffset.X * X + ParticlesEffects[i].ParticlesOffset.Y * Y + ParticlesEffects[i].ParticlesOffset.Z * Z), Rotation + ParticlesEffects[i].ParticlesRotation);
			pp.DrawScale = ParticlesEffects[i].ParticlesDrawScale;
			pp.Rate = ParticlesEffects[i].ParticleSpeed;
			pp.Texture = ParticlesEffects[i].ParticleTex;
			pp.VertexMesh = ParticlesEffects[i].VertexMesh;
			pp.VertexAnim = ParticlesEffects[i].VertexAnim;
			pp.bSpecialLoop = ParticlesEffects[i].bSpecialLoop;
			PickB.XParticles[i] = pp;

			pp.AmbientSound = ParticlesEffects[i].PSound;
			pp.SoundPitch = ParticlesEffects[i].PSoundPitch;
			pp.SoundVolume = ParticlesEffects[i].PSoundVolume;
			pp.SoundRadius = ParticlesEffects[i].PSoundRadius;
			pp.Tag = Tag;

			if (ParticlesEffects[i].bRotating)
			{
				pp.RotationRate = ParticlesEffects[i].ParticlesRotationRate;
				pp.SetPhysics(PHYS_Rotating);
			}

			switch (ParticlesEffects[i].ParticleType)
			{
				case PT_Default:
					pp.ParticleType = 0;
					break;
				case PT_CylinderRotation:
					pp.ParticleType = 1;
					break;
				case PT_CylinderRotation2:
					pp.ParticleType = 2;
					break;
				case PT_CubeRotation:
					pp.ParticleType = 3;
					break;
				case PT_CubeRotation2:
					pp.ParticleType = 4;
					break;
				case PT_SphereRotation:
					pp.ParticleType = 5;
					break;
				case PT_WhirlPlaneOut:
					pp.ParticleType = 6;
					break;
				case PT_WhirlPlaneIn:
					pp.ParticleType = 7;
					break;
				case PT_WhirlHoleOut:
					pp.ParticleType = 8;
					break;
				case PT_WhirlHoleIn:
					pp.ParticleType = 9;
					break;
				case PT_Custom:
					pp.ParticleType = 10;
					break;
				default:
					break;
			}

		}

		}
	}

	//Destroy();
}

function Timer()
{
	MarkedPick.bForceRot = bForceRot;
	MarkedPick.PickupRespawnTime = PickupRespawnTime;
	MarkedPick.BeginDelayTime = BeginDelayTime;
	MarkedPick.PickupClass = PickupClass;
	MarkedPick.CollectedEvent = Event;
	MarkedPick.PMarker = MyMarker;
	MyMarker.Tag = Tag;
	Destroy();
}

//---------------------------------------------------------------
//Cancel several inventory functions
//---------------------------------------------------------------

function BecomePickup(){}

function BecomeItem(){}

function GiveTo( pawn Other ){}

function inventory SpawnCopy( pawn Other ){}

function SetRespawn(){}

function Activate(){}

event TravelPreAccept(){}

function bool HandlePickupQuery( inventory Item ){}

function Inventory SelectNext(){}

function DropFrom(vector StartLocation){}


event float BotDesireability( pawn Bot )
{
	local Inventory AlreadyHas;
	local float desire;
	local bool bChecked;

	desire = MaxDesireability;

	if ( RespawnTime < 10 )
	{
		bChecked = true;
		AlreadyHas = Bot.FindInventoryType(PickupClass); 
		if ( (AlreadyHas != None) 
			&& (AlreadyHas.Charge >= Charge) )
				return -1;
	}

	if( bIsAnArmor )
	{
		if ( !bChecked )
			AlreadyHas = Bot.FindInventoryType(PickupClass); 
		if ( AlreadyHas != None )
			desire *= (1 - AlreadyHas.Charge * AlreadyHas.ArmorAbsorption * 0.00003);
		
		desire *= (Charge * 0.005);
		desire *= (ArmorAbsorption * 0.01);
		return desire;
	}
	else return desire;
}




auto state Pickup
{

ignores ZoneChange, Touch, Landed, Timer, BeginState, EndState;

function bool ValidTouch( actor Other ){}

function CheckTouching(){}

Begin:
GotoState('');

}

state Activated
{
	function BeginState(){}

	function EndState(){}

	function Activate(){}

Begin:
}
State Sleeping
{
Begin:
}

function ActivateTranslator(bool bHint){}

defaultproperties
{
     BeginDelayTime=2.000000
     SpawnOffset=(Z=48.000000)
     bRotPickup=True
     PickupRespawnTime=20.000000
     bAutoAlignPickup=True
     ParticlesEffects(0)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     ParticlesEffects(1)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     ParticlesEffects(2)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     ParticlesEffects(3)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     RandRespawnTime=30.000000
     RandRespawnTimeMin=28.000000
     RandRespawnTimeMax=50.000000
     bRotatingPickup=False
     RemoteRole=ROLE_DumbProxy
     Mesh=LodMesh'MH2_C_V18.UTPowerUpBase'
     AmbientGlow=0
     bTravel=False
     bCollideActors=False
}
