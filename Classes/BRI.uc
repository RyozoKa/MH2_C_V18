class BRI extends ReplicationInfo;
//This class is just to replicate server settings, will not be too network demanding due to it only has to be updated when the admin first logs in.

var bool bAttempt;
var string Buffer;

var bool UseAwards, StopPlayerCollision, BounceOffPlayer, bRequireReady;
var int DH, KakuTime, AmpTime, TimeLimit, MaxMonsterHealth,MonsterSkill, MHR, MH, MAR;
var float FriendlyFireScale, SelfDamageScale,MonsterHealthMultiplier;
var byte HRPS, GameSpeed, ARPS;

replication 
{
	reliable if( Role == ROLE_Authority)
		HRPS,MHR,MH,ARPS,MAR,DH,MonsterSkill,MonsterHealthMultiplier,MaxMonsterHealth,bRequireReady,TimeLimit, GameSpeed, bAttempt, UseAwards, StopPlayerCollision, BounceOffPlayer, KakuTime, AmpTime, FriendlyFireScale, SelfDamageScale;
	reliable if (Role < ROLE_Authority)
       ServerAttemptLogin;
}

function PreBeginPlay()
{
local MonsterBasePlus Base;
local MonsterHunt2 Controller;
Base=MonsterBasePlus(Level.Game.BaseMutator);
Controller=MonsterHunt2(Level.Game);

UseAwards=True;
StopPlayerCollision=Base.StopPlayerCollision;
BounceOffPlayer=False;
KakuTime=Base.KakuTime;
AmpTime=Base.AmpTime;
FriendlyFireScale=Controller.FriendlyFireScale;
SelfDamageScale=Base.SelfDamageScale;
GameSpeed=Level.Game.GameSpeed;
TimeLimit=Controller.TimeLimit;
bRequireReady=Controller.bRequireReady;
MaxMonsterHealth=Base.MaxMonsterHealth;
MonsterHealthMultiplier=Base.MHealthMultiplier;
MonsterSkill=Base.LevelMonster;

HRPS=0;
MHR=0;
MH=Base.MaxHealth;
ARPS=0;
MAR=0;
DH=Base.DefaultHealth;
}


function ServerAttemptLogin(string User, string Pass, PlayerPawn Admin)
{
bAttempt=MonsterBasePlus(Level.Game.BaseMutator).ServerAttemptLogin(User,Pass,Admin);
}

defaultproperties
{
     NetUpdateFrequency=1.000000
}
