class CStats extends Mutator config(NewMHStats);

struct PStats
{
var string PlayerName;
var int PID;
var int Score;
var byte Deaths;
var byte Rank;
var int Headshots;
var int KilledMonsters;
var string TeamMsg;
};


var config PStats Stats[128];
var config PStats Top20[20];
var config int index;

function initStats()
{
SortStats();
SetTimer(1,false);
}

function Timer()
{
local int i;
	if(MonsterReplicationInfoTwo(Level.Game.GameReplicationInfo)== none) 
	{
		SetTimer(1,false); 
		return;
	}
	for(i=0;i<20;i++)
	{
		MonsterReplicationInfoTwo(Level.Game.GameReplicationInfo).SetName(Top20[i].PlayerName,i);//Will take a match to update this, so scores are old until game ends and new starts....
		MonsterReplicationInfoTwo(Level.Game.GameReplicationInfo).SetScore(Top20[i].Score,i);
		MonsterReplicationInfoTwo(Level.Game.GameReplicationInfo).SetDeaths(Top20[i].Deaths,i);
		MonsterReplicationInfoTwo(Level.Game.GameReplicationInfo).SetHeadshots(Top20[i].HeadShots,i);
		MonsterReplicationInfoTwo(Level.Game.GameReplicationInfo).SetKilledMonsters(Top20[i].KilledMonsters,i);
	}
}

function string GetWelcome(playerpawn P)
{
local int i;
	for(i=0;i<index;i++)
	{
		
	
	}
}

function SortFinalStats()
{
local int i;

	for(i=0;i<index && Stats[i].PlayerName != "";i++)
	{
		if(Stats[i].Rank > 0)
			Top20[Stats[i].Rank-1]=Stats[i];
	}
}

function ChangeMessage(String Msg,PlayerPawn In)
{
local int i;
local int PID;

PID = MHReplicationInfo(In.PlayerReplicationInfo).TPID;

for(i=0;i<index;i++)
	{
		if(In.PlayerReplicationinfo.playername == Stats[i].PlayerName && PID == Stats[i].PID)
		{
			Stats[i].TeamMsg=Msg;
			SaveConfig();
			break;
		}
	}
}

function ModifyPlayer(Pawn Other)
{
local int PID;
local int i;
local bool bWelcome;
if(!Other.IsA('TournamentPlayer')) {
	if ( NextMutator != None )
		NextMutator.ModifyPlayer(Other);
		return;
}
	//Make sure players own one of these....
	//Now check if Player exists or not.
	PID = MHReplicationInfo(Other.PlayerReplicationInfo).TPID;
	for(i=0;i<128;i++)
	{
	    if(Other.PlayerReplicationinfo.playername == Stats[i].PlayerName && PID == Stats[i].PID) break;//Player exists...
		
		else if(Other.PlayerReplicationInfo.PlayerName != Stats[i].PlayerName && Stats[i].PlayerName != "" && PID == Stats[i].PID)
		{ // Player has changed name, so update database....
		//log("Player ID is equal for old name: "$Stats[i].PlayerName@"New name: "$Other.PlayerReplicationinfo.playername@"PIDS: "@PID@" "@Stats[i].PID );
                Stats[i].PlayerName = Other.PlayerReplicationInfo.PlayerName;
				SaveConfig();
				SortFinalStats();
				break;
		}
		else if(Stats[i].PlayerName ~= "")
		{ //Player doesn't exists.... so add to database
		        Stats[i].PlayerName = Other.PlayerReplicationInfo.playerName;
				Stats[i].PID = PID;
				SaveConfig();
				break;
		}
	}
	if(bWelcome)
	{
		BroadcastMessage("Welcome"@Other.PlayerReplicationInfo.PlayerName@"[Team'"$Stats[i].TeamMsg$"']",,'DownMessage');
	}
	if ( NextMutator != None )
		NextMutator.ModifyPlayer(Other);
}

function int GetScore(PStats Stat)
{
local int sum;

if(Stat.KilledMonsters>4 && Stat.HeadShots > 4) //KilledMonster will almost always be more than 0, Headshots is less of a case.
Sum = (Stat.KilledMonsters / (Stat.KilledMonsters / 4)) + (Stat.HeadShots / (Stat.HeadShots / 4));
else if(Stat.KilledMonsters>=4 && Stat.HeadShots < 4)
Sum = (Stat.KilledMonsters / (Stat.KilledMonsters / 4)) + Stat.HeadShots;
if ( Sum<=1) Sum=2;//No extra points
   return (Stat.Score * (Sum / 2));//Will see
}

function SortStats()
{
local Pawn P;
local int i,j;
local int TopSC1,TopSC2,TopSC3,TopSC4,TopSC5,TopSC6,TopSC7,TopSC8,TopSC9,TopSC10,TopSC11,TopSC12,TopSC13,TopSC14,TopSC15,TopSC16,TopSC17,TopSC18,TopSC19,TopSC20;//Temp score saves
    for(j=0;j<32;j++)
    {
        if(MonsterHunt2(Level.Game).GetData(j).PlayerName!=""){
	   	for(i=0;i<128;i++)
		{
		    if(MonsterHunt2(Level.Game).GetData(j).PlayerName == Stats[i].PlayerName)//Name matches so.....
		    {
	        Stats[i].Score+=MonsterHunt2(Level.Game).GetData(j).Score;
			Stats[i].Deaths+=MonsterHunt2(Level.Game).GetData(j).Deaths;
			Stats[i].HeadShots+=MonsterHunt2(Level.Game).GetData(j).Headshots;
			Stats[i].KilledMonsters+=MonsterHunt2(Level.Game).GetData(j).KilledMonsters;//Now data is added to database.......This solution helps for players leaving before the party is ended too.......good ehh?
			}
		}
		}
	}
index=0;
//Now we need to count top 20.....
for(i=0;i<128;i++)//First we reset rank
{
Stats[i].Rank=0;//Then we need to know how many players we have in total.
    if(Stats[i].PlayerName!="")//Check if empty slot or not.
        index++;//if not then count index
}


//Top1
for(i=0;i<index;i++)//might speed up a little
{
    if(GetScore(Stats[i])>TopSC1)
	    TopSC1=GetScore(Stats[i]);
}
//Top2
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC2 && GetScore(Stats[i])<TopSC1)
	    TopSC2=GetScore(Stats[i]);
}
//Top3
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC3 && GetScore(Stats[i])<TopSC2)
	    TopSC3=GetScore(Stats[i]);
}
//Top4
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC4 && GetScore(Stats[i])<TopSC3)
	    TopSC4=GetScore(Stats[i]);
}
//Top5
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC5 && GetScore(Stats[i])<TopSC4)
	    TopSC5=GetScore(Stats[i]);
}
//Top6
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC6 && GetScore(Stats[i])<TopSC5)
	    TopSC6=GetScore(Stats[i]);
}
//Top7
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC7 && GetScore(Stats[i])<TopSC6)
	    TopSC7=GetScore(Stats[i]);
}
//Top8
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC8 && GetScore(Stats[i])<TopSC7)
	    TopSC8=GetScore(Stats[i]);
}
//Top9
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC9 && GetScore(Stats[i])<TopSC8)
	    TopSC9=GetScore(Stats[i]);
}
//Top10
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC10 && GetScore(Stats[i])<TopSC9)
	    TopSC10=GetScore(Stats[i]);
}
//Top11
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC11 && GetScore(Stats[i])<TopSC10)
	    TopSC11=GetScore(Stats[i]);
}
//Top12
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC12 && GetScore(Stats[i])<TopSC11)
	    TopSC12=GetScore(Stats[i]);
}
//Top13
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC13 && GetScore(Stats[i])<TopSC12)
	    TopSC13=GetScore(Stats[i]);
}
//Top14
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC14 && GetScore(Stats[i])<TopSC13)
	    TopSC14=GetScore(Stats[i]);
}
//Top15
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC15 && GetScore(Stats[i])<TopSC14)
	    TopSC15=GetScore(Stats[i]);
}
//Top16
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC16 && GetScore(Stats[i])<TopSC15)
	    TopSC16=GetScore(Stats[i]);
}
//Top17
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC17 && GetScore(Stats[i])<TopSC16)
	    TopSC17=GetScore(Stats[i]);
}
//Top18
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC18 && GetScore(Stats[i])<TopSC17)
	    TopSC18=GetScore(Stats[i]);
}
//Top19
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC19 && GetScore(Stats[i])<TopSC18)
	    TopSC19=GetScore(Stats[i]);
}
//Top20
for(i=0;i<index;i++)
{
    if(GetScore(Stats[i])>TopSC20 && GetScore(Stats[i])<TopSC19)
	    TopSC20=GetScore(Stats[i]);
}
//Done...... now we give them ranks
for(i=0;i<index;i++)
{
if(GetScore(Stats[i])==TopSC1){//Top1
    Stats[i].Rank=1;
	continue;}

if(GetScore(Stats[i])==TopSC2){
    Stats[i].Rank=2;
	continue;}

	if(GetScore(Stats[i])==TopSc3){
    Stats[i].Rank=3;
	continue;}
	
	if(GetScore(Stats[i])==TopSC4){
    Stats[i].Rank=4;
	continue;}
	
	if(GetScore(Stats[i])==TopSC5){
    Stats[i].Rank=5;
	continue;}
	
	if(GetScore(Stats[i])==TopSC6){
    Stats[i].Rank=6;
	continue;}
	
	if(GetScore(Stats[i])==TopSC7){
    Stats[i].Rank=7;
	continue;}
	
	if(GetScore(Stats[i])==TopSc8){
    Stats[i].Rank=8;
	continue;}
	
	if(GetScore(Stats[i])==TopSc9){
    Stats[i].Rank=9;
	continue;}
	
	if(GetScore(Stats[i])==TopSC10){
    Stats[i].Rank=10;
	continue;}
	
	if(GetScore(Stats[i])==TopSC11){
    Stats[i].Rank=11;
	continue;}
	
	if(GetScore(Stats[i])==TopSC12){
    Stats[i].Rank=12;
	continue;}
	
	if(GetScore(Stats[i])==TopSC13){
    Stats[i].Rank=13;
	continue;}
	
	if(GetScore(Stats[i])==TopSC14){
    Stats[i].Rank=14;
	continue;}
	
	if(GetScore(Stats[i])==TopSC15){
    Stats[i].Rank=15;
	continue;}
	
	if(GetScore(Stats[i])==TopSC16){
    Stats[i].Rank=16;
	continue;}
	
	if(GetScore(Stats[i])==TopSC17){
    Stats[i].Rank=17;
	continue;}
	
	if(GetScore(Stats[i])==TopSC18){
    Stats[i].Rank=18;
	continue;}
	
	if(GetScore(Stats[i])==TopSC19){
    Stats[i].Rank=19;
	continue;}
	
	if(GetScore(Stats[i])==TopSC20){
    Stats[i].Rank=20;}
}
SortFinalStats();
}

function bool HandleEndGame()
{

   SortStats();
   SaveConfig();
   log("Initiating transferring of stats to the database.");
      if ( NextMutator != None )
      return NextMutator.HandleEndGame();
    return false;
}

defaultproperties
{
     Stats(0)=(PlayerName="asdasd",PID=382,Score=55220,rank=6,KilledMonsters=42)
     Stats(1)=(PlayerName="Chris",PID=2661,Score=142565470,Deaths=79,rank=3,Headshots=1119,KilledMonsters=67574)
     Stats(2)=(PlayerName="ChrisSyChris",PID=17579,Score=280740,rank=5,Headshots=41,KilledMonsters=167)
     Stats(3)=(PlayerName="Chris",PID=21336,Score=142489686,Deaths=175,rank=4,Headshots=1133,KilledMonsters=67276)
     Stats(4)=(PlayerName="Chris",PID=10046,Score=144717312,Deaths=101,rank=2,Headshots=1494,KilledMonsters=68461,TeamMsg=" asdasd")
     Stats(5)=(PlayerName="PleaseChangeMyName1",PID=22793,rank=7)
     Stats(6)=(PlayerName="Chris",PID=27221,Score=474384804,Deaths=193,rank=1,Headshots=2206,KilledMonsters=207134)
     Top20(0)=(PlayerName="Ghetto",PID=27221,Score=474384804,Deaths=193,rank=1,Headshots=2206,KilledMonsters=207134)
     Top20(1)=(PlayerName="Chris",PID=10046,Score=144717312,Deaths=101,rank=2,Headshots=1494,KilledMonsters=68461,TeamMsg=" asdasd")
     Top20(2)=(PlayerName="Chris",PID=2661,Score=142565470,Deaths=79,rank=3,Headshots=1119,KilledMonsters=67574)
     Top20(3)=(PlayerName="Chris",PID=21336,Score=142489686,Deaths=175,rank=4,Headshots=1133,KilledMonsters=67276)
     Top20(4)=(PlayerName="ChrisSyChris",PID=17579,Score=280740,rank=5,Headshots=41,KilledMonsters=167)
     Top20(5)=(PlayerName="asdasd",PID=382,Score=55220,rank=6,KilledMonsters=42)
     Top20(6)=(PlayerName="PleaseChangeMyName1",PID=22793,rank=7)
     Index=7
     bAlwaysRelevant=True
     bGameRelevant=True
}
