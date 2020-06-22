class MyAdminConfig expands MyTab;

var MySecondEditControl NetSpeed, Lives, FFS, SFS, At, Dt, TL, GS, Add, MMH, MHM, MS, HRPS, MHR, MH, ARPS, MAR, DH;
var color colors;
var MySmallButton Save, Adds, Reset, reboot;
var MonsterReplicationinfotwo GRI;
var MHReplicationInfo PRI;
var MyCheckBox Ua, Uc, Bop, RR;
var MyLabelControl ClientMessagesText, GameRles, States, SPRS, RegenL; 
var BRI BRI;
const UpperLine=40;

function Created()
{
Super.Created();
WinLeft = (Root.WinWidth - WinWidth) / 2;
WinTop = (Root.WinHeight - WinHeight) / 2;
Colors.R=0;
Colors.G=255;
Colors.B=0;
GRI=MonsterReplicationinfotwo(GetPlayerOwner().GameReplicationInfo);
PRI=MHReplicationInfo(GetPlayerOwner().PlayerReplicationInfo);
BRI=PRI.BRI;

ClientMessagesText = MyLabelControl(CreateControl(class'MyLabelControl', 20, UpperLine, 200, 1));
ClientMessagesText.SetTextColor(Colors);
ClientMessagesText.SetText(LangObj.default.ClientMT);

    NetSpeed = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 60 , 150, 1 ));
	NetSpeed.SetTextColor(Colors);
	NetSpeed.NotifyWindow=Self;
	NetSpeed.EditBoxWidth=50;
	NetSpeed.SetText(LangObj.default.NetSpeed);
	NetSpeed.SetNumericOnly( True ) ;
	NetSpeed.SetHistory( False ) ;
	NetSpeed.SetMaxLength( 5 ) ;
	

	Lives = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 80 , 150, 1 ));
	Lives.SetTextColor(Colors);
	Lives.NotifyWindow=Self;
	Lives.EditBoxWidth=50;
	Lives.SetText(LangObj.default.Lives);
	Lives.SetNumericOnly( True ) ;
	Lives.SetHistory( False ) ;
	Lives.SetMaxLength( 3 ) ;
	
	
	FFS = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 100 , 150, 1 ));
	FFS.SetTextColor(Colors);
	FFS.NotifyWindow=Self;
	FFS.EditBoxWidth=50;
	FFS.SetText(LangObj.default.FFS);
	FFS.SetNumericOnly( False ) ;
	FFS.SetHistory( False ) ;
	FFS.SetMaxLength( 8 ) ;
	
	
	SFS = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 120 , 150, 1 ));
	SFS.SetTextColor(Colors);
	SFS.NotifyWindow=Self;
	SFS.EditBoxWidth=50;
	SFS.SetText(LangObj.default.SFS);
	SFS.SetNumericOnly( False ) ;
	SFS.SetHistory( False ) ;
	SFS.SetMaxLength( 8 ) ;
	
	
	Ua = MyCheckBox(CreateControl(class'MyCheckBox', 20, 140, 150, 1));
	Ua.SetTextColor(Colors);
	Ua.SetText(LangObj.default.Ua);
	Ua.SetFont(F_Normal);
	
	
	At = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 160 , 150, 1 ));
	At.SetTextColor(Colors);
	At.NotifyWindow=Self;
	At.EditBoxWidth=50;
	At.SetText(LangObj.default.At);
	At.SetNumericOnly( true ) ;
	At.SetHistory( False ) ;
	At.SetMaxLength( 3 ) ;
	

	Dt = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 180 , 150, 1 ));
	Dt.SetTextColor(Colors);
	Dt.NotifyWindow=Self;
	Dt.EditBoxWidth=50;
	Dt.SetText(LangObj.default.Dt);
	Dt.SetNumericOnly( true ) ;
	Dt.SetHistory( False ) ;
	Dt.SetMaxLength( 3 ) ;
	
	
	Uc = MyCheckBox(CreateControl(class'MyCheckBox', 20, 200, 150, 1));
	Uc.SetTextColor(Colors);
	Uc.SetText(LangObj.default.Uc);
	Uc.SetFont(F_Normal);
	
	
	Bop = MyCheckBox(CreateControl(class'MyCheckBox', 20, 220, 150, 1));
	Bop.SetTextColor(Colors);
	Bop.SetText(LangObj.default.Bop);
	Bop.SetFont(F_Normal);
	
//Game rules
GameRles = MyLabelControl(CreateControl(class'MyLabelControl', 20, 290, 200, 1));
GameRles.SetTextColor(Colors);
GameRles.SetText(LangObj.default.GameRules);	

	GS = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 310 , 150, 1 ));
	GS.SetTextColor(Colors);
	GS.NotifyWindow=Self;
	GS.EditBoxWidth=50;
	GS.SetText(LangObj.default.GS);
	GS.SetNumericOnly( true ) ;
	GS.SetHistory( False ) ;
	GS.SetMaxLength( 3 ) ;

	TL = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 330 , 150, 1 ));
	TL.SetTextColor(Colors);
	TL.NotifyWindow=Self;
	TL.EditBoxWidth=50;
	TL.SetText(LangObj.default.TL);
	TL.SetNumericOnly( true ) ;
	TL.SetHistory( False ) ;
	TL.SetMaxLength( 3 ) ;
	
	RR = MyCheckBox(CreateControl(class'MyCheckBox', 20, 350, 150, 1));
	RR.SetTextColor(Colors);
	RR.SetText(LangObj.default.RR);
	RR.SetFont(F_Normal);
	
	Add = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 370 , 150, 1 ));
	Add.SetTextColor(Colors);
	Add.NotifyWindow=Self;
	Add.EditBoxWidth=50;
	Add.SetText(LangObj.default.Add);
	Add.SetNumericOnly( false ) ;
	Add.SetHistory( False ) ;
	Add.SetMaxLength( 2 ) ;
	
	Adds = MySmallButton(CreateControl(Class'MySmallButton', 20 , 390 , 64, 1 ));
	Adds.WinHeight=16;
	Adds.SetText(LangObj.default.Adds);
	Adds.bDisabled=False;
	 //ScriptedPawn
	 
	SPRS = MyLabelControl(CreateControl(class'MyLabelControl', 270, 40, 300, 1));
	SPRS.SetTextColor(Colors);
	SPRS.SetText(LangObj.default.SPRS);
	
	MMH = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 60 , 230, 1 ));
	MMH.SetTextColor(Colors);
	MMH.NotifyWindow=Self;
	MMH.EditBoxWidth=50;
	MMH.SetText(LangObj.default.MMH);
	MMH.SetNumericOnly( true ) ;
	MMH.SetHistory( False ) ;
	MMH.SetMaxLength( 5 ) ;
	
	MHM = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 80 , 230, 1 ));
	MHM.SetTextColor(Colors);
	MHM.NotifyWindow=Self;
	MHM.EditBoxWidth=50;
	MHM.SetText(LangObj.default.MHM);
	MHM.SetNumericOnly( false ) ;
	MHM.SetHistory( False ) ;
	MHM.SetMaxLength( 8 ) ;
	
	MS = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 100 , 230, 1 ));
	MS.SetTextColor(Colors);
	MS.NotifyWindow=Self;
	MS.EditBoxWidth=50;
	MS.SetText(LangObj.default.MS);
	MS.SetNumericOnly( true ) ;
	MS.SetHistory( False ) ;
	MS.SetMaxLength( 1 ) ;
	//Regen etc...
	
RegenL = MyLabelControl(CreateControl(class'MyLabelControl', 270, 290, 200, 1));
RegenL.SetTextColor(Colors);
RegenL.SetText(LangObj.default.RegenL);	
	
	HRPS = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 310 , 230, 1 ));
	HRPS.SetTextColor(Colors);
	HRPS.NotifyWindow=Self;
	HRPS.EditBoxWidth=50;
	HRPS.SetText(LangObj.default.HRPS);
	HRPS.SetNumericOnly( true ) ;
	HRPS.SetHistory( False ) ;
	HRPS.SetMaxLength( 2 ) ;
	
	MHR = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 330 , 230, 1 ));
	MHR.SetTextColor(Colors);
	MHR.NotifyWindow=Self;
	MHR.EditBoxWidth=50;
	MHR.SetText(LangObj.default.MHR);
	MHR.SetNumericOnly( true ) ;
	MHR.SetHistory( False ) ;
	MHR.SetMaxLength( 3 ) ;
	
	MH = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 350 , 230, 1 ));
	MH.SetTextColor(Colors);
	MH.NotifyWindow=Self;
	MH.EditBoxWidth=50;
	MH.SetText(LangObj.default.MH);
	MH.SetNumericOnly( true ) ;
	MH.SetHistory( False ) ;
	MH.SetMaxLength( 4 ) ;
	
	ARPS = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 390 , 230, 1 ));
	ARPS.SetTextColor(Colors);
	ARPS.NotifyWindow=Self;
	ARPS.EditBoxWidth=50;
	ARPS.SetText(LangObj.default.ARPS);
	ARPS.SetNumericOnly( true ) ;
	ARPS.SetHistory( False ) ;
	ARPS.SetMaxLength( 3 ) ;
	
	MAR = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 410 , 230, 1 ));
	MAR.SetTextColor(Colors);
	MAR.NotifyWindow=Self;
	MAR.EditBoxWidth=50;
	MAR.SetText(LangObj.default.MAR);
	MAR.SetNumericOnly( true ) ;
	MAR.SetHistory( False ) ;
	MAR.SetMaxLength( 3 ) ;

	DH = MySecondEditControl(CreateControl(Class'MySecondEditControl', 270 , 370 , 230, 1 ));
	DH.SetTextColor(Colors);
	DH.NotifyWindow=Self;
	DH.EditBoxWidth=50;
	DH.SetText(LangObj.default.DH);
	DH.SetNumericOnly( true ) ;
	DH.SetHistory( False ) ;
	DH.SetMaxLength( 3 ) ;
	
LoadCurrentSettings();

States = MyLabelControl(CreateControl(class'MyLabelControl', 50, 440, 450, 1));
States.SetTextColor(Colors);
States.SetText(LangObj.default.States);
Save = MySmallButton(CreateControl(Class'MySmallButton', 300 , 460 , 64, 1 ));
Save.WinHeight=16;
Save.SetText(LangObj.default.Save);
Save.bDisabled=False;
Reset = MySmallButton(CreateControl(Class'MySmallButton', 200 , 460 , 64, 1 ));
Reset.WinHeight=16;
Reset.SetText(LangObj.default.Reset);
Reset.bDisabled=False;
reboot = MySmallButton(CreateControl(Class'MySmallButton', 400 , 460 , 64, 1 ));
reboot.WinHeight=16;
reboot.SetText(LangObj.default.reboot);
reboot.bDisabled=False;
}

function ChangeLan()
{
Super.ChangeLan();

RegenL.SetText(LangObj.default.RegenL);
DH.SetText(LangObj.default.DH);
MAR.SetText(LangObj.default.MAR);
ARPS.SetText(LangObj.default.ARPS);
MH.SetText(LangObj.default.MH);
MHR.SetText(LangObj.default.MHR);
RegenL.SetText(LangObj.default.RegenL);
reboot.SetText(LangObj.default.reboot);
Lives.SetText(LangObj.default.Lives);
FFS.SetText(LangObj.default.FFS);
SFS.SetText(LangObj.default.SFS);
Ua.SetText(LangObj.default.Ua);
At.SetText(LangObj.default.At);
Dt.SetText(LangObj.default.Dt);
Uc.SetText(LangObj.default.Uc);
Bop.SetText(LangObj.default.Bop);
GameRles.SetText(LangObj.default.GameRules);
GS.SetText(LangObj.default.GS);
TL.SetText(LangObj.default.TL);
RR.SetText(LangObj.default.RR);
Add.SetText(LangObj.default.Add);
Adds.SetText(LangObj.default.Adds);
SPRS.SetText(LangObj.default.SPRS);
MMH.SetText(LangObj.default.MMH);
MHM.SetText(LangObj.default.MHM);
MS.SetText(LangObj.default.MS);
ClientMessagesText.SetText(LangObj.default.ClientMT);
Save.SetText(LangObj.default.Save);
NetSpeed.SetText(LangObj.default.NetSpeed);
HRPS.SetText(LangObj.default.HRPS);
States.SetText(LangObj.default.States);
Reset.SetText(LangObj.default.Reset);
}

function LoadCurrentSettings()
{
Bop.bChecked = BRI.UseAwards;
Uc.bChecked = !BRI.StopPlayerCollision;
Dt.SetValue(String(BRI.KakuTime));
At.SetValue(String(BRI.AmpTime));
Ua.bChecked = BRI.UseAwards;
SFS.SetValue(String(BRI.SelfDamageScale));
FFS.SetValue(String(BRI.FriendlyFireScale));
Lives.SetValue(String(MonsterReplicationinfotwo(GetPlayerOwner().GameReplicationInfo).Live));
NetSpeed.SetValue(String(HUD.NetSpeed));
GS.SetValue(String(int(BRI.GameSpeed)*100));
TL.SetValue(String(BRI.TimeLimit));
RR.bChecked=BRI.bRequireReady;
MMH.SetValue(string(BRI.MaxMonsterHealth));
MHM.SetValue(String(BRI.MonsterHealthMultiplier));
MS.SetValue(string(BRI.MonsterSkill));
HRPS.SetValue(String(BRI.HRPS));
MHR.SetValue(String(BRI.MHR));
MH.SetValue(String(BRI.MH));
DH.SetValue(String(BRI.DH));
ARPS.SetValue(String(BRI.ARPS));
MAR.SetValue(String(BRI.MAR));

}

function Notify(UWindowDialogControl C, byte E)
{

	if(E==DE_Change)
	{
	
	}
	if(E==DE_Click)
	{
		if(C==Adds)
			GetPlayerOwner().ConsoleCommand("Admin AddBots"@Add.GetValue());
		if(C==reboot){
			GetPlayerOwner().ConsoleCommand("Admin BroadcastThisMessage "@GetPlayerOwner().PlayerReplicationinfo.PlayerName@"is rebooting the server.");
			GetPlayerOwner().ConsoleCommand("Admin DoReboot");
			}
		if(C==Save)
		{
			log("Applying settings");
			GetPlayerOwner().ConsoleCommand("Admin DoNetSpeed"@NetSpeed.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus UseAwards"@String(Ua.bChecked));
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus stopPlayerCollision"@String(!Uc.bChecked));
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus KakuTime"@Dt.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus AmpTime"@At.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus UseAwards"@String(Ua.bChecked));
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus bBounceOffPlayer"@String(Bop.bChecked));
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus SelfDamageScale"@SFS.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterHunt2 FriendlyFireScale"@FFS.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterHunt2 Live"@lives.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin DoGameSpeed"@GS.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterHunt2 TimeLimit"@TL.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterHunt2 bRequireReady"@String(RR.bChecked));
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus MaxMonsterHealth"@MMH.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus MHealthMultiplier"@MHM.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterHunt2 SkillMonster"@MS.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus HealthRegenPerSec"@HRPS.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus MaxRegenHealth"@MHR.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus MaxHealth"@MH.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus DefaultHealth"@DH.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus AmmoRegenPerSec"@ARPS.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin Set MH2_C_V18.MonsterBasePlus MaxAmmoRegen"@MAR.GetValue());
			GetPlayerOwner().ConsoleCommand("Admin BroadcastThisMessage "@GetPlayerOwner().PlayerReplicationinfo.PlayerName@"has changed server settings.");
			GetPlayerOwner().ConsoleCommand("Admin SaveMyConfig");
		}
		if(C==Reset)
			LoadCurrentSettings();
	}
	SaveConfigs();
}



function Paint(Canvas C, float X, Float Y)
{
Super.Paint(C,X,Y);

C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
//Draw the nice background.
DrawStretchedTextureSegment( C, 0, 0, 544, winheight, 0, 0, 544, winheight, Texture'BackgroundTwo' );
}


function SaveConfigs()
{
Super.SaveConfigs();
if(HUD!=none)
HUD.SaveConfig();
}

defaultproperties
{
}
