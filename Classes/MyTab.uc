class MyTab extends UwindowPageWindow;

var class<mylanguageclass> LangObj;
var MyTab NextTab;
var CMonsterHUD HUD;
function BeforeCreate()
{
	Super.BeforeCreate();
	
HUD=CMonsterHUD(GetPlayerOwner().MyHUD);
if(HUD.index44<16)
HUD.Tabs[HUD.index44++]=self;
        LangObj=class<mylanguageclass>(DynamicLoadObject("MH2_C_V18.MyLanguage"$HUD.MyLanguage, class'Class'));
	HUD.LangObj=LangObj;
}

function ChangeLan()
{
LangObj=HUD.LangObj;
}

function Timer();

function NewPlayer(string name);

defaultproperties
{
}
