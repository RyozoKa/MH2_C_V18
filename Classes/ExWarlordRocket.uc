//=============================================================================
// WarlordRocket. Nelsona: No no no - I want smoke and I want a better view starting from now on
// Other question: WHY Default WarlordRocket has DUMBProxy, Losers ? What the hell is your problem anyway ?
// Dumb coders worked at Epic ? I want there too :P
//=============================================================================
class ExWarlordRocket extends Projectile;

var float TimerDelay;

auto state Flying
{
	simulated function Timer()
	{
		local SpriteSmokePuff bs;
			
		if (Level.NetMode != NM_DedicatedServer) 
		{
			bs = Spawn(class'SpriteSmokePuff');
			bs.RemoteRole = ROLE_Authority;	//Causes assertion failed!!!! 	
		}
		SetTimer(TimerDelay,True);			
		TimerDelay += 0.01;
	}
//La, la, la, losers, I can see this better :P
	simulated function ProcessTouch (Actor Other, Vector HitLocation)
	{
		if (Other != instigator)
			Explode(HitLocation,Vect(0,0,0));
	}
	
	function BlowUp(vector HitLocation)
	{
		if (instigator != None)
			HurtRadius(damage, 50 + instigator.skill * 45, 'exploded', MomentumTransfer, HitLocation);
		else
			HurtRadius(damage, 50, 'exploded', MomentumTransfer, HitLocation);
		MakeNoise(1.0);
		PlaySound(ImpactSound);
	}

	simulated function Explode(vector HitLocation, vector HitNormal)
	{
		local SpriteBallExplosion s;

		BlowUp(HitLocation);
		s = spawn(class 'SpriteBallExplosion',,'',HitLocation+HitNormal*10 );
		s.RemoteRole = ROLE_Authority;
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
			else TimerDelay = 3.0;
			Timer();
		}
		SetUp();
	}

Begin:
	Sleep(7.0); //self destruct after 7.0 seconds
	Explode(Location,vect(0,0,0));
}

defaultproperties
{
     speed=800.000000
     MaxSpeed=950.000000
     Damage=150.000000
     MomentumTransfer=50000
     ExplosionDecal=Class'Botpack.BlastMark'
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     AmbientSound=Sound'UnrealI.General.BRocket'
     Mesh=LodMesh'UnrealI.perock'
     DrawScale=2.500000
     AmbientGlow=9
     bUnlit=True
     SoundRadius=20
     SoundVolume=255
     SoundPitch=73
     LightType=LT_Steady
     LightBrightness=154
     LightHue=24
     LightSaturation=207
     LightRadius=2
     bBounce=True
}
