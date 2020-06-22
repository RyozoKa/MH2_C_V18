//=============================================================================
// CHSpectator. fixed for MH.
//=============================================================================




/*	Attempt to work around UEngine's broken import system
	And compiler
*/

//Default UT files
#exec OBJ LOAD FILE="..\Music\firebr.umx"
#exec OBJ LOAD FILE="..\Textures\GenFX.utx"

//Weapons packages
#exec OBJ LOAD FILE="..\System\BPak.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\UKBadBoy.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\ColorShock.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\MJD.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\oldskool.u" PACKAGE=MH2_C_V18	//Contains fixed versions of projectiles
#exec OBJ LOAD FILE="..\System\MH2_EXU.u"	PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\System\CS_v16_2.u"

#exec OBJ LOAD FILE="..\System\MonsterHunt.u"

//Custom music files
#exec OBJ LOAD FILE="..\Music\LasGone.umx" PACKAGE=MH2_C_V18

//Other mutators
#exec OBJ LOAD FILE="..\System\TeleporterFix103.u" 

//Other pickups
#exec OBJ LOAD FILE="..\System\MH2_C_Pickups.u" PACKAGE=MH2_C_V18 //Contains 2k4 pickups
//#exec OBJ LOAD FILE="..\System\MH2_C_Meshes.u" PACKAGE=MH2_C_V18
#exec OBJ LOAD FILE="..\Textures\MH2_C_Anims.utx"






class MH2CHSpectator extends Spectator;

var Actor OldTarget;

function InitPlayerReplicationInfo()
{
	Super.InitPlayerReplicationInfo();
	PlayerReplicationInfo.Team=0;
}

event PostBeginPlay()
{
	Super.PostBeginPlay();
	//if ( Level.NetMode != NM_Client )
		HUDType = Level.Game.HUDType;
		
	PlayerReplicationInfo.bIsSpectator=true;
}

exec function Jump( optional float F )
{
//	ViewClass(class'SpectatorCam', true);
//	While ( (ViewTarget != None) && ViewTarget.IsA('SpectatorCam') && SpectatorCam(ViewTarget).bSkipView )
//		ViewClass(class'SpectatorCam', true);
//	if ( ViewTarget.IsA('SpectatorCam') )
//		bBehindView = false;
}

exec function Verbose()
{
	if ( Bot(ViewTarget) != None )
		Bot(ViewTarget).bVerbose = true;
}

function FixFOV()
{
	if ( (ViewTarget != None) && !ViewTarget.IsA('SpectatorCam') )
	{
		FOVAngle = 90;
		DesiredFOV = 90;
		DefaultFOV = 90;
	}
	else
	{
		FOVAngle = Default.DefaultFOV;
		DesiredFOV = Default.DefaultFOV;
		DefaultFOV = Default.DefaultFOV;
	}
}

exec function NextWeapon()
{
	OldTarget = ViewTarget;
	Fire();
}

exec function PrevWeapon()
{
	if ( OldTarget != None )
		ViewTarget = OldTarget;
	else if ( (Role == ROLE_Authority) && !Level.Game.IsA('Intro') )
		ViewPlayerNum(-2);
	OldTarget = None;
	if ( ViewTarget == None )
		bBehindView = false;
	else
		bBehindView = bChaseCam;
}

exec function ViewPlayerNum(optional int num)
{
	local Pawn P;

	
	bChaseCam = true;
	bBehindView = true;
	
	if ( !PlayerReplicationInfo.bIsSpectator && !Level.Game.bTeamGame )
		return;
	if ( num >= 0 )
	{
		P = Pawn(ViewTarget);
		if ( (P != None) && P.bIsPlayer && (P.PlayerReplicationInfo.TeamID == num) )
		{
			ViewTarget = None;
			bBehindView = false;
			return;
		}
		for ( P=Level.PawnList; P!=None; P=P.NextPawn )
			if ( (P.PlayerReplicationInfo != None) && !P.IsA('ScriptedPawn') && !P.IsA('FlockPawn') && !P.IsA('StationaryPawn') && (P.PlayerReplicationInfo.Team == PlayerReplicationInfo.Team)
				&& !P.PlayerReplicationInfo.bIsSpectator
				&& (P.PlayerReplicationInfo.TeamID == num) )
			{
				if ( P != self )
				{
					ViewTarget = P;
					bBehindView = true;
				}
				return;
			}
		return;
	}
	if ( Role == ROLE_Authority )
	{
		ViewClass(class'Pawn', true);
		While ( (ViewTarget != None) 
				&& (!Pawn(ViewTarget).bIsPlayer || Pawn(ViewTarget).PlayerReplicationInfo.bIsSpectator) )
			ViewClass(class'Pawn', true);

		if ( ViewTarget != None )
			ClientMessage(ViewingFrom@Pawn(ViewTarget).PlayerReplicationInfo.PlayerName, 'Event', true);
		else
			ClientMessage(ViewingFrom@OwnCamera, 'Event', true);
	}
	
	FixFOV();
}

exec function ViewClass( class<actor> aClass, optional bool bQuiet )
{

    local actor other, first;
	local bool bFound;

	if ( (Level.Game != None) && !Level.Game.bCanViewOthers )
		return;

	first = None;
	ForEach AllActors( aClass, other )
	{
		if ( (first == None) && !Other.IsA('ScriptedPawn') && !Other.IsA('FlockPawn') && !Other.IsA('StationaryPawn') && (other != self)
			 && ( (bAdmin && Level.Game==None) || Level.Game.CanSpectate(self, other) ) )
		{
			first = other;
			bFound = true;
		}
		if ( other == ViewTarget ) 
			first = None;
	}  

	if ( first != None )
	{
		if ( !bQuiet )
		{
			if ( first.IsA('Pawn') && Pawn(first).bIsPlayer && (Pawn(first).PlayerReplicationInfo.PlayerName != "") )
				ClientMessage(ViewingFrom@Pawn(first).PlayerReplicationInfo.PlayerName, 'Event', true);
			else
				ClientMessage(ViewingFrom@first, 'Event', true);
		}
		ViewTarget = first;
	}
	else
	{
		if ( !bQuiet )
		{
			if ( bFound )
				ClientMessage(ViewingFrom@OwnCamera, 'Event', true);
			else
				ClientMessage(FailedView, 'Event', true);
		}
		ViewTarget = None;
	}

	bBehindView = ( ViewTarget != None );
	if ( bBehindView )
		ViewTarget.BecomeViewTarget();
		

	FixFOV();
}

exec function ViewSelf()
{
	Super.ViewSelf();
	FixFOV();
}

exec function CheatView( class<actor> aClass )
{
	Super.CheatView(aClass);
	FixFOV();
}

exec function Fire( optional float F )
{
	if ( (Role == ROLE_Authority) && (Level.Game == None || !Level.Game.IsA('Intro')) )
	{
		ViewPlayerNum(-1);
		if ( ViewTarget == None )
			bBehindView = false;
		else
			bBehindView = bChaseCam;
	}
}

// Send a message to all players.
exec function Say( string Msg )
{
	local Pawn P;

	if ( bAdmin && (left(Msg,1) == "#") )
	{
		Msg = right(Msg,len(Msg)-1);
		for( P=Level.PawnList; P!=None; P=P.nextPawn )
			if( P.IsA('PlayerPawn') )
			{
				PlayerPawn(P).ClearProgressMessages();
				PlayerPawn(P).SetProgressTime(6);
				PlayerPawn(P).SetProgressMessage(Msg,0);
			}
		return;
	}
	if ( Level.Game.AllowsBroadcast(self, Len(Msg)) )
		for( P=Level.PawnList; P!=None; P=P.nextPawn )
			if( P.bIsPlayer || P.IsA('MessagingSpectator') )
			{
				if ( (Level.Game != None) && (Level.Game.MessageMutator != None) )
				{
					if ( Level.Game.MessageMutator.MutatorTeamMessage(Self, P, PlayerReplicationInfo, Msg, 'Say', true) )
						P.TeamMessage( PlayerReplicationInfo, Msg, 'Say', true );
				} else
					P.TeamMessage( PlayerReplicationInfo, Msg, 'Say', true );
			}
	return;
}

defaultproperties
{
     HUDType=Class'Botpack.CHSpectatorHUD'
     FovAngle=110.000000
     CollisionRadius=17.000000
}
