//=============================================================================
// Bird1.
//=============================================================================
class Bird2 extends FlockPawn;

var() name GoalTag;
var	actor GoalActor;
var() float CircleRadius;
var float Angle;
var	vector CircleCenter;
var() bool bCircle;

function PreBeginPlay()
{
	Super.PreBeginPlay();
	CircleCenter = Location;
	if ( GoalTag != '' )
	{
		AirSpeed = 2 * AirSpeed;
		ForEach AllActors(class 'Actor', GoalActor, GoalTag)
			Break;
	}
}

function PlayCall()
{
	if ( FRand() < 0.4 ) 
		PlaySound(sound'call1m',,1 + FRand(),,, 1 + 0.7 * FRand());
	else
		PlaySound(sound'call2b',,1 + FRand(),,, 0.8 + 0.4 * FRand());
}

function PlayHit(float Damage, vector HitLocation, name damageType, vector Momentum)
{
	if ( FRand() < 0.5 )
		TweenAnim('Hit1', 0.1);
	else
		TweenAnim('Hit2', 0.1);
	PlaySound(sound'injur1m',,,,, 1.2);
	AirSpeed = 1.5 * Default.AirSpeed;	
	bCircle = false;
	SetPhysics(PHYS_Falling);
	GotoState('TakeHit');
}

function PlayDeathHit(float Damage, vector HitLocation, name damageType, vector Momentum)
{
	PlaySound(sound'injur1m');
	if ( FRand() < 0.5 )
		TweenAnim('Dead1', 0.2);
	else
		TweenAnim('Dead2', 0.2);	
}


function Died(pawn Killer, name damageType, vector HitLocation)
{
	local Actor A;

	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Self, Killer );
	
	if ( Region.Zone.bDestructive && (Region.Zone.ExitActor != None) )
	{
		Spawn(Region.Zone.ExitActor);
		Destroy();
		return;
	}
	GotoState('Dying');
}

function WhatToDoNext()
{
	if ( bCircle )
		GotoState('Circle');
	else if ( GoalActor != None )
		GotoState('MoveToGoal');
	else
		GotoState('Meander');
}

auto state startup
{
	function Trigger( actor Other, pawn EventInstigator )
	{
		if ( GoalActor != None )
			GotoState('MoveToGoal');
	}

Begin:
	if ( GoalActor == None )
		WhatToDoNext();
}

state TakeHit
{
	ignores seeplayer, enemynotvisible;

Begin:
	FinishAnim();
	Sleep(0.3);
	TweenAnim('Flight', 0.1);
	WhatToDoNext();
}

state meander
{
	ignores seeplayer, enemynotvisible;

	singular function ZoneChange( ZoneInfo NewZone )
	{
		if (NewZone.bWaterZone || NewZone.bPainZone)
		{
			SetLocation(OldLocation);
			Velocity = vect(0,0,0);
			Acceleration = vect(0,0,0);
			MoveTimer = -1.0;
		}
	}
	 		
begin:
	SetPhysics(PHYS_Flying);
wander:
	if ( FRand() < 0.2 )
		PlayCall();
	Destination = CircleCenter + FRand() * CircleRadius * VRand();
	if ( Abs(Destination.Z - CircleCenter.Z) > 200 )
		Destination.Z = CircleCenter.Z; 
	if ( (Destination.Z >= Location.Z) || (FRand() < 0.5) )
		LoopAnim('Flight');
	else
		TweenAnim('Flight', 1.0);
	MoveTo(Destination);
	Goto('Wander');
}

state movetogoal
{
	ignores seeplayer, enemynotvisible;
	
	function HitWall(vector HitNormal, actor Wall)
	{
		GoalActor = None;
		GotoState('Meander');
	}
 		
begin:
	SetPhysics(PHYS_Flying);
wander:
	if ( FRand() < 0.5 )
		PlayCall();
	LoopAnim('Flight', 2.0);
	MoveTo(GoalActor.Location);
	If ( VSize(Location - GoalActor.Location) < 100 )
		Destroy();
	else
		Goto('Wander');
}

state circle
{
	ignores seeplayer, enemynotvisible;

	singular function ZoneChange( ZoneInfo NewZone )
	{
		if (NewZone.bWaterZone || NewZone.bPainZone)
		{
			SetLocation(OldLocation);
			Velocity = vect(0,0,0);
			Acceleration = vect(0,0,0);
			MoveTimer = -1.0;
		}
	}
	 		
begin:
	SetPhysics(PHYS_Flying);
wander:
	if ( FRand() < 0.2 )
	{
		LoopAnim('Flight');
		PlayCall();
	}
	else
		PlayAnim('Flight');
	Angle += 1.0484; //2*3.1415/6;	
	Destination.X = CircleCenter.X - CircleRadius * Sin(Angle);
	Destination.Y = CircleCenter.Y + CircleRadius * Cos(Angle);
	Destination.Z = CircleCenter.Z + 30 * FRand() - 15;
	MoveTo(Destination);
	Goto('Wander');
}

State Dying
{
	ignores seeplayer, enemynotvisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, 
							Vector momentum, name damageType)
	{
		destroy();
	}

	function Landed(vector HitNormal)
	{
		local rotator newRot;

		newRot = Rotation;
		newRot.Pitch = 0;
		newRot.Roll = 0;
		If ( FRand() < 0.5 )
			TweenAnim('Ground1', 0.2);
		else
			TweenAnim('Ground2', 0.2);
		SetRotation(newRot);
		SetPhysics(PHYS_None);
		SetTimer(8.0, True);
	}	

	function Timer()
	{
//		if ( !PlayerCanSeeMe() )
			Destroy();
	}
			
Begin:
	SetPhysics(PHYS_Falling);
	Sleep(10);
	Timer();
}			

defaultproperties
{
     CircleRadius=300.000000
     AirSpeed=300.000000
     AccelRate=400.000000
     SightRadius=1000.000000
     Health=27
     Land=None
     DrawType=DT_Mesh
     Mesh=LodMesh'UnrealShare.Bird'
     DrawScale=0.800000
     bUnlit=True
     CollisionRadius=20.000000
     CollisionHeight=4.000000
     RotationRate=(Pitch=12000,Yaw=20000,Roll=12000)
     NetPriority=1.000000
     NetUpdateFrequency=50.000000
}
