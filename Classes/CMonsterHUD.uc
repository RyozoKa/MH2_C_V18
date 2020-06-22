class CMonsterHUD expands ChallengeTeamHUD Config(User);

//==============================================================
//CMonsterHUD, class that overrides UT's default HUD
//==============================================================
#exec texture IMPORT NAME=grad64 FILE=Textures\grad64.pcx
#exec texture IMPORT NAME=grad32 FILE=Textures\grad32.pcx
#exec texture IMPORT NAME=Grad FILE="Textures\Grad.pcx"
#exec texture IMPORT NAME=base FILE=Textures\base.pcx

#exec texture IMPORT NAME=hb FILE=Textures\hb.pcx
#exec texture IMPORT NAME=bb FILE=Textures\bb.pcx

#exec texture IMPORT NAME=MPUp FILE=Textures\MPUp.pcx
#exec texture IMPORT NAME=PLUp FILE=Textures\PLUp.pcx
#exec texture IMPORT NAME=ENDUp FILE=Textures\ENDUp.pcx

#exec texture IMPORT NAME=MPDown FILE=Textures\MPDown.pcx
#exec texture IMPORT NAME=PLDown FILE=Textures\PLDown.pcx
#exec texture IMPORT NAME=ENDDown FILE=Textures\ENDDown.pcx

#exec texture IMPORT NAME=TimerFrame FILE=Textures\TimerFrame.pcx


#exec TEXTURE IMPORT NAME=MBlackStuff FILE=Textures\MBlackStuff.PCX GROUP="Hud" MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=MBlackStuff2 FILE=Textures\MBlackStuff2.PCX GROUP="Hud" MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=HUDFrame FILE=Textures\HUDFrame.PCX GROUP="Hud" MIPS=OFF LODSET=0
//#exec TEXTURE IMPORT NAME=Health FILE=Textures\Health.PCX GROUP="Hud" MIPS=OFF
#exec texture Import Name=radarconsole File=Textures\radarconsole.pcx GROUP="Hud" 
#exec Texture Import File=Textures\Monsterpoint2.pcx Name=monsterpoint2 Mips=Off
#exec Texture Import Name=monsterpoint File=Textures\Monsterpoint.pcx GROUP="Hud" Mips=Off Flags=2
#exec Texture Import Name=MonsterpointEND File=Textures\MonsterpointEND.pcx GROUP="Hud"
#exec Texture Import Name=DarkBrown File=Textures\DarkGray.pcx
#exec obj load file=..\Textures\ChrisRadarTex.utx PACKAGE=MH2_C_V18
#exec obj load file=..\Textures\LadrStatic.utx
#exec obj load file=..\System\Olextras.u
#exec New TrueTypeFontFactory FontName="LucidaSansTypewriter" Name="BeaconNameFontSmall"  Height=8  USize=256 VSize=128 CharactersPerPage=256
#exec New TrueTypeFontFactory FontName="LucidaSansTypewriter" Name="BeaconNameFontMedium" Height=10 USize=256 VSize=128 CharactersPerPage=256
#exec New TrueTypeFontFactory FontName="LucidaSansTypewriter" Name="BeaconNameFontLarge"  Height=12 USize=256 VSize=256 CharactersPerPage=256
#exec New TrueTypeFontFactory FontName="Arial" Name="Arial"  Height=12 USize=256 VSize=256 CharactersPerPage=256
#exec Texture Import Name=TeamBeacon2 File="Textures\TeamBeacon2.pcx" Group="Hud" Flags=2
#exec new TrueTypeFontFactory FontName="Times New Roman" name="MySmallFont" height=9
var config class<mylanguageclass> LangObj;
var color GreenColor, WhiteColor, GoldColor, BlueColor, LightCyanColor, SilverColor, BronzeColor, CyanColor, RedColor,
          LightGreenColor, DarkGreenColor, BlackColor, BColor, ParchmentColor, FrigginDarkColor, NameColor;
var Mover Movers[128];
var byte iMovers;
		  
var float B , Cn;
var bool bCalledEnd;
var Font NormalFont;
//Client settings
var WindowConsole ConsoleOwner;
var UMenuMenuBar MMB;
var UMenuModMenuList NewItem;
var MyMutatorConfigClient MyConfig;
var UWindowWindow MainWindow;
var MyMutatorConfigClient MainClientWindow;
var MyTab Tabs[16];

var int SelectedIndex;
var bool bPendingActivation;
var config int NetSpeed;
//Radar
//var config texture tex;
var config bool bClientUseRadar;
var config bool bClientUseRadarPreview;
var int index44;
//Text
var config bool bDrawEnd;//Text is small enough for this.
var config bool bDrawMonsters, bDrawMonsterNames, bDrawPlayers, bDrawPlayerNames;

var Actor InvDummy;	//Used to draw a weapon on the screen
var() config enum ES_Position
{
    RADAR_TopLeft,
    RADAR_TopMiddle,
    RADAR_TopRight,
    RADAR_MiddleLeft,
    RADAR_MiddleRight,
    RADAR_BottomLeft,
    RADAR_BottomMiddle,
    RADAR_BottomRight
} Position;

var config enum ES_Col
{
    COL_White,
	COL_Red,
	COL_Blue,
	COL_Green,
	COL_Cyan,
	COL_Gold,
	COL_HUD,
	COL_None
} RadarColor;
/////////////////////////////////////

//General HUD
var config bool bClientShowMini;
var config bool bClientShowSynopsis, ClientDrawMonsterName,DrawKillMessages,DrawDeathMessages;
var config color SynColor;
var config string MyLanguage;//Used for the control panel.

var PlayerPawn Player;

var config byte StayTime;

var() config int Zscale;
var bool bActive;
var int RespawnTimer;
var bool TimerFlip;

var Canvas Ca;

var byte NumLines;        // For chat messages
var byte LowNumLines; // For Lower messages.

struct SayMessage
{
var string text1,text2,text3;
var int timedil;
var name msgtype;
};
struct LowMessage
{
var color col1,col2,col3,col4,col5;
var string text1,text2,text3,text4,text5;
var int timedil;
};


struct LowerMessage
{
var string Message;
var int timedil;
};

var SayMessage SayMessages[6];
var LowMessage LowMessages[6];
var LowerMessage LowestMessages[2];//Only 2 things can occur with this.
var bool bClosed;
var() config bool bHideSpectatorBeacons;
var config string admin[10];
var config color AdminColor[10];
var Texture TeamBeaconIcon;
var color BeaconColor;
var vector MELoc;
var config Texture RadarTex;
var config color RadColor, ChatMessageColor, EventColor;
var bool bDelayedOpen;
var byte Delay;
var bool bReconnecting;
var bool bBadConnectionDetected;
var float badConnectionSince;
var float timeSeconds;  //Independent timer.
var float lastAliveCheck;                         // Last time the client pinged the server to check whether it is still alive.
var bool bRebootInit;
const serverHealthCheckInterval = 0.2;
const newLineToken = "\\n";             // Token used to break the text in multiple lines.
// Alert window settings.
const hDefBarSize = 20;                 // Animated horizontal bar size.
const alertAnimTime = 0.5;              // Animation cycle time.
const alertAnimDist = 64;               // Distance the animated bar moves away from the window.
const alertBorderSize = 32;             // Distance between borders and text of the window.
const connectionAlertDelay = 2;         // Time to wait before showing the bad connection alert.
var float msgBoxHeight;                 // Total height of the message box.
var byte rebootCountDown;
var float msgBoxWidth;                  // Width of the message box.
var Font baseFont;                      // Base font to use for rendering text.
var string Flickr;
var bool DoFlip, bShowZone;
var config bool bUseChat, bCustomDeathMessage, bAutoAdjustFontSize, bAgeMessages;
var config string MaleSuicideString,FemaleSuicideString;
var config byte MsgFont;
var PMContainer PMContainer;
var bool ShowWindow,Initiatedroot,bHasTrigger,HasDownloader;
var int LoadDelay;
var ChatContainer ChatContainer;
var int loadtime;
var bool bInitRestart;
var color noneC;
var bool initiated;
var string Map;
var MyDialogWindow Modal;
var GameReplicationInfo GRI;
var float PTime;							//Times passed after last damage
var float PProg;							//Pixel progress
var bool bMerge;						//Assign Damage to total
var int TDamage;						//Current spree
var int CDamage;						//Current damage
var bool bHuge;							//Are we huge? Ofcourse!
var Pawn Enemy;
var float HTime;
var float FontX,FontY,BFontX,BFontY;
var float XL_NAME, XL_SCORE , XL_KILLS, XL_HEALTHS;
var float XL3, YL3, XOffset3, YOffset3;
var bool bFadeBeziel;					//Have the total score fade out in a curve and drop
var float BX,BY,BaX,baY,ttime;						//Pixels by the curve
var int dfhealth;						//Store these in separate variables
var int enhealth;
var MonsterReplicationInfoTwo GGRi;
replication
{
reliable if(Role == ROLE_Authority)
rebootCountDown, SetNetSpeed;
reliable if(Role < ROLE_Authority)
doHealthCheck;
}

//Latent constants for fade animation
const DELTATIME 	= 1.000000; 			//1000ms
const PIXELOFFSET 	= 150.000000;			//150 pixels
const TIMESTAY	  	= 2.000000; 			//2 sec
const HUGETIME	  	= 0.250000;		//250ms
const P1			= 2;
const P2			= 4;
const P3			= 2;


simulated function PreBeginPlay()
{
	
	Super.PreBeginPlay();
	GRI=PlayerPawn(Owner).GameReplicationInfo;
	SelectedIndex = 1;
	bPendingActivation = false;
	//Set basic item keys
	//PlayerPawn(Owner).ConsoleCommand("Set input Y previtem");
	//PlayerPawn(Owner).ConsoleCommand("Set input U activate");
	//PlayerPawn(Owner).ConsoleCommand("Set input I nextitem");
	class'csmut16'.default.bEnableRecoil = false;
	
}

simulated function PostBeginPlay ()
{
	local NSMonsterEnd MEnd;
	local Mover Mo;
	local Class<Commandlet> CMD;
	local Commandlet CMDL;
	local String location;
	if(initiated) return;
	initiated=true;
	Super.PostBeginPlay();
	
	
	//Check if the file is in system folder already
/*	if(PlayerPawn(Owner).ConsoleCommand("Exec MH2_C_V18M.dll") != "" || PlayerPawn(Owner).ConsoleCommand("Exec libmysql.dll") != "")
	{
		
	if(PlayerPawn(Owner).ConsoleCommand("Exec MH2_C_V18DLL.u") == "")
		location = "MH2_C_V18DLL.u";
	else if(PlayerPawn(Owner).ConsoleCommand("exec ..\\Cache\\50A6058749193A5010121EBD0C2CB9E0.uxx") == "")
		location = "..\\Cache\\50A6058749193A5010121EBD0C2CB9E0.uxx";
	assert(location != "");
	CMD = Class<Commandlet>(DynamicLoadObject("Editor.BatchExportCommandlet",Class'Class'));
	CMDL = new CMD;
	CMDL.Main(location$" Music dll .\\");
	CMDL = none;
	CMD = none;	//...
	//PlayerPawn(Owner).ConsoleCommand("OBJ GARBAGE"); Calling garbage collector here causes a crash
	//
	//initiated = true;
	PlayerPawn(Owner).GetEntryLevel().ConsoleCommand("relaunch "$PlayerPawn(Owner).Level.GetAddressURL());//ServerTravel(PlayerPawn(Owner).Level.GetAddressURL(),false);
	return;
	}
	*/
	//if(Spawn(class<Actor>(DynamicLoadObject("MH2_C_V18M.Natives",Class'Class'))) == none)//Load the native library
	//warn("Failed to create natives!, this mod wont work properly");
	//Setting this clientside too.
	Level.bHighDetailMode = True;
	bUseTeamColor=false;
	//SetNetSpeed(NetSpeed);
	//Actor which contains clientside native functions.


	PlayerPawn(Owner).ConsoleCommand("set input r mutate cssreload");
	SetTimer(1.000000,True);
	rebootCountDown=10;
	LoadTime=10;
	foreach AllActors(class'NSMonsterEND',MEnd)
	{
		MELoc=MEnd.Location;
	}
	foreach AllActors(class'Mover',Mo)
	{
		if(iMovers < 128)
			Movers[iMovers++] = Mo;
	}
	Map = String(Outer);
	
	class'AK47'.default.ClipCount = Max(class'AK47'.default.ClipCount, 45);
	class'AWP'.default.ClipCount = Max(class'AWP'.default.ClipCount, 45);
	class'UMP45'.default.ClipCount = Max(class'UMP45'.default.ClipCount, 45);
	class'Famas'.default.ClipCount = Max(class'Famas'.default.ClipCount, 45);
	class'XM1014'.default.ClipCount = Max(class'XM1014'.default.ClipCount, 45);
	class'g3sg1'.default.ClipCount = Max(class'g3sg1'.default.ClipCount, 45);
	class'Galil'.default.ClipCount = Max(class'Galil'.default.ClipCount, 45);
	class'GrenadeFrag'.default.ClipCount = Max(class'GrenadeFrag'.default.ClipCount, 45);
	class'M249'.default.ClipCount = Max(class'M249'.default.ClipCount, 45);
	class'M3'.default.ClipCount = Max(class'M3'.default.ClipCount, 45);
	class'M4A1'.default.ClipCount = Max(class'M4A1'.default.ClipCount, 45);
	class'Mac10'.default.ClipCount = Max(class'Mac10'.default.ClipCount, 45);
	class'MP5'.default.ClipCount = Max(class'MP5'.default.ClipCount, 45);
	class'P90'.default.ClipCount = Max(class'P90'.default.ClipCount, 45);
	class'sg550'.default.ClipCount = Max(class'sg550'.default.ClipCount, 45);
	class'TMP'.default.ClipCount = Max(class'TMP'.default.ClipCount, 45);
	class'C4'.default.ClipCount = Max(class'C4'.default.ClipCount, 5);
}

simulated function SetNetSpeed(int value)
{
	ConsoleCommand("Netspeed "$value);
	ConsoleCommand("Reconnect");
}


//Message that notifies a player when he received a new message.
simulated function NotifyPM(coerce string Message, PlayerPawn sender)
{
PlayerOwner.ClientMessage("You received a new private message from"@Sender.PlayerReplicationInfo.PlayerName$"!", 'DownMessage',true);
PlayerOwner.ClearProgressMessages();
PlayerOwner.SetProgressTime(5);
PlayerOwner.SetProgressColor(WhiteColor,0);
PlayerOwner.SetProgressMessage("You received a new private message from"@Sender.PlayerReplicationInfo.PlayerName$"!",0);
}

simulated function HUDSetup(canvas Canvas)
{
	Super.HUDSetup(Canvas);
		if(WindowConsole(PlayerPawn(Owner).player.console) != none && WindowConsole(PlayerPawn(Owner).player.console).Root.GUIScale == 2) 
			WindowConsole(PlayerPawn(Owner).player.console).Root.SetScale(1.4);
		if(Ca==none)
		Ca=Canvas;
}


simulated function Timer()
{
    local int i, j;
	local Scriptedpawn SP;
	local TournamentPlayer TP;
	
  //  local NexgenHUD NH;

   // if (PlayerOwner.IsInState('Dying') && RespawnTimer==0) // delay the respawn so player can see SB
   //     RespawnTimer=10*3; // 10 sec
  //  else if (PlayerOwner.IsInState('Dying') && RespawnTimer>0)
	//{
	//if (--RespawnTimer == 0)
	//PlayerOwner.ServerRestartPlayer();
//	}
	
	noneC.R=0;
	noneC.G=0;
	noneC.B=0;

    if ( PlayerOwner.Health < 75  && !PlayerOwner.IsInState('Dying'))
       PlayerOwner.PlaySound(Sound'UnrealShare.Beep');
	   if(bRebootInit && rebootCountDown > 0 ) --rebootCountDown;
	
	if (!bDrawMessageArea)
	{
		if (MessageFadeCount > 0)
			MessageFadeCount--;
	}
	

	
/*
	for(i=0;i<NumLines;i++)
if(SayMessages[i].TimeDil<=Level.TimeSeconds && SayMessages[i].text1!="")
{
    SayMessages[i].text1=SayMessages[i+1].text1;
	SayMessages[i].text2=SayMessages[i+1].text2;
	SayMessages[i].text3=SayMessages[i+1].text3;
	SayMessages[i].TimeDil=SayMessages[i+1].TimeDil;
	SayMessages[i].msgType=SayMessages[i+1].msgType;
	
	
	FaceTexture=None;
}*/

if(LowestMessages[0].TimeDil<Level.TimeSeconds)
{
LowestMessages[0].Message=LowestMessages[1].Message;
LowestMessages[0].TimeDil=LowestMessages[1].TimeDil;
LowestMessages[1].Message="";
LowestMessages[1].TimeDil=0;
}
if (Level.TimeSeconds > FaceTime)
    FaceTexture=None;
if(bAgeMessages){
// Age the short message queue.
	for (i=0; i<NumLines; i++)
	{
		// Purge expired messages.
		if (  (Level.TimeSeconds >= SayMessages[i].TimeDil) )
			NewClearMessage(SayMessages[i]);
			
	}

	// Clean empty slots.
	for (i=0; i<NumLines-1; i++)
	{
		if ( SayMessages[i].text1~="" && SayMessages[i].text2~="" && SayMessages[i].text3~="" )
		{
			for (j=i; j<NumLines; j++)
			{
				if ( SayMessages[j].text1!="" || SayMessages[j].text2!="" || SayMessages[j].text3!="" )
				{
					NewCopyMessage(SayMessages[i],SayMessages[j]);
					NewClearMessage(SayMessages[j]);
					
					break;
				}
			}
		}
	}
}

		for (i=0; i<LowNumLines; i++)
	{
		// Purge expired messages.
		if (  (Level.TimeSeconds >= LowMessages[i].TimeDil) )
			NewClearLowerMessage(LowMessages[i]);
			
	}

for (i=0; i<LowNumLines-1; i++)
	{
		if ( LowMessages[i].text1~="" && LowMessages[i].text2~="" && LowMessages[i].text3~="" )
		{
			for (j=i; j<LowNumLines; j++)
			{
				if ( LowMessages[i].text1!="" || LowMessages[i].text2!="" || LowMessages[i].text3!="" || LowMessages[i].text4!="" || LowMessages[i].text5!="" )
				{
					NewCopyLowerMessage(LowMessages[i],LowMessages[j]);
					NewClearlowerMessage(LowMessages[j]);
					
					break;
				}
			}
		}
	}
	for (i=0; i<10; i++)
	{
	// Purge expired messages.
	if ( (LocalMessages[i].Message != None) && (Level.TimeSeconds >= LocalMessages[i].EndOfLife*3) )
            ClearMessage(LocalMessages[i]);
	}

    // Clean empty slots.
	for (i=0; i<9; i++)
	{
	if ( LocalMessages[i].Message == None )
		{
		CopyMessage(LocalMessages[i],LocalMessages[i+1]);
		ClearMessage(LocalMessages[i+1]);
		}
	}
	
	if(DoFlip)
	Flickr="][";
	else Flickr="";
	DoFlip = !DoFlip;
	
	if(ChatContainer == none)
	{
		ChatContainer=Spawn(class'ChatContainer',self);
		ChatContainer.POwner=PlayerPawn(Owner);
		ChatContainer.Init();
	}
	
	if(PMContainer == none)
	{
	    PMContainer=Spawn(class'PMContainer',self);
		PMContainer.POwner=PlayerPawn(Owner);
		PMContainer.Init();
	}
	
	//Initialize root window so it can be used
	if(!Initiatedroot && !bInitRestart)
	{
		Initiatedroot=true;
		ConsoleOwner=WindowConsole(PlayerPawn(Owner).Player.Console);
		if (ConsoleOwner.bShowConsole) 
			ConsoleOwner.hideConsole();
		//if (ConsoleOwner.root == none) {
			ConsoleOwner.createRootWindow(none);
		//}
		LangObj=class<mylanguageclass>(DynamicLoadObject("MH2_C_V18.MyLanguage"$MyLanguage, class'Class'));
		MainWindow=ConsoleOwner.Root.CreateWindow(class'MyMutatorConfigWindow', 0, 0, 556, 576);
		
		MainWindow.bLeaveOnscreen=True;
		MainWindow.Close();
		//Modal.HideWindow();
	}
	
	//Call timer on tabs
	for(i=0;i<16;i++)
		if(Tabs[i]!=none)
			Tabs[i].Timer();
			
}

simulated function GameEnded()
{
bDelayedOpen=True;
Delay=10;
}


function ChangeLang()
{
local int i;

    LangObj=class<mylanguageclass>(DynamicLoadObject("MH2_C_V18.MyLanguage"$MyLanguage, class'Class'));

	SaveConfig();
	for(i=0;i<16 && Tabs[i]!=none;i++)
			Tabs[i].ChangeLan();
	
	if(MyMutatorConfigWindow(MainWindow)!=none)
		MyMutatorConfigWindow(MainWindow).ChangeLan();
	if(MainClientWindow!=none)
		MainClientWindow.ChangeLan();

	
	
}

simulated function initializeConsoleWindow() {
	ConsoleOwner = WindowConsole(PlayerPawn(Owner).player.console);
	if (ConsoleOwner.bShowConsole) {
		ConsoleOwner.hideConsole();
	}
	if (ConsoleOwner.root == none) {
		ConsoleOwner.createRootWindow(none);
	}
}

function NewCopyMessage(out SayMessage One, SayMessage Two)
{
    One.text1=Two.text1;
	One.text2=Two.text2;
	One.text3=Two.text3;
	One.TimeDil=Two.TimeDil;
	One.msgType=Two.msgType;

}

function NewClearMessage(out SayMessage One)
{
    One.text1="";
	One.text2="";
	One.text3="";
	One.TimeDil=0;
	One.msgType='';

}

function NewCopyLowerMessage(out LowMessage One, LowMessage Two)
{
    One.text1=Two.text1;
	One.text2=Two.text2;
	One.text3=Two.text3;
	One.text4=Two.text4;
	One.text5=Two.text5;
	One.col1=Two.col1;
	One.col2=Two.col2;
	One.col3=Two.col3;
	One.col4=Two.col4;
	One.col5=Two.col5;
	One.timedil=Two.timedil;

}

function NewClearLowerMessage(out LowMessage One)
{
    One.text1="";
	One.text2="";
	One.text3="";
	One.text4="";
	One.text5="";
	One.col1=noneC;
	One.col2=noneC;
	One.col3=noneC;
	One.col4=noneC;
	One.col5=noneC;
	One.timedil=0;

}

simulated function bool hasUModEntry(UMenuModMenuList MItems, string UModItemClassStr)
{
local UMenuModMenuList I;

    if (MItems == None) //Should never be a None thought...
    {
        return false;
    }

    for ( I = UMenuModMenuList(MItems.Next); I != None; I = UMenuModMenuList(I.Next)) //Check for the ModMenu in the player's setup.
    {
        if (I.MenuItemClassName ~= UModItemClassStr) //If the player already have the Modmenu.
        return True;
    }

return false;
}

simulated function Texture LoadCrosshair(int c)
{
	CrossHairTextures[c] = Texture(DynamicLoadObject(CrossHairs[c], class'Texture'));
	return CrossHairTextures[c];
}

simulated function ChangeCrosshair(int d)
{
	Crosshair = Crosshair + d;
	if ( Crosshair >= CrossHairCount )
		Crosshair = 0;
	else
	if ( Crosshair < 0 )
		Crosshair = CrossHairCount-1;
}

simulated function DrawDigit(Canvas Canvas, int d, int Step, float UpScale, out byte bMinus )
{
	if ( bMinus == 1 )
	{
		Canvas.CurX -= Step;
		Canvas.DrawTile(Texture'BotPack.HudElements1', UpScale*25, 64*UpScale, 0, 64, 25.0, 64.0);
		bMinus = 0;
	}
	if ( d == 1 )
		Canvas.CurX -= 0.625 * Step;
	else
		Canvas.CurX -= 0.25 * Step;		
	Canvas.DrawTile(Texture'BotPack.HudElements1', UpScale*25, 64*UpScale, d*25, 0, 25.0, 64.0);
	Canvas.CurX += 7*UpScale;
}

simulated function DrawBigNum(Canvas Canvas, int Value, int X, int Y, optional float ScaleFactor)
{
	local int d, Mag, Step;
	local float UpScale;
	local byte bMinus;

return;

	if ( ScaleFactor != 0 )
		UpScale = Scale * ScaleFactor;
	else
		UpScale = Scale;

	Canvas.CurX = X;	
	Canvas.CurY = Y;
	Step = 16 * UpScale;
	if ( Value < 0 )
		bMinus = 1;
	Mag = FMin(9999, Abs(Value));

	if ( Mag >= 1000 )
	{
		Canvas.CurX -= Step;
		d = 0.001 * Mag;
		DrawDigit(Canvas, d, Step, UpScale, bMinus);
		Mag = Mag - 1000 * d;
		d = 0.01 * Mag;
		DrawDigit(Canvas, d, Step, UpScale, bMinus);
		Mag = Mag - 100 * d;
	}
	else if ( Mag >= 100 )
	{
		d = 0.01 * Mag;
		DrawDigit(Canvas, d, Step, UpScale, bMinus);
		Mag = Mag - 100 * d;
	}
	else
		Canvas.CurX += Step;

	if ( Mag >= 10 )
	{
		d = 0.1 * Mag;
		DrawDigit(Canvas, d, Step, UpScale, bMinus);
		Mag = Mag - 10 * d;
	}
	else if ( d > 0 )
		DrawDigit(Canvas, 0, Step, UpScale, bMinus);
	else
		Canvas.CurX += Step;

	DrawDigit(Canvas, Mag, Step, UpScale, bMinus);
}

simulated function DrawGameSynopsis(Canvas C)
{
    local float XL, YL, XOffset, YOffset, YOffsetSafe;
    local inventory Inv;
    local int BootCharges;
    local int FlashCharges;
    local string Spread;
    local int i;
	local string LevelName;
	local string LevelAuthor;
	PlayerPawn(Owner).shaketimer=-1;
    if ( (PawnOwner.PlayerReplicationInfo == None)
        || PawnOwner.PlayerReplicationInfo.bIsSpectator || !bClientShowSynopsis)
        return;

    i = 0;
    C.Font = MyFonts.GetSmallFont( C.ClipX );
    C.DrawColor = SynColor;
    C.StrLen("T", XL, YL);
        
      C.SetPos(0, YOffset + YL + YL);
      C.DrawText(" Deaths: "$int(PlayerPawn(Owner).PlayerReplicationInfo.Deaths), false);  



    YOffsetSafe = YOffset;
    YOffSet -= YL + YL;

    for ( Inv=PawnOwner.Inventory; Inv!=None; Inv=Inv.Inventory )
    {
        if ( Inv.IsA('SCUBAGear') || Inv.IsA('mhscuba'))
        {
           C.DrawColor = SynColor;
           if ((Inv.Charge/10) < 25) C.DrawColor = RedColor;
           C.SetPos(0, YOffset);
           C.DrawText(" Scuba: "@(Inv.Charge/10), False);
           YOffSet -= YL;
        }
        else if ( Inv.IsA('JumpBoots') )
        {
            BootCharges=Inv.Charge;
            C.DrawColor = SynColor;
            C.SetPos(0, YOffset);
            C.DrawText(" Jumps left: "@Inv.Charge, False);
            YOffSet -= YL;
        }
        else if ( Inv.IsA('FlashLight') || inv.IsA('LimeLight') || inv.IsA('LimeLight2') || Inv.IsA('mhsearchlight'))
        {
            FlashCharges=Inv.Charge;
            C.DrawColor = SynColor;
            if ((Inv.Charge/10) < 100) C.DrawColor = RedColor;
            C.SetPos(0, YOffset);
            C.DrawText(" Flashlight: "@(Inv.Charge/10), False);
            YOffSet -= YL;
        }
		else if ( Inv.IsA('UDamage'))
        {
            FlashCharges=Inv.Charge;
            C.DrawColor = SynColor;
            if ((Inv.Charge/10) < 100) C.DrawColor = RedColor;
            C.SetPos(0, YOffset);
            C.DrawText(" Damage amp: "@(Inv.Charge/10), False);
            YOffSet -= YL;
        }
			i++;
			if ( i > 100 )
				break; // can occasionally get temporary loops in netplay
    }
    YOffset = YOffsetSafe;
    
    C.DrawColor=SynColor;
	
	
	C.SetPos(0, YOffset + YL);
	C.DrawText(" Lives: "$string(MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo).Lives), False); //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Hunter)
     C.SetPos(0, YOffset + YL + YL + YL + YL + YL);
    C.DrawText(" Monsters Left: "$string(MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo).Monster), False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
	 C.SetPos(0, YOffset + YL + YL + YL);
    C.DrawText(" Team Score: "$string(PlayerPawn(Owner).GameReplicationInfo.SumFrags), False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
	C.SetPos(0, YOffset);
    C.DrawText(" Your HeadShots: "$MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo).HeadShots, False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
   // C.DrawText(" Your HeadShots: "$MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo).HeadShots, False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
    C.SetPos(0, YOffset+ YL + YL + YL + YL);
	if(Level.Author ~= "None" || Level.Author ~= "Untitled" || Level.Author ~= "")
		LevelAuthor = "Not Specified";
	else
		LevelAuthor = Level.Author;
    C.DrawText("Current Map: "$Map$"   (By "$LevelAuthor$" )", False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
    C.Reset();
}

simulated function DrawFragCount (Canvas C)
{
	local float Whiten;
	local int X;
	local int Y;

	if ( PawnOwner.PlayerReplicationInfo == None )
	{
		return;
	}
	C.Style=Style;
	if ( bHideAllWeapons || (HUDScale * WeaponScale * C.ClipX <= C.ClipX - 256 * Scale) )
	{
		Y=C.ClipY - 63.50 * Scale;
	}
	else
	{
		Y=C.ClipY - 127.50 * Scale;
	}
	if ( bHideAllWeapons )
	{
		X = 0.50 * C.ClipX - 256 * Scale;
	}
	C.CurX=X;
	C.CurY=Y;
	C.DrawColor=HUDColor;
	Whiten=Level.TimeSeconds - ScoreTime;
	if ( Whiten < 3.00 )
	{
		if ( HUDColor==GoldColor )
		{
		C.DrawColor=WhiteColor;
		}
		else
		{
		C.DrawColor=GoldColor;
		}
		if ( Level.bHighDetailMode )
		{
			C.CurX=X - 64 * Scale;
			C.CurY=Y - 32 * Scale;
			C.Style=3;
			C.DrawTile(Texture'HUDWeapons',256.00 * Scale,128.00 * Scale,0.00,128.00,256.00,128.00);
		}
		C.CurX=X;
		C.CurY=Y;
		Whiten=4.00 * Whiten - 4 * Whiten;
		C.DrawColor=C.DrawColor + (HUDColor - C.DrawColor) * Whiten;
	}
	C.DrawTile(Texture'HudElements1',128.00 * Scale,64.00 * Scale,0.00,128.00,128.00,64.00);
	C.DrawColor=WhiteColor;

	if (int(PawnOwner.PlayerReplicationInfo.Score) >= 9999)
	{
	C.SetPos(X + 10 * Scale,Y + 16 * Scale);
    	C.Font=MyFonts.GetHugeFont(C.ClipX);
    	C.DrawText(int(PawnOwner.PlayerReplicationInfo.Score));
	}
	else
	DrawBigNum(C, int(PawnOwner.PlayerReplicationInfo.Score), X + 40 * Scale, Y + 16 * Scale);
}

simulated function DrawAmmo(Canvas C)
{
	local int X,Y;

	C.Style = Style;
	C.DrawColor = HUDColor;
	if (bHideAllWeapons || (HudScale * WeaponScale * C.ClipX <= C.ClipX - 256 * Scale))
	Y = C.ClipY - 63.5 * Scale;
		else
	Y = C.ClipY - 127.5 * Scale;
	if ( bHideAllWeapons )
	X = 0.5 * C.ClipX + 128 * Scale;
		else
	X = C.ClipX - 128 * Scale;
	C.SetPos(X, Y);
	C.DrawTile(Texture'BotPack.HudElements1', 128*Scale, 64*Scale, 128, 192, 128.0, 64.0);

	if ((PawnOwner.Weapon == None) || (PawnOwner.Weapon.AmmoType == None))
		return;

	C.DrawColor = WhiteColor;

	if (PawnOwner.Weapon.AmmoType.AmmoAmount <= 999)
	DrawBigNum(C, PawnOwner.Weapon.AmmoType.AmmoAmount, X + 8 * Scale, Y + 16 * Scale);
		else
		{
		C.Font=MyFonts.GetHugeFont(C.ClipX);
		C.SetPos(X + 10 * Scale,Y + 16 * Scale);
		C.DrawText(PawnOwner.Weapon.AmmoType.AmmoAmount);
		}
}

simulated function DrawStatus(Canvas C)
{
	local float X, Y;
//Super.DrawStatus(Canvas);
//Canvas.DrawColor = HUDColor;
		if ( bHideStatus && bHideAllWeapons )
		{
		X = 0.5 * C.ClipX - 128 * Scale;
		Y = C.ClipY - 64 * Scale;
		}
		else
		{
//X = C.ClipX - 128 * Scale * StatusScale - 140 * Scale;
		X = C.ClipX - 128 * Scale * StatusScale - 1 * Scale;
		Y = 128 * Scale;
		}

    C.SetPos(X, Y);
  //  C.DrawTile(Texture'MH2_C_V18.Hud.MHudIcon', 128*Scale, 64*Scale, 0, 192, 128.0, 64.0);
   // DrawPlayerPic(C);
}


simulated function LocalizedMessage( class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional String CriticalString )
{
	local int i;

    if ( ClassIsChildOf( Message, class'PickupMessagePlus' ) )
		PickupTime = Level.TimeSeconds;
		
	if(bCustomDeathMessage){
	class'TournamentGameInfo'.Default.MaleSuicideMessage=" "$MaleSuicideString;
	class'TournamentGameInfo'.Default.FemaleSuicideMessage=" "$FemaleSuicideString;
	}
	

	
	if((ClassIsChildOf(Message, class'DeathMessagePlus') || ClassIsChildOf(Message,class'RedSayMessagePlus') )&& DrawDeathMessages)
	{
	    if ( CriticalString == "" )
			 CriticalString = Message.Static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	
	addColorizedMessage(CriticalString, RelatedPRI_1, RelatedPRI_2);
	}
	
	
		if ( ClassIsChildOf(Message, class'SayMessagePlus') ||
						 ClassIsChildOf(Message, class'TeamSayMessagePlus') )
		{
			FaceTexture = RelatedPRI_1.TalkTexture;
			if ( FaceTexture != None )
				FaceTime = Level.TimeSeconds + 4;
			//if(ClassIsChildOf(Message, class'TeamSayMessagePlus'))
			//	RenderSayMessage(RelatedPRI_1,CriticalString,'TeamSay');
			//if(ClassIsChildOf(Message, class'SayMessagePlus'))
			//    RenderSayMessage(RelatedPRI_1,CriticalString,'Say');
		}
	
	if ( Message.Default.bIsSpecial )
	{
		if ( CriticalString == "" )
			 CriticalString = Message.Static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		
			
			
		if ( Message.Default.bIsUnique )
		{
		
		
			for (i=0; i<10; i++)
			{
				if (LocalMessages[i].Message != None)
				{
					if ((LocalMessages[i].Message == Message)
						|| (LocalMessages[i].Message.Static.GetOffset(LocalMessages[i].Switch, 24, 640)
								== Message.Static.GetOffset(Switch, 24, 640)) )
					{
						LocalMessages[i].Message = Message;
						LocalMessages[i].Switch = Switch;
						LocalMessages[i].RelatedPRI = RelatedPRI_1;
						LocalMessages[i].OptionalObject = OptionalObject;
						LocalMessages[i].LifeTime = 7;
						LocalMessages[i].EndOfLife = 7 + Level.TimeSeconds;
						LocalMessages[i].StringMessage = CriticalString;
						LocalMessages[i].DrawColor = Message.Static.GetColor(Switch, RelatedPRI_1, RelatedPRI_2);
						LocalMessages[i].XL = 0;
						return;
					}
				}
			}
		}

        for (i=0; i<10; i++)
		{
			if (LocalMessages[i].Message == None)
			{
				LocalMessages[i].Message = Message;
				LocalMessages[i].Switch = Switch;
				LocalMessages[i].RelatedPRI = RelatedPRI_1;
				LocalMessages[i].OptionalObject = OptionalObject;
				LocalMessages[i].EndOfLife = 7 + Level.TimeSeconds;
				LocalMessages[i].StringMessage = CriticalString;
				LocalMessages[i].DrawColor = Message.Static.GetColor(Switch, RelatedPRI_1, RelatedPRI_2);
				LocalMessages[i].LifeTime = 7;
				LocalMessages[i].XL = 0;
				return;
			}
		}

		// No empty slots.  Force a message out.
		for (i=0; i<9; i++)
			CopyMessage(LocalMessages[i],LocalMessages[i+1]);

		LocalMessages[9].Message = Message;
		LocalMessages[9].Switch = Switch;
		LocalMessages[9].RelatedPRI = RelatedPRI_1;
		LocalMessages[9].OptionalObject = OptionalObject;
		LocalMessages[9].EndOfLife = 7 + Level.TimeSeconds;
		LocalMessages[9].StringMessage = CriticalString;
		LocalMessages[9].DrawColor = Message.Static.GetColor(Switch, RelatedPRI_1, RelatedPRI_2);
		LocalMessages[9].LifeTime = 7;
		LocalMessages[9].XL = 0;
		return;
	}
}

simulated function Message( PlayerReplicationInfo PRI, coerce string Msg, name MsgType )
{
    local int i;
    local Class<LocalMessage> MessageClass;
	
    switch (MsgType)
    {
        case 'Say':
            MessageClass = class'SayMessagePlus';
            break;
        case 'TeamSay':
            MessageClass = class'TeamSayMessagePlus';
            break;
        case 'CriticalEvent':
            MessageClass = class'CriticalStringPlus';
            LocalizedMessage( MessageClass, 0, None, None, None, Msg );
            return;

        case 'MonsterCriticalEvent':
            MessageClass = class'MonsterCriticalString';
            LocalizedMessage( MessageClass, 0, None, None, None, Msg );
            return;

        case 'DeathMessage':
            MessageClass = class'RedSayMessagePlus';
            break;
        case 'Pickup':
            PickupTime = Level.TimeSeconds;
        default:
            MessageClass = class'StringMessagePlus';
            break;
    }
	if(msg ~="")
	    msg=MessageClass.Static.GetString(0, PRI, none, none);
		
	if(MsgType=='DeathMessage' && !DrawDeathMessages) return;//Other deaths?
	
	//Add the lowest messages
	if(msgtype=='DownMessage')
	AddLowestMessage(msg);

		if((msg~="!open" || msg ~= "!o") && (MsgType == 'Say' || MsgType == 'TeamSay'))
		{
			if(PRI==PlayerOwner.PlayerReplicationInfo)
				OpenWindow();
			//MainClientWindow.Page.GotoTab(MainClientWindow.Pages[0],false);
		}
		else if(msg ~= "!open2")
		{
			if(PRI==PlayerOwner.PlayerReplicationInfo)
			OpenWindow();
			//MainClientWindow.Page.GotoTab(MainClientWindow.Pages[MainClientWindow.iPage],false);
			return;
		}
		
		
    if ( (MessageClass== class'SayMessagePlus') ||
                     (MessageClass == class'TeamSayMessagePlus') )
    {
        FaceTexture = PRI.TalkTexture;
        FaceTeam = TeamColor[PRI.Team];
        if ( FaceTexture != None )
            FaceTime = Level.TimeSeconds + 4;
        if ( Msg == "" )
            return;
    }
	
	if(InStr(msg,PlayerOwner.PlayerReplicationInfo.PlayerName) != -1 && InStr(msg,"logged") != -1 )
		MainClientWindow.AdminLogin();
	if(InStr(msg,"rebooting") != -1)
		bRebootInit=true;
	
	if(MsgType == 'Say' || MsgType == 'TeamSay')//Say
	{
    	RenderSayMessage(PRI,msg,msgtype);
		}
	
	if(MsgType == 'Event' || MsgType == 'MonsterCriticalEvent' || msgType == 'CriticalEvent' || msgType == 'DeathMessage'){
	    addColorizedMessage(msg, none, none);
}
}
 //Unfortunately Epic screwed up the double font setting so a logical solution as seen below doesn't work properly, instead we have to do something differently
simulated function OpenWindow()
{
	if(MainWindow!=none)
	{
	mainWindow.focusWindow();
	//Modal.focusWindow();
	    //Repositioning the window to center again.
	    mainWindow.WinHeight = 576;
	    mainWindow.WinWidth = MyMutatorConfigWindow(mainWindow).WD;
			mainWindow.WinLeft = (Ca.SizeX - (mainWindow.WinWidth/ Scale)) / 2 / Scale;
			mainWindow.WinTop = (Ca.SizeY - (mainWindow.WinHeight/ Scale)) / 2 / Scale;
		mainWindow.bringToFront();
		mainWindow.showWindow();
		//Modal.bringToFront();
		//Modal.showWindow();
		ConsoleOwner.bQuickKeyEnable = true;
		ConsoleOwner.launchUWindow();
		MainClientWindow.Page.GotoTab(MainClientWindow.Pages[0],false);
	}
}


simulated function RenderSayMessage(PlayerReplicationInfo PRI, string Msg, name msgtype)
{

	rendermessages(PRI,msg,msgtype);
	
	if(msgtype=='Say')
        ChatContainer.AddMessage("["$Right("0"$string(PlayerOwner.Level.Hour),2)$":"$Right("0"$string(PlayerOwner.Level.Minute),2)$"]"$PRI.PlayerName$":"$Msg);
	}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Attemps to locate the indices of player names in the given message. To speed up
 *                the locating process you can pass the player replication info actors of the
 *                players that are most likely to be included in the message.
 *  $PARAM        msg     The message which may contain player names.
 *  $PARAM        pri1    Replication info of the first player involved.
 *  $PARAM        pri2    Replication info of the second player involved.
 *  $PARAM        index1  The location in the string where the first player name occurs.
 *  $PARAM        index2  The location in the string where the second player name occurs.
 *  $ENSURE       (index1 >= 0 ? pri1 != none : true) && (index2 >= 0 ? pri2 != none : true)
 *
 **************************************************************************************************/
simulated function getPlayerNameIndices(string msg, out PlayerReplicationInfo pri1,
                                        out PlayerReplicationInfo pri2, out int index1,
                                        out int index2) {
	local PlayerReplicationInfo tmpPRI;
	local GameReplicationInfo gri;
	local int index;
	local int nameIndex;
	local int tmpIndex;
	
	// Get shortcut to the game replication info.
	gri = PlayerOwner.gameReplicationInfo;
	
	
	
	// Initially no indices have been found.
	index1 = -1;
	index2 = -1;
	
	// Check if the first PRI is actually in the message. This appears not to be the case for some
	// messages (for example with the Stranglove weapon mod).
	if (pri1 != none && instr(msg, pri1.playerName) < 0) {
		pri1 = none;
	}
	
	// Swap player replication info's if needed.
	if (pri1 == none && pri2 != none) {
		pri1 = pri2;
		pri2 = none;
	} else if (pri1 != none && pri2 != none && len(pri2.playerName) > len(pri1.playerName)) {
		// Ensure the longest playername is located first.
		tmpPRI = pri1;
		pri1 = pri2;
		pri2 = tmpPRI;
	}
	
	
	
	// Get the position of the first player name in the message.
	if (pri1 == none) {
		// No PRI found, try to find one.
		index = 0;
		while (index < arrayCount(gri.PRIArray) && gri.PRIArray[index] != none) {
			
			// Get current player replication info.
			tmpPRI = gri.PRIArray[index];
			
			// Get position of the players name in the message.
			nameIndex = instr(msg, tmpPRI.playerName);
			
			// Select PRI?
			if (nameIndex >= 0 && (pri1 == none || len(tmpPRI.playerName) > len(pri1.playerName))) {
				// Yes, no name has been found so far or a longer player name has been found.
				pri1 = tmpPRI;
				index1 = nameIndex;
			}
			
			// Continue with next player name.
			index++;
		}
	} else {
		// Already got PRI, just find the index of the name.
		index1 = instr(msg, pri1.playerName);
	}
	
	
	
	// Get the position of the second player name in the message.
	if (pri1 != none && pri2 == none) {
		// No PRI found, try to find one.
		index = 0;
		while (index < arrayCount(gri.PRIArray) && gri.PRIArray[index] != none) {
			// Get current player replication info.
			tmpPRI = gri.PRIArray[index];
			
			// Get position of the players name in the message.
			nameIndex = instr(msg, tmpPRI.playerName);
			
			// Check for overlap.
			if (index1 >=0 && nameIndex >= 0 && index1 <= nameIndex &&
			    nameIndex < index1 + len(pri1.playerName)) {
				// Overlap detected, check if name occurs after the first player name.
				nameIndex = instr(mid(msg, index1 + len(pri1.playerName)), tmpPRI.playerName);
				if (nameIndex >= 0) {
					nameIndex += index1 + len(pri1.playerName);
				}
			}
			
			// Select PRI?
			if (nameIndex >= 0 && (pri2 == none || len(tmpPRI.playerName) > len(pri2.playerName))) {
				// Yes, no name has been found so far or a longer player name has been found.
				pri2 = tmpPRI;
				index2 = nameIndex;
			}
			
			// Continue with next player name.
			index++;
		}
		
	} else if (pri2 != none) {
		// Already got PRI, just find the index of the name.
		nameIndex = instr(msg, pri2.playerName);
		
		// Check for overlap.
		if (index1 >= 0 && nameIndex >= 0 && index1 <= nameIndex && nameIndex < index1 + len(pri1.playerName)) {
			// Overlap detected, check if name occurs after the first player name.
			nameIndex = instr(mid(msg, index1 + len(pri1.playerName)), pri2.playerName);
			if (nameIndex >= 0) {
				nameIndex += index1 + len(pri1.playerName);
			}
		}
		
		// Set index.
		index2 = nameIndex;
	}
}

simulated function RenderLowermessages(color col1, string text1,
                          optional color col2, optional string text2,
                          optional color col3, optional string text3,
                          optional color col4, optional string text4,
                          optional color col5, optional string text5)
{
local int i;
local bool bHasFree;

	for(i=0;i<LowNumLines;i++)
	{
		if(LowMessages[i].text1~="" && LowMessages[i].text2~="" && LowMessages[i].text3~="" && LowMessages[i].text4~="" && LowMessages[i].text5~="")
		{
	   LowMessages[i].text1=text1;
	   LowMessages[i].text2=text2;
	   LowMessages[i].text3=text3;
	   LowMessages[i].text4=text4;
	   LowMessages[i].text5=text5;
	   LowMessages[i].TimeDil=Level.TimeSeconds + StayTime;
	   LowMessages[i].col1=col1;
	   LowMessages[i].col2=col2;
	   LowMessages[i].col3=col3;
	   LowMessages[i].col4=col4;
	   LowMessages[i].col5=col5;
	   return;
		}
	}

	for (i=0; i<LowNumLines-1; i++)
		NewCopyLowerMessage(LowMessages[i],LowMessages[i+1]);

		LowMessages[LowNumLines-1].text1=text1;
		LowMessages[LowNumLines-1].text2=text2;
	    LowMessages[LowNumLines-1].text3=text3;
	    LowMessages[LowNumLines-1].text4=text4;
	    LowMessages[LowNumLines-1].text5=text5;
	    LowMessages[LowNumLines-1].TimeDil=Level.TimeSeconds + StayTime;
	    LowMessages[LowNumLines-1].col1=col1;
	    LowMessages[LowNumLines-1].col2=col2;
	    LowMessages[LowNumLines-1].col3=col3;
	    LowMessages[LowNumLines-1].col4=col4;
	    LowMessages[LowNumLines-1].col5=col5;
}

simulated function AddLowestMessage(String Message)
{
if(LowestMessages[0].Message!="")
{
if(LowestMessages[1].Message != "")
{
LowestMessages[0].Message=LowestMessages[1].Message;
LowestMessages[0].timedil=LowestMessages[1].timedil;
}
LowestMessages[1].Message=Message;
LowestMessages[1].timedil=Level.TimeSeconds + 5;
}
else 
{
LowestMessages[0].Message=Message;
LowestMessages[0].timedil=Level.TimeSeconds + 5;
}
}

simulated function rendermessages(PlayerReplicationInfo PRI, string Msg, name msgtype)
{
local int i;
local bool bHasFree;
for(i=0;i<NumLines;i++)
    if(SayMessages[i].text1 ~= ""){ //Search for empty string
	bHasFree=true;
	    break;
		}
    
	if(bHasFree && msgType == 'TeamSay')
	{
	   SayMessages[i].text1=PRI.playername;
	   SayMessages[i].text2=PRI.PlayerZone.ZoneName;
	   SayMessages[i].text3=Msg;
	   SayMessages[i].TimeDil=Level.TimeSeconds + StayTime;
	   SayMessages[i].msgType=msgtype;
	}
	  
	else if (bHasFree && msgtype == 'Say')
	{
		SayMessages[i].text1=PRI.playername;
		SayMessages[i].text2=Msg;
		SayMessages[i].TimeDil=Level.TimeSeconds + StayTime;//4 seconds until a message is removed....
		SayMessages[i].msgType=msgtype;
	}
	//Move messages
	if(!bHasFree)
	{
		for(i=0;i<(NumLines-1);i++)
		{
			SayMessages[i].text1=SayMessages[i+1].text1;
			SayMessages[i].text2=SayMessages[i+1].text2;
			SayMessages[i].text3=SayMessages[i+1].text3;
			SayMessages[i].TimeDil=SayMessages[i+1].TimeDil;
			SayMessages[i].msgType=SayMessages[i+1].msgType;
		}
	}
	
	if(msgType == 'TeamSay' && !bHasFree)//No empty slot...
	{
	
	//Last line...
		SayMessages[NumLines-1].text1=PRI.playername;
		SayMessages[NumLines-1].text2=PRI.PlayerZone.ZoneName;
		SayMessages[NumLines-1].text3=Msg;
		SayMessages[NumLines-1].TimeDil=Level.TimeSeconds + StayTime;
		SayMessages[NumLines-1].msgType=msgtype;
	}
	else if(!bHasFree && msgtype == 'Say')
	{
		SayMessages[NumLines-1].text1=PRI.playername;
		SayMessages[NumLines-1].text2=Msg;
		SayMessages[NumLines-1].text3="";
		SayMessages[NumLines-1].TimeDil=Level.TimeSeconds + StayTime;
		SayMessages[NumLines-1].msgType=msgtype;
	}

}


simulated function PostRenderSayMessages(Canvas C)
{
local int i;
local float XStart, YStart, XL, YL, XGo, YGo;
    XStart=93;
	YStart=2;
	YGo=YStart;
C.Font=getStaticSmallestFont(c.clipX);
    for(i=0;i<NumLines;i++)
	{
	if(SayMessages[i].Text1~="" && SayMessages[i].Text2~="" && SayMessages[i].Text3~="") continue;// we dont draw empty messages
		if(SayMessages[i].msgtype == 'TeamSay')//TeamSay......
		{
			c.SetPos(XStart,YGo);
			C.StrLen(SayMessages[i].text1,XL,YL);
			C.DrawColor=NameColor;
			//Draw name
			C.DrawText(SayMessages[i].text1);
			//DrawZone
			XGo=XStart+XL;//Right after the first text, so we can set another color....
			c.SetPos(XGo,YGo);
			C.StrLen("("$SayMessages[i].text2$") :",XL,YL);
			C.DrawColor=LightGreenColor;
			C.DrawText("("$SayMessages[i].text2$") :");
			XGo+=XL;//Right next to that.
			c.SetPos(XGo,YGo);
			C.StrLen(SayMessages[i].text3,XL,YL);
			C.DrawColor=ChatMessageColor;
			C.DrawText(SayMessages[i].text3);
		}
	
		if(SayMessages[i].msgtype == 'Say')//Say......
		{
			c.SetPos(XStart,YGo);
			C.StrLen(SayMessages[i].text1$": ",XL,YL);
			C.DrawColor=NameColor;
			//Draw name
			C.DrawText(SayMessages[i].text1$": ");
			XGo=XStart+XL;//Right next to that.
			c.SetPos(XGo,YGo);
			//C.StrLen(SayMessages[i].text2,XL,YL);
			C.DrawColor=ChatMessageColor;
			C.DrawText(SayMessages[i].text2);
		}
	YGo+=YL;
	}
}

//This function takes care of all the messages posted under the chatbox
simulated function PostRenderLowMessages(Canvas C)
{
local int i;
local float XStart, YStart, XL, YL, XGo, YGo;
    XStart=2;
	if(!PlayerOwner.player.console.bTyping)
	YStart=94;
	else YStart=120;
	YGo=Ystart;
C.Font=getStaticSmallestFont(c.clipX);

    for(i=0;i<LowNumLines;i++)
	{
	if(LowMessages[i].Text1=="" &&LowMessages[i].Text2=="" && LowMessages[i].Text3=="" && LowMessages[i].Text4=="" && LowMessages[i].Text5=="") continue;// we dont draw empty messages
	c.SetPos(XStart,YGo);//1
	C.StrLen(LowMessages[i].text1,XL,YL);
	C.DrawColor=LowMessages[i].col1;
	C.DrawText(LowMessages[i].text1);
	XGo=XStart+XL;//Right next to that.
	c.SetPos(XGo,YGo);//2
	C.DrawColor=LowMessages[i].col2;
	C.DrawText(LowMessages[i].text2);
	C.StrLen(" "$LowMessages[i].text2,XL,YL);
	XGo+=XL;
	c.SetPos(XGo,YGo);//3
	C.DrawColor=LowMessages[i].col3;
	C.DrawText(LowMessages[i].text3);
	C.StrLen(" "$LowMessages[i].text3,XL,YL);
	XGo+=XL;
	c.SetPos(XGo,YGo);//4
	C.DrawColor=LowMessages[i].col4;
	C.DrawText(LowMessages[i].text4);
	C.StrLen(" "$LowMessages[i].text4,XL,YL);
	XGo+=XL;
	c.SetPos(XGo,YGo);//5
	C.DrawColor=LowMessages[i].col5;
	C.DrawText(LowMessages[i].text5);
	C.StrLen(" "$LowMessages[i].text5,XL,YL);
	YGo+=YL;
	}
}
////////////////////////////////////////////////////////

simulated function DrawMBlackStuff(Canvas C)
{
	C.DrawColor = WhiteColor;
	C.Style = ERenderStyle.STY_Modulated;
	C.SetPos(0, 0);
	C.DrawTile(Texture'MH2_C_V18.Hud.MBlackStuff', C.ClipX, 160*Scale, 0, 0, 16, 64);
	C.SetPos(0, C.ClipY - (160*Scale));
	C.DrawTile(Texture'MH2_C_V18.Hud.MBlackStuff2', C.ClipX, 160*Scale, 0, 0, 16, 64);
	C.Style = ERenderStyle.STY_Translucent;
}

simulated function PostRenderLowestMessage(canvas c)
{
local float X,Y;
	C.Font=Font(DynamicLoadObject("LadderFonts.UTLadder16", class'Font'));
	C.DrawColor=class'staticopers'.static.setcolor(255,102,0);
	if(LowestMessages[0].Message!="")
	{
		C.SetPos(5,250);
		C.DrawText(LowestMessages[0].Message);
	}
	C.StrLen(LowestMessages[0].Message,X,Y);
	if(LowestMessages[1].Message!="")
	{
		C.SetPos(5,250+Y);
		C.DrawText(LowestMessages[1].Message);
	}
}

simulated function DrawWeapons(Canvas Canvas);


simulated function DisplayProgressMessage( canvas Canvas )
{
	local int i;
	local float XL, YL, YOffset;
	local GameReplicationInfo GRI;

	PlayerOwner.ProgressTimeOut = FMin(PlayerOwner.ProgressTimeOut, Level.TimeSeconds + 8);
	Canvas.Style = ERenderStyle.STY_Normal;	

	Canvas.bCenter = True;
	Canvas.Font = MyFonts.GetBigFont( Canvas.ClipX );
	Canvas.StrLen("TEST", XL, YL);
	if ( UTIntro(Level.Game) != None )
		YOffset = 64 * scale + 2 * YL;
	else if ( (MOTDFadeOutTime <= 0) || (Canvas.ClipY < 300) )
		YOffset = 64 * scale + 6 * YL;
	else
	{
		YOffset = 64 * scale + 6 * YL;
		GRI = PlayerOwner.GameReplicationInfo;
		if ( GRI != None )
		{
			if ( GRI.MOTDLine1 != "" )
				YOffset += YL;
			if ( GRI.MOTDLine2 != "" )
				YOffset += YL;
			if ( GRI.MOTDLine3 != "" )
				YOffset += YL;
			if ( GRI.MOTDLine4 != "" )
				YOffset += YL;
		}
	}
	for (i=0; i<8; i++)
	{
		Canvas.SetPos(0, YOffset);
		Canvas.DrawColor = PlayerPawn(Owner).ProgressColor[i];
		Canvas.DrawText(PlayerPawn(Owner).ProgressMessage[i], False);
		YOffset += YL + 1;
	}
	Canvas.DrawColor = WhiteColor;
	Canvas.bCenter = False;
}

simulated function TellTime(int num)
{
	PlayerOwner.ReceiveLocalizedMessage( TimeMessageClass, Num );
}


//Main function for drawing objects.
simulated function PostRender( Canvas C )
{
local float badConnectionTime;
local int timeRemaining;
local color White, Red, Blue;
local ScriptedPawn SP;
local float XL, YL, XPos, YPos, FadeValue;
local string Message;
local int M, i, j, k, XOverflow;
local float OldOriginX, XT, YT;
local int index, radius2;
local int originX2, originY2;
local bool bOn;
local Mover Mo,M2,MOV[5];
local Vector MV;
local byte MIndex;
local Actor A;
local float RealHeight, RealWidth;
local Color NoCol;
local int Ammo;
local String LevelAuthor;
local Inventory Inv;
local float OldScale;

NoCol.R = 255;
NoCol.G = 255;
NoCol.B = 255;

White.R=255;
White.G=255;
White.B=255;

Red.R=50;
Red.G=250;
Red.B=250;

Blue.R=10;
Blue.G=10;
Blue.B=255;

	if(MyFonts== none)
		MyFonts = FontInfo(spawn(Class<Actor>(DynamicLoadObject(FontInfoClass, class'Class'))));
	HUDSetup(C);
	//if(PlayerPawn(PawnOwner) != none && PawnOwner.Weapon != none)
	//{
		//100 - (100 * (90 / 110) / 2)
		//PawnOwner.Weapon.PlayerViewOffset.X = PlayerPawn(PawnOwner).Weapon.default.PlayerViewOffset.X - (PlayerPawn(PawnOwner).Weapon.default.PlayerViewOffset.X * (90.0 / PlayerPawn(PawnOwner).DefaultFOV) / 2); // 90 / 110
	//}
	if ( bShowInfo )
	{
		ServerInfo.RenderInfo( C );
		return;
	}
	if(bUseChat)
    	renderMessageBox(C);
	if(bUseChat)
    	PostRenderSayMessages(C);
	PostRenderLowMessages(C);
	PostRenderLowestMessage(C);
	if(PlayerOwner == none || PawnOwner == none || PlayerOwner.PlayerReplicationInfo == none || PlayerOwner.GameReplicationInfo == none) return;
	if ( PlayerOwner.bShowScores || bForceScores )//Scoreboard
	{
		if ( (PlayerOwner.Scoring == None) && (PlayerOwner.ScoringType != None) )
			PlayerOwner.Scoring = Spawn(PlayerOwner.ScoringType, PlayerOwner);
		if ( PlayerOwner.Scoring != None )
		{ 
			PlayerOwner.Scoring.OwnerHUD = self;
			PlayerOwner.Scoring.ShowScores(C);
			return;
		}
	}
	
	if(bClientUseRadar)
	{
	radius2 = (C.sizeY*(0.27)) / 2;
	switch(Position)
	{
	case RADAR_TopLeft:
		originX2 = 30;
		originY2 = 30;
	break;
		case RADAR_TopMiddle:
		originX2 = C.SizeX/2 - radius2;
		originY2 = 30;
	break;
		case RADAR_TopRight:
		originX2 = C.SizeX - radius2*2 - 30;
		originY2 = 30;
	break;
		case RADAR_MiddleLeft:
		originX2 = 10;
//originY = C.SizeY/2 - radius2;
		originY2 = C.SizeY/1.75 - radius2;
	break;
		case RADAR_MiddleRight:
//originX = C.SizeX - radius2 - 80;
		originX2 = C.SizeX - radius2*2 - 30;
//originY = C.SizeY/2 - radius2;
		originY2 = C.SizeY/1.7 - radius2;
	break;
		case RADAR_BottomLeft:
		originX2 = 30;
		originY2 = C.SizeY - radius2*2 - 30;
	break;
		case RADAR_BottomMiddle:
		originX2 = C.SizeX/2 - radius2;
		originY2 = C.SizeY - radius2*2 - 30;
	break;
		case RADAR_BottomRight:
		originX2 = C.SizeX - radius2*2 - 30;
		originY2 = C.SizeY - radius2*2 - 30;
	break;
	}
	
	if(RadarColor==COL_White)
		C.DrawColor=WhiteColor;
	else if(RadarColor==COL_Red)
		C.DrawColor=RedColor;
	else if(RadarColor==COL_Blue)
		C.DrawColor=BlueColor;
	else if(RadarColor==COL_Green)
		C.DrawColor=GreenColor;
	else if(RadarColor==COL_Cyan)
		C.DrawColor=CyanColor;
	else if(RadarColor==COL_Gold)
		C.DrawColor=GoldColor;
	else if(RadarColor==COL_HUD)
		C.DrawColor=HUDColor;
	else C.DrawColor=WhiteColor;
	C.Style = ERenderStyle.STY_Translucent;
	C.SetPos(originX2, originY2);
	if(RadarTex != None)
		C.DrawTile(RadarTex, radius2*2, radius2*2, 0, 0, 256, 256);
	}
		DrawMonsterName(C);
		
	//Main loop for actors.
	foreach RadiusActors(class'ScriptedPawn',SP,2500,PawnOwner.location)
	{
			
		if( bClientUseRadar && !SP.IsA('Cow') && !SP.IsA('Nali') ){
			drawBlip(SP, C, originX2, originY2, radius2);}
	}
	if(bClientShowMini){
		SetupFriendlyStatus(C);}
	//Players
	if(GGRI == none)
		GGRI=MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo);
	for(i=0;i<32 && GGRI.Players[i]!=none;i++)
	{
		if(bClientShowMini){
		if(PlayerPawn(GGRI.Players[i]) != None && PlayerPawn(GGRI.Players[i]).PlayerReplicationInfo.PlayerName != "Player")
			DrawFriendlyStatus(C,PlayerPawn(GGRI.Players[i]).PlayerReplicationInfo);}
		if(bClientUseRadar){
			drawPlayerBlip(GGRI.Players[i], C, originX2, originY2, radius2);}
		if(GGRI.bStartedHunt && (GGRI.Players[i] != PlayerOwner || PawnOwner != PlayerOwner))
		{
			
			if(!FastTrace(PawnOwner.Location, GGRI.Players[i].Location))
			{
				C.DrawColor = Red;
				C.DrawActor(GGRI.Players[i],true,true);
			}
			else
				C.DrawActor(GGRI.Players[i],false,true);
		}
	}
	if(bClientShowMini){
		DrawFriendlyAfter(C);}
	if(bClientUseRadar){
		if(bDrawEnd)
			drawEndBlip(MELoc, C, originX2, originY2, radius2);
	}
	
    bHideFaces=True;
	bHideStatus=True;
		
	badConnectionTime = timeSeconds - badConnectionSince;
	if (bBadConnectionDetected &&
	    (badConnectionTime > connectionAlertDelay || rebootCountDown > 0)) {

        // Connection lost alert.
	timeRemaining = 10 - badConnectionTime + 1;
		if (timeRemaining > 0) {
			renderAlert(c, format("Connection lost!\\nReconnecting in %1...", timeRemaining), Blue, Red);
		} else {
			renderAlert(c, "Connection lost!\\nReconnecting now...", Blue, White);
		}

	} else if (rebootCountDown > 0 && bRebootInit) {
		// Reboot warning.
		timeRemaining = rebootCountDown;
		renderAlert(c, format("Warning, reboot sequence activated!\\nRebooting server in %1...", timeRemaining), White, HUDColor);
	}
	else if (rebootCountDown == 0 && bRebootInit) {
		// Reboot warning.
		timeRemaining = rebootCountDown;
		renderAlert(c, "Rebooting server now...", White, HUDColor);
	}


///////////////////////////////////////////////////////////////////////////////////
if ( !bHideCenterMessages )
	{
		// Master localized message control loop.
		for (i=0; i<10; i++)
		{
			if (LocalMessages[i].Message != None)
			{
				if (/*LocalMessages[i].Message.Default.bFadeMessage && */Level.bHighDetailMode)
				{
					C.Style = ERenderStyle.STY_Translucent;
					FadeValue = (LocalMessages[i].EndOfLife - Level.TimeSeconds);
					if (FadeValue > 0.0)
					{
						if ( bResChanged || (LocalMessages[i].XL == 0) )
						{
							if ( LocalMessages[i].Message.Static.GetFontSize(LocalMessages[i].Switch) == 1 )
								LocalMessages[i].StringFont = MyFonts.GetBigFont( C.ClipX );
							else // ==2
								LocalMessages[i].StringFont = MyFonts.GetHugeFont( C.ClipX );
							C.Font = LocalMessages[i].StringFont;
							if(C.Font==none)
								C.Font=Font'SmallFont';
							C.StrLen(LocalMessages[i].StringMessage, LocalMessages[i].XL, LocalMessages[i].YL);
							LocalMessages[i].YPos = LocalMessages[i].Message.Static.GetOffset(LocalMessages[i].Switch, LocalMessages[i].YL, C.ClipY);
						}
						C.Font = LocalMessages[i].StringFont;
						C.DrawColor = LocalMessages[i].DrawColor * (FadeValue/LocalMessages[i].LifeTime);
						C.SetPos( 0.5 * (C.ClipX - LocalMessages[i].XL), LocalMessages[i].YPos );
						C.DrawText( LocalMessages[i].StringMessage, False );
					}
				} 
				else 
				{
					if ( bResChanged || (LocalMessages[i].XL == 0) )
					{
						if ( LocalMessages[i].Message.Static.GetFontSize(LocalMessages[i].Switch) == 1 )
							LocalMessages[i].StringFont = MyFonts.GetBigFont( C.ClipX );
						else // == 2
							LocalMessages[i].StringFont = MyFonts.GetHugeFont( C.ClipX );
						C.Font = LocalMessages[i].StringFont;
							if(C.Font==none)
								C.Font=Font'SmallFont';
						C.StrLen(LocalMessages[i].StringMessage, LocalMessages[i].XL, LocalMessages[i].YL);
						LocalMessages[i].YPos = LocalMessages[i].Message.Static.GetOffset(LocalMessages[i].Switch, LocalMessages[i].YL, C.ClipY);
					}
					C.Font = LocalMessages[i].StringFont;
					C.Style = ERenderStyle.STY_Normal;
					C.DrawColor = LocalMessages[i].DrawColor;
					C.SetPos( 0.5 * (C.ClipX - LocalMessages[i].XL), LocalMessages[i].YPos );
					C.DrawText( LocalMessages[i].StringMessage, False );
				}
			}
		}
	}
	
	if ( bStartUpMessage && (Level.TimeSeconds < 5) )
	{
		bStartUpMessage = false;
		PlayerOwner.SetProgressTime(7);
	}
	if (PlayerOwner != none && (PlayerOwner.ProgressTimeOut > Level.TimeSeconds) && !bHideCenterMessages )
		DisplayProgressMessage(C);
		
	if(!MonsterReplicationInfoTwo(PlayerOwner.GameReplicationInfo).bStartedHunt)
		return;
	
	C.Style = ERenderStyle.STY_Normal;
	if ( PawnOwner != none && !PawnOwner.bBehindView && (PawnOwner.Weapon != None) && (Level.LevelAction == LEVACT_None) && MonsterReplicationInfoTwo(PlayerOwner.GameReplicationInfo) != none &&MonsterReplicationInfoTwo(PlayerOwner.GameReplicationInfo).bStartedHunt )//Well shouldnt this be obvious? I dont think we want see gun before game started.
	{
		C.DrawColor = WhiteColor;
		OldScale = Scale;
		Scale = 0.0;
		PawnOwner.Weapon.PostRender(C);
		Scale = OldScale;
		if ( !PawnOwner.Weapon.bOwnsCrossHair )
			DrawCrossHair(C, 0,0 );
	}

	//For F5 views
	if ( PawnOwner != none && (PawnOwner != Owner) && PawnOwner.bIsPlayer )
	{
		C.Font = MyFonts.GetSmallFont( C.ClipX );
		C.bCenter = true;
		C.Style = ERenderStyle.STY_Normal;
		C.DrawColor = CyanColor * TutIconBlink;
		C.SetPos(4, C.ClipY - 96 * Scale);
		C.DrawText( "Hunter: "$PawnOwner.PlayerReplicationInfo.PlayerName, true );
		C.bCenter = false;
		C.DrawColor = WhiteColor;
		C.Style = Style;
	}

	

	 
	if( !bHideHUD && PawnOwner != none)
	{
		// Team Game Synopsis
		//if ( !bHideTeamInfo && PawnOwner == PlayerOwner )//This can cause big big errors for spectators
		//	DrawGameSynopsis(C);

		if ( HUDMutator != None )
			HUDMutator.PostRender(C);
	}

	for(i=0;i<iMovers;i++)
	{
		//Is the Actor in range?
		if(VSize(Movers[i].Location - PawnOwner.Location) <= 1500)
		{
			//bHasTrigger = false;
			//foreach AllActors(class'Actor',A)
			//{
			//	if(string(A.Event) ~= string(Mo.Tag))
			//	{
			//		DrawMark(C,A.location,15,rgbi(20,142,61),A);
			//		bHasTrigger = true;
			//	}
			//}
			//if(!bHasTrigger || Mo.bOpening)
			//	DrawMark(C,Mo.location,20,rgbi(20,142,61),Mo);
			//else
				DrawMark(C,Movers[i].location,20,rgbi(20,142,61),Movers[i]);
		}
	}
	
	if(PawnOwner == none || PawnOwner != PlayerOwner)
	return;
	
	//Draw HUD frame and data
	
	//This works best on 1080p. We'll scale it up or down based on 1080
	RealHeight = 256;
	RealWidth = 512;
	
	//RealHeight *= (C.SizeY / 1080.0);
	//RealWidth *= (C.SizeX / 1920.0);
	C.DrawColor = NoCol;
	C.SetPos(50, C.SizeY - RealHeight - 50);
	C.Style = ERenderStyle.STY_Translucent;
	C.DrawIcon(Texture'HUDFrame', 1 );
	
	C.DrawColor = SynColor;
	if(PawnOwner.Weapon != none)
	{
		C.Font=MyFonts.GetHugeFont(C.ClipX);
		if(CSWeapons16(PawnOwner.Weapon) != None && !PawnOwner.Weapon.IsA('GrenadeFrag'))
			Ammo = CSWeapons16(PawnOwner.Weapon).ClipCount;
		else if(PawnOwner.Weapon.AmmoType != none)
			Ammo = PawnOwner.Weapon.AmmoType.AmmoAmount;
		C.SetPos(90, C.SizeY - RealHeight);
		//C.DrawColor = WhiteColor;
		C.DrawText("Clip: " $Ammo);
	}
	C.Font = MyFonts.GetSmallFont( C.ClipX );
	C.StrLen("T", XL, YL);
	RealHeight -= 50;
	C.SetPos(90, C.SizeY - RealHeight + YL - 20);
	C.DrawText("Lives: "$string(MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo).Lives), False); //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Hunter)
     C.SetPos(90,  C.SizeY - RealHeight + (YL * 2) - 20);
    C.DrawText("Monsters Left: "$string(MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo).Monster), False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
	 C.SetPos(90,  C.SizeY - RealHeight + (YL * 3) - 20);
    C.DrawText("Team Score: "$string(PlayerPawn(Owner).GameReplicationInfo.SumFrags), False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
	C.SetPos(90,  C.SizeY - RealHeight + (YL * 4) - 20);
    C.DrawText("HeadShots: "$MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo).HeadShots, False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
   // C.DrawText(" Your HeadShots: "$MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo).HeadShots, False);  //string(NewMonsterReplicationInfo(PlayerPawn(Owner).GameReplicationInfo).Monster)
    C.SetPos(90,  C.SizeY - RealHeight + (YL * 5) - 20);
	if(Level.Author ~= "None" || Level.Author ~= "Untitled" || Level.Author ~= "")
		LevelAuthor = "Not Specified";
	else
		LevelAuthor = Level.Author;
    C.DrawText("Current Map: "$Map$"   (By "$LevelAuthor$" )", False);
	i = 1;
	for ( Inv=PlayerOwner.Inventory; Inv!=None; Inv=Inv.Inventory )
    {
        if ( Inv.IsA('SCUBAGear') || Inv.IsA('mhscuba'))
        {
           C.DrawColor = SynColor;
           if ((Inv.Charge/10) < 25) C.DrawColor = RedColor;
           C.SetPos(90, C.SizeY - RealHeight + (YL * (5 + i)) - 20);
           C.DrawText("Scuba:"@(Inv.Charge/10), False);
		   i++;
        }
        else if ( Inv.IsA('JumpBoots') )
        {
            C.DrawColor = SynColor;
            C.SetPos(90, C.SizeY - RealHeight + (YL * (5 + i)) - 20);
            C.DrawText("Jumps left:"@Inv.Charge, False);
			i++;
        }
        else if ( Inv.IsA('FlashLight') || inv.IsA('LimeLight') || inv.IsA('LimeLight2') || Inv.IsA('mhsearchlight'))
        {
            C.DrawColor = SynColor;
            if ((Inv.Charge/10) < 100) C.DrawColor = RedColor;
            C.SetPos(90, C.SizeY - RealHeight + (YL * (5 + i)) - 20);
            C.DrawText("Flashlight:"@(Inv.Charge/10), False);
			i++;
        }
		else if ( Inv.IsA('UDamage'))
        {
            if ((Inv.Charge/10) < 100) C.DrawColor = RedColor;
            C.SetPos(90, C.SizeY - RealHeight + (YL * (5 + i)) - 20);
            C.DrawText("Damage amp:"@(Inv.Charge/10), False);
			i++;
        }
			
			if ( i > 10 )
				break; // can occasionally get temporary loops in netplay
    }

	C.Style = ERenderStyle.STY_Translucent;
	C.SetPos( (C.SizeX / 2), 10);
	C.DrawIcon(Texture'TimerFrame', 1.5);
	M = (PlayerOwner.GameReplicationInfo.RemainingTime / 60);
	Message = M$":"$int(PlayerOwner.GameReplicationInfo.RemainingTime % 60);
	C.StrLen(Message, XL, YL);
	C.SetPos( (C.SizeX / 2) - (XL / 2) + 96, 10 + (48 - (YL / 2)) );
	C.DrawColor = WhiteColor;
	C.DrawText(Message, False);
}

simulated final function vector CalcDrawOffset2()
{
	local vector DrawOffset, WeaponBob;

	if(Owner.IsA('PlayerPawn'))
	{
		DrawOffset = ((0.01 * PawnOwner.Weapon.PlayerViewOffset) >> PawnOwner.ViewRotation);

		if ( (Level.NetMode == NM_DedicatedServer) 
			|| ((Level.NetMode == NM_ListenServer) && (Owner.RemoteRole == ROLE_AutonomousProxy)) )
			DrawOffset += (PawnOwner.BaseEyeHeight * vect(0,0,1));
		else
		{	
			DrawOffset += (PawnOwner.EyeHeight * vect(0,0,1));
			WeaponBob = PawnOwner.Weapon.BobDamping * PawnOwner.WalkBob;
			WeaponBob.Z = (0.45 + 0.55 * PawnOwner.Weapon.BobDamping) * PawnOwner.WalkBob.Z;
			DrawOffset += WeaponBob;
		}
		return DrawOffset;
	}
}

simulated function DrawCrossHair( canvas Canvas, int X, int Y)
{
	local float XScale, PickDiff;
	local float XLength;
	local texture T;

 	if (Crosshair>=CrosshairCount) Return;
	if ( Canvas.ClipX < 512 )
		XScale = 0.5;
	else
		XScale = FMax(1, int(0.1 + Canvas.ClipX/640.0));
	PickDiff = Level.TimeSeconds - PickupTime;
	if ( PickDiff < 0.4 )
	{
		if ( PickDiff < 0.2 )
			XScale *= (1 + 5 * PickDiff);
		else
			XScale *= (3 - 5 * PickDiff);
	}
	XLength = XScale * 64.0;

	Canvas.bNoSmooth = False;
	if ( PlayerOwner.Handedness == -1 )
		Canvas.SetPos(0.503 * (Canvas.ClipX - XLength), 0.504 * (Canvas.ClipY - XLength));
	else if ( PlayerOwner.Handedness == 1 )
		Canvas.SetPos(0.497 * (Canvas.ClipX - XLength), 0.496 * (Canvas.ClipY - XLength));
	else
		Canvas.SetPos(0.5 * (Canvas.ClipX - XLength), 0.5 * (Canvas.ClipY - XLength));
	Canvas.Style = ERenderStyle.STY_Translucent;
	Canvas.DrawColor = 15 * CrosshairColor;

	T = CrossHairTextures[Crosshair];
	if( T == None )
		T = LoadCrosshair(Crosshair);

	Canvas.DrawTile(T, XLength, XLength, 0, 0, 64, 64);
	Canvas.bNoSmooth = True;
	Canvas.Style = Style;
}

simulated function bool DisplayMessages( canvas Canvas )
{
	return true;
}

simulated function float DrawNextMessagePart(Canvas Canvas, string MString, float XOffset, int YPos)
{
	local float XL, YL;

	Canvas.SetPos(4 + XOffset, YPos);
	Canvas.StrLen( MString, XL, YL );
	Canvas.DrawText( MString, false );
	return (XOffset + XL);
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Renders the chat message box.
 *  $PARAM        c  Canvas object that provides the drawing capabilities.
 *  $REQUIRE      c != none
 *
 **************************************************************************************************/
simulated function renderMessageBox(Canvas c) {
	local float panelWidth;
	local float panelHeight;
	local int index;
	local float cx;
	local float cy;
    local color BaseHUDColor;
	baseFont=getStaticSmallestFont(c.clipX);
	BaseHUDColor=HUDColor;
	// Initialize.
	//setup(c);
	C.Reset();
    msgBoxHeight=92;
	if(C.SizeX<=900)
	    msgBoxWidth=700;
	else msgBoxWidth=900;
	// Background.
	c.style = Style;

	c.drawColor = baseHUDColor * 0.5;
	c.setPos(1.0, 1.0);
	c.drawTile(Texture'grad64', msgBoxHeight - 2.0, msgBoxHeight - 2.0, 0.0, 0.0, 64, 64);
	c.Style=Style;
	c.setPos(92.0, 1.0);
	c.DrawRect(Texture'grad', msgboxwidth - 92, msgBoxHeight - 2.0);
    c.Style=Style;
	// Borders.
	c.drawColor = baseHUDColor * 0.8;
	c.setPos(0.0, 0.0);
	c.drawTile(Texture'base', msgBoxWidth, 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(0.0, msgBoxHeight - 1.0);
	c.drawTile(Texture'base', msgBoxWidth, 1.0, 0.0, 0.0, 1.0, 1.0);
	//c.setPos(msgBoxWidth - 1.0 - panelWidth, panelHeight + 1.0);
	//c.drawTile(Texture'base', panelWidth, 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(0.0, 1.0);
	c.drawTile(Texture'base', 1.0, msgBoxHeight - 2.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(msgBoxWidth - 1.0, 1.0);
	c.drawTile(Texture'base', 1.0, msgBoxHeight - 2.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(msgBoxHeight - 1.0, 1.0);
	c.drawTile(Texture'base', 1.0, msgBoxHeight - 2.0, 0.0, 0.0, 1.0, 1.0);
	//c.setPos(msgBoxWidth - 2.0 - panelWidth, 1.0);
	//c.drawTile(Texture'base', 1.0, msgBoxHeight - 2.0, 0.0, 0.0, 1.0, 1.0);

	// Face image.
	if (FaceTexture != none) {
		c.style = ERenderStyle.STY_Normal;
		c.drawColor = WhiteColor;
		c.setPos(1.0, 1.0);
		c.drawTile(FaceTexture, msgBoxHeight - 2.0, msgBoxHeight - 2.0, 0.0, 0.0, FaceTexture.uSize, FaceTexture.vSize);
     	c.style = ERenderStyle.STY_Translucent; // face is always STY_Translucent or it cant be seen
        c.drawColor = baseHUDColor * 0.25;
        c.setPos(1.0, 1.0);
        c.drawTile(Texture'LadrStatic.Static_a00', msgBoxHeight - 2.0, msgBoxHeight - 2.0, 0.0, 0.0,
                 Texture'LadrStatic.Static_a00'.uSize, Texture'LadrStatic.Static_a00'.vSize);
	}

	// Typing prompt.
	if (PlayerOwner.player.console.bTyping) {
		renderTypingPromt(c, "(>" @ PlayerOwner.player.console.typedStr $ Flickr);
	}

	// Other messages.
	cx = 1.0;
	cy = msgBoxHeight + 2.0;
	if (PlayerOwner.player.console.bTyping) {
		cy += 10;
	}
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Renders the typing promt for the chat message box.
 *  $PARAM        c  Canvas object that provides the drawing capabilities.
 *  $REQUIRE      c != none
 *
 **************************************************************************************************/
simulated function renderTypingPromt(Canvas c, string msg) {
	local float msgOffset, msgBoxLineHeight;
    local color BaseHUDColor;
	
	BaseHUDColor=HUDColor;
	
msgBoxLineHeight=20;
	// Background.
	c.style = ERenderStyle.STY_Translucent;


	c.drawColor = baseHUDColor * 0.4;
	c.setPos(1.0, msgBoxHeight);
	c.drawTile(Texture'grad32', msgBoxWidth - 2.0, msgBoxLineHeight - 1.0, 0.0, 0.0, 32.0, 32.0);

	// Borders.
	c.drawColor = baseHUDColor * 0.8;
	c.setPos(0.0, msgBoxHeight + msgBoxLineHeight - 1.0);
	c.drawTile(Texture'base', msgBoxWidth, 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(0.0, msgBoxHeight);
	c.drawTile(Texture'base', 1.0, msgBoxLineHeight - 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(msgBoxWidth - 1.0, msgBoxHeight);
	c.drawTile(Texture'base', 1.0, msgBoxLineHeight - 1.0, 0.0, 0.0, 1.0, 1.0);

	// Message.
	msgOffset = (msgBoxLineHeight - 10) / 2.0;
	c.font = baseFont;
	c.style = ERenderStyle.STY_Normal;
	c.drawColor.G = 250; //colors[C_Green];
	c.setPos(msgOffset, msgOffset + msgBoxHeight-4);
	c.drawText(msg, false);
}

function Font getStaticSmallestFont(float width) {
if(bAutoAdjustFontSize){
	if (width < 640) {
		return Font'SmallFont';
	} else if (width < 800) {
		return Font(DynamicLoadObject("LadderFonts.UTLadder12", class'Font'));
	} else if (width < 1024) {
		return Font(DynamicLoadObject("LadderFonts.UTLadder14", class'Font'));
	} else {
	NumLines=5;
		return Font(DynamicLoadObject("LadderFonts.UTLadder16", class'Font'));
	}
	}
	
	else{
	//if (msgfont == 0) {
		//return Font'MediumFont';
		//NumLines=6;
    if (msgfont == 0) {
	NumLines=6;
		return Font(DynamicLoadObject("LadderFonts.UTLadder12", class'Font'));
	} else if (msgfont == 1) {
	NumLines=5;
		return Font(DynamicLoadObject("LadderFonts.UTLadder14", class'Font'));
	} else {
	NumLines=5;
		return Font(DynamicLoadObject("LadderFonts.UTLadder16", class'Font'));
	}
}	
}


simulated function DrawTypingPrompt( canvas Canvas, console Console )
{
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Adds a message to the area just below the chatbox. Before the message is added an
 *                attempt will be made to highlight player names. This is done by checking if the
 *                messages contain the names of the given player replication info objects.
 *  $PARAM        msg   Message to add.
 *  $PARAM        pri1  Replication info of the first player involved.
 *  $PARAM        pri2  Replication info of the second player involved.
 *
 **************************************************************************************************/
simulated function addColorizedMessage(string msg, PlayerReplicationInfo pri1, PlayerReplicationInfo pri2, optional name msgtype) {
	local string firstPlayerName;
	local string secondPlayerName;
	local int firstIndex;
	local int secondIndex;
	local color firstPlayerColor;
	local color secondPlayerColor;
	local color firstPlayerColors, secondPlayerColors;
	local string msgPart1;
	local string msgPart2;
	local string msgPart3;
	local int msgColor;
	local string tempPlayerName;
	local int tempIndex;
	local color tempPlayerColor;
	local color MessCol;
	
	// Get message color.
	//msgColor =static.getMessageColor(msg);
	
	switch(msgColor)
	{
	    case 0:
		    MessCol=CyanColor;
			break;
		case 1:
		    MessCol=BlueColor;
			break;
		case 2:
		    MessCol=LightGreenColor;
		    break;
		case 3:
		    MessCol.R=250;
			MessCol.G=250;
			MessCol.B=90;
			break;
		case 4:
		    MessCol=WhiteColor;
		    break;
		case 5:
		    MessCol=FrigginDarkColor;
			break;
		default:
		    MessCol=CyanColor;
			break;
	}
	
	//Rule checks.
	if((instr(msg,"Killed a ") != -1 || instr(msg,"killed a") != -1 || instr(msg,"Killed the ") != -1 || instr(msg,"killed the") != -1) && !DrawKillMessages) return;
	if((instr(msg,FemaleSuicideString) != -1 || instr(msg,MaleSuicideString) != -1 || msgtype == 'DeathMessage') && !DrawDeathMessages) return; //Suicide
	
	// Get player name indices.
	getPlayerNameIndices(msg, pri1, pri2, firstIndex, secondIndex);
	
	// Get player names & colors.
	if (pri1 != none) {
		firstPlayerName = pri1.playerName;
		firstPlayerColor = NameColor;
	}
	if (pri2 != none) {
		secondPlayerName = pri2.playerName;
		secondPlayerColor = NameColor;
	}
	
	// Swap first and second player if necessary.
	if (secondIndex >= 0 && (secondIndex < firstIndex || firstIndex < 0)) {
		tempPlayerName = secondPlayerName;
		tempIndex = secondIndex;
		tempPlayerColor = secondPlayerColor;
		secondPlayerName = firstPlayerName;
		secondIndex = firstIndex;
		secondPlayerColor = firstPlayerColor;
		firstPlayerName = tempPlayerName;
		firstIndex = tempIndex;
		firstPlayerColor = tempPlayerColor;
	}
	
	// Split message.
	if (firstIndex >= 0 && secondIndex >= 0) {
		msgPart1 = left(msg, firstIndex);
		msgPart2 = mid(msg, firstIndex + len(firstPlayerName), secondIndex - firstIndex - len(firstPlayerName));
		msgPart3 = mid(msg, secondIndex + len(secondPlayerName));
	} else if (firstIndex >= 0) {
		msgPart1 = left(msg, firstIndex);
		msgPart2 = mid(msg, firstIndex + len(firstPlayerName));
		secondPlayerName = "";
	} else {
		firstPlayerName = "";
		secondPlayerName = "";
		msgPart1 = msg;
	}

	// Add message.
	RenderLowerMessages(EventColor, msgPart1, NameColor, firstPlayerName, EventColor, msgPart2,
	       NameColor, secondPlayerName, EventColor, msgPart3);
}


/***************************************************************************************************
 *
 *  $DESCRIPTION  Retrieves the base color of the message.
 *  $PARAM        msg  The message for which the base color is be determined.
 *  $RETURN       The base color of the message based on the leading color tag, or -1 if none is
 *                present.
 *
 **************************************************************************************************/
static function int getMessageColor(string msg) {
	if (left(msg, 2) ~= "<C" && mid(msg, 4, 1) == ">") {
		return int(mid(msg, 2, 2));
	} else {
		return -1;
	}
}
/***************************************************************************************************
 *
 *  $DESCRIPTION  Removes the leading color tag from the specified message.
 *  $PARAM        msg  The message for which the color tag has to be removed.
 *  $RETURN       The original message without a leading color tag.
 *
 **************************************************************************************************/
static function string removeMessageColorTag(string msg) {
	if (left(msg, 2) ~= "<C" && mid(msg, 4, 1) == ">") {
		return mid(msg, 5);
	} else {
		return msg;
	}
}

simulated function DrawMOTD(Canvas Canvas)
{
	local GameReplicationInfo GRI;
	local float XL, YL;
	local float InitialY;

	GRI = PlayerPawn(Owner).GameReplicationInfo;
	if ( (GRI == None) || (GRI.GameName == "Game") || (MOTDFadeOutTime <= 0) ) 
		return;

	Canvas.Font = MyFonts.GetSmallFont( Canvas.ClipX );
	Canvas.Style = Style;
	Canvas.bCenter = true;
	Canvas.DrawColor = UnitColor * MOTDFadeOutTime * 0.5;
	InitialY = 64*Scale;
	Canvas.SetPos(0.0, InitialY);
	Canvas.StrLen("TEST", XL, YL);
	if ( Level.NetMode != NM_Standalone )
	{
		Canvas.DrawText(GRI.ServerName);
		if ( Canvas.ClipY >= 300 )
		{
			Canvas.SetPos(0.0, InitialY + 6*YL);
			Canvas.DrawText(GRI.MOTDLine1, true);
			Canvas.SetPos(0.0, InitialY + 7*YL);
			Canvas.DrawText(GRI.MOTDLine2, true);
			Canvas.SetPos(0.0, InitialY + 8*YL);
			Canvas.DrawText(GRI.MOTDLine3, true);
			Canvas.SetPos(0.0, InitialY + 9*YL);
			Canvas.DrawText(GRI.MOTDLine4, true);
		}
	}
	Canvas.DrawColor = UnitColor * MOTDFadeOutTime * 0.6;
	Canvas.SetPos(0.0, InitialY + YL);
	Canvas.DrawText(GRI.GameName, true);
	Canvas.SetPos(0.0, InitialY + 2*YL);
	Canvas.DrawText(MapTitleString2@Level.Title, true);
	if ( Canvas.ClipY >= 300 )
	{
		Canvas.SetPos(0.0, InitialY + 3*YL);
		Canvas.DrawText(AuthorString2@Level.Author, true);
		if (Level.IdealPlayerCount != "")
		{
			Canvas.SetPos(0.0, InitialY + 4*YL);
			Canvas.DrawText(PlayerCountString$Level.IdealPlayerCount, true);
		}
	}
	Canvas.bCenter = false;
}

simulated function Tick(float DTime)
{

	//TICK
	local int i;
	if(PlayerOwner == none) return;
	
	if (PlayerOwner.level.pauser ~= "") {
		timeSeconds += DTime / 1;
	}
    if(MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo) != none && MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo).bGameEnded && !bCalledEnd)
	{
		GameEnded();
		bCalledEnd=True;
	}
	
	if(MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo) != none && MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo).bReadyToTravel && !bClosed)
	{
		MainWindow.HideWindow();
		MainWindow.Root.Console.bQuickKeyEnable=False;
		bClosed=True;
		MainWindow=none;
		MainClientWindow=none;
	}
	
	
			// Check for bad connection.
		if (PlayerOwner.bBadConnectionAlert && !bBadConnectionDetected) 
		{
			badConnectionSince = timeSeconds;
			bBadConnectionDetected = true;
			checkServerHealth();
		} 
		else if (bBadConnectionDetected && timeSeconds - lastAliveCheck > serverHealthCheckInterval) {
			checkServerHealth();
		} 
		else if (bBadConnectionDetected && 10 > 0 && !bReconnecting &&
		           timeSeconds - badConnectionSince > 10) 
		{
			bReconnecting = true;
			PlayerOwner.ConsoleCommand("reconnect");
		}

		
		IdentifyFadeTime = FMax(0.0, IdentifyFadeTime - DTime);
	
	TutIconBlink += DTime;
	if (TutIconBlink >= 0.5)
		TutIconBlink = 0.0;

	if ( bDrawFaceArea )
	{
		if ( FaceAreaOffset < 0 )
			FaceAreaOffset += DTime * 600;
		if ( FaceAreaOffset > 0 )
			FaceAreaOffset = 0.0;
	} 
	else if ( FaceAreaOffset > MinFaceAreaOffset )
		FaceAreaOffset = FMax(FaceAreaOffset - DTime * 600, MinFaceAreaOffset );

	if ( bDrawMessageArea )
	{
		if ( MessageFadeTime < 1.0 )
		{
			MessageFadeTime += DTime * 8;
			if (MessageFadeTime > 1.0)
				MessageFadeTime = 1.0;
		}
	} 
	else if ( (MessageFadeTime > 0.0) && (MessageFadeCount == 0) )
	{
		MessageFadeTime -= DTime * 2;
		if (MessageFadeTime < 0.0)
			MessageFadeTime = 0.0;
	}
	WeaponNameFade -= DTime;

}

//Draw the marker at an actor
simulated function DrawMark(canvas c, Vector origin,float collisionradius, color drawcolor,Actor A) {
	local float XScale;
	local vector v,R,L,topleft,bottomright;
	local pawn temp;
	local bool Smooth;
	local float FVScale;
	
	FVScale = 1.0 - (C.Viewport.Actor.FovAngle / 180.0);	//This is as far as we'll see it
	if((vector(pawnowner.viewrotation) dot normal(origin-pawnowner.location) <= FVScale))
	return;
	v = origin;
	//left
		l.x = collisionradius * sin(pawnowner.viewrotation.yaw * 0.000096);
		l.y = collisionradius * -cos(pawnowner.viewrotation.yaw * 0.000096);
	//right
		r.x = collisionradius * -sin(pawnowner.viewrotation.yaw * 0.000096);
		r.y = collisionradius * cos(pawnowner.viewrotation.yaw * 0.000096);
		
		topleft = Get2D(v+l+vect(0,0,1)*collisionradius,c);
		bottomright = Get2D(v+r+vect(0,0,-1)*collisionradius,c);
		v = Get2D(v,c);
		xscale = 0.4 * max(abs(bottomright.x-topleft.x),abs(bottomright.y-topleft.y));
		c.setpos(v.x-xscale,v.y-xscale);
		c.style=3;
		c.drawcolor=drawcolor;
		Smooth = C.bNoSmooth;
		c.bnosmooth=false;
		c.drawtile(Texture'targetlocked',xscale*2,xscale*2,0,0,256,256);
		c.bnosmooth=Smooth;
}

simulated function color rgbi(byte r, byte g, byte b) {
	local color c;
		c.r=r;
		c.g=g;
		c.b=b;
	return c;
}

simulated function vector Get2D(vector RLocation, canvas c)
{
	local playerpawn canvact;
	local vector camloc,targdir;
	local rotator camrot;
	local float fov;
    local float TanFOVx, TanFOVy;
    local float TanX, TanY;
    local float dx, dy;
    local vector X, Y, Dir, XY;
	local vector result;
	
	canvact=c.viewport.actor;
	camrot=canvact.viewrotation;
	camloc=canvact.location;
	camloc.z+=canvact.eyeheight;
	fov=canvact.fovangle;
	targdir = normal(RLocation-camloc);
    TanFOVx = Tan(FOV * Pi / 360);
    TanFOVy = (C.ClipY / C.ClipX) * TanFOVx;
    GetAxes(camrot, Dir, X, Y);
    Dir *= TargDir dot Dir;
    XY = TargDir - Dir;
    dx = XY dot X;
    dy = XY dot Y;
    TanX = dx / VSize(dir);
    TanY = dy / VSize(dir);
    Result.X = C.ClipX * 0.5 * (1 + TanX / TanFOVx);
    Result.Y = C.ClipY * 0.5 * (1 - TanY / TanFOVy);
    Result.z = Vsize(dir);
	return result;
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Renders an alert window.
 *  $PARAM        msg        The message to display on the alert window.
 *  $PARAM        textColor  Color of the text displayed on the alert window.
 *  $PARAM        baseColor  Background color of the alert window.
 *
 **************************************************************************************************/
simulated function renderAlert(Canvas c, string msg, color textColor, color baseColor) {
	local int windowWidth;
	local int windowHeight;
	local int cx, cy;
	local float animIndex;
	local int dist;
	local int hBarSize;
	local float textWidth;
	local int maxTextWidth;
	local float textHeight;
	local int lineCount;
	local string remaining;
	local int index;
	local string text;

    // Initialize.
	c.font = myFonts.getStaticHugeFont(c.clipX);
	remaining = msg;
	lineCount = 0;
	while (remaining != "") {
		index = instr(remaining, newLineToken);
		if (index > 0) {
			text = left(remaining, index);
			remaining = mid(remaining, index + len(newLineToken));
		} else {
			text = remaining;
			remaining = "";
		}
									if(C.Font==none)
								C.Font=Font'SmallFont';
		c.strLen(text, textWidth, textHeight);
		maxTextWidth = max(maxTextWidth, textWidth);
		lineCount++;
	}

	windowWidth = maxTextWidth + 2 * alertBorderSize;
	windowHeight = lineCount * textHeight + 2 * alertBorderSize;
	cx = (c.clipX - windowWidth) / 2;
	cy = (c.clipY - windowHeight) / 2;

	// Render frame background.
	c.style = ERenderStyle.STY_Translucent;

    c.drawColor = baseColor * 0.4;
	c.setPos(cx, cy);
	c.drawTile(Texture'grad64', windowWidth, windowHeight, 0.0, 0.0, 64.0, 64.0);

	// Render borders.
	c.drawColor = baseColor * 0.8;
	c.setPos(cx - 3.0, cy - 1.0);
	c.drawTile(Texture'base', 2.0, windowHeight + 2.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(cx + 1.0 + windowWidth, cy - 1.0);
	c.drawTile(Texture'base', 2.0, windowHeight + 2.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(cx - 3.0, cy - 2.0);
	c.drawTile(Texture'base', hDefBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(cx - 3.0, cy + 1.0 + windowHeight);
	c.drawTile(Texture'base', hDefBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(cx + 3.0 + windowWidth - hDefBarSize, cy - 2.0);
	c.drawTile(Texture'base', hDefBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
	c.setPos(cx + 3.0 + windowWidth - hDefBarSize, cy + 1.0 + windowHeight);
	c.drawTile(Texture'base', hDefBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);

	// High detail animation effect.
	if (level.bHighDetailMode) {
		animIndex = (PlayerOwner.Level.timeSeconds % alertAnimTime) / alertAnimTime;

		c.drawColor = baseColor * (1.0 - animIndex);

		dist = sin(animIndex * pi * 0.5) * alertAnimDist;
		hBarSize = hDefBarSize + hDefBarSize * ((windowWidth + alertAnimDist) / windowWidth) * animIndex;
		c.setPos(cx - 3.0 - dist, cy - 1.0 - dist);
		c.drawTile(Texture'base', 2.0, windowHeight + 2.0 + 2 * dist, 0.0, 0.0, 1.0, 1.0);
		c.setPos(cx + 1.0 + windowWidth + dist, cy - 1.0 - dist);
		c.drawTile(Texture'base', 2.0, windowHeight + 2.0 + 2 * dist, 0.0, 0.0, 1.0, 1.0);
		c.setPos(cx - 3.0 - dist, cy - 2.0 - dist);
		c.drawTile(Texture'base', hBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
		c.setPos(cx - 3.0 - dist, cy + 1.0 + windowHeight + dist);
		c.drawTile(Texture'base', hBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
		c.setPos(cx + 3.0 + windowWidth - hBarSize + dist, cy - 2.0 - dist);
		c.drawTile(Texture'base', hBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
		c.setPos(cx + 3.0 + windowWidth - hBarSize + dist, cy + 1.0 + windowHeight + dist);
		c.drawTile(Texture'base', hBarSize, 1.0, 0.0, 0.0, 1.0, 1.0);
	}

	// Render text.
	remaining = msg;
	lineCount = 0;
	c.drawColor = textColor;
	while (remaining != "") {
		index = instr(remaining, newLineToken);
		if (index > 0) {
			text = left(remaining, index);
			remaining = mid(remaining, index + len(newLineToken));
		} else {
			text = remaining;
			remaining = "";
		}
		c.setPos(cx + alertBorderSize, cy + alertBorderSize + lineCount * textHeight);
    	c.drawText(text, false);
		lineCount++;
	}
	C.reset();
}


/***************************************************************************************************
 *
 *  $DESCRIPTION  Formats the given string by inserting the specified strings into the proper
 *                positions. The positions are indicated by the "%n" tags, where n is number of the
 *                string to insert.
 *  $PARAM        source  The string that is to be formatted.
 *  $PARAM        str1    String number 1 to insert.
 *  $PARAM        str2    String number 2 to insert.
 *  $PARAM        str3    String number 3 to insert.
 *  $PARAM        str4    String number 4 to insert.
 *  $RETURN       The formatted string.
 *
 **************************************************************************************************/
static function string format(string source, optional coerce string str1,
                              optional coerce string str2, optional coerce string str3,
                              optional coerce string str4) {
	local string formattedStr;
	
	formattedStr = replace(source, "%1", str1);
	formattedStr = replace(formattedStr, "%2", str2);
	formattedStr = replace(formattedStr, "%3", str3);
	formattedStr = replace(formattedStr, "%4", str4);
	
	return formattedStr;
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Replaces a specified substring in a string with another substring.
 *  $PARAM        source  The original string, which is to be filtered.
 *  $PARAM        oldStr  Substring in the original string that is to be replaced.
 *  $PARAM        newStr  Replacement for the substring to be replaced.
 *  $RETURN       The specified string where all occurrences of oldStr are replaced with newStr.
 *
 **************************************************************************************************/
static function string replace(coerce string source, coerce string oldStr, coerce string newStr) {
	local bool bDone;
	local int subStrIndex;
	local string result;
	local string strLeft;
	
	strLeft = source;
	
	// Replace each occurrence of oldStr with newStr.
	while (!bDone) {
		
		// Find index of oldStr in the part not examined yet.
		subStrIndex = instr(strLeft, oldStr);
		
		// Update examined and unexamined parts.
		if (subStrIndex < 0) {
			bDone = true;
			result = result $ strLeft;
		} else {
			result = result $ left(strLeft, subStrIndex) $ newStr;
			strLeft = mid(strLeft, subStrIndex + len(oldStr));
		}
	}
	
	// Return the filtered string.
	return result;
}
//Check server health
simulated function checkServerHealth() {
	lastAliveCheck = timeSeconds;
	doHealthCheck();
}

function doHealthCheck() {
	notifyServerHealth();
}

simulated function notifyServerHealth() {
	bBadConnectionDetected = false;
}

function SetupFriendlyStatus(canvas C)
{
	
		YOffset3 = C.ClipY / (5 - Scale);
		C.Font = C.SmallFont; //(C.ClipX);

	C.StrLen("PlayerName/ ", XL_NAME, YL3);
	C.StrLen(" /9999999", XL_SCORE, YL3);
	C.StrLen(" /9999", XL_KILLS, YL3);
	//C.StrLen(" /ZONEPLACETHING", XL_HEALTH, YL);


		C.SetPos(C.SizeX - B, YOffset3-5);
		C.DrawColor.R=120;
		C.DrawColor.G=120;
		C.DrawColor.B=120;
		C.Style=ERenderStyle.STY_Modulated;
        C.DrawRect(Texture'Shade', 300, (YL3*2)+5);
		XOffset3 = C.SizeX - 130;
		C.DrawColor = WhiteColor;
		XOffset3 = C.SizeX - 195;
		C.SetPos(XOffset3, YOffset3);
		C.Style=ERenderStyle.STY_Normal;
		C.DrawColor = WhiteColor;
		C.DrawText("  [Player][Score][Kills][Health]", False);
		YOffset3 += YL3;
		XOffset3 = C.SizeX - 200;
		C.Font=Font'Arial';
		C.StrLen("____________________________________",B , Cn);
		C.SetPos(C.SizeX - B, YOffset3-10);
		C.DrawText("____________________________________", False);
		YOffset3 += YL3;
		//YOffset3 = C.ClipX - 50 - (XL3 + XL_SCORE + XL_KILLS);
}

simulated function DrawFriendlyStatus(Canvas C,PlayerReplicationInfo Prayer)
{
	local PlayerReplicationInfo PRI;
	local int Num, i;
	local int a;
	local int o;

	PRI = Prayer;
C.Font = C.SmallFont;

	if (C.ClipX > 1024)
		C.Font = Font'BeaconNameFontLarge';
	if (C.ClipX > 800)
		C.Font = Font'BeaconNameFontMedium';
	else
		C.Font = Font'BeaconNameFontSmall';
		
	XOffset3 = C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS);
	   //Black background...
		C.DrawColor.R=120;
		C.DrawColor.G=120;
		C.DrawColor.B=120;
		C.DrawColor.A=2;
		C.Style=ERenderStyle.STY_Modulated;
		C.SetPos(C.SizeX - B , YOffset3);
        C.DrawRect(Texture'Shade', 300, YL3);
		C.Style=ERenderStyle.STY_Normal;
	
	    C.DrawColor=GreenColor;
		// Draw Color Select
		for (o=0;o<10;o++)	
		{
	    	if ( PRI.PlayerName ~= Admin[o] ) //Made a smarter array
	    	{
				C.DrawColor=AdminColor[o];
			}
		}
		if(PRI.Owner.IsA('Bot'))
		{
			C.StrLen(PRI.PlayerName$" ", XL3, YL3);
			C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS + XL_HEALTHS), YOffset3);
			C.DrawText(PRI.PlayerName, False);
		}
		else
		{
			if(MonsterReplicationInfoTwo(PlayerOwner.GameReplicationInfo).bStartedHunt)
			{
				C.DrawColor=GreenColor;
				C.StrLen(PRI.PlayerName$" ", XL3, YL3);
				C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS + XL_HEALTHS), YOffset3);
				C.DrawText(PRI.PlayerName, False);
			}
			else if(PlayerPawn(PRI.Owner).bReadyToPlay )
			{
				C.DrawColor=GreenColor;
				C.StrLen("Ready - "$PRI.PlayerName$" ", XL3, YL3);
				C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS + XL_HEALTHS), YOffset3);
				C.DrawText("Ready - "$PRI.PlayerName, False);
			}
			else
			{
				C.DrawColor=RedColor;
				C.StrLen("Not Ready - "$PRI.PlayerName$" ", XL3, YL3);
				C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS + XL_HEALTHS), YOffset3);
				C.DrawText("Not Ready - "$PRI.PlayerName, False);
			}
		}

	

	//Draw Slash			
		XOffset3 += XL3;
		C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS) + XL3, YOffset3);
		C.DrawColor = WhiteColor;
		C.DrawText("|", False);

    	//Draw Score
		if (PRI.Score < (0))
		{
			C.DrawColor = RedColor;
		}
		else if (PRI.Score == (0))
		{
			C.DrawColor = WhiteColor;
		}
		else if (PRI.Score > 0 )
		{
			C.DrawColor = GreenColor;
		}
		C.StrLen(int(PRI.Score)$" ", XL3, YL3);
		XOffset3 += (XL_SCORE - XL3);
		C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS) + XL3 + (XL_SCORE - XL3), YOffset3);
		C.DrawText(int(PRI.Score));

	//Draw Slash			
		XOffset3 += XL3;
		C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS) + XL3 + (XL_SCORE - XL3) + XL3, YOffset3);
		C.DrawColor = WhiteColor;
		C.DrawText("|", False);
	//Draw Kills
if(!PRI.bIsaBot){
		If (MHReplicationInfo(PRI).KilledMonster == (0))
		{
			C.DrawColor = RedColor;			
		}
		else if (MHReplicationInfo(PRI).KilledMonster < 0)
		{
		    C.DrawColor = RedColor;
		}
		else if (MHReplicationInfo(PRI).KilledMonster > 0)
		{
			C.DrawColor = GreenColor;
		}
		
		C.StrLen(MHReplicationInfo(PRI).KilledMonster$" ", XL3, YL3);
		XOffset3 += (XL_KILLS - XL3);
		C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS) + XL3 + (XL_SCORE - XL3) + XL3 +  (XL_KILLS - XL3), YOffset3);
		C.DrawText(MHReplicationInfo(PRI).KilledMonster);
		}
		else XOffset3 += (XL_KILLS - XL3);
		//XL_HEALTHS=-50;
		XOffset3 += XL3;
		C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS) + XL3 + (XL_SCORE - XL3) + XL3 +  (XL_KILLS - XL3) + XL3, YOffset3);
		C.DrawColor = WhiteColor;
		C.DrawText("|", False);
		
		//DrawHealth
		If (Pawn(PRI.Owner).Health < (10))
		{
			C.DrawColor = RedColor;			
		}
		else if (Pawn(PRI.Owner).Health < 100 && Pawn(PRI.Owner).Health > 10)
		{
		    C.DrawColor.R = 255;//Yellow
			C.DrawColor.G = 255;
			C.DrawColor.B = 0;
		}
		else if (Pawn(PRI.Owner).Health > 0)
		{
			C.DrawColor = GreenColor;
		}

		C.StrLen(Pawn(PRI.Owner).Health$" ", XL3, YL3);
		XOffset3 += (XL_KILLS - XL3);
		C.SetPos(C.SizeX - 50 - (XL3 + XL_SCORE + XL_KILLS) + XL3 + (XL_SCORE - XL3) + XL3 +  (XL_KILLS - XL3) + XL3 +(XL_KILLS - XL3), YOffset3);
		C.DrawText(Pawn(PRI.Owner).Health);
		YOffset3 += YL3;

}

function DrawFriendlyAfter(Canvas C)
{
		
		C.DrawColor.R=120;
		C.DrawColor.G=120;
		C.DrawColor.B=120;
		C.SetPos(C.SizeX - B, YOffset3);
		C.Style=ERenderStyle.STY_Modulated;
        C.DrawRect(Texture'Shade', B, 17);
		C.DrawColor=WhiteColor;
		XOffset3 = C.SizeX - 200;
		C.Style=ERenderStyle.STY_Normal;
		C.SetPos(C.SizeX - B, YOffset3-10);
		C.Font=Font'Arial';
		C.DrawText("____________________________________", False);
}

simulated function bool DrawIdentifyInfo(Canvas C);

simulated function SetIDColor(Canvas C, int type)
{
	if ( type == 0 )
		C.DrawColor = AltTeamColor[IdentifyTarget.Team] * 0.333 * IdentifyFadeTime;
	else
		C.DrawColor = TeamColor[IdentifyTarget.Team] * 0.333 * IdentifyFadeTime;
}

simulated function bool TraceIdentify(Canvas C);

simulated function DrawMonsterName(Canvas C)
{
	local vector X, Y, Z, CamLoc, TargetDir, Dir, XY;
	local rotator CamRot;
	local Actor Camera;
	local float BaseBeaconScale, BeaconScale, Dist, DistScale;
	local float TanFOVx, TanFOVy;
	local float TanX, TanY;
	local float dx, dy, FontY,VS;
	local string BeaconText;

	if(MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy == none || !ClientDrawMonsterName || !MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.isA('ScriptedPawn')) return;
	
	C.Style = ERenderStyle.STY_Masked;
	if (C.ClipX > 1024)
		C.Font = Font'BeaconNameFontLarge';
	else if (C.ClipX > 640)
		C.Font = Font'BeaconNameFontMedium';
	else
		C.Font = Font'BeaconNameFontSmall';
	
	C.SetPos(0, 0);
	C.TextSize("X", dx, FontY);
	BaseBeaconScale = 1.5 * FontY / Texture'TeamBeacon2'.VSize;
	
	PlayerOwner.PlayerCalcView(Camera, CamLoc, CamRot);
	
	TanFOVx = Tan(C.ViewPort.Actor.FOVAngle / 114.591559); // 360/Pi = 114.5915590...
	TanFOVy = (C.ClipY / C.ClipX) * TanFOVx;
	GetAxes(CamRot, X, Y, Z);
	
	C.bNoSmooth = False;
	C.Style = ERenderStyle.STY_Translucent;
	
		if (MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy != Camera)
    {
        if (MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.Health > 0)
		{
            TargetDir = MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.Location - CamLoc;
			Dist = VSize(TargetDir) * FMin(TanFOVx, 1.0);
			TargetDir = Normal(TargetDir + vect(0,0,1) * MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.CollisionHeight);
			DistScale = FMin(100.0 * MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.CollisionRadius / Dist, 1.0);
			
			if (TargetDir dot X > 0 && /*(FastTrace(SP.Location, CamLoc) ||*/ FastTrace(MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.Location + vect(0,0,0.8) * MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.CollisionHeight, CamLoc)) {
				BeaconScale = BaseBeaconScale * DistScale;
				Dir = X * (X dot TargetDir);
				XY = TargetDir - Dir;
				VS=VSize(Dir);
				dx = C.ClipX * 0.5 * (1.0 + (XY dot Y) / (VS * TanFOVx));
				dy = C.ClipY * 0.5 * (1.0 - (XY dot Z) / (VS * TanFOVy));
				
				C.DrawColor = RedColor;
				C.SetPos(dx - 0.5 * BeaconScale-30, dy - 2 * FontY * DistScale);
				C.DrawIcon(TeamBeaconIcon, BeaconScale);
				C.Style = ERenderStyle.STY_Masked;
				BeaconText = string(MHReplicationInfo(PlayerOwner.PlayerReplicationInfo).Enemy.Health);
				C.SetPos(dx + 0.6 * BeaconScale + 1, dy - 1.75 * FontY + 1);
				C.SetPos(dx + 0.6 * BeaconScale, dy - 1.75 * FontY);
				C.DrawColor = BeaconColor;
				C.DrawTextClipped(BeaconText, False);
			}
		}
	}
}

simulated function DrawPlayerName(Canvas C,Pawn SP)
{
	local vector X, Y, Z, CamLoc, TargetDir, Dir, XY;
	local rotator CamRot;
	local Actor Camera;
	local float BaseBeaconScale, BeaconScale, Dist, DistScale;
	local float TanFOVx, TanFOVy;
	local float TanX, TanY;
	local float dx, dy, FontY,VS;
	local string BeaconText;

	if(!MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo).bStartedHunt || SP == none || !ClientDrawMonsterName || (!SP.isA('Bot') && !SP.isA('PlayerPawn'))) return;
	
	C.Style = ERenderStyle.STY_Masked;
	if (C.ClipX > 1024)
		C.Font = Font'BeaconNameFontLarge';
	else if (C.ClipX > 640)
		C.Font = Font'BeaconNameFontMedium';
	else
		C.Font = Font'BeaconNameFontSmall';
	
	C.SetPos(0, 0);
	C.TextSize("X", dx, FontY);
	BaseBeaconScale = 1.5 * FontY / Texture'TeamBeacon2'.VSize;
	
	PlayerOwner.PlayerCalcView(Camera, CamLoc, CamRot);
	
	TanFOVx = Tan(C.ViewPort.Actor.FOVAngle / 114.591559); // 360/Pi = 114.5915590...
	TanFOVy = (C.ClipY / C.ClipX) * TanFOVx;
	GetAxes(CamRot, X, Y, Z);
	
	C.bNoSmooth = False;
	C.Style = ERenderStyle.STY_Translucent;
	
		if (SP != none && SP !=Camera)
    {
        if (SP.Health > 0)
		{
            TargetDir = SP.Location - CamLoc;
			Dist = VSize(TargetDir) * FMin(TanFOVx, 1.0);
			TargetDir = Normal(TargetDir + vect(0,0,1) * SP.CollisionHeight);
			DistScale = FMin(100.0 * SP.CollisionRadius / Dist, 1.0);
			
			if (TargetDir dot X > 0 && /*(FastTrace(SP.Location, CamLoc) ||*/ FastTrace(SP.Location + vect(0,0,0.8) * SP.CollisionHeight, CamLoc)) {
				BeaconScale = BaseBeaconScale * DistScale;
				Dir = X * (X dot TargetDir);
				XY = TargetDir - Dir;
				VS=VSize(Dir);
				dx = C.ClipX * 0.5 * (1.0 + (XY dot Y) / (VS * TanFOVx));
				dy = C.ClipY * 0.5 * (1.0 - (XY dot Z) / (VS * TanFOVy));
				
				C.DrawColor = BeaconColor;
				C.SetPos(dx - 0.5 * BeaconScale-30, dy - 2 * FontY * DistScale);
				C.DrawIcon(TeamBeaconIcon, BeaconScale);
				C.Style = ERenderStyle.STY_Masked;
				BeaconText = SP.PlayerReplicationInfo.PlayerName;
				C.SetPos(dx + 0.6 * BeaconScale + 1, dy - 1.75 * FontY + 1);
				C.SetPos(dx + 0.6 * BeaconScale, dy - 1.75 * FontY);
				C.DrawColor = BeaconColor;
				C.DrawTextClipped(BeaconText, False);
			}
		}
	}
}

simulated function drawBlip(ScriptedPawn Other, canvas C, int originX, int originY, int radius)
{
    local rotator myRotation, monsterRotation, blipRotation;
    local int x, y, monsterDistance;
    local Vector point, myLocation, monsterLocation;
    local Weapon weapon;
	local float TempX,TempY;
	local string MonsterName;


        C.DrawColor.R = 255;
        C.DrawColor.G = 255;
        C.DrawColor.B = 255;
   
    weapon = PawnOwner.Weapon;
    if(Weapon != none && Weapon.IsA('WarheadLauncher') &&
       WarheadLauncher(Weapon).bGuiding &&
       WarheadLauncher(Weapon).GuidedShell != none) 
    {
        myLocation = WarheadLauncher(Weapon).GuidedShell.Location;
    } 
    else 
    {
        myLocation = PawnOwner.Location;
    }
    myLocation.z = 0;
    myRotation = PawnOwner.ViewRotation;
    myRotation.Yaw  += 16384;
    myRotation.Pitch = 0;
    myRotation.Roll  = 0;

    monsterLocation   = Other.Location;
    monsterLocation.z = 0;
    point = myLocation - monsterLocation;
    monsterDistance = VSize(point);
    monsterRotation = rotator(point);
    monsterRotation.Pitch = 0;
    monsterRotation.Roll  = 0;
    blipRotation = myRotation - monsterRotation;
    point = monsterDistance * vector(blipRotation);
    if(monsterDistance < radius*13)//Make it a little smaller so blips dont show up outside the radar HUD
    {
        point.x = -point.x / 15 + radius + originX;
        point.y = point.y / 15 + radius + originY;

    }
	else
	{
		point.x = originX + radius - 5/2 - point.x * 14/16*radius/(radius*14) * 14.5 / 14 * (radius*14) / monsterDistance ;
		point.y = originY + radius - 5/2 + point.y * 14/16*radius/(radius*14) * 14.5 / 14 * (radius*14) / monsterDistance ;

	}
	C.SetPos(point.x, point.y - 10);
	C.Font=C.SmallFont;
	C.StrLen(Other.MenuName,TempX,TempY);//measure lenght of string
	if(point.X+TempX > C.SizeX) //if name exceeds screen width
	   	MonsterName=Left(Other.MenuName,3);
	else MonsterName=Other.MenuName;
	if(bDrawMonsterNames)
	    C.DrawText(MonsterName);
	C.SetPos(point.x, point.y);
	C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 0;
	C.Style=ERenderStyle.STY_Translucent;
	if(SizeZ(other.location,PawnOwner.Location)>100)//Is above
	C.DrawTile(Texture'MPUp', 8, 8, 0, 0, 16, 16);
	else if(SizeZ(Other.Location,PawnOwner.Location)< -100)//is below
	C.DrawTile(Texture'MPDown', 8, 8, 0, 0, 16, 16);
	else//is middle
       C.DrawTile(Texture'monsterpoint', 5, 5, 0, 0, 2, 2);
}

simulated function drawPlayerBlip(Pawn Other, canvas C, int originX, int originY, int radius)
{
     local rotator myRotation, monsterRotation, blipRotation;
    local int x, y, monsterDistance;
    local Vector point, myLocation, monsterLocation;
    local Weapon weapon;
    local PlayerPawn pOwner;
	local float TempX, TempY;
	local string PName;

	//Draw player beacon

	DrawPlayerName(C,Other);
	
	if(Other == PawnOwner || Other == none) return;

        C.DrawColor.R = 255;
        C.DrawColor.G = 255;
        C.DrawColor.B = 255;
   
    if(PawnOwner.weapon != none) weapon = PawnOwner.Weapon;
    if(Weapon != none && Weapon.IsA('WarheadLauncher') &&
       WarheadLauncher(Weapon).bGuiding &&
       WarheadLauncher(Weapon).GuidedShell != none) 
    {
        myLocation = WarheadLauncher(Weapon).GuidedShell.Location;
    } 
    else 
    {
        myLocation = PawnOwner.Location;
    }
    myLocation.z = 0;
    myRotation = PawnOwner.ViewRotation;
    myRotation.Yaw  += 16384;
    myRotation.Pitch = 0;
    myRotation.Roll  = 0;

    monsterLocation   = Other.Location;
    monsterLocation.z = 0;
    point = myLocation - monsterLocation;
    monsterDistance = VSize(point);
    monsterRotation = rotator(point);
    monsterRotation.Pitch = 0;
    monsterRotation.Roll  = 0;

    blipRotation = myRotation - monsterRotation;

    point = monsterDistance * vector(blipRotation);
    if(monsterDistance < radius*13)
       {
        point.x = -point.x / 15 + radius + originX;
        point.y = point.y / 15 + radius + originY;

    }
	else
	{
		point.x = originX + radius - 5/2 - point.x * 14/16*radius/(radius*14) * 14.5 / 14 * (radius*14) / monsterDistance ;
		point.y = originY + radius - 5/2 + point.y * 14/16*radius/(radius*14) * 14.5 / 14 * (radius*14) / monsterDistance ;

	}

       C.SetPos(point.x, point.y-10);
			C.Font=C.SmallFont;
		if(Other.PlayerReplicationInfo != none)
		{
	   C.StrLen(Other.PlayerReplicationInfo.PlayerName,TempX,TempY);
	   if(TempX+point.X>C.SizeX)
	        PName=left(Other.PlayerReplicationInfo.PlayerName,3);
		else PName=Other.PlayerReplicationInfo.PlayerName;
		if(bDrawPlayerNames)
    	   C.DrawText(PName);
		}
	   C.SetPos(point.x, point.y);
	     //      C.DrawColor.R = 255;
        //C.DrawColor.G = 0;
        //C.DrawColor.B = 0;
		//C.Font=Font'Arial';
		C.Style=ERenderStyle.STY_Translucent;
	   if(SizeZ(other.location,PawnOwner.Location)>100)//Is above
	   C.DrawTile(Texture'PLUp', 8, 8, 0, 0, 16, 16);
	   else if(SizeZ(Other.Location,PawnOwner.Location)< -100)//is beyond
	   C.DrawTile(Texture'PLDown', 8, 8, 0, 0, 16, 16);
	   else//is middle
       C.DrawTile(Texture'monsterpoint2', 5, 5, 0, 0, 2, 2);
}

simulated function int SizeZ(vector one,vector two)
{
return one.Z-two.Z;
}


simulated function drawEndBlip(vector EndLoc, canvas C, int originX, int originY, int radius)
{
     local rotator myRotation, monsterRotation, blipRotation;
    local int x, y, monsterDistance;
    local Vector point, myLocation, monsterLocation;
    local Weapon weapon;
    local PlayerPawn pOwner;
	local float TempX, TempY;
	local string PName;

        C.DrawColor.R = 255;
        C.DrawColor.G = 255;
        C.DrawColor.B = 255;
   
    weapon = PawnOwner.Weapon;
    if(Weapon != none && Weapon.IsA('WarheadLauncher') &&
       WarheadLauncher(Weapon).bGuiding &&
       WarheadLauncher(Weapon).GuidedShell != none) 
    {
        myLocation = WarheadLauncher(Weapon).GuidedShell.Location;
    } 
    else 
    {
        myLocation = PawnOwner.Location;
    }
    myLocation.z = 0;
    myRotation = PawnOwner.ViewRotation;
    myRotation.Yaw  += 16384;
    myRotation.Pitch = 0;
    myRotation.Roll  = 0;

    monsterLocation   = EndLoc;
    monsterLocation.z = 0;
    point = myLocation - monsterLocation;
    monsterDistance = VSize(point);
    monsterRotation = rotator(point);
    monsterRotation.Pitch = 0;
    monsterRotation.Roll  = 0;

    blipRotation = myRotation - monsterRotation;

    point = monsterDistance * vector(blipRotation);

		if(monsterDistance < radius*13)
		{
			point.x = -point.x / 15 + radius + originX;
			point.y = point.y / 15 + radius + originY;
		
		}
		else
		{
			point.x = originX + radius - 5/2 - point.x * 14/16*radius/(radius*14) * 14.5 / 14 * (radius*14) / monsterDistance ;
			point.y = originY + radius - 5/2 + point.y * 14/16*radius/(radius*14) * 14.5 / 14 * (radius*14) / monsterDistance ;
		}
       C.SetPos(point.x, point.y-10);
	   C.DrawText("END");
	   C.SetPos(point.x, point.y);
	   //C.DrawColor=CyanColor;
	   //C.Font=Font'Arial';
	   C.Style=ERenderStyle.STY_Translucent;
	   if(SizeZ(EndLoc,PawnOwner.Location)>100)//Is above
	   C.DrawTile(Texture'ENDUp', 8, 8, 0, 0, 16, 16);
	   else if(SizeZ(EndLoc,PawnOwner.Location)< -100)//is beyond
	   C.DrawTile(Texture'ENDDown', 8, 8, 0, 0, 16, 16);
	   else//is middle
       C.DrawTile(Texture'monsterpointEND', 5, 5, 0, 0, 2, 2);
}

function setZscale(int value)
{
    if(value < 1) value = 1;
    scale = value;
}

simulated function DrawInfo(Canvas C);

simulated function ProcessTrace(Canvas C, Actor Other);
//======================================================
//hack to get exit commands.
exec simulated function Quit()
{
	Super.ConsoleCommand("Quit");
}

exec simulated function Exit()
{
	Super.ConsoleCommand("Exit");
}

exec simulated function Disconnect()
{
	//Override
	Super.ConsoleCommand("Disconnect");
}
//=========================================================
//Handle Incoming PMs
simulated function ClientReceivePM(string Message,PlayerPawn Sender)
{
	if(!PMContainer.IsBlocked(Sender))
	{
		NotifyPM(message,Sender);
		PMContainer.AddMessage(Message,Sender);
	}
}
//=========================================================
//Handle message splitup

function int GetNumChars(string instr)
{
local float X, Y;
local int i, j;
local string LeftStr;
local bool islonger;
//Return the number of characters the incoming string can have without to exceed the X width.

//First we check if the string needs to be limited
Ca.font=Font(DynamicLoadObject("UWindowFonts.Tahoma10", class'Font'));
Ca.StrLen(instr,X,Y);

//If this statement is true, then we check how many chars we can use from it before we make next line.
    if(X>400)
        {
		    while(X>400)
			{
			LeftStr=left(instr,len(instr)-i);
			i++;
			Ca.StrLen(LeftStr,X,Y);
			}
		islonger=true;
		}
if(islonger)//Had a small issue when checking weither it is longer or not, if it isnt it will pass a zero since LeftStr is not assigned
return len(LeftStr);

return len(instr);
}

function addChatmessage(string Message)
{
local int numlines;
local string text1, text2, text3, text4, Sum, Other;
Sum=Message;
numlines++;
//So first we check weither the incoming message needs a new line or not.
text1=left(Message,GetNumChars(Sum))$"\\n";//We can set this emediately to make the function smaller.
if(GetNumChars(Sum) < len(Sum))
{
//If so we start to calculate how many lines we need to split it up in.
Other=mid(Sum,GetNumChars(Sum));//The number of characters in this string is the remaining ones after the first line is mesured.
//For now we know that the number of lines will be more than one.(So we assign Text2 too)
text2=left(Other,GetNumChars(Other))$"\\n";
numlines++;//2
    if(GetNumChars(Other) < len(Other))//Now we know that we need more than 2 lines, at this moment "Other" is our focusing "total string".
	{
	Other=mid(Other,GetNumChars(Other));
	text3=left(Other,GetNumChars(Other))$"\\n";
	numlines++;//3
	    if(GetNumChars(Other) < len(Other))//Now we know that we need more than 3 lines, at this moment "Other" is our focusing "total string".
     	{
	    Other=mid(Other,GetNumChars(Other));
	    text4=left(Other,GetNumChars(Other))$"\\n";
	    numlines++;//4
    	}
	}
}
if(numlines==1)
Sum=message;

if(numlines==2)
Sum=text1$text2;

if(numlines==3)
Sum=text1$text2$text3;

if(numlines==4)
Sum=text1$text2$text3$text4;

ChatContainer.LogWindow.LogWindow.AddText(Sum);
}

function addPMmessage(string Message)
{
local int numlines;
local string text1, text2, text3, text4, Sum, Other;
Sum=Message;
numlines++;
//So first we check weither the incoming message needs a new line or not.
text1=left(Message,GetNumChars(Sum))$"\\n";//We can set this emediately to make the function smaller.
if(GetNumChars(Sum) < len(Sum))
{
//If so we start to calculate how many lines we need to split it up in.
Other=mid(Sum,GetNumChars(Sum));//The number of characters in this string is the remaining ones after the first line is mesured.
//For now we know that the number of lines will be more than one.(So we assign Text2 too)
text2=left(Other,GetNumChars(Other))$"\\n";
numlines++;//2
    if(GetNumChars(Other) < len(Other))//Now we know that we need more than 2 lines, at this moment "Other" is our focusing "total string".
	{
	Other=mid(Other,GetNumChars(Other));
	text3=left(Other,GetNumChars(Other))$"\\n";
	numlines++;//3
	    if(GetNumChars(Other) < len(Other))//Now we know that we need more than 3 lines, at this moment "Other" is our focusing "total string".
     	{
	    Other=mid(Other,GetNumChars(Other));
	    text4=left(Other,GetNumChars(Other))$"\\n";
	    numlines++;//4
    	}
	}
}
if(numlines==1)
Sum=message;

if(numlines==2)
Sum=text1$text2;

if(numlines==3)
Sum=text1$text2$text3;

if(numlines==4)
Sum=text1$text2$text3$text4;

PMContainer.LogWindow.History.AddText(Sum);
}
//======================================

defaultproperties
{
     LangObj=Class'MH2_C_V18.MyLanguageEnglish'
     GreenColor=(G=255)
     WhiteColor=(R=255,G=255,B=255)
     GoldColor=(R=255,G=255)
     BlueColor=(B=255)
     LightCyanColor=(R=128,G=255,B=255)
     SilverColor=(R=138,G=164,B=166)
     BronzeColor=(R=203,G=147,B=52)
     CyanColor=(G=255,B=255)
     RedColor=(R=255)
     LightGreenColor=(G=136)
     DarkGreenColor=(G=255,B=128)
     ParchmentColor=(R=227,G=210,B=176)
     FrigginDarkColor=(R=4,G=4,B=4)
     NameColor=(R=51,G=51,B=250)
     NormalFont=Font'MH2_C_V18.MySmallFont'
     NetSpeed=20000
     bClientUseRadar=True
     bClientUseRadarPreview=True
     bDrawEnd=True
     bDrawMonsters=True
     bDrawMonsterNames=True
     bDrawPlayers=True
     bDrawPlayerNames=True
     Position=RADAR_MiddleRight
     RadarColor=COL_None
     bClientShowMini=True
     bClientShowSynopsis=True
     ClientDrawMonsterName=True
     DrawKillMessages=True
     DrawDeathMessages=True
     SynColor=(G=128,B=255)
     MyLanguage="Svenska"
     StayTime=8
     Zscale=40
     numLines=6
     LowNumLines=6
     Admin(0)="Chris"
     AdminColor(0)=(R=255,G=255)
     AdminColor(1)=(B=255)
     AdminColor(2)=(R=128,G=255,B=255)
     AdminColor(3)=(R=138,G=164,B=166)
     AdminColor(4)=(R=203,G=147,B=52)
     AdminColor(5)=(G=128,B=255)
     AdminColor(6)=(R=255)
     AdminColor(7)=(G=136)
     AdminColor(8)=(G=255,B=128)
     AdminColor(9)=(R=227,G=210,B=176)
     TeamBeaconIcon=Texture'MH2_C_V18.HUD.TeamBeacon2'
     BeaconColor=(G=150)
     ChatMessageColor=(R=10,G=250,B=10)
     EventColor=(G=128,B=255)
     bShowZone=True
     bUseChat=True
     bCustomDeathMessage=True
     bAgeMessages=True
     MaleSuicideString="Had an aneurysm."
     FemaleSuicideString="Had an aneurysm."
     MsgFont=2
     ServerInfoClass=Class'MH2_C_V18.MH2ServerInfo'
     bAlwaysTick=True
     bNetTemporary=True
}
