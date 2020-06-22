class MonsterEnd2 expands Trigger;

#exec Texture Import Name=MHEnd File=textures\MHEnd.pcx Group="Pics" Mips=Off Flags=2
#exec obj load file=..\Music\Narvas.umx PACKAGE=MH2_C_V18
function Touch( actor Other )
{
	local actor A;
	local pawn P, Best;

	if( IsRelevant( Other ) )
	{
		if ( ReTriggerDelay > 0 )
		{
		if ( Level.TimeSeconds - TriggerTime < ReTriggerDelay )
			return;
		TriggerTime = Level.TimeSeconds;
	}
	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Other, Other.Instigator );

		if ( Other.IsA('Pawn') && (Pawn(Other).SpecialGoal == self) )
	Pawn(Other).SpecialGoal = None;

	if( Message != "" )
		Other.Instigator.ClientMessage( Message );

	TriggerObjective();

      for ( P=Level.PawnList; P!=None; P=P.nextPawn )
      if ( P.bIsPlayer && ((Best == None) || (P.PlayerReplicationInfo.Score > Best.PlayerReplicationInfo.Score)) )
         Best = P;
		//if (MonsterReplicationInfoTwo(PlayerPawn(Best).GameReplicationInfo).Monster == 0)
        //{
		    spawn(class'MH2Dancer',,,Best.Location  + 72 * Vector(Rotation) + vect(0,0,1) * 5 );
            spawn(class'MH2Dancer1',,,Best.Location  - 72 * Vector(Rotation) + vect(0,0,1) * 5 );
            spawn(class'MH2Table1',,,Best.Location  - 72 * Vector(Rotation) + vect(0,0,-7) * 5 );
            spawn(class'MH2Table2',,,Best.Location  + 72 * Vector(Rotation) + vect(0,0,-7) * 5 );
            ShutDownLevelMusic();
		//}

	if( bTriggerOnceOnly )
		SetCollision(False);
	else if ( RepeatTriggerTime > 0 )
		SetTimer(RepeatTriggerTime, false);
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

	if( bTriggerOnceOnly )
	SetCollision(False);

	TriggerObjective();
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
        TriggerObjective();
}

function TriggerObjective()
{
	local	MonsterHunt2 MH;
	local	Pawn P;

	MH = MonsterHunt2(Level.Game);
	if (MH != None)
		MH.EndGame("Game Over!");
	else
		log("Ending Game - TriggerObjective - MH == None");
}

defaultproperties
{
     bHidden=False
     InitialState=OtherTriggerTurnsOn
     Texture=Texture'MH2_C_V18.Pics.MHEnd'
}
