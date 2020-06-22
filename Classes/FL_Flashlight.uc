//=============================================================================
// FL_Flashlight.
//=============================================================================
class FL_Flashlight expands TournamentPickup;

var FL_Beam s;

simulated function PostNetBeginPlay()
{
	GotoState('ClientControl');
}

state Activated
{
	function BeginState()
	{
		local Vector HitNormal,HitLocation,StartTrace,EndTrace;

		if ( class'FL_Mutator'.default.bBrightPlayer && (Pawn(Owner).PlayerReplicationInfo.HasFlag == None) )
		Pawn(Owner).AmbientGlow = 128;

		bActive = True;
		Owner.PlaySound(ActivateSound);

		StartTrace = Pawn(Owner).Location + vect(0,0,16);
		EndTrace = StartTrace + 15000*Vector(Pawn(Owner).ViewRotation);
		Trace(HitLocation,HitNormal,EndTrace,StartTrace,True);

		s = Spawn(class'FL_Beam',Owner,,HitLocation+HitNormal*40);

		if ( s != None )
		s.bHideMe = ( (Owner.IsA('PlayerPawn')) && (ViewPort(PlayerPawn(Owner).Player) == None) );
		else
		GoToState('DeActivated');  
	}

	function EndState()
	{
		if ( s != None)
		s.Destroy();

		bActive = False;    
	}

	function Tick(float DeltaTime)
	{
		local Vector HitNormal,HitLocation,StartTrace,EndTrace,ViewVector;
		local Actor Other;

		if ( Pawn(Owner) == None )
		{
			if ( s != None)
			s.Destroy();

			UsedUp();
			return;    
		}

		ViewVector = Vector(Pawn(Owner).ViewRotation);
		StartTrace = Pawn(Owner).Location + vect(0,0,16);
		EndTrace = StartTrace + 15000*ViewVector;
		Other = Pawn(Owner).TraceShot(HitLocation,HitNormal,EndTrace,StartTrace);

		if ( (s != None) && (Other != None) && (!Other.IsA('ShockProj')) && (!Other.IsA('Flare')) && (!Other.IsA('TranslocatorTarget')) )
		s.SetLocation(HitLocation-ViewVector*64);
	}
}

state DeActivated
{
Begin:
	if ( (class'FL_Mutator'.default.bBrightPlayer) && (Pawn(Owner).PlayerReplicationInfo.HasFlag == None) )
	Pawn(Owner).Ambientglow = 0;

	if ( s != None)
	s.Destroy();

	Owner.PlaySound(DeActivateSound);
}

state ClientControl
{
	simulated function Tick(float DeltaTime)
	{
		local Vector HitNormal,HitLocation,StartTrace,EndTrace,ViewVector;
		local Actor Other;

		if ( !bActive )
		{
			if ( s != None )
			s.Destroy();

			s = None;
			return;
		}

		ViewVector = vector(Pawn(Owner).ViewRotation);
		StartTrace = Pawn(Owner).Location + vect(0,0,16);
		EndTrace = StartTrace + 15000*ViewVector;
		Other = Pawn(Owner).TraceShot(HitLocation,HitNormal,EndTrace,StartTrace);

		if ( Other != None )
		{
			if ( s == None )
			s = Spawn(class'FL_Beam',Owner,,HitLocation-ViewVector*64);
			else if ( (!Other.IsA('ShockProj')) && (!Other.IsA('Flare')) && (!Other.IsA('TranslocatorTarget')) )
			s.SetLocation(HitLocation-ViewVector*64);
		}
		else if ( s != None )
		{
			s.Destroy();		
			s = None;
		}
	}
}

simulated function Destroyed()
{
	if ( class'FL_Mutator'.default.bBrightPlayer && (Pawn(Owner).PlayerReplicationInfo.HasFlag == None) )
	Pawn(Owner).AmbientGlow = 0;

	if ( s != None )
	s.Destroy();

	Super.Destroyed();
}

defaultproperties
{
     bActivatable=True
     PickupMessage="You picked up a Flashlight."
     PickupViewMesh=LodMesh'UnrealShare.Flashl'
     PickupSound=Sound'UnrealShare.Pickups.GenPickSnd'
     ActivateSound=Sound'UnrealShare.Pickups.FSHLITE1'
     DeActivateSound=Sound'UnrealShare.Pickups.FSHLITE2'
     Mesh=LodMesh'UnrealShare.Flashl'
     AmbientGlow=96
     CollisionRadius=12.000000
     CollisionHeight=4.000000
     Mass=10.000000
}
