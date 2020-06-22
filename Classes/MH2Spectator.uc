//=============================================================================
// Spectator.
//=============================================================================
class MH2Spectator extends Spectator;

var bool bChaseCam;



event FootZoneChange(ZoneInfo newFootZone)
{
}
	
event HeadZoneChange(ZoneInfo newHeadZone)
{
}

event PainTimer()
{
}

exec function Walk()
{	
}

exec function BehindView( Bool B )
{
	bBehindView = B;
	bChaseCam = bBehindView;
	if ( ViewTarget == None )
		bBehindView = false;
}

function ChangeTeam( int N )
{
	PlayerReplicationInfo.Team=0;
}

exec function Taunt( name Sequence )
{
}

exec function CallForHelp()
{
}

exec function ThrowWeapon()
{
}

exec function Suicide()
{
}

exec function Fly()
{
	UnderWaterTime = -1;	
	SetCollision(false, false, false);
	bCollideWorld = true;
	GotoState('CheatFlying');

	ClientRestart();
}

function ServerChangeSkin( coerce string SkinName, coerce string FaceName, byte TeamNum )
{
}

function ClientReStart()
{
	//log("client restart");
	Velocity = vect(0,0,0);
	Acceleration = vect(0,0,0);
	BaseEyeHeight = Default.BaseEyeHeight;
	EyeHeight = BaseEyeHeight;
	
	GotoState('CheatFlying');
}

function PlayerTimeOut()
{
	if (Health > 0)
		Died(None, 'dropped', Location);
}

exec function Grab()
{
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

//=============================================================================
// functions.

exec function RestartLevel()
{
}

// This pawn was possessed by a player.
function Possess()
{
	bIsPlayer = true;
	DodgeClickTime = FMin(0.3, DodgeClickTime);
	EyeHeight = BaseEyeHeight;
	NetPriority = 2;
	Weapon = None;
	Inventory = None;
	Fly();
}

function PostBeginPlay()
{
	if (Level.LevelEnterText != "" )
		ClientMessage(Level.LevelEnterText);
	bIsPlayer = true;
	FlashScale = vect(1,1,1);
	//if ( Level.NetMode != NM_Client )
		ScoringType = Level.Game.ScoreboardType;
		
}

//=============================================================================
// Inventory-related input notifications.

// The player wants to switch to weapon group numer I.
exec function SwitchWeapon (byte F )
{
}

exec function NextItem()
{
}

exec function PrevItem()
{
}

exec function Fire( optional float F )
{
	ViewPlayerNum(-1);
	bBehindView = bChaseCam;
	if ( ViewTarget == None )
		bBehindView = false;
}

// The player wants to alternate-fire.
exec function AltFire( optional float F )
{
	bBehindView = false;
	Viewtarget = None;
	ClientMessage(ViewingFrom@OwnCamera, 'Event', true);
}

//=================================================================================

function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, 
						Vector momentum, name damageType)
{
}

defaultproperties
{
     bChaseCam=True
     AirSpeed=600.000000
     MenuName="MH2 Spectator"
}
