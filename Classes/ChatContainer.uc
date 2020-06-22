class ChatContainer extends Actor config(TempLog);

//==================================================

//==================================================
var config string MessageArray[1024];
var config int index, DayStamp;
var MyChatLog LogWindow;
var PlayerPawn POwner;
var config bool Save;

function init()
{
//if(MonsterReplicationInfoTwo(POwner.GameReplicationInfo).bClientLogChat){
    //CL=Spawn(class'ClientMessageLog',self);
	//CL.POwner=POwner;
	//CL.OpenMyLoghere();
//}
	if(DayStamp != POwner.Level.Day)
	{
	//	clean();
	//	DayStamp = POwner.Level.Day;
	}
}

function string getarray(int indext)
{
	return MessageArray[indext];
}

function clean()
{
local int i;

for(i=0;i<1024;i++)
    MessageArray[i]="";
index=0;
SaveConfig();
}

//Unsorted message.
function AddMessage(string Message)
{
MessageArray[index]=Message;
index++;

if(LogWindow != none)
    LogWindow.AddNewMessage(Message);

//CL.AddMessage(Message);

if(Save)
SaveConfig();
}

/*
========================================================
Chat message class to transfer and store messages to the chat window log.
========================================================
*/

defaultproperties
{
     MessageArray(0)="[00:53]Chris:xd"
     MessageArray(1)="[00:53]Chris:xd"
     MessageArray(2)="[00:53]Chris:asdas"
     MessageArray(3)="[00:53]Chris:aasdasd"
     MessageArray(4)="[00:53]Chris:asdas"
     MessageArray(5)="[00:53]Chris:asdas"
     MessageArray(6)="[00:53]Chris:asdasd"
     MessageArray(7)="[00:54]Chris:aaaaaa"
     MessageArray(8)="[00:54]Chris:asdasds"
     MessageArray(9)="[00:54]Chris:asdasdasd"
     MessageArray(10)="[00:56]Chris:xd"
     MessageArray(11)="[00:56]this:yep this net's pretty sluggish"
     MessageArray(12)="[00:56]Chris:brr"
     MessageArray(13)="[00:56]Chris:not sure what I set the tickrate as"
     MessageArray(14)="[00:57]this:looks kinda high"
     MessageArray(15)="[00:57]this:and ut.ini ofc"
     MessageArray(16)="[00:57]Chris:lower would lower the ping too?"
     MessageArray(17)="[00:57]this:slightly raise it"
     MessageArray(18)="[00:57]Chris:lol maby keep it on there for now then"
     MessageArray(19)="[00:58]this:high tick would be more of a load on the serv"
     MessageArray(20)="[00:58]this:and bandwidth"
     MessageArray(21)="[00:58]Chris:well the server can handle it but if it would load your bandwidth then I can try lowering it"
     MessageArray(22)="[00:59]this:24 would be fine"
     MessageArray(23)="[00:59]Chris:Can I set it through the console without having to close it?"
     MessageArray(24)="[00:59]Chris:maby just reboot"
     MessageArray(25)="[00:59]this:not sure if you need admin"
     MessageArray(26)="[00:59]Chris:I have a server console in the control panel"
     MessageArray(27)="[01:00]this:It allows the Set commands?"
     MessageArray(28)="[01:00]Chris:Yeah"
     MessageArray(29)="[01:01]Chris:I might have to see which class it belongs to first"
     MessageArray(30)="[01:01]this:Set IpDrv.TcpNetDriver NetServerMaxTickRate 24"
     MessageArray(31)="[01:02]Chris:Set IPDrv.TcpNetDriver NetServerMaxTickRate 24"
     MessageArray(32)="[01:02]Chris:Oh lolz"
     MessageArray(33)="[01:02]Chris:wrong area"
     MessageArray(34)="[01:02]this:lol it changed my client's .ini"
     MessageArray(35)="[01:03]Chris:let's see if it changes after a reboot"
     MessageArray(36)="[01:03]this:Shouldn't need one"
     MessageArray(37)="[01:03]Chris:Oh"
     MessageArray(38)="[01:03]Chris:lolz"
     MessageArray(39)="[01:03]this:My packets/sec in F6 was already under 24"
     MessageArray(40)="[01:04]Chris:Roger"
     MessageArray(41)="[01:04]Chris:I need a better keyboard rofl"
     MessageArray(42)="[01:04]this:Has it become worse since you said that last time? haha"
     MessageArray(43)="[01:04]Chris:Well a bit yeah"
     MessageArray(44)="[01:04]this:wow that really did help"
     MessageArray(45)="[01:05]this:the in signal doesn't keep going out"
     MessageArray(46)="[01:05]this:ping below 240-"
     MessageArray(47)="[01:05]Chris:Mine stays between 21-22"
     MessageArray(48)="[01:05]this:yep"
     MessageArray(49)="[01:05]this:Could even try 20 lmao"
     MessageArray(50)="[01:06]Chris:I do have a steady framerate on this i3 ha ha"
     MessageArray(51)="[01:06]this:but what's its GPU"
     MessageArray(52)="[01:06]Chris:rarely sinks below 60"
     MessageArray(53)="[01:06]Chris:intergrated "
     MessageArray(54)="[01:06]Chris:which means the CPU handles GPU stuff too"
     MessageArray(55)="[01:06]this:d3d8 here and max fps about 184"
     MessageArray(56)="[01:07]Chris:I think mine has VSync or something since it caps at 71.82"
     MessageArray(57)="[01:07]this:or even the renderer setting in the .ini?"
     MessageArray(58)="[01:07]this:FrameRateLimit"
     MessageArray(59)="[01:07]Chris:Might be"
     MessageArray(60)="[01:08]Chris:But I don't need any higher than that anyway hah a"
     MessageArray(61)="[01:08]Chris:lol press that fire button"
     MessageArray(62)="[01:08]this:screen refresh rate is 60?"
     MessageArray(63)="[01:08]Chris:Nah it's at 100 but a nice 72 is enough"
     MessageArray(64)="[01:08]this:oh why is this one only 60 then, oh well"
     MessageArray(65)="[01:09]this:maybe to save juice"
     MessageArray(66)="[01:09]Chris:Well since I am on the TV"
     MessageArray(67)="[01:09]this:ah"
     MessageArray(68)="[01:09]Chris:Most PC screens are 60 or 70"
     MessageArray(69)="[01:09]this:You going to do a server travel or what? lmao"
     MessageArray(70)="[01:09]Chris:Nah waiting for you to press fire lmao"
     MessageArray(71)="[01:10]this:I thought this test was not for playing rofl"
     MessageArray(72)="[01:10]Chris:Well I do need to test by playing too"
     MessageArray(73)="[01:10]this:that would be goofy if it needs both of ours"
     MessageArray(74)="[01:10]this:no playing with someone afk"
     MessageArray(75)="[01:11]Chris:that can be turned off, but most people like to wait for eachother"
     MessageArray(76)="[01:11]this:Most meaning among a select few who give shits lol"
     MessageArray(77)="[01:11]Chris:I had to rewrite that func too"
     MessageArray(78)="[01:12]this:Try the LAN tick rate at 30 and net at 20"
     MessageArray(79)="[01:12]Chris:Well I doubt I would run tests over lan anymore"
     MessageArray(80)="[01:12]this:DJ off?"
     MessageArray(81)="[01:12]Chris:nah but I think it"
     MessageArray(82)="[01:13]Chris:it's missconfigurted"
     MessageArray(83)="[01:13]Chris:lol damn keyboard"
     MessageArray(84)="[01:13]Chris:it works but seem sluggish occasionally"
     MessageArray(85)="[01:13]this:dumb voice lmao"
     MessageArray(86)="[01:13]this:I thought top gun was only a head shot"
     MessageArray(87)="[01:13]Chris:which one ha ha"
     MessageArray(88)="[01:13]this:the map's narration"
     MessageArray(89)="[01:13]Chris:I don't have sounds on during games"
     MessageArray(90)="[01:14]this:laggy enough I can't see my shots"
     MessageArray(91)="[01:14]this:What's MaxDamage lol"
     MessageArray(92)="[01:15]Chris:I don't remember since I haven't messed with any configs yet"
     MessageArray(93)="[01:16]this:oh now I have DJ haha"
     MessageArray(94)="[01:17]this:Maybe you want a version of my trans lmao"
     MessageArray(95)="[01:18]Chris:Oh I thought I had put it already ha ha"
     MessageArray(96)="[01:20]Chris:I do like that the radar shows weither they are above you or below"
     MessageArray(97)="[01:21]Chris:How do you like the scoreboard at F2 ha ha"
     MessageArray(98)="[01:21]this:hahahahaha please don't connect"
     MessageArray(99)="[01:21]Chris::P"
     MessageArray(100)="[01:22]this:lol deaths registered twice"
     MessageArray(101)="[01:22]Chris:Oh where, I might have to check that"
     MessageArray(102)="[01:23]Chris:that scoreboard is outdated from old tests tho"
     MessageArray(103)="[01:24]this:Since when did you disable the health regen lol"
     MessageArray(104)="[01:24]this:or maybe even the timer is disabled"
     MessageArray(105)="[01:24]Chris:I dodn't lolz"
     MessageArray(106)="[01:24]Chris:didn't"
     MessageArray(107)="[01:25]this:It showed me at 15 for about fifteen seconds Xd"
     MessageArray(108)="[01:25]Chris:Works fine here"
     MessageArray(109)="[01:25]Chris:Oh lolz"
     MessageArray(110)="[01:29]Chris:lolz duplicated message"
     MessageArray(111)="[01:29]this:but not on a monster death"
     MessageArray(112)="[01:31]Chris:where are all those 24 ha ha"
     MessageArray(113)="[01:31]this:corpseflies or pupae respawns"
     MessageArray(114)="[01:32]Chris:I have to change those dancers lmao"
     MessageArray(115)="[01:33]Chris:Haha most of those maps are missing files"
     MessageArray(116)="[01:34]Chris:Since it's running off my messy test env"
     MessageArray(117)="[01:35]this:haha maybe I need to set the hotkey again"
     MessageArray(118)="[01:35]Chris:It should be compatible with LA "
     MessageArray(119)="[01:36]this:Lol more laggy shit"
     MessageArray(120)="[01:36]Chris:what is laggy"
     MessageArray(121)="[01:37]this:Five seconds to see thet conrtroller after using the hotkey"
     MessageArray(122)="[01:37]this:*the"
     MessageArray(123)="[01:37]Chris:Oh net delay?"
     MessageArray(124)="[01:38]Chris:you're on the i3 now?"
     MessageArray(125)="[01:38]this:7"
     MessageArray(126)="[01:38]this:I can only see the controller, not vote menu"
     MessageArray(127)="[01:39]this:One pixel seems bugged, it's staying white most of the time"
     MessageArray(128)="[01:39]Chris:Oh a dead one?"
     MessageArray(129)="[01:39]Chris:Or just happening in UT?"
     MessageArray(130)="[01:39]this:Your MV doesn't wait for players to finish typing but LA does"
     MessageArray(131)="[01:39]Chris:I do get random lines and junk sometimes in UT drawn"
     MessageArray(132)="[01:40]this:White unless I move the mouse edge (black) over it"
     MessageArray(133)="[01:40]Chris:Brr almost 2 AM"
     MessageArray(134)="[01:40]Chris:Oh odd"
     MessageArray(135)="[01:41]Chris:I'd try to get back tomorrow for more testing"
     MessageArray(136)="[01:41]this:meh"
     MessageArray(137)="[01:41]Chris:I'll leave the server on if you want xd"
     MessageArray(138)="[01:42]this:!vote"
     MessageArray(139)="[01:42]this:and that was fast"
     MessageArray(140)="[01:42]Chris:maby some input lag"
     MessageArray(141)="[01:43]this:haha there's an underscore in each map name"
     MessageArray(142)="[01:43]this:drawn over some chars"
     MessageArray(143)="[01:43]Chris:Oh I don't see that here"
     Index=144
     DayStamp=9
     Save=True
     bHidden=True
     RemoteRole=ROLE_None
}
