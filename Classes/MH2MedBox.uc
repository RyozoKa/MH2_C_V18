class MH2MedBox expands MedBox;

#Exec OBJ LOAD FILE=..\Textures\Coret_FX.utx
var int HealMax;

#exec AUDIO IMPORT NAME="HealthPackSFX" FILE=SOUNDS\HealthPackSFX.wav GROUP="Health"
#exec AUDIO IMPORT NAME="InvisibiltyRespawn" FILE=SOUNDS\InvisibiltyRespawn.wav
#exec mesh import mesh=UT2HealthPack anivfile=Models\UT2HealthPack_a.3d datafile=Models\UT2HealthPack_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
#exec MESH LODPARAMS MESH=UT2HealthPack STRENGTH=0
#exec mesh origin mesh=UT2HealthPack x=0 y=0 z=0
#exec mesh sequence mesh=UT2HealthPack seq=All startframe=0 numframes=1

#exec meshmap new meshmap=UT2HealthPack mesh=UT2HealthPack
#exec meshmap scale meshmap=UT2HealthPack x=0.07500 y=0.07500 z=0.15000


auto state Pickup
{	
	function Touch( actor Other )
	{
		
		local Pawn P;
			
		if ( ValidTouch(Other) ) 
		{	
			P = Pawn(Other);
			//if(MonsterBasePlus(Level.Game.BaseMutator) != none)
			//HealMax = MonsterBasePlus(Level.Game.BaseMutator).MaxHealth;
			//else HealMax = 200;
			if (P.Health < HealMax) 
			{

				P.Health += HealingAmount;
				if (P.Health > HealMax) P.Health = HealMax;
				PlayPickupMessage(P);
				PlaySound (Sound'HealthPackSFX',,2.5);
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
	PlaySound( RespawnSound );	
	Sleep( Level.Game.PlaySpawnEffect(self) );
	GoToState( 'Pickup' );
}

defaultproperties
{
     HealingAmount=50
     bSuperHeal=True
     bRotatingPickup=True
     PickupMessage="You picked up a crystallized MH2 Health"
     ItemName="MH2 Health Pack"
     PickupViewMesh=LodMesh'MH2_C_V18.UT2HealthPack'
     RespawnSound=Sound'MH2_C_V18.InvisibiltyRespawn'
     Mesh=LodMesh'MH2_C_V18.UT2HealthPack'
     bGameRelevant=True
     MultiSkins(0)=Texture'MH2_C_Anims.Sec_One_a00'
     MultiSkins(1)=Texture'Coret_FX.Glass.SpecGlas'
     CollisionRadius=19.200001
     CollisionHeight=19.200001
     RotationRate=(Yaw=15000)
}
