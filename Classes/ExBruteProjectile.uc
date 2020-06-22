//=============================================================================
// BruteProjectile, a stupid class resolved by Nelsona in a new formula
// I think they left errors for a faster processing :P, since they didn't used some checks
// Fixing accesed nones
// As we know, some guys love drinking, but I sent their crap in WC, :P
//=============================================================================
class ExBruteProjectile extends Projectile;

var float TimerDelay;

auto state Flying
{
	simulated function Timer()
	{
		local SpriteSmokePuff bs;
			
		if (Level.NetMode!=NM_DedicatedServer) 
		{
			bs = Spawn(class'SpriteSmokePuff');
			bs.RemoteRole = ROLE_None;		
		}
		SetTimer(TimerDelay,True);			
		TimerDelay += 0.01;
	}

	simulated function ProcessTouch (Actor Other, Vector HitLocation)
	{
		if (Other != instigator)
			Explode(HitLocation,Vect(0,0,0));
	}
	
	function BlowUp(vector HitLocation)
	{
		if (instigator != None) //IF Pawn is alive we have THIS, dumbass ! He has skill because is alive.
			HurtRadius(damage, 50 + instigator.skill * 45, 'exploded', MomentumTransfer, HitLocation);
		else				//IF Pawn was killed before to explode we have this (not exist skill any more)... DONE with craps in my server.
			HurtRadius(damage, 50, 'exploded', MomentumTransfer, HitLocation);
		MakeNoise(1.0);
		PlaySound(ImpactSound);
	}

	simulated function Explode(vector HitLocation, vector HitNormal)
	{
		local SpriteBallExplosion s;

		BlowUp(HitLocation);
		s = spawn(class 'SpriteBallExplosion',,'',HitLocation+HitNormal*10 );
		s.RemoteRole = ROLE_None;
		Destroy();
	}

	simulated function AnimEnd()
	{
		LoopAnim('Flying');
		Disable('AnimEnd');
	}

	function SetUp()
	{
		PlaySound(SpawnSound);
		Velocity = Vector(Rotation) * speed;
		if ( ScriptedPawn(Instigator) != None )
		{
			Speed = ScriptedPawn(Instigator).ProjectileSpeed;
			if ( Instigator.IsA('LesserBrute') )
				Damage *= 0.7;
		}
	}

	simulated function BeginState()
	{
		if ( Level.NetMode != NM_DedicatedServer )
		{
			PlayAnim('Ignite',0.5);
			if (Level.bHighDetailMode) TimerDelay = 0.03;
			else TimerDelay = 5.0;;
			Timer();
		}
		SetUp();
	}

Begin:
	Sleep(7.0); //self destruct after 7.0 seconds - Wow, and you declared LifeSpan 8, stupid.
	Explode(Location,vect(0,0,0));
}

defaultproperties
{
     speed=700.000000
     MaxSpeed=900.000000
     Damage=30.000000
     MomentumTransfer=50000
     SpawnSound=Sound'UnrealShare.Eightball.Ignite'
     ImpactSound=Sound'UnrealShare.flak.Explode1'
     ExplosionDecal=Class'olweapons.ODBlastMark'
     RemoteRole=ROLE_SimulatedProxy
     AmbientSound=Sound'UnrealShare.General.BRocket'
     Texture=None
     Mesh=LodMesh'UnrealShare.srocket'
     DrawScale=0.120000
     AmbientGlow=9
     bUnlit=True
     SoundRadius=15
     SoundVolume=255
     SoundPitch=73
     LightType=LT_Steady
     LightBrightness=154
     LightHue=24
     LightSaturation=207
     LightRadius=2
}
