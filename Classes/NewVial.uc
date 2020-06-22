//=============================================================================
// NewVial.
// Scripted by FXD|Shadow
// Memo an mich selbst (Crev): Um Probleme zu vermeiden, sollte man die Teile am besten
// 16 WE über dem Boden platzieren. Das hat sich als optimal rausgestellt.
//
//Just place the vial 16 uu above the ground, and all should be just fine
//=============================================================================
class NewVial expands HealthVial;

#exec mesh import mesh=NewVial anivfile=Models\NewVial_a.3d datafile=Models\NewVial_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
#exec MESH LODPARAMS MESH=NewVial STRENGTH=0.25
#exec mesh origin mesh=NewVial x=0 y=0 z=0
#exec mesh sequence mesh=NewVial seq=All startframe=0 numframes=1

#exec meshmap new meshmap=NewVial mesh=NewVial
#exec meshmap scale meshmap=NewVial x=0.03985 y=0.03985 z=0.07969

#exec AUDIO IMPORT NAME="UT3Vial" FILE=SOUNDS\UT3Vial.wav GROUP="Health"

//Skins import
#exec TEXTURE IMPORT NAME=InvSkin00 FILE=SKINS\New18AStL.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=InvSkin00 FILE=SKINS\New18AStL.pcx GROUP=Skins PALETTE=InvSkin00
#exec MESHMAP SETTEXTURE MESHMAP=NewVial NUM=0 TEXTURE=InvSkin00

#exec TEXTURE IMPORT NAME=NVialSk01 FILE=SKINS\NewVialUBar.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=NVialSk01 FILE=SKINS\NewVialUBar.pcx GROUP=Skins PALETTE=NVialSk01
#exec MESHMAP SETTEXTURE MESHMAP=NewVial NUM=1 TEXTURE=NVialSk01

#exec TEXTURE IMPORT NAME=InvSkin04 FILE=SKINS\PBbas18AL.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=InvSkin04 FILE=SKINS\PBbas18AL.pcx GROUP=Skins PALETTE=InvSkin04
#exec MESHMAP SETTEXTURE MESHMAP=NewVial NUM=2 TEXTURE=InvSkin04

#exec TEXTURE IMPORT NAME=NVialSk03 FILE=SKINS\pbas03HA.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=NVialSk03 FILE=SKINS\pbas03HA.pcx GROUP=Skins PALETTE=NVialSk03
#exec MESHMAP SETTEXTURE MESHMAP=NewVial NUM=3 TEXTURE=NVialSk03

#exec TEXTURE IMPORT NAME=NVialSk04 FILE=SKINS\PBcel08CS.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=NVialSk04 FILE=SKINS\PBcel08CS.pcx GROUP=Skins PALETTE=NVialSk04
#exec MESHMAP SETTEXTURE MESHMAP=NewVial NUM=4 TEXTURE=NVialSk04

#exec TEXTURE IMPORT NAME=NVialSk05 FILE=SKINS\NewVialUCross.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=NVialSk05 FILE=SKINS\NewVialUCross.pcx GROUP=Skins PALETTE=NVialSk05
#exec MESHMAP SETTEXTURE MESHMAP=NewVial NUM=5 TEXTURE=NVialSk05


//---------------------------------------------------------------------------------------------

var() float MinZ,MaxZ;			//minimum/maximum of z-position in relation to placed location.z
var() float WavyFactor;			//how fast does the vial move up/down ?
var() bool bRandomize;  		//if true each wavy movement varies from vial to vial (recommended)
var() float WavyRandFactor;		//who much/fast does each wavy movement vary if bRandomize=true?

//internals
var float changez;
var bool bup;
var vector v;

simulated function PostBeginPlay()
{
local rotator CRot;

	changez=0;	//must be zero to allow +/- value
	v=location; //store location at the beginning of the game as it was placed (in tick, location would always change..))
	SetCollisionSize(15.0, 15.0);

	CRot = Rotation;
	CRot.Yaw = Rand(16384) * 4;
	SetRotation(CRot);
}

simulated function Tick(float t)
{
	if (bup)
	{
		if(brandomize)changez+=(WavyFactor+frand()*wavyrandfactor)*(t/WavyFactor);
		else changez+=(t/WavyFactor);
		if (changez>=maxz)
		{
			changez=maxz;
			bup=false;
		}
	}
	else
	{
		if(brandomize)changez-=(WavyFactor+frand()*wavyrandfactor)*(t/WavyFactor);
		else changez-=(t/WavyFactor);
		if (changez<=minz)
		{
			changez=minz;
			bup=true;
		}
	}
	setlocation(v+vect(0,0,1)*changez);
}

defaultproperties
{
     MinZ=-4.000000
     maxZ=4.000000
     WavyFactor=0.001000
     bRandomize=True
     WavyRandFactor=0.035000
     bRotatingPickup=True
     RespawnTime=27.000000
     PickupViewMesh=LodMesh'MH2_C_V18.NewVial'
     PickupSound=Sound'MH2_C_V18.Health.UT3Vial'
     LODBias=2.000000
     Mesh=LodMesh'MH2_C_V18.NewVial'
     CollisionRadius=12.000000
     CollisionHeight=34.000000
     RotationRate=(Yaw=30000)
}
