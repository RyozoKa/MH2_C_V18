class MyMainPage expands MyTab;

#Exec TEXTURE IMPORT FILE=Textures/MissingImage.pcx name=MissingImage

var MyLabelControl LanguageT, PanelT, MapVoteT;
var MyComboControl Language;
var color colors;
var MySmallButton Play, Spectate, AdminLogin, ExitGame;
var UMenuRaisedButton MapVote, Panel;
var LevelInfo Level;
var MyDialogWindow Modal;
var bool bMapvotefocus, bPanelFocus;
function Created()
{
Super.Created();
HUD.Modal=Modal;
WinLeft = (Root.WinWidth - WinWidth) / 2;
WinTop = (Root.WinHeight - WinHeight) / 2;
Colors.R=0;
Colors.G=255;
Colors.B=0;
//Language Label
if(LanguageT==none)
LanguageT = MyLabelControl(CreateControl(class'MyLabelControl', 50, 53, 120, 1));
LanguageT.SetTextColor(Colors);
LanguageT.SetText(LangObj.default.LanguageT);

PanelT = MyLabelControl(CreateControl(class'MyLabelControl', 50, 299, 120, 1));
PanelT.SetTextColor(Colors);
PanelT.SetText(LangObj.default.MapVoteKey);

MapVoteT = MyLabelControl(CreateControl(class'MyLabelControl', 50, 339, 100, 1));
MapVoteT.SetTextColor(Colors);
MapVoteT.SetText(LangObj.default.PanelKey);


//Language Combo
if(Language==none)
Language = MyComboControl(CreateControl(class'MyComboControl', 65, 75, 100, 1));

Language.SetFont(F_Normal);
Language.SetEditable(False);
Language.AddItem("English");//0 
Language.AddItem("Svenska");
Language.AddItem("Español");
Language.AddItem("Deutsch");
Language.SetSelectedIndex(GetNum());
Language.EditBoxWidth=100;

Play=MySmallButton(CreateControl(class'MySmallButton', 50, 129, 128, 32));
Play.WinHeight=32;
Play.WinWidth=128;
Play.SetTextColor(Colors);
Play.SetText(LangObj.default.Play);

Spectate=MySmallButton(CreateControl(class'MySmallButton', 50, 174, 128, 32));
Spectate.WinHeight=32;
Spectate.WinWidth=128;
Spectate.SetTextColor(Colors);
Spectate.SetText(LangObj.default.Spec);

AdminLogin=MySmallButton(CreateControl(class'MySmallButton', 50, 216, 128, 32));
AdminLogin.WinHeight=32;
AdminLogin.WinWidth=128;
AdminLogin.SetTextColor(Colors);
AdminLogin.SetText(LangObj.default.Admin);

ExitGame=MySmallButton(CreateControl(class'MySmallButton', 50, 259, 128, 32));
ExitGame.WinHeight=32;
ExitGame.WinWidth=128;
ExitGame.SetTextColor(Colors);
ExitGame.SetText(LangObj.default.Exit);

MapVote=UMenuRaisedButton(CreateControl(class'UMenuRaisedButton', 50, 319, 128, 32));
MapVote.Align = TA_center;
Panel=UMenuRaisedButton(CreateControl(class'UMenuRaisedButton', 50, 359, 128, 32));
Panel.Align = TA_center;

GetKeyBinds();
Level=GetLevel();
}

function GetKeyBinds()
{
local int i;
	for(i=0;i<255;i++)
	{
		if(GetPlayerOwner().ConsoleCommand("Get input"@Chr(i)) ~= "Mutate BDBMapVote.VoteMenu" || GetPlayerOwner().ConsoleCommand("Get input"@Chr(i)) ~= "Mutate NSC OPENVOTE")
			MapVote.SetText(Chr(i));
		else if(GetPlayerOwner().ConsoleCommand("Get input"@Chr(i)) ~= "Mutate asc#get#window" || GetPlayerOwner().ConsoleCommand("Get input"@Chr(i)) ~= "Mutate hz0090" || GetPlayerOwner().ConsoleCommand("Get input"@Chr(i)) ~= "Mutate NSC OPENRCP")
			Panel.SetText(Chr(i));
	}
}

function ChangeLan()
{
Super.ChangeLan();
if(LanguageT!=none)
	LanguageT.SetText(LangObj.default.LanguageT);
if(ExitGame!=none)
	ExitGame.SetText(LangObj.default.Exit);
if(AdminLogin!=none)
	AdminLogin.SetText(LangObj.default.Admin);
if(Spectate!=none)
	Spectate.SetText(LangObj.default.Spec);
if(Play!=none)
	Play.SetText(LangObj.default.Play);
	if(Modal != none)
		Modal.ChangeLan();
	PanelT.SetText(LangObj.default.MapVoteKey);
	MapVoteT.SetText(LangObj.default.PanelKey);
}

function int GetNum()
{
if(LangObj.default.ThisLanguage=="English") return 0;
if(LangObj.default.ThisLanguage=="Svenska") return 1;
if(LangObj.default.ThisLanguage=="Espanol") return 2;
if(LangObj.default.ThisLanguage=="Deutsch") return 3;
}

function string GetStr()
{
if(Language.GetSelectedIndex()==0) return "English";
if(Language.GetSelectedIndex()==1) return "Svenska";
if(Language.GetSelectedIndex()==2) return "Espanol";
if(Language.GetSelectedIndex()==3) return "Deutsch";
}

function Notify(UWindowDialogControl C, byte E)
{

	if(E==DE_Change)
	{
		if(C==Language)
		{
			HUD.MyLanguage=GetStr();
			HUD.SaveConfig();
			HUD.ChangeLang();
		}
	}
	if(E==DE_Click)
	{
		if(C==MapVote)
		{
			bMapvotefocus=!bMapvotefocus;
			MapVote.bDisabled=bMapvotefocus;
		}
		else {bMapvotefocus = false; MapVote.bDisabled=False;}
		if(C==Panel)
		{
			bPanelFocus=!bPanelFocus;
			Panel.bDisabled=bPanelFocus;
		}
		else {bPanelFocus = false; Panel.bDisabled=False;}
		
		if(C==Play)
		{
			if(GetPlayerOwner().PlayerReplicationInfo.bIsSpectator)
			{
				GetPlayerOwner().UpdateURL("OverrideClass", "", True);
				Root.Close();
				GetPlayerOwner().ConsoleCommand("Reconnect");
			}
			else GetPlayerOwner().ConsoleCommand("Reconnect");
		}
		
		if(C==Spectate)
		{
			if(GetPlayerOwner().IsA('TournamentPlayer'))
			{
				GetPlayerOwner().UpdateURL("OverrideClass", "Botpack.CHSpectator", True);
				Root.Close();
				GetPlayerOwner().ConsoleCommand("Reconnect");
			}
			else GetPlayerOwner().ConsoleCommand("Reconnect");
		}
		
		if(C==ExitGame)
			GetPlayerOwner().ConsoleCommand("Exit");
		
		if(C==AdminLogin)
		{
			Modal=MyDialogWindow(Root.CreateWindow(class'MyDialogWindow', 0, 0, 256, 256));
		//	Modal.focusWindow();
		//	Modal.ShowWindow();
		//	Modal.bringToFront();
		}
		if(C == Panel)
		{
		
		}
	}
	SaveConfigs();
}

function KeyDown(int Key, float X, float Y)
{
	if(bPanelFocus){
		Panel.SetText(Chr(Key));
		GetPlayerOwner().ConsoleCommand("Set input"@Chr(Key)@"Mutate NSC OPENRCP");
		bPanelFocus=false;
		Panel.bDisabled=False;
		}
	else if(bMapvotefocus){
		MapVote.SetText(Chr(Key));
		GetPlayerOwner().ConsoleCommand("Set input"@Chr(Key)@"Mutate BDBMapVote.VoteMenu");
		bMapvotefocus=False;
		MapVote.bDisabled=False;
		}
}

function Paint(Canvas C, float X, Float Y)
{
Super.Paint(C,X,Y);

C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
//Draw the nice background.
DrawStretchedTextureSegment( C, 0, 0, 544, winheight, 0, 0, 544, winheight, Texture'BackgroundTwo' );

C.Style = GetPlayerOwner().ERenderStyle.STY_Modulated;
DrawStretchedTextureSegment( C, 50, 50, 128, 64, 0, 0, 1, 1, Texture'Shade' );
//Draw the button box
DrawStretchedTextureSegment( C, 35, 114, 158, 276, 0, 0, 1, 1, Texture'Shade' );

//Map infio
DrawStretchedTextureSegment( C, 272, 50, 220, 349, 0, 0, 1, 1, Texture'Shade' );
C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
if(Level!=none && Level.Screenshot!=none)
	DrawStretchedTextureSegment( C, 282, 60, 200, 200, 0, 0, Level.ScreenShot.USize, Level.ScreenShot.VSize, Level.ScreenShot );
else DrawStretchedTextureSegment( C, 282, 60, 200, 200, 0, 0, 128, 128, Texture'MissingImage' );

C.DrawColor.R=255;
C.DrawColor.G=255;
C.DrawColor.B=255;
C.Font = Root.Fonts[F_Normal];
ClipText(C, 282, 268, LangObj.default.Title@Level.Title, True);
ClipText(C, 282, 288, LangObj.default.Author@Level.Author, True);
ClipText(C, 282, 308, LangObj.default.Player@Level.IdealPlayerCount, True);
ClipText(C, 282, 328, LangObj.default.Time@MonsterReplicationInfoTwo(GetPlayerOwner().GameReplicationInfo).TimesPlayed, True);
}


function SaveConfigs()
{
Super.SaveConfigs();
HUD.SaveConfig();
}

defaultproperties
{
}
