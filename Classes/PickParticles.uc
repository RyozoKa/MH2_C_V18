//=============================================================================
// PickParticles.
//=============================================================================
class PickParticles expands Effects;

//-----------------------------------------------------------------------------
//Default Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=DefaultParticle ANIVFILE=MODELS\DefaultParticle_a.3d DATAFILE=MODELS\DefaultParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=DefaultParticle STRENGTH=0.25
#exec MESH ORIGIN MESH=DefaultParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=DefaultParticle SEQ=All STARTFRAME=0 NUMFRAMES=6
#exec MESH SEQUENCE MESH=DefaultParticle SEQ=Anim STARTFRAME=0 NUMFRAMES=6 RATE=1.0

#exec MESHMAP NEW MESHMAP=DefaultParticle MESH=DefaultParticle
#exec MESHMAP SCALE MESHMAP=DefaultParticle X=0.5 Y=0.5 Z=1.0

//-----------------------------------------------------------------------------
//Cylindric Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=CylindricParticle ANIVFILE=MODELS\CylindricParticle_a.3d DATAFILE=MODELS\CylindricParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CylindricParticle STRENGTH=0
#exec MESH ORIGIN MESH=CylindricParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CylindricParticle SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=CylindricParticle SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=CylindricParticle MESH=CylindricParticle
#exec MESHMAP SCALE MESHMAP=CylindricParticle X=0.2 Y=0.2 Z=0.4

//-----------------------------------------------------------------------------
//Cylindric Particles Import 2
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=CylindricParticleB ANIVFILE=MODELS\CylindricParticleB_a.3d DATAFILE=MODELS\CylindricParticleB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CylindricParticleB STRENGTH=0
#exec MESH ORIGIN MESH=CylindricParticleB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CylindricParticleB SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=CylindricParticleB SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=CylindricParticleB MESH=CylindricParticleB
#exec MESHMAP SCALE MESHMAP=CylindricParticleB X=0.2 Y=0.2 Z=0.4

//-----------------------------------------------------------------------------
//Cubic Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=CubeParticle ANIVFILE=MODELS\CubeParticle_a.3d DATAFILE=MODELS\CubeParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CubeParticle STRENGTH=0
#exec MESH ORIGIN MESH=CubeParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CubeParticle SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=CubeParticle SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=CubeParticle MESH=CubeParticle
#exec MESHMAP SCALE MESHMAP=CubeParticle X=0.2 Y=0.2 Z=0.4

//-----------------------------------------------------------------------------
//Cubic Particles Import 2
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=CubeParticleB ANIVFILE=MODELS\CubeParticleB_a.3d DATAFILE=MODELS\CubeParticleB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CubeParticleB STRENGTH=0
#exec MESH ORIGIN MESH=CubeParticleB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CubeParticleB SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=CubeParticleB SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=CubeParticleB MESH=CubeParticleB
#exec MESHMAP SCALE MESHMAP=CubeParticleB X=0.2 Y=0.2 Z=0.4

//-----------------------------------------------------------------------------
//Sphere Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=SphereParticle ANIVFILE=MODELS\SphereParticle_a.3d DATAFILE=MODELS\SphereParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SphereParticle STRENGTH=0
#exec MESH ORIGIN MESH=SphereParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SphereParticle SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=SphereParticle SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=SphereParticle MESH=SphereParticle
#exec MESHMAP SCALE MESHMAP=SphereParticle X=0.2 Y=0.2 Z=0.4

//-----------------------------------------------------------------------------
//Whirl Plane Out Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=WhirlOutParticle ANIVFILE=MODELS\WhirlOutParticle_a.3d DATAFILE=MODELS\WhirlOutParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WhirlOutParticle STRENGTH=0
#exec MESH ORIGIN MESH=WhirlOutParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WhirlOutParticle SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=WhirlOutParticle SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=WhirlOutParticle MESH=WhirlOutParticle
#exec MESHMAP SCALE MESHMAP=WhirlOutParticle X=0.1 Y=0.1 Z=0.05

//-----------------------------------------------------------------------------
//Whirl Plane In Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=WhirlInParticle ANIVFILE=MODELS\WhirlInParticle_a.3d DATAFILE=MODELS\WhirlInParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WhirlInParticle STRENGTH=0
#exec MESH ORIGIN MESH=WhirlInParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WhirlInParticle SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=WhirlInParticle SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=WhirlInParticle MESH=WhirlInParticle
#exec MESHMAP SCALE MESHMAP=WhirlInParticle X=0.1 Y=0.1 Z=0.05

//-----------------------------------------------------------------------------
//Whirl Hole Out Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=WhirlOutParticleH ANIVFILE=MODELS\WhirlOutParticle_a.3d DATAFILE=MODELS\WhirlOutParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WhirlOutParticleH STRENGTH=0
#exec MESH ORIGIN MESH=WhirlOutParticleH X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WhirlOutParticleH SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=WhirlOutParticleH SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=WhirlOutParticleH MESH=WhirlOutParticleH
#exec MESHMAP SCALE MESHMAP=WhirlOutParticleH X=0.1 Y=0.1 Z=0.2

//-----------------------------------------------------------------------------
//Whirl Hole In Particles Import
//-----------------------------------------------------------------------------
#exec MESH IMPORT MESH=WhirlInParticleH ANIVFILE=MODELS\WhirlInParticle_a.3d DATAFILE=MODELS\WhirlInParticle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WhirlInParticleH STRENGTH=0
#exec MESH ORIGIN MESH=WhirlInParticleH X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WhirlInParticleH SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=WhirlInParticleH SEQ=Anim STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=WhirlInParticleH MESH=WhirlInParticleH
#exec MESHMAP SCALE MESHMAP=WhirlInParticleH X=0.1 Y=0.1 Z=0.2





//----------------------------------------------------------------------------

var float Rate;
var byte ParticleType;
var mesh ParticleMesh[11];

//Custom vertex mesh side
var mesh VertexMesh;
var name VertexAnim;
var bool bSpecialLoop;

var byte OtherSoundVolume;
var bool bVSet;


function PostBeginPlay()
{
		SetTimer(0.1, False);
}

function Timer()
{
	if (!bVSet)
	{
		OtherSoundVolume = SoundVolume;
		bVSet = True;
	}

	if (bHidden)
		SoundVolume = 0;
	else
		SoundVolume = OtherSoundVolume;

	ParticleMesh[10] = VertexMesh;

	Mesh = ParticleMesh[ParticleType];

	If (Rate <=0)
		Rate = 1.0;

	If (ParticleType != 10)
	{
		If (ParticleType != 0)
			PlayAnim('Anim', Rate, 0.0);
		else
			LoopAnim('Anim', Rate, 1/Rate);
	}
	else
	{
		If (bSpecialLoop && VertexAnim != '')
			PlayAnim(VertexAnim, Rate, 0.0);
		else if(VertexAnim != '')
			LoopAnim(VertexAnim, Rate, 1/Rate);
	}

}

function AnimEnd()
{
	If (ParticleType != 0 && ParticleType != 10)
		PlayAnim('Anim', Rate, 0.0);

	If (ParticleType == 10)
		PlayAnim(VertexAnim, Rate, 0.0);
}

defaultproperties
{
     ParticleMesh(0)=LodMesh'MH2_C_V18.DefaultParticle'
     ParticleMesh(1)=LodMesh'MH2_C_V18.CylindricParticle'
     ParticleMesh(2)=LodMesh'MH2_C_V18.CylindricParticleB'
     ParticleMesh(3)=LodMesh'MH2_C_V18.CubeParticle'
     ParticleMesh(4)=LodMesh'MH2_C_V18.CubeParticleB'
     ParticleMesh(5)=LodMesh'MH2_C_V18.SphereParticle'
     ParticleMesh(6)=LodMesh'MH2_C_V18.WhirlOutParticle'
     ParticleMesh(7)=LodMesh'MH2_C_V18.WhirlInParticle'
     ParticleMesh(8)=LodMesh'MH2_C_V18.WhirlOutParticleH'
     ParticleMesh(9)=LodMesh'MH2_C_V18.WhirlInParticleH'
     bNetTemporary=False
     DrawType=DT_Mesh
     Style=STY_Translucent
     Texture=None
     Mesh=LodMesh'MH2_C_V18.DefaultParticle'
     DrawScale=0.200000
     ScaleGlow=3.000000
     bUnlit=True
     bParticles=True
     bFixedRotationDir=True
}
