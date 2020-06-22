//=============================================================================
// Vial.
//=============================================================================
class MH2HealthVial extends HealthVial;

#exec MESH IMPORT MESH=Vial2 ANIVFILE=MODELS\MiniHealthPack_a.3d DATAFILE=MODELS\MiniHealthPack_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=Vial2
#exec MESH ORIGIN MESH=Vial2 X=0 Y=0 Z=0 ROLL=128
#exec MESH SEQUENCE MESH=Vial2 SEQ=All  STARTFRAME=0 NUMFRAMES=1
//#exec TEXTURE IMPORT NAME=JVial0 FILE=MODELS\vial.PCX GROUP=Skins LODSET=2
#exec OBJ LOAD FILE=..\Textures\MH2_C_Anims.utx
#exec MESHMAP NEW   MESHMAP=Vial2 MESH=Vial2
#exec MESHMAP SCALE MESHMAP=Vial2 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=Vial2 NUM=1 TEXTURE=Sec_One_a00
#exec MESHMAP SETTEXTURE MESHMAP=Vial2 NUM=2 TEXTURE=MHPickup
//#exec MESHMAP SETTEXTURE MESHMAP=Vial2 NUM=2 TEXTURE=Botpack.ShaneFx.Top


var int HealMax;

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
		if(MH2Base(Owner) != none)
			MH2Base(Owner).pp.Destroy();
	}			
Begin:
	Sleep( ReSpawnTime );
	PlaySound( Sound'MH2_C_Pickups.InvisibiltyRespawn', SLOT_Ambient, 16 );	
	Sleep( Level.Game.PlaySpawnEffect(self) );
	GoToState( 'Pickup' );
}

auto state Pickup
{	
	function Touch( actor Other )
	{
		local Pawn P;
			
		if ( ValidTouch(Other) ) 
		{	
			P = Pawn(Other);	
			if (bSuperHeal) HealMax = Min(199, HealMax * 2.0);
			if (P.Health < HealMax) 
			{
				if (Level.Game.LocalLog != None)
					Level.Game.LocalLog.LogPickup(Self, P);
				if (Level.Game.WorldLog != None)
					Level.Game.WorldLog.LogPickup(Self, P);
				P.Health += HealingAmount;
				if (P.Health > HealMax) P.Health = HealMax;
				PlayPickupMessage(P);
				PlaySound (PickupSound,,2.5);
				Other.MakeNoise(0.2);		
				SetRespawn();
			}
		}
	}
}

defaultproperties
{
     HealingAmount=10
     PickupViewMesh=LodMesh'MH2_C_V18.Vial2'
     Mesh=LodMesh'MH2_C_V18.Vial2'
     DrawScale=15.000000
     CollisionHeight=25.000000
}
