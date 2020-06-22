class SPFix extends ScriptedPawn;

function eAttitude AttitudeToCreature_fix(Pawn Other)
{
	if( Other.bIsPlayer)
	{
		if(PlayerPawn(Other) != None && PlayerPawn(Other).IsInState('FeigningDeath'))
			return ATTITUDE_Ignore;
		else
			return ATTITUDE_Hate;
	}
	else
		return ATTITUDE_Friendly;
}


function eAttitude AttitudeTo_Fix(Pawn Other)
{
	if (Other.bIsPlayer)
	{
		if(PlayerPawn(Other) != None && PlayerPawn(Other).IsInState('FeigningDeath'))
			return ATTITUDE_Ignore;
		if ( bIsPlayer && Level.Game.IsA('TeamGame') && (Team == Other.PlayerReplicationInfo.Team) )
			return ATTITUDE_Friendly;
		else if ( (Intelligence > BRAINS_None) && 
			((AttitudeToPlayer == ATTITUDE_Hate) || (AttitudeToPlayer == ATTITUDE_Threaten) 
				|| (AttitudeToPlayer == ATTITUDE_Fear)) ) //check if afraid 
		{
			if (RelativeStrength(Other) > Aggressiveness)
				AttitudeToPlayer = AttitudeWithFear();
			else if (AttitudeToPlayer == ATTITUDE_Fear)
				AttitudeToPlayer = ATTITUDE_Hate;
		}
		return AttitudeToPlayer;
	}
	else if (Hated == Other && !Hated.IsA('ScriptedPawn'))
	{
		if (RelativeStrength(Other) >= Aggressiveness)
			return AttitudeWithFear();
		else 
			return ATTITUDE_Hate;
	}
	else if ( (TeamTag != '') && (ScriptedPawn(Other) != None) && (TeamTag == ScriptedPawn(Other).TeamTag) )
		return ATTITUDE_Friendly;
	else	
		return AttitudeToCreature(Other); 
}

	/*function GiveUpTactical(bool bNoCharge)
	{	
		if ( !bNoCharge && (2 * CombatStyle > (3 - Skill) * FRand()) )
			GotoState('Charging');
		else if ( bReadyToAttack && (skill > 3 * FRand() - 1) )
			GotoState('RangedAttack');
		else
			GotoState('RangedAttack', 'Challenge'); 
	}	
*/
state TacticalMove
{
/*
	Attempted to repair this huge bulky function
	To get rid of Accessed nones
*/
	function PickDestination(bool bNoCharge)
	{
		local vector pickdir, enemydir, enemyPart, Y, minDest;
		local actor HitActor;
		local vector HitLocation, HitNormal, collSpec;
		local float Aggression, enemydist, minDist, strafeSize, optDist;
		local bool success, bNoReach;
		
		if(Enemy == none) return;	//Is this hard? 	(Chris)
		
		bChangeDir = false;
		if (Region.Zone.bWaterZone && !bCanSwim && bCanFly)
		{
			Destination = Location + 75 * (VRand() + vect(0,0,1));
			Destination.Z += 100;
			return;
		}
		if ( Enemy.Region.Zone.bWaterZone )
			bNoCharge = bNoCharge || !bCanSwim;
		else 
			bNoCharge = bNoCharge || (!bCanFly && !bCanWalk);
		
		success = false;
		enemyDist = VSize(Location - Enemy.Location);
		Aggression = 2 * (CombatStyle + FRand()) - 1.1;
		if ( intelligence == BRAINS_Human )
		{
			if ( Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Fear) && (CombatStyle > 0) )
				Aggression = Aggression - 2 - 2 * CombatStyle;
			if ( Weapon != None )
				Aggression += 2 * Weapon.SuggestAttackStyle();
			if ( Enemy.Weapon != None )
				Aggression += 2 * Enemy.Weapon.SuggestDefenseStyle();
		}
	
		if ( enemyDist > 1000 )
			Aggression += 1;
		if ( bIsPlayer && !bNoCharge )
			bNoCharge = ( Aggression < FRand() );
	
		if ( (Physics == PHYS_Walking) || (Physics == PHYS_Falling) )
		{
			if (Location.Z > Enemy.Location.Z + 140) //tactical height advantage
				Aggression = FMax(0.0, Aggression - 1.0 + CombatStyle);
			else if (Location.Z < Enemy.Location.Z - CollisionHeight) // below enemy
			{
				if ( !bNoCharge && (Intelligence > BRAINS_Reptile) 
					&& (Aggression > 0) && (FRand() < 0.6) )
				{
					GotoState('Charging');
					return;
				}
				else if ( (enemyDist < 1.1 * (Enemy.Location.Z - Location.Z)) 
						&& !actorReachable(Enemy) ) 
				{
					bNoReach = (Intelligence > BRAINS_None);
					aggression = -1.5 * FRand();
				}
			}
		}
	
		if (!bNoCharge && (Aggression > 2 * FRand()))
		{
			if ( bNoReach && (Physics != PHYS_Falling) )
			{
				TweenToRunning(0.15);
				GotoState('Charging', 'NoReach');
			}
			else
				GotoState('Charging');
			return;
		}
	
		if (enemyDist > FMax(VSize(OldLocation - Enemy.OldLocation), 240))
			Aggression += 0.4 * FRand();
			
		enemydir = (Enemy.Location - Location)/enemyDist;
		minDist = FMin(160.0, 3*CollisionRadius);
		if ( bIsPlayer )
			optDist = 80 + FMin(EnemyDist, 250 * (FRand() + FRand()));  
		else 
			optDist = 50 + FMin(EnemyDist, 500 * FRand());
		Y = (enemydir Cross vect(0,0,1));
		if ( Physics == PHYS_Walking )
		{
			Y.Z = 0;
			enemydir.Z = 0;
		}
		else 
			enemydir.Z = FMax(0,enemydir.Z);
			
		strafeSize = FMax(-0.7, FMin(0.85, (2 * Aggression * FRand() - 0.3)));
		enemyPart = enemydir * strafeSize;
		strafeSize = FMax(0.0, 1 - Abs(strafeSize));
		pickdir = strafeSize * Y;
		if ( bStrafeDir )
			pickdir *= -1;
		bStrafeDir = !bStrafeDir;
		collSpec.X = CollisionRadius;
		collSpec.Y = CollisionRadius;
		collSpec.Z = FMax(6, CollisionHeight - 18);
		
		minDest = Location + minDist * (pickdir + enemyPart);
		HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
		if (HitActor == None)
		{
			success = (Physics != PHYS_Walking);
			if ( !success )
			{
				collSpec.X = FMin(14, 0.5 * CollisionRadius);
				collSpec.Y = collSpec.X;
				HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
				success = (HitActor != None);
			}
			if (success)
				Destination = minDest + (pickdir + enemyPart) * optDist;
		}
	
		if ( !success )
		{					
			collSpec.X = CollisionRadius;
			collSpec.Y = CollisionRadius;
			minDest = Location + minDist * (enemyPart - pickdir); 
			HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
			if (HitActor == None)
			{
				success = (Physics != PHYS_Walking);
				if ( !success )
				{
					collSpec.X = FMin(14, 0.5 * CollisionRadius);
					collSpec.Y = collSpec.X;
					HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
					success = (HitActor != None);
				}
				if (success)
					Destination = minDest + (enemyPart - pickdir) * optDist;
			}
			else 
			{
				if ( (CombatStyle <= 0) || (Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Fear)) )
					enemypart = vect(0,0,0);
				else if ( (enemydir Dot enemyPart) < 0 )
					enemyPart = -1 * enemyPart;
				pickDir = Normal(enemyPart - pickdir + HitNormal);
				minDest = Location + minDist * pickDir;
				collSpec.X = CollisionRadius;
				collSpec.Y = CollisionRadius;
				HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
				if (HitActor == None)
				{
					success = (Physics != PHYS_Walking);
					if ( !success )
					{
						collSpec.X = FMin(14, 0.5 * CollisionRadius);
						collSpec.Y = collSpec.X;
						HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
						success = (HitActor != None);
					}
					if (success)
						Destination = minDest + pickDir * optDist;
				}
			}	
		}
					
		if ( !success )
			GiveUpTactical(bNoCharge);
		else 
		{
			pickDir = (Destination - Location);
			enemyDist = VSize(pickDir);
			if ( enemyDist > minDist + 2 * CollisionRadius )
			{
				pickDir = pickDir/enemyDist;
				HitActor = Trace(HitLocation, HitNormal, Destination + 2 * CollisionRadius * pickdir, Location, false);
				if ( (HitActor != None) && ((HitNormal Dot pickDir) < -0.6) )
					Destination = HitLocation - 2 * CollisionRadius * pickdir;
			}
		}
	}
	//State >> TacticalMove
	function Timer()
	{
		if(Enemy == none) return;	//Don't go to attack anything if we have no enemy...
		bReadyToAttack = True;
		Enable('Bump');
		//Why is always about enemy and no sanity check?... (Chris)
		Target = Enemy;
		if (VSize(Enemy.Location - Location) 
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');		 
		else if ( bHasRangedAttack && ((!bMovingRangedAttack && (FRand() < 0.8)) || (FRand() > 0.5 + 0.17 * skill)) ) 
			GotoState('RangedAttack');
	}
}
	
/*
	This is starting to become routine...
*/

function bool ChooseTeamAttackFor_Fix(ScriptedPawn TeamMember)
{
	if(TeamMember == none) return false;
	if ( (Enemy == None) && (TeamMember.Enemy != None) && LineOfSightTo(TeamMember) ) //Here is check for enemy == none, but nothing further down? If TeamMember.Enemy == none && Enemy == none Results in Accessed none..
	{
		if (SetEnemy(TeamMember.Enemy))
			MakeNoise(1.0);
	}
	
	if(Enemy == none)
		return false;

	// speak order
	if ( !bTeamSpeaking )
		SpeakOrderTo(TeamMember);
	
	// set CombatStyle and Aggressiveness of TeamMember
	if ( TeamMember == Self )
	{
		ChooseLeaderAttack();
		return true;		
	}
	
	if ( TeamMember.bReadyToAttack )
	{
		////log("Attack!");
		TeamMember.Target = TeamMember.Enemy;
		If (VSize(Enemy.Location - Location) <= (TeamMember.MeleeRange + TeamMember.Enemy.CollisionRadius + TeamMember.CollisionRadius))
		{
			TeamMember.GotoState('MeleeAttack');
			return true;
		}
		else if (TeamMember.bMovingRangedAttack || (TeamMember.TeamID == 1) )
			TeamMember.SetTimer(TimeBetweenAttacks, False);
		else if (TeamMember.bHasRangedAttack && (TeamMember.bIsPlayer || TeamMember.Enemy.bIsPlayer) && TeamMember.CanFireAtEnemy() )
		{
			if ( !TeamMember.bIsPlayer || (3 * FRand() > Skill) )
			{
				TeamMember.GotoState('RangedAttack');
				return true;
			}
		}
	}

	if ( !TeamMember.bHasRangedAttack || (TeamMember.TeamID == 1) )
		TeamMember.GotoState('Charging');
	else if ( TeamMember.TeamID == 2 )
	{
		TeamMember.bStrafeDir = true;
		TeamMember.GotoState('TacticalMove', 'NoCharge'); 
	}
	else if ( TeamMember.TeamID == 3 )
	{
		TeamMember.bStrafeDir = false;
		TeamMember.GotoState('TacticalMove', 'NoCharge'); 
	}
	else
		TeamMember.GotoState('TacticalMove');

	return true;
}



state Retreating
{
ignores SeePlayer, EnemyNotVisible, HearNoise;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, 
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Retreating'; 
			NextLabel = 'TakeHit';
			GotoState('TakeHit'); 
		}
	}

	function Timer()
	{
		bReadyToAttack = True;
		Enable('Bump');
	}
	
	function SetFall()
	{
		NextState = 'Retreating'; 
		NextLabel = 'Landed';
		NextAnim = AnimSequence;
		GotoState('FallingState'); 
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		bSpecialPausing = false;
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Retreating', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
			GotoState('Retreating', 'AdjustFromWall');
		else
		{
			Home = None;
			MoveTimer = -1.0;
		}
	}

	/* if has a base then run toward it if its not visible to player. (FIXME)
	adjusts attitude based on proximity to base
	Else pick a random pathnode not visible to player and run toward it.
	Also - modify weights of paths visible and near to player up.
	*/
	function PickDestination()
	{
	 	//log("find retreat destination");
		if (HomeBase(Home) == None)
		{
			Home = FindRandomDest(); //find temporary home
			if (Home == None)
			{
				if (bReadyToAttack)
				{
					setTimer(3.0, false);
					Target = Enemy;
					GotoState('RangedAttack');
				}
				else
				{
					Aggressiveness += 0.3;
					GotoState('TacticalMove', 'NoCharge');
				}
			}
		}
	}

	function ChangeDestination()
	{
		local actor oldTarget;
		local Actor path;
		
		oldTarget = Home;
		PickDestination();
		if (Home == oldTarget)
		{
			Aggressiveness += 0.3;
			//log("same old target");
			GotoState('TacticalMove', 'TacticalTick');
		}
		else
		{
			path = FindPathToward(Home);
			if (path == None)
			{
				//log("no new target");
				Aggressiveness += 0.3;
				GotoState('TacticalMove', 'TacticalTick');
			}
			else 
			{
				MoveTarget = path;
				Destination = path.Location;
			}
		}
	}

	function Bump(actor Other)
	{
		local vector VelDir, OtherDir;
		local float speed;

		//log(Other.class$" bumped "$class);
		if (Pawn(Other) != None)
		{
			if ( (Other == Enemy) || SetEnemy(Pawn(Other)) )
				GotoState('MeleeAttack');
			else if ( (HomeBase(Home) != None) 
				&& (VSize(Location - Home.Location) < HomeBase(Home).Extent) )
				ReachedHome();
			return;
		}
		if ( TimerRate <= 0 )
			setTimer(1.0, false);
		
		speed = VSize(Velocity);
		if ( speed > 1 )
		{
			VelDir = Velocity/speed;
			VelDir.Z = 0;
			OtherDir = Other.Location - Location;
			OtherDir.Z = 0;
			OtherDir = Normal(OtherDir);
			if ( (VelDir Dot OtherDir) > 0.9 )
			{
				Velocity.X = VelDir.Y;
				Velocity.Y = -1 * VelDir.X;
				Velocity *= FMax(speed, 200);
			}
		} 
		Disable('Bump');
	}
	
	function ReachedHome()
	{
		if (LineOfSightTo(Enemy))
		{
			if (Homebase(home) != None)
			{
				//log(class$" reached home base - turn and fight");
				Aggressiveness += 0.2;
				if ( !bMoraleBoosted )
					health = Min(default.health, health+20);
				MakeNoise(1.0);
				GotoState('Attacking');
			}
			else
				ChangeDestination();
		}
		else
		{
			if (Homebase(home) != None)
				MakeNoise(1.0);
			aggressiveness += 0.2;
			if ( !bMoraleBoosted )
				health = Min(default.health, health+5);
			GotoState('Retreating', 'TurnAtHome');
		}
		bMoraleBoosted = true;	
	}

	function PickNextSpot()
	{
		local Actor path;
		local vector dist2d;
		local float zdiff;

		if ( Home == None )
		{
			PickDestination();
			if ( Home == None )
				return;
		}
		//log("find retreat spot");
		dist2d = Home.Location - Location;
		zdiff = dist2d.Z;
		dist2d.Z = 0.0;	
		if ((VSize(dist2d) < 2 * CollisionRadius) && (Abs(zdiff) < CollisionHeight))
			ReachedHome();
		else
		{
			if (ActorReachable(Home))
			{
				//log("almost there");
				path = Home;
				if (HomeBase(Home) == None)
					Home = None;
			}
			else
			{
				if (SpecialGoal != None)
					path = FindPathToward(SpecialGoal);
				else
					path = FindPathToward(Home);
			}
				
			if (path == None)
				ChangeDestination();
			else
			{
				MoveTarget = path;
				Destination = path.Location;
			}
		}
	}

	function AnimEnd() 
	{
		if ( bSpecialPausing )
			PlayPatrolStop();
		else if ( bCanFire && LineOfSightTo(Enemy) )
			PlayCombatMove();
		else
			PlayRunning();
	}

	function BeginState()
	{
		bCanFire = false;
		bSpecialPausing = false;
		SpecialGoal = None;
		SpecialPause = 0.0;
	}

Begin:
	//log(class$" retreating");
	if ( bReadyToAttack && (FRand() < 0.6) )
	{
		SetTimer(TimeBetweenAttacks, false);
		bReadyToAttack = false;
	}
	TweenToRunning(0.1);
	WaitForLanding();
	PickDestination();

Landed:
	TweenToRunning(0.1);
	
RunAway:
	PickNextSpot();
SpecialNavig:
	if (SpecialPause > 0.0)
	{
		if ( LineOfSightTo(Enemy) )
		{
			bFiringPaused = true;
			NextState = 'Retreating';
			NextLabel = 'Moving';
			GotoState('RangedAttack');
		}
		bSpecialPausing = true;
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.25);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		bSpecialPausing = false;
		TweenToRunning(0.1);
	}
Moving:
	if ( MoveTarget == None || Enemy == none )
	{
		Sleep(0.0);
		Goto('RunAway');
	}
	if ( !bCanStrafe || !LineOfSightTo(Enemy) ||
		(Skill - 2 * FRand() + (Normal(Enemy.Location - Location - vect(0,0,1) * (Enemy.Location.Z - Location.Z)) 
			Dot Normal(MoveTarget.Location - Location - vect(0,0,1) * (MoveTarget.Location.Z - Location.Z))) < 0) )
	{
		bCanFire = false;
		MoveToward(MoveTarget);
	}
	else
	{
		bCanFire = true;
		StrafeFacing(MoveTarget.Location, Enemy);
	}
	Goto('RunAway');

TakeHit:
	TweenToRunning(0.12);
	Goto('Moving');

AdjustFromWall:
	StrafeTo(Destination, Focus); 
	Destination = Focus; 
	MoveTo(Destination);
	Goto('Moving');

TurnAtHome:
	Acceleration = vect(0,0,0);
	TurnTo(Homebase(Home).lookdir);
	GotoState('Ambushing', 'FindAmbushSpot');
}

defaultproperties
{
}
