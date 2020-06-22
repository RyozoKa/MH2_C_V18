class PMContainer extends Actor config(TempLog);

//==================================================
//==================================================
struct PM
{
var string Message;
var PlayerPawn Sender;
};

var config PM PMArray[512];
var config int index, DayStamp;
var MyPMLog LogWindow;
var PlayerPawn POwner;
var config bool Save;
var config string Blocked[64];
var int indexb;

function init()
{

//if(CL==none)
    //CL=Spawn(class'ClientPMLog',self);
//CL.POwner=POwner;
//CL.OpenMyLoghere();

if(DayStamp != POwner.Level.Day)
{
clean();
DayStamp = POwner.Level.Day;
}
}

function AddMessage(string Message, PlayerPawn Sender)
{
if(IsBlocked(Sender)) return;
PMArray[index].Message=Message;
PMArray[index].Sender=Sender;
index++;
//If log...
LogWindow.AddMessage("["$Right("0"$POwner.Level.Hour,2)$":"$Right("0"$POwner.Level.Minute,2)$"] From "$Sender.PlayerReplicationInfo.PlayerName$":"@Message);
SaveConfig();
}

function bool IsBlocked(PlayerPawn P)
{
local int i;
if( P == none || P.PlayerReplicationInfo == none) return false;
for(i=0;i<64;i++)
    if(Blocked[i]!=""&&Blocked[i]==P.PlayerReplicationInfo.PlayerName) return true;
return false;
}

function AddBlocked(MyPlayerListItem list)
{
Blocked[indexb]=list.PlayerName;
indexb++;//Will be the first slot empty, so if you want to access the last non empty slot, you need to do indexb-1.
SaveConfig();
}

function removeblocked(MyPlayerListItem list)
{
local int i;

for(i=0;i<indexb;i++)
    if(blocked[i]==list.playername)
	    break;
if(indexb>0){
indexb--;
blocked[i]=blocked[indexb];}
blocked[indexb]="";
}
function PM getarray(int index)
{
return PMArray[index];
}

function clean()
{
local int i;

for(i=0;i<512;i++){
    PMArray[i].Message="";
    PMArray[i].Sender=none;
	}
index=0;
SaveConfig();
}

/*
========================================================
Chat message class to transfer and store messages to the chat window log.
========================================================
*/

defaultproperties
{
     DayStamp=8
     bLocked(0)="Chris"
     bLocked(1)="None"
     bLocked(2)="None"
     bLocked(3)="None"
     bLocked(4)="None"
     bLocked(5)="None"
     bLocked(6)="None"
     bLocked(7)="None"
     bLocked(8)="None"
     bLocked(9)="None"
     bLocked(10)="None"
     bLocked(11)="None"
     bLocked(12)="None"
     bLocked(13)="None"
     bLocked(14)="None"
     bLocked(15)="None"
     bLocked(16)="None"
     bLocked(17)="None"
     bLocked(18)="None"
     bLocked(19)="None"
     bLocked(20)="None"
     bLocked(21)="None"
     bLocked(22)="None"
     bLocked(23)="None"
     bLocked(24)="None"
     bLocked(25)="None"
     bLocked(26)="None"
     bLocked(27)="None"
     bLocked(28)="None"
     bLocked(29)="None"
     bLocked(30)="None"
     bLocked(31)="None"
     bLocked(32)="None"
     bLocked(33)="None"
     bLocked(34)="None"
     bLocked(35)="None"
     bLocked(36)="None"
     bLocked(37)="None"
     bLocked(38)="None"
     bLocked(39)="None"
     bLocked(40)="None"
     bLocked(41)="None"
     bLocked(42)="None"
     bLocked(43)="None"
     bLocked(44)="None"
     bLocked(45)="None"
     bLocked(46)="None"
     bLocked(47)="None"
     bLocked(48)="None"
     bLocked(49)="None"
     bLocked(50)="None"
     bLocked(51)="None"
     bLocked(52)="None"
     bLocked(53)="None"
     bLocked(54)="None"
     bLocked(55)="None"
     bLocked(56)="None"
     bLocked(57)="None"
     bLocked(58)="None"
     bLocked(59)="None"
     bLocked(60)="None"
     bLocked(61)="None"
     bLocked(62)="None"
     bLocked(63)="None"
     bHidden=True
     RemoteRole=ROLE_None
}
