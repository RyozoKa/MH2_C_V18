class MH2HealthPack expands HealthPack;
var int HealMax;

///////////////// PICK UPS /////////////////////
#exec TEXTURE IMPORT NAME=SuperKeg File=Textures\superkeg512.pcx Group=Skins Lodset=2
#exec TEXTURE IMPORT NAME=GrandPanner File=Textures\GrandPanner.pcx Group=Skins Lodset=2
// BigKeg
#exec MESH  MODELIMPORT MESH=SuperKeg MODELFILE=Models\UT2BigKegM.PSK
#exec MESH  ORIGIN MESH=SuperKeg X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0
#exec ANIM  IMPORT ANIM=UT2PickUpAnim ANIMFILE=Models\UT2PickUpAnim.PSA
#exec MESHMAP   SCALE MESHMAP=SuperKeg X=0.5 Y=0.5 Z=0.5
#exec MESH  DEFAULTANIM MESH=SuperKeg ANIM=UT2PickUpAnim
#EXEC ANIM  SEQUENCE ANIM=UT2PickUpAnim SEQ=Still    STARTFRAME=0 NUMFRAMES=1
#EXEC ANIM  SEQUENCE ANIM=UT2PickUpAnim SEQ=Rotate   STARTFRAME=1 NUMFRAMES=8 RATE=8
#EXEC ANIM  SEQUENCE ANIM=UT2PickUpAnim SEQ=Full     STARTFRAME=9 NUMFRAMES=8 RATE=8
#EXEC ANIM  SEQUENCE ANIM=UT2PickUpAnim SEQ=DownUp   STARTFRAME=17 NUMFRAMES=4 RATE=4
#EXEC ANIM  SEQUENCE ANIM=UT2PickUpAnim SEQ=UpDown   STARTFRAME=21 NUMFRAMES=4 RATE=4
#exec ANIM DIGEST  ANIM=UT2PickUpAnim VERBOSE
#exec TEXTURE IMPORT NAME=SuperkegSkin FILE=Textures\SuperkegSkin.pcx GROUP=Skins FLAGS=2
#EXEC MESHMAP SETTEXTURE MESHMAP=SuperKeg NUM=0 TEXTURE=SuperkegSkin
#EXEC MESHMAP SETTEXTURE MESHMAP=SuperKeg NUM=1 TEXTURE=GrandPanner

//Model Import
//#exec mesh import mesh=SuperKeg anivfile=Models\SuperKeg_a.3d datafile=Models\SuperKeg_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
//#exec MESH LODPARAMS MESH=SuperKeg STRENGTH=0
//#exec mesh origin mesh=SuperKeg x=0 y=0 z=0 YAW=0 PITCH=0 ROLL=64
//#exec mesh sequence mesh=SuperKeg seq=All startframe=0 numframes=1
//#exec meshmap new meshmap=SuperKeg mesh=SuperKeg

//#exec TEXTURE IMPORT NAME=SuperkegSkin FILE=Textures\SuperkegSkin.pcx GROUP=Skins
//#exec meshmap scale meshmap=SuperKeg x=0.08210 y=0.08210 z=0.16420
//#exec MESHMAP SETTEXTURE MESHMAP=SuperKeg NUM=1 TEXTURE=SuperkegSkin
#exec AUDIO IMPORT NAME="SuperHealth" FILE=SOUNDS\SuperHealth.wav GROUP="Health"
auto state Pickup
{	
	function Touch( actor Other )
	{
		local Pawn P;
			
		if ( ValidTouch(Other) ) 
		{	
			P = Pawn(Other);
			if (P.Health < HealMax) 
			{

				P.Health += HealingAmount;
				if (P.Health > HealMax) P.Health = HealMax;
				PlayPickupMessage(P);
				PlaySound (Sound'MH2_C_Pickups.Health.SuperHealth',,2.5);
				Other.MakeNoise(0.2);		
				SetRespawn();
			}
		}
	}
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
     HealingAmount=300
     bRotatingPickup=True
     PickupMessage="You picked up a crystallized Keg O' Health "
     ItemName="MH2 Keg Pack "
     RespawnTime=54.000000
     PickupViewMesh=SkeletalMesh'MH2_C_V18.SuperKeg'
     Texture=None
     Mesh=SkeletalMesh'MH2_C_V18.SuperKeg'
     DrawScale=0.100000
     bGameRelevant=True
     CollisionRadius=16.000000
     CollisionHeight=16.000000
     RotationRate=(Yaw=15000)
}
