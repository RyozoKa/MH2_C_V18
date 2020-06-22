class MHReplicationInfo extends PlayerReplicationInfo;

var byte HeadCount;
var int Health;
var string Country;
var byte Headshots;
var byte Lives;
var int KilledMonster;
var string VotedMap;//just stored lol
var bool bVoted;
var BRI BRI;
var MyAdminConsole Console;
var Pawn Enemy;
var int TPID;

//Server only
var byte HealthCounter;	//Used to count seconds that passed since last injury


replication
{
	// Things the server should send to the client.
	reliable if (Role == ROLE_Authority)
	Country,KilledMonster, Headshots, Health, Lives, ClientReceivePM, bVoted, BRI, ClientSetNetSpeed, ReturnResult, Enemy/*Why this shit is not in Pawn?*/;
	reliable if (Role < ROLE_Authority )//to server
	TPID, SendPMToServer, ServerRequest, ClientInitiated;
}

simulated function PreBeginPlay()
{
	//Get the Player ID.
	local PID pid;
	pid = Spawn(class'PID',Owner);
	if(pid.PID==0)
	{
	    pid.PID=Rand(2147483640);
		pid.SaveConfig();
	}
	TPID = pid.PID;
	pid.Destroy();
}

function PostBeginPlay()
{
	BRI=Spawn(class'BRI',Owner);
	Super.PostBeginPlay();
}

function ClientInitiated()	//Not used atm
{
	log("################################################################################",'SystemLog');
	log("########### Client Login @"@PlayerPawn(Owner).PlayerReplicationinfo.PlayerName@PlayerPawn(Owner).GetPlayerNetworkAddress(),'SystemLog');
	log("################################################################################",'SystemLog');
	log("# Country:       "$Country);
	log("################################################################################",'SystemLog');
	log("################################################################################",'SystemLog');
}

Function SetNetSpeed(coerce int value)
{
	ClientSetNetSpeed(value);
}

simulated function ClientSetNetSpeed(int value)
{
	CMonsterHUD(PlayerPawn(Owner).MyHUD).SetNetSpeed(value);
}
//Send PM to server.
simulated function SendPM(string Message,PlayerPawn Sender,PlayerPawn Receiver)
{
	SendPMToServer(Message,Sender,Receiver);
}
function SendPMToServer(string Message,PlayerPawn Sender,PlayerPawn Receiver)
{
	MonsterHunt2(Level.Game).HandlePM(Message,Sender,Receiver);
}
//Receive PM
function ReceivePM(string Message,PlayerPawn Sender)
{
	ClientReceivePM(Message,Sender);
}

simulated function ClientReceivePM(string Message,PlayerPawn Sender)
{
	CMonsterHUD(PlayerPawn(Owner).MyHUD).ClientReceivePM(Message,Sender);
}
//Adminlogin
Simulated function bool AttemptLogin(string User, string Pass, PlayerPawn Admin)
{
	BRI.ServerAttemptLogin(User,Pass,Admin);
	return BRI.bAttempt;
}

function ServerRequest(string Request, PlayerPawn Pawner)
{
	MonsterHunt2(Level.Game).Commandlet(Request, Pawner);
}

simulated function ReturnResult(string result)
{
	Console.AddResult(result);
}

defaultproperties
{
     NetUpdateFrequency=1.000000
}
