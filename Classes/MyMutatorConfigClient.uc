//

//Created by chris 2014-02-03
class MyMutatorConfigClient expands UWindowPageWindow;

#exec Texture import File=Textures\BackgroundPG.PCX Name=BackGroundTwo MIPS=ON
var bool hasAdminCrap;
var MyPageControl Page;
var int index;
var UWindowPageControlPage Pages[16];
var LevelInfo L;

function Created()
{
CMonsterHUD(GetPlayerOwner().MyHUD).MainClientWindow=Self;
L=GetLevel();
Super.Created();
    Page = MyPageControl(CreateWindow(class'MyPageControl', 0, 14, 544, 547));
	Page.SetMultiLine(false);
	Pages[0]=Page.AddPage(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab1, class'MyMainPage');
	Pages[1]=Page.AddPage(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab2, class'MyRadarClientSettings');
	Pages[2]=Page.AddPage(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab3, class'MyGeneralHUDSettings');
	Pages[3]=Page.AddPage(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab4, class'MyChatLog');
	Pages[4]=Page.AddPage(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab5, class'MyPMLog');
	//Pages[5]=Page.AddPage("MapVote", class'MyMapPage');
	//Pages[6]=Page.AddPage("Report", class'MyReportDialog');
	Page.SetFont(F_Normal);
	if(GetPlayerOwner().PlayerReplicationInfo != none && GetPlayerOwner().PlayerReplicationInfo.bAdmin)
		GiveAdminTabs();
}

function GiveAdminTabs()
{
if(Pages[7]==none && Pages[8] == none){
	Pages[7]=Page.AddPage(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab6, class'MyAdminConfig');
	Pages[8]=Page.AddPage("Console", class'MyAdminConsole');
	hasAdminCrap=True;
	}
}

function AfterCreate()
{
	Super.AfterCreate();
	DesiredWidth = 532;
	DesiredHeight = 512;
}

function Paint(Canvas C, float X, float Y)
{
//Super.Paint(C,X,Y);
//Dynamically set the WindowTitle
//if(GetLevel()==none || L!=GetLevel())
//	Root.CloseActiveWindow();//Old instance o
}

function Adminlogin()
{
if(!hasAdminCrap)
GiveAdminTabs();
}


function ChangeLan()
{
if(Pages[0]==none) return;
Pages[0].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab1);
Pages[1].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab2);
Pages[2].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab3);
Pages[3].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab4);
Pages[4].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab5);
if(GetPlayerOwner().PlayerReplicationInfo != none && GetPlayerOwner().PlayerReplicationInfo.bAdmin)
Pages[7].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab6);
//if(Pages[6]!=none)
	//Pages[6].SetCaption(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Tab6);
}

function SaveConfigs()
{
	Super.SaveConfigs();
}

defaultproperties
{
}
