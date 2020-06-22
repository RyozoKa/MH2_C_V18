class ExCreatureCarcass extends CreatureCarcass;

var class<creaturecarcass> realcarcass;
var Decal Pool; //blood pool
var config bool PermaCarcass; //carcass does not auto-destruct?
var int swarmsize;
//permacarcass: LOL, are you kidding right, how many actors we need to crash server ?
function PostBeginPlay()
{
	if ( !bDecorative &&!PermaCarcass)
	{
		DeathZone = Region.Zone;
		if (DeathZone != None)
			DeathZone.NumCarcasses++;
	}
	Super(Carcass).PostBeginPlay();
	if ( Physics == PHYS_None )
		SetCollision(bCollideActors, false, false);
}

//DEFAULTED CHECKS:
//realcarcass check
function Initfor(actor Other)
{
	local rotator carcRotation;
	local int i;
	if (Other == None)
	{
		Destroy();
		return;
	}
	if ( bDecorative)
	{
		DeathZone = Region.Zone;
		if (DeathZone != None)
			DeathZone.NumCarcasses++;
	}
	bDecorative = false;
	bMeshCurvy = Other.bMeshCurvy;	
	bMeshEnviroMap = Other.bMeshEnviroMap;	
	for (i=0;i<8;i++) //NEED THIS!
		multiskins[i]=other.multiskins[i];
	Mesh = Other.Mesh;
	Skin = Other.Skin;
	if (skin!=none)
		skin.lodset=lodset_skin;
	Texture = Other.Texture;
	if (texture!=none)
		texture.lodset=lodset_skin;
	Fatness = Other.Fatness;
	DrawScale = Other.DrawScale;
	SetCollisionSize(Other.CollisionRadius + 4, Other.CollisionHeight);
	if ( !SetLocation(Location) )
		SetCollisionSize(CollisionRadius - 4, CollisionHeight);
	if (scriptedpawn(other) != None)
		realcarcass=class<creaturecarcass>(scriptedpawn(other).default.carcasstype); //use default!
	if (realcarcass != None)
	{
		bgreenblood=realcarcass.default.bgreenblood; //copy.
		bPermanent=realcarcass.default.bPermanent;
		lifespan=realcarcass.default.lifespan;
	}
	DesiredRotation = other.Rotation;
	DesiredRotation.Roll = 0;
	DesiredRotation.Pitch = 0;
	AnimSequence = Other.AnimSequence;
	AnimFrame = Other.AnimFrame;
	AnimRate = Other.AnimRate;
	TweenRate = Other.TweenRate;
	AnimMinRate = Other.AnimMinRate;
	AnimLast = Other.AnimLast;
	bAnimLoop = Other.bAnimLoop;
	SimAnim.X = 10000 * AnimFrame;
	SimAnim.Y = 5000 * AnimRate;
	SimAnim.Z = 1000 * TweenRate;
	SimAnim.W = 10000 * AnimLast;
	bAnimFinished = Other.bAnimFinished;
	Velocity = other.Velocity;
	Mass = Other.Mass;
	if ( Buoyancy < 0.8 * Mass )
		Buoyancy = 0.9 * Mass;
	if ( AnimSequence == 'LeglessDeath' ) 	//krall
		SetCollision(true, false, false);
}
/*
simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, 
							Vector Momentum, name DamageType)
{
	local ExBloodSpurt b;

	b = Spawn(class'ExBloodSpurt',,,HitLocation,rot(16384,0,0));
	if ( bGreenBlood )
		b.GreenBlood();
	b.RemoteRole = ROLE_None;
	if ( !bPermanent )
	{
		if ( (DamageType == 'Corroded') && (Damage >= 20) )
		{
			bCorroding = true;
			GotoState('Corroding');
		}
		else
			Super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
		}
	}
*/
simulated function tick(float delta)
{
	if (realcarcass==class'KrallCarcass'&&AnimSequence!='LegLessDeath') //fix up stupid krall col-height bug
		 bReducedHeight = false; //fix this!
	Disable('tick');
}

simulated function CreateReplacement()
{
	local ExCreatureChunks carc;
	
	if (bHidden || realcarcass == None)
		return;
	 if (realcarcass==class'NaliCarcass'||realcarcass==class'SkaarjCarcass'||realcarcass==class'TrooperCarcass')
		carc = Spawn(class 'ExCreatureChunks');
	else if (realcarcass.default.bodyparts[0] != None )
		 carc = Spawn(class 'ExCreatureChunks',,, Location + realcarcass.default.ZOffset[0] * CollisionHeight * vect(0,0,1));
	if (carc != None)
	{
		if (realcarcass!=class'NaliCarcass'&&realcarcass!=class'SkaarjCarcass'&&realcarcass!=class'TrooperCarcass')
		{
			carc.TrailSize = realcarcass.default.Trails[0];
			carc.Mesh = realcarcass.default.bodyparts[0];
		}
		carc.bMasterChunk = true;
		carc.CarcassClass=realcarcass; //set my static to this.
		carc.Initfor(self);
		carc.Bugs = Bugs;
		if ( Bugs != None )
			Bugs.SetBase(carc);
		Bugs = None;
	}
/*	else if ( Bugs != None )
		Bugs.Destroy();
*/
}
function GibSound() 	 //statics.
{
	local float decision;

	decision = FRand();
	if (decision < 0.2 && realcarcass != None)
		PlaySound(realcarcass.default.GibOne, SLOT_Interact, 0.18 * Mass);
	else if ( decision < 0.35 && realcarcass != None)
		PlaySound(realcarcass.default.GibTwo, SLOT_Interact, 0.18 * Mass);
	else if ( decision < 0.5 )
		PlaySound(sound'Gib3', SLOT_Interact, 0.18 * Mass);
	else if ( decision < 0.8 )
		PlaySound(sound'Gib4', SLOT_Interact, 0.18 * Mass);
	else 
		PlaySound(sound'Gib5', SLOT_Interact, 0.18 * Mass);
}
//crap for warlord:
function AnimEnd()
{
	if (realcarcass!=class'WarlordCarcass')
	{
		super.animend();
		return;
	}
	if ( AnimSequence == 'Dead2A' )
	{
		if ( Physics == PHYS_None )
		{
			LieStill();
			PlayAnim('Dead2B', 0.7, 0.07);
		}
		else
			LoopAnim('Fall');
	} 
	else if ( Physics == PHYS_None )
		LieStill();
}
//some blood decal stuff
simulated function Landed(vector HitNormal)
{
	local ExBloodSpurt b;

	if (role==role_authority)
	{ //I could do 1337 new net stuff, but nah..
		if (realcarcass==class'WarlordCarcass')
		{
			if ( AnimSequence == 'Fall' )
			{
				LieStill();
				PlayAnim('Dead2B', 0.7, 0.07);
			}
			SetPhysics(PHYS_None);
		}
		else if (realcarcass==class'tentacleCarcass')
		{
			if ( AnimSequence == 'Dead1')
				PlayAnim('Dead1Land', 1.5);
			SetPhysics(PHYS_None);
			LieStill();
		}

		else if (realcarcass==class'RockTentacleCarcass')
		{
			if ( AnimSequence == 'Dead1')
				PlayAnim('Dead1Land', 1.5);
			SetPhysics(PHYS_None);
			LieStill();
		}

		else
			super.landed(hitnormal);
	}//normal carcass
	if ( level.netmode==nm_dedicatedserver || region.zone.bwaterzone)
		return; 	//I can not see tentacles or water creatures having blood pools.
	else
	{
	if ( Pool == None)
	{
		if (bGreenBlood)
			Pool = Spawn(class'GreenUTBloodPool2',,,Location, rotator(HitNormal)); //mercs get this :P
		else
		{
			class'olutBloodpool2'.default.drawscale=0.038*(collisionradius-4);	 //change drawscale to match size
			Pool = Spawn(class'olUTBloodPool2',,,Location, rotator(HitNormal));
			class'olutBloodpool2'.default.drawscale=0.68;
		}
	} //reset
	else
	{
	if (!bGreenBlood)
		Spawn(class'olBloodSplat',,,Location, rotator(HitNormal + 0.5 * VRand()));
	else
		Spawn(class'GreenBloodSplat',,,Location, rotator(HitNormal + 0.5 * VRand()));
	}
	}
}

singular function ZoneChange( ZoneInfo NewZone )
{
	local float splashsize;
	local actor splash;
//	local PlayerPawn P;

	if( NewZone.bWaterZone )
	{
/*
		if( bSplash && !Region.Zone.bWaterZone && Mass<=Buoyancy
			&& ((Abs(Velocity.Z) < 100) || (Mass == 0)) && (FRand() < 0.05) && (P != None && (P.bIsHuman) && !P.LineOfSightTo(Self))/*&& !PlayerCanSeeMe()*/)
		{
			bSplash = false;				//NO shit me ag ai n, argh 451 shitiest crap, gulp...
			SetPhysics(PHYS_None);
		}
		else */
if( !Region.Zone.bWaterZone && (Velocity.Z < -200) )
		{
			// Else play a splash.
			splashSize = FClamp(0.0001 * Mass * (250 - 0.5 * FMax(-600,Velocity.Z)), 1.0, 3.0 );
			if( NewZone.EntrySound != None )
				PlaySound(NewZone.EntrySound, SLOT_Interact, splashSize*3);
			if( NewZone.EntryActor != None )
			{
				splash = Spawn(NewZone.EntryActor); 
				if ( splash != None )
					splash.DrawScale = splashSize;
			}
		}
		bSplash = true;
	}
	else if( Region.Zone.bWaterZone && (Buoyancy > Mass) )
	{
		bBobbing = true;
		if( Buoyancy > 1.1 * Mass )
			Buoyancy = 0.95 * Buoyancy; // waterlog
		else if( Buoyancy > 1.03 * Mass )
			Buoyancy = 0.99 * Buoyancy;
	}

	if( NewZone.bPainZone && (NewZone.DamagePerSec > 0) )
		TakeDamage(100, None, location, vect(0,0,0), NewZone.DamageType);
}

function LieStill()
{
	super.LieStill();
	if (PermaCarcass)
	{
		bdecorative=true;
		bstasis=true; //save mem
	}
}

function Drop(vector newVel) //only ever called on tentacle
{
	Velocity.X = 0;
	Velocity.Y = 0;
	SetPhysics(PHYS_Falling);
}


state Dead 
{
	function BeginState()
	{
		if ( bDecorative || bPermanent||PermaCarcass )
			lifespan = 10.0;
		else
		{
			if (realcarcass==class'WarlordCarcass')
				return;
			if ( Mover(Base) != None )
			{
				ExistTime = FMax(12.0, 30.0 - 2 * DeathZone.NumCarcasses);
				SetTimer(3.0, true);
			}
			else
				SetTimer(FMax(12.0, 30.0 - 2 * DeathZone.NumCarcasses), false); 
		}
	}
/*
	function AddFliesAndRats()
	{
		if ( (flies > 0) && (Bugs == None) && (Level.NetMode != NM_DedicatedServer) )
		{
			Bugs = Spawn(class 'ExHorseFlySwarm');
			if (Bugs != None)
			{
				Bugs.SetBase(Self);
				DeadBodySwarm(Bugs).swarmsize = flies * (FRand() + 0.9);
				DeadBodySwarm(Bugs).swarmradius = collisionradius;
			}
		}
	}
*/
	function AddFliesAndRats()
	{
	while ((swarmsize > 0) && (realcarcass != class 'ExFlyCarcass')) //avoid spawning the same fly for his own carcass
		{
		swarmsize--;
		spawn(class 'ExFly',self,'', Location + VRand() * CollisionRadius);
		}
	}

	function CheckZoneCarcasses()
	{
		local CreatureCarcass C, Best;

		if ( !bDecorative && (DeathZone.NumCarcasses > DeathZone.MaxCarcasses) )
		{
			Best = self;
			ForEach AllActors(class'CreatureCarcass', C)
				if ( (C != Self) && !C.bDecorative && (C.DeathZone == DeathZone) && !C.IsAnimating() )
				{
					if ( Best == self )
						Best = C;
/*					else if ( !C.PlayerCanSeeMe() )
					{
						Best = C;
						break;
					}
*/
				}
			Best.Destroy();
		}
	}

	function Timer()
	{
		local bool bSeen;
		local Pawn aPawn;
		local float dist;

		if ( Region.Zone.NumCarcasses <= Region.Zone.MaxCarcasses )
		{
			SetTimer(7.0, false);
			GotoState('Corroding');	
		}
		else
			Destroy();
	}
}

//BLOODDECALS:
//Nelsona: I need to see Blood from Dead Mercs GREEN COLORED... :|
simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, 
						Vector Momentum, name DamageType)
{
	local ExBloodSpurt b;

	b = Spawn(class'ExBloodSpurt',,,HitLocation,rotator(Momentum)); 	 //options can change.
	if ( bGreenBlood )
		b.GreenBlood(); //I have some doubts
	b.RemoteRole = ROLE_None;
	if ( !bPermanent )
	{
		if ( (DamageType == '') && (Damage >= 20) )
		{
			bCorroding = true;
			GotoState('Corroding');
		}
		else
			Super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
}

simulated event destroyed()
{
	if (pool!=none)
		pool.destroy();
	if ( !bDecorative&&!PermaCarcass  && DeathZone != None)
			DeathZone.NumCarcasses--;
	super(Carcass).destroyed();
}

state Corroding
{
	ignores Landed, HitWall, AnimEnd, TakeDamage, ZoneChange;

	function Tick( float DeltaTime )
	{
		local int NewFatness; 
		local float splashSize;
		local actor splash;

		NewFatness = fatness - DeltaTime/2;
		if ( NewFatness < 85 )
		{
			if ( Region.Zone.bWaterZone && Region.Zone.bDestructive )
			{
				splashSize = FClamp(0.0002 * Mass * (250 - 0.5 * FMax(-600,Velocity.Z)), 1.0, 4.0 );
				if ( Region.Zone.ExitSound != None )
					PlaySound(Region.Zone.ExitSound, SLOT_Interact, splashSize*3);
				if ( Region.Zone.ExitActor != None )
				{
					splash = Spawn(Region.Zone.ExitActor); 
					if ( splash != None )
						splash.DrawScale = splashSize;
				}
			}			
			Destroy();
		}
		fatness = Clamp(NewFatness, 0, 255);
	}
	
	function BeginState()
	{
		Disable('Tick');
	}
	
Begin:
	Sleep(2.0);
	Enable('Tick');	
}

defaultproperties
{
     swarmsize=7
     flies=5
     LifeSpan=15.000000
     NetPriority=1.000000
}
