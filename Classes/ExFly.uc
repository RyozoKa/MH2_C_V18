//=============================================================================
// ExFly.
// In fact is a smaller one. If you don't destroy a dead creature will
// spawn some small flies hunting you as well
//=============================================================================
class ExFly extends ScriptedPawn;
//-----------------------------------------------------------------------------
// ExFly variables.
//-----------------------------------------------------------------------------
// ExFly functions.

function PreSetMovement()
{
	bCanJump = true;
	bCanWalk = true;
	bCanSwim = false;
	bCanFly = true;
	MinHitWall = -0.6;
	bCanOpenDoors = false;
	bCanDoSpecial = false;
}

function ZoneChange(ZoneInfo newZone)
{
	local vector jumpDir;

	if ( newZone.bWaterZone )
	{
		MoveTimer = -1.0;
		if ( (Enemy != None) && (Enemy.Location.Z < Location.Z) )
			GotoState('TacticalMove', 'BackOff');
		else
			Acceleration = Accelrate * vect(0,0,1);
	}

}

function SetMovementPhysics()
{
	if (Enemy != None)
		SetPhysics(PHYS_Flying); 
	else if (Physics != PHYS_Falling)
		SetPhysics(PHYS_Walking);
}

singular function Falling()
{
	SetPhysics(PHYS_Flying);
	if (bIsPlayer)
	{
		PlayInAir();
		return;
	}
		
	if (health > 0)
		SetFall();
}

function PlayWaiting()
{
	if ( Physics == PHYS_Walking )
		TweenAnim('Waiting', 10.0);
	else
		LoopAnim('Flying', 0.75);
}

function PlayPatrolStop()
{
	PlayWaiting();
}

function PlayWaitingAmbush()
{
	PlayWaiting();
}

function PlayChallenge()
{
	PlayAnim('Shoot1', 1.0, 0.1);
}

function TweenToFighter(float tweentime)
{
	TweenAnim('Flying', tweentime);
}

function TweenToRunning(float tweentime)
{
	if ( (AnimSequence != 'Flying') || !bAnimLoop )
		TweenAnim('Flying', tweentime);
}

function TweenToWalking(float tweentime)
{
	if (Physics == PHYS_Walking)
		TweenAnim('Walking', tweentime);
	else if ( (AnimSequence != 'Flying') || !bAnimLoop )
		TweenAnim('Flying', tweentime);
}

function TweenToWaiting(float tweentime)
{
	PlayAnim('Land', 0.2 + 0.5 * FRand());
	SetPhysics(PHYS_Falling);
}

function TweenToPatrolStop(float tweentime)
{
	TweenAnim('Flying', tweentime);
}

function PlayRunning()
{
	LoopAnim('Flying');
}

function PlayWalking()
{
	if (Physics == PHYS_Walking)
		LoopAnim('Walking', -1.0/GroundSpeed,, 0.4);
	else
		LoopAnim('Flying');
}

function PlayThreatening()
{
	if ( FRand() < 0.8 )
		LoopAnim('Flying');
	else
		LoopAnim('Shoot1', 0.4);
}

function PlayTurning()
{
	if (Physics == PHYS_Walking)
		LoopAnim('Walking');
	else
		LoopAnim('Flying');
}

function PlayDying(name DamageType, vector HitLocation)
{
	PlaySound(Die, SLOT_Talk, 3.5 * TransientSoundVolume);
	PlayAnim('Dead', 0.7, 0.1);
}

function PlayTakeHit(float tweentime, vector HitLoc, int damage)
{
	TweenAnim('TakeHit', tweentime);
}

function TweenToFalling()
{
	TweenAnim('Flying', 0.2);
}

function PlayInAir()
{
	LoopAnim('Flying');
}

function PlayLanded(float impactVel)
{
	PlayAnim('Land');
}

function PlayVictoryDance()
{
	if ( FRand() < 0.4 )
		TweenToWaiting(0.25);
	else
		PlayAnim('Flying',1.0, 0.05);
}
	
function PlayMeleeAttack()
{
	PlayAnim('Shoot1');
	if ( MeleeDamageTarget(15, (15 * 1000.0 * Normal(Target.Location - Location))) )
		PlaySound(Threaten, SLOT_Talk); //FIXME - stingdamage instead of projectile
	GotoState('TacticalMove', 'BackOff');
}

function PlayRangedAttack()
{
	local vector projStart;
	local vector adjust;

	PlayAnim('Shoot1');
	/*
	adjust = vect(0,0,0);
	adjust.Z = Target.CollisionHeight + 20;
	Acceleration = AccelRate * Normal(Target.Location - Location + adjust);
	projStart = Location - 0.5 * CollisionHeight * vect(0,0,1);
	spawn(RangedProjectile ,self,'',projStart,AdjustAim(ProjectileSpeed, projStart, 400, false, false));
	*/
}

function PlayMovingAttack()
{
	PlayRangedAttack();
}

state TacticalMove
{
ignores SeePlayer, HearNoise;

BackOff:
	if(Enemy != none)
	{
		Acceleration = AccelRate * Normal(Location - Enemy.Location);
		Acceleration.Z *= 0.5;
		Destination = Location;
		Sleep(0.5);
		SetTimer(TimeBetweenAttacks, false);
		Goto('TacticalTick');
	}
}

state Roaming
{
	function PickDestination()
	{
		GotoState('Wandering');
	}

Begin:
	GotoState('Wandering');
}

defaultproperties
{
     CarcassType=Class'MH2_C_V18.ExFlyCarcass'
     Aggressiveness=0.700000
     RefireRate=0.700000
     WalkingSpeed=5.000000
     bCanStrafe=True
     MeleeRange=30.000000
     GroundSpeed=100.000000
     AirSpeed=150.000000
     AccelRate=300.000000
     JumpZ=10.000000
     Visibility=100
     SightRadius=2000.000000
     PeripheralVision=-1.500000
     Health=10
     HitSound1=Sound'UnrealShare.Razorfly.injur1rf'
     HitSound2=Sound'UnrealShare.Razorfly.injur2rf'
     Land=None
     Die=Sound'UnrealShare.Razorfly.death1rf'
     CombatStyle=0.400000
     MenuName="CorpseFly"
     AmbientSound=Sound'UnrealShare.flies.flybuzz'
     DrawType=DT_Mesh
     Mesh=LodMesh'UnrealShare.FlyM'
     DrawScale=0.700000
     SoundRadius=40
     SoundVolume=245
     TransientSoundVolume=6.000000
     CollisionRadius=24.000000
     CollisionHeight=18.000000
     Buoyancy=110.000000
     RotationRate=(Pitch=6000,Yaw=65000,Roll=8192)
}
