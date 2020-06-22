// ============================================================
//Ported from OldSkool and 
//adapted to this game
//Nelsona: Thanks a lot but need tuning for MH
// ============================================================

class ExBloodSpurt expands BloodSpurt;
Auto State StartUp
{
	simulated function Tick(float DeltaTime)
	{
	local vector WallHit, WallNormal;
	local Actor WallActor;

		if ( Level.NetMode != NM_DedicatedServer )
		{
		WallActor = Trace(WallHit, WallNormal, Location + 300 * vector(Rotation), Location, false);
		if ( WallActor != None )
			{
			if (Texture == texture'BloodSGrn')
				spawn(class'GreenBloodSplat',,,WallHit + 20 * (WallNormal + VRand()), rotator(WallNormal));
			else
				spawn(class'olBloodSplat',,,WallHit + 20 * (WallNormal + VRand()), rotator(WallNormal));
			}
		}
	Disable('Tick');
	}

}

simulated function PreBeginPlay()    //gore stuff for client
	{
	if( Class'GameInfo'.Default.bVeryLowGore )
		GreenBlood();
	}

defaultproperties
{
}
