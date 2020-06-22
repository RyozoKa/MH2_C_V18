class MonsterReplicationInfoTwo expands TournamentGameReplicationInfo;

var bool bUseLive;
var byte Live;
var int Monster;
var byte Hunter;
var bool bClientLogChat;
var bool bGameEnded;
var bool bStartedHunt;
var bool bReadyToTravel;
struct PDStats
{
var string PlayerName;
var int Score;
var byte Deaths;
var int Headshots;
var int KilledMonsters;
};
var int TimesPlayed;
var PDStats Top20[20];

var Pawn Players[32];	//PP and Bots

replication
{
	reliable if ( Role == ROLE_Authority )
		bStartedHunt, Live, Monster, bUseLive, Hunter, Top20, TimesPlayed, bGameEnded, bReadyToTravel;
}

function PreBeginPlay()
{
	RemainingTime = MonsterHunt2(Level.Game).RemainingTime;
}

simulated function PostNetBeginPlay()
{
	SecondCount = Level.TimeSeconds;
	
	SetTimer(1, true);
}

simulated function SetStats( out string PName, out int Score, Out byte Deaths, out int Headshots, out int KilledMonsters,int index)
{
PName=Top20[index].PlayerName;
Score=Top20[index].Score;
Deaths=Top20[index].Deaths;
Headshots=Top20[index].Headshots;
KilledMonsters=Top20[index].KilledMonsters;
}

function SetScore(int Score, int index)
{
Top20[index].Score=Score;
}

function SetName(string Name, int index)
{
Top20[index].PlayerName=Name;
}
function SetDeaths(byte deaths, int index)
{
Top20[index].Deaths=deaths;
}
function SetHeadshots(int headshots, int index)
{
Top20[index].Headshots=headshots;
}
function SetKilledMonsters(int KilledMonsters, int index)
{
Top20[index].KilledMonsters=KilledMonsters;
}

simulated function Timer()
{
	local Pawn P;
	local int i, FragAcc, j;
	
	if(!bStartedHunt) return;
	
	if(RemainingTime > 0)
		--RemainingTime;
	
	for (i=0; i<32; i++)
		PRIArray[i] = None;
	i = 0;
	j = 0;
	foreach AllActors(class'Pawn', P)
	{
		if ( i < 32 && P.IsA('PlayerPawn'))
			PRIArray[i++] = PlayerPawn(P).PlayerReplicationInfo;
		if( j < 32 && P.bIsPlayer)
			Players[j++] = P;
	}
	

	// Update various information.
	UpdateTimer = 0;
	for (i=0; i<32; i++)
		if (PRIArray[i] != None)
			FragAcc += PRIArray[i].Score;
	SumFrags = FragAcc;

	if ( Level.Game != None )
		NumPlayers = Level.Game.NumPlayers;
}

defaultproperties
{
     NetUpdateFrequency=1.000000
}
