class NSMonsterEnd expands Trigger;

#exec Texture Import Name=MHEnd File=textures\MHEnd.pcx Group="Pics" Mips=Off Flags=2

function Touch( actor Other )
{
	local actor A;
	local pawn P, Best;
	if(Other.IsA('Bot')) return;
	if( IsRelevant( Other ) )
	{
	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Other, Other.Instigator );

		if ( Other.IsA('Pawn') && (Pawn(Other).SpecialGoal == self) )
	Pawn(Other).SpecialGoal = None;

	if( Message != "" )
		Other.Instigator.ClientMessage( Message );

	TriggerObjective(Pawn(Other));

      for ( P=Level.PawnList; P!=None; P=P.nextPawn )
      if ( P.bIsPlayer && ((Best == None) || (P.PlayerReplicationInfo.Score > Best.PlayerReplicationInfo.Score)) )
         Best = P;
		 
		    spawn(class'MH2Dancer',,,Best.Location  + 72 * Vector(Rotation) + vect(0,0,1) * 5 );
            spawn(class'MH2Dancer',,,Best.Location  - 72 * Vector(Rotation) + vect(0,0,1) * 5 );
            spawn(class'MH2Table1',,,Best.Location  - 72 * Vector(Rotation) + vect(0,0,-7) * 5 );
            spawn(class'MH2Table2',,,Best.Location  + 72 * Vector(Rotation) + vect(0,0,-7) * 5 );
            ShutDownLevelMusic();
			
		SetCollision(False);
	}
}

function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,	Vector momentum, name damageType)
{
	local actor A;

	if ( bInitiallyActive && (TriggerType == TT_Shoot) && (Damage >= DamageThreshold) && (instigatedBy != None) )
	{
		if ( ReTriggerDelay > 0 )
		{
		if ( Level.TimeSeconds - TriggerTime < ReTriggerDelay )
			return;
		TriggerTime = Level.TimeSeconds;
	}
	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( instigatedBy, instigatedBy );

	if( Message != "" )
		InstigatedBy.Instigator.ClientMessage( Message );

	SetCollision(False);

	TriggerObjective(InstigatedBy);
	}
}

function ShutDownLevelMusic()
{
   local PlayerPawn P;
   local Pawn A;

   A = Level.PawnList;
   While ( A != None )
   {
      if ( A.IsA('PlayerPawn') )
         PlayerPawn(A).ClientSetMusic( Music'Narvas.Narvas', 0, 255, MTRAN_Fade);
      A = A.nextPawn;
   }
}

function Trigger (Actor Other, Pawn EventInstigator)
{
	local actor A;

	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Other, Other.Instigator );
    TriggerObjective(EventInstigator);
}

function TriggerObjective(pawn Instigator)
{
	//if (Level.Game.IsA('MonsterHunt2'))
		Level.Game.EndGame("Hunt Successful!");
	//else
	//	log("MonsterEnd - TriggerObjective - MH == None. This map needs to be fixed for normal MH.");
}

defaultproperties
{
     bHidden=False
     bAlwaysRelevant=True
     InitialState=OtherTriggerTurnsOn
     Texture=Texture'MH2_C_V18.Pics.MHEnd'
}
