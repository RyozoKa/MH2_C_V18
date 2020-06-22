class MH2ServerInfo extends ServerInfo;

var color WhiteColor, RedColor;
var int index;
#Exec Texture Import File="Textures\HaveFun.pcx" Name=HaveFun
//var FontInfo MyFonts; dumbass....
struct PDStats
{
var string PlayerName;
var int Score;
var byte Deaths;
var int Headshots;
var int KilledMonsters;
};

var PDStats Top20[20];

function Destroyed()
{
   Super.Destroyed();
   if ( MyFonts != None )
      MyFonts.Destroy();
}

function PostBeginPlay()
{
   Super.PostBeginPlay();
 //  MyFonts = FontInfo(spawn(Class<Actor>(DynamicLoadObject(class'ChallengeHUD'.default.FontInfoClass, class'Class'))));
settimer(1,true);
}

function Timer()
{
local int i;
	if(MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo) == none) return;
	if(Top20[0].PlayerName == "")
	{
		//log("Transfering stats");
		for(i=0;i<20;i++)//replicate it
		{
			MonsterReplicationInfoTwo(PlayerPawn(Owner).GameReplicationInfo).SetStats(Top20[i].PlayerName,Top20[i].Score,Top20[i].Deaths,Top20[i].Headshots,Top20[i].KilledMonsters,i);
		}
	}
}

function int GetScore(PDStats Stat)
{
local int sum;

if(Stat.KilledMonsters>4 && Stat.HeadShots > 4) //KilledMonster will almost always be more than 0, Headshots is less of a case.
Sum = (Stat.KilledMonsters / (Stat.KilledMonsters / 4)) + (Stat.HeadShots / (Stat.HeadShots / 4));
else if(Stat.KilledMonsters>=4 && Stat.HeadShots < 4)
Sum = (Stat.KilledMonsters / (Stat.KilledMonsters / 4)) + Stat.HeadShots;
if ( Sum<=1) Sum=2;//No extra points
   return (Stat.Score * (Sum / 2));//Will see
}

function RenderInfo( canvas C )
{
local float XStart, YStart, YL, XL, WhiteX, WhiteY, XL2, YL2;
local int i;
local bool bDrawWhite;
local font CFont;

CFont=C.Font;
C.Reset();
C.Font=CFont;
//if(PlayerPawn(Owner).Weapon!=none)
    //PlayerPawn(Owner).Weapon.bHideWeapon=True;
//Draw scoreboard.
C.Style=ERenderStyle.STY_Modulated;
C.SetPos((C.SizeX/2) - 400, 0); //X is drawn from right side minus 800 pixels, Y starts from top plus 40 pixels down.
C.DrawRect(Texture'Shade', 800, 450);
C.Style=ERenderStyle.STY_Normal;
//Draw scores and names.....
XStart=((C.SizeX/2) - 400);
YStart=40;
YL=YStart;
XL=C.SizeX-100;
WhiteX=XStart;
WhiteY=YStart-1;
	C.DrawColor.R=255;
	C.DrawColor.G=255;
	C.DrawColor.B=255;
//Header
C.SetPos(XStart, 5);
C.DrawText("Player Name");

C.SetPos(XStart + 300, 5);
C.DrawText("Sub Score");

C.SetPos(XStart + 400, 5);
C.DrawText("Kills");

C.SetPos(XStart + 460, 5);
C.DrawText("Heads.");

C.SetPos(XStart + 550, 5);
C.DrawText("Deaths");

C.SetPos(XStart + 650, 5);
C.DrawText("XP");


    for(i=0;i<20;i++)
	{
//	C.reset();
	C.Style=ERenderStyle.STY_Normal;//Needs little normality.
	XL=XStart+700;
	C.Font=CFont;
	
	if(bDrawWhite){
		C.Style=ERenderStyle.STY_Modulated;
		C.SetPos(WhiteX,WhiteY);
		C.DrawRect(Texture'Whiteness',800, 20);//19 seems more centered.
		//bDrawWhite=!bDrawWhite;
		WhiteY+=40;//Draw on every other line.
		C.Style=ERenderStyle.STY_Normal;
		}
	
	if(C.ViewPort.Actor.PlayerReplicationinfo.PlayerName == Top20[i].PlayerName)
	{
	C.DrawColor.R=0;
    C.DrawColor.G=128;
    C.DrawColor.B=255;
	}
	else
	{
    C.DrawColor.R=0;
    C.DrawColor.G=200;
    C.DrawColor.B=128;
	}
	
	//XP points
	XL-=50;
	C.SetPos(XL,YL);
	C.DrawText(GetScore(Top20[i]));
	
	//Deaths
	XL-=100;
	C.SetPos(XL,YL);
	C.DrawText(Top20[i].Deaths);
	
	
	XL-=50;
	//HeadShots
	C.SetPos(XL-20,YL);
	C.DrawText(Top20[i].Headshots);
	
	
	XL-=100;
	//KilledMonsters
	C.SetPos(XL,YL);
	C.DrawText(Top20[i].KilledMonsters);
	
	
	XL-=100;
	//Draw Score
	C.SetPos(XL,YL);
	C.DrawText(Top20[i].Score);
	
	
	XL-= 300;//more space for names
	C.SetPos(XL,YL);
	if(Top20[i].PlayerName!="")
	    C.DrawText(Top20[i].PlayerName);
	else C.DrawText("None");//No player for this slot.
	
	YL+=20;
	bDrawWhite=!bDrawWhite;
	}
	
	C.DrawColor.R=255;
	C.DrawColor.G=255;
	C.DrawColor.B=255;
	//Draw left side texts.
	//if(C.SizeX>=1024){//Only draw if width is atleast 1024
	//Need new position.
	C.Style=ERenderStyle.STY_Normal;
	XStart=(C.SizeX/2);
    YStart=455;
	XL=0;
	YL=0;
	if (C.SizeY>=600){
	C.StrLen("Welcome to"@PlayerPawn(Owner).GameReplicationInfo.ServerName@"where all the fun happens!",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("Welcome to"@PlayerPawn(Owner).GameReplicationInfo.ServerName@"where all the fun happens!");
	YStart+=20;
	
	C.StrLen("In this list you can see the top 20 players of this server.",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("In this list you can see the top 20 players of this server.");
	YStart+=20;
	
	C.StrLen("It also involves XP points, which is affected by all the other scores.",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("It also involves XP points, which is affected by all the other scores.");
	YStart+=20;
	
	C.StrLen("Scores are updated at the end of game, and new results will be shown at next start.",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("Scores are updated at the end of game, and new results will be shown at next start.");
	YStart+=20;
	
	C.StrLen("Remember that Death points affect the XP negatively.",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("Remember that Death points affect the XP negatively.");
	YStart+=20;
	
	C.StrLen("Also remember that both self damage, and friendly fire is enabled.",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("Also remember that both self damage, and friendly fire is enabled.");
	YStart+=20;
	
	C.StrLen("So don't fire like a maniac!",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("So don't fire like a maniac!");
	YStart+=20;
	
	C.StrLen("And last but not least remember to have fun, and work with your teammates!",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("And last but not least remember to have fun, and work with your teammates!");
	YStart+=20;
	
	C.StrLen("Designed and developed by Christopher, the owner of this server.",XL,YL);
	C.SetPos(XStart-(XL/2),YStart);
	C.DrawText("Designed and developed by Christopher, the owner of this server.");
	}
	XL=0;
	YL=0;
	//Draw local time at bottom center
	C.StrLen(DrawTwoDigit(Owner.Level.Hour)$":"$DrawTwoDigit(Owner.Level.Minute)$":"$DrawTwoDigit(Owner.Level.Second),XL,YL);
	C.SetPos((C.SizeX / 2) - ( XL / 2),C.SizeY-(YL * 2));
	C.DrawText(DrawTwoDigit(Owner.Level.Hour)$":"$DrawTwoDigit(Owner.Level.Minute)$":"$DrawTwoDigit(Owner.Level.Second));
	
	C.StrLen(DrawTwoDigit(Owner.Level.Day)$"/"$DrawTwoDigit(Owner.Level.Month)$"/"$DrawTwoDigit(Owner.Level.Year),XL,YL);
	C.SetPos((C.SizeX / 2) - ( XL / 2),C.SizeY-YL);
	C.DrawText(DrawTwoDigit(Owner.Level.Day)$":"$DrawTwoDigit(Owner.Level.Month)$":"$DrawTwoDigit(Owner.Level.Year));
	
	C.Style=ERenderStyle.STY_Translucent;
	C.SetPos((C.SizeX/2)-256,440);
	C.DrawTile(Texture'HaveFun',512,512,0,0,512,512);
}

function string DrawTwoDigit(int i)
{
if ( i > 9 ) return string(i);
return "0"$string(i);
}

defaultproperties
{
     WhiteColor=(R=255,G=255,B=255)
     RedColor=(R=255)
     ServerInfoText="Player Stats"
}
