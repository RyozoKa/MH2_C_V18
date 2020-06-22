class MH2Base expands Actor;
//Main stuff

//Model Import
#exec mesh import mesh=UTPowerUpBase anivfile=Models\UTPowerUpBase_a.3d datafile=Models\UTPowerUpBase_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
#exec MESH LODPARAMS MESH=UTPowerUpBase STRENGTH=0.25
#exec mesh origin mesh=UTPowerUpBase x=0 y=0 z=0
#exec mesh sequence mesh=UTPowerUpBase seq=All startframe=0 numframes=1

#exec meshmap new meshmap=UTPowerUpBase mesh=UTPowerUpBase
#exec meshmap scale meshmap=UTPowerUpBase x=0.12203 y=0.12203 z=0.24407

//Skins import
#exec TEXTURE IMPORT NAME=InvSkin05 FILE=Textures\InvSkin05.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=InvSkin05 FILE=Textures\InvSkin05.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=0 TEXTURE=InvSkin05

#exec TEXTURE IMPORT NAME=NVialSk04 FILE=Textures\NVialSk04.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=NVialSk04 FILE=Textures\NVialSk04.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=1 TEXTURE=NVialSk04

#exec TEXTURE IMPORT NAME=PBaseSkin02 FILE=Textures\PBaseSkin02.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin02 FILE=Textures\PBaseSkin02.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=2 TEXTURE=PBaseSkin02

#exec TEXTURE IMPORT NAME=PBaseSkin03 FILE=Textures\PBaseSkin03.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin03 FILE=Textures\PBaseSkin03.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=3 TEXTURE=PBaseSkin03

#exec TEXTURE IMPORT NAME=PBaseSkin04 FILE=Textures\PBaseSkin04.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin04 FILE=Textures\PBaseSkin04.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=4 TEXTURE=PBaseSkin04

#exec TEXTURE IMPORT NAME=PBaseSkin05 FILE=Textures\PBaseSkin05.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin05 FILE=Textures\PBaseSkin05.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=5 TEXTURE=PBaseSkin05

#exec TEXTURE IMPORT NAME=InvSkin04 FILE=Textures\InvSkin04.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=InvSkin04 FILE=Textures\InvSkin04.pcx GROUP=Skins PALETTE=InvSkin04
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=6 TEXTURE=InvSkin04

#exec TEXTURE IMPORT NAME=PBaseSkin07 FILE=Textures\PBaseSkin07.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=PBaseSkin07 FILE=Textures\PBaseSkin07.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBase NUM=7 TEXTURE=PBaseSkin07
//
//Health base
#exec mesh import mesh=UT2HealthCharger anivfile=Models\UT2HealthCharger_a.3d datafile=Models\UT2HealthCharger_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
#exec MESH LODPARAMS MESH=UT2HealthCharger STRENGTH=0.25
#exec mesh origin mesh=UT2HealthCharger x=0 y=0 z=0
#exec mesh sequence mesh=UT2HealthCharger seq=All startframe=0 numframes=1

#exec meshmap new meshmap=UT2HealthCharger mesh=UT2HealthCharger
#exec meshmap scale meshmap=UT2HealthCharger x=0.07110 y=0.07110 z=0.14220

//Shield stuff
#exec mesh import mesh=ShieldChargerMesh anivfile=Models\ShieldChargerMesh_a.3d datafile=Models\ShieldChargerMesh_d.3d x=0 y=0 z=0
#exec MESH LODPARAMS MESH=ShieldChargerMesh
#exec mesh origin mesh=ShieldChargerMesh x=0 y=0 z=0
#exec mesh sequence mesh=ShieldChargerMesh seq=All startframe=0 numframes=1

#exec meshmap new meshmap=ShieldChargerMesh mesh=ShieldChargerMesh
#exec meshmap scale meshmap=ShieldChargerMesh x=0.07110 y=0.07110 z=0.14220

//Skins import
#exec TEXTURE IMPORT NAME=HChargSk FILE=Textures\HealthBaseTEX.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=HChargSk FILE=Textures\HealthBaseTEX.pcx GROUP=Skins

#exec TEXTURE IMPORT NAME=ShieldChargerTex FILE=Textures\ShieldChargerTex.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=ShieldChargerTex FILE=Textures\ShieldChargerTex.pcx GROUP=Skins

#exec MESHMAP SETTEXTURE MESHMAP=UT2HealthCharger NUM=0 TEXTURE=HChargSk
#exec MESHMAP SETTEXTURE MESHMAP=ShieldChargerMesh NUM=0 TEXTURE=ShieldChargerTex


var Class<Inventory> PickupClass;
var Inventory SpawnObj;
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
var MH2Particles pp;

function SetHave()
{
	ParticlesEffects[0].bHaveThisParticle=True;
}
function SetTex(Texture Tex)
{
	ParticlesEffects[0].ParticleTex=Tex;
}

function SetScale(float scale)
{
	ParticlesEffects[0].ParticlesDrawScale=scale;
}

function PostBeginPlay()
{

Super.PostBeginPlay();
AdjustZAxis();
	SpawnObj=Spawn(PickupClass,self,,Location+vect(0,0,48),Rot(0,0,0));
	//SpawnParticles();
}
//Call this manually.
function SpawnParticles()
{
local int i;
local vector X, Y, Z;


		For (i=0; i<4; i++)
		{
		
		if (ParticlesEffects[i].bHaveThisParticle)
		{
			GetAxes(Rotation, X, Y, Z);

			pp = Spawn(Class'MH2Particles',,, Location + (ParticlesEffects[i].ParticlesOffset.X * X + ParticlesEffects[i].ParticlesOffset.Y * Y + ParticlesEffects[i].ParticlesOffset.Z * Z), Rotation + ParticlesEffects[i].ParticlesRotation);
			pp.DrawScale = ParticlesEffects[i].ParticlesDrawScale;
			pp.Rate = ParticlesEffects[i].ParticleSpeed;
			pp.Texture = ParticlesEffects[i].ParticleTex;
			pp.VertexMesh = ParticlesEffects[i].VertexMesh;
			pp.VertexAnim = ParticlesEffects[i].VertexAnim;
			pp.bSpecialLoop = ParticlesEffects[i].bSpecialLoop;

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

//Function to adjust to the correct Z index
function AdjustZAxis()
{
local vector StartTrace, EndTrace, FinalLocation, HitLocation, HitNormal;
StartTrace=Location;
EndTrace=Location-vect(0,0,100);
Trace(HitLocation,HitNormal,EndTrace,StartTrace,false,);
FinalLocation = (HitLocation + HitNormal * (0.8 * (CollisionRadius + CollisionHeight)));
SetLocation(FinalLocation);
}

defaultproperties
{
     ParticlesEffects(0)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=48.000000))
     ParticlesEffects(1)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     ParticlesEffects(2)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     ParticlesEffects(3)=(ParticlesDrawScale=0.200000,ParticleSpeed=1.000000,ParticlesOffset=(Z=32.000000))
     DrawType=DT_Mesh
     Mesh=LodMesh'MH2_C_V18.UTPowerUpBase'
     bGameRelevant=True
     CollisionRadius=10.000000
     CollisionHeight=10.000000
}
