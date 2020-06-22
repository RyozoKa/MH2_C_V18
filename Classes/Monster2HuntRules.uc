// Brought this class in in the hopes of fixing the forced red team that MH has.
// Unfortunately it breaks the replication of the radar and scoreboard if you alter
// the assigned team. Feel free to try to fix this but remember many outside mods
// depend on this replication data to be accurate.

class Monster2HuntRules expands UTRulesCWindow
	config(MH2_C_V18);

#exec TEXTURE IMPORT NAME=MHRulesBG FILE=Textures\MHRulesBG.PCX GROUP=Rules LODSET=0

function Created()
{
	Super.Created();
}

function LoadCurrentValues()
{
	Super.LoadCurrentValues();

	if(TimeEdit != None)
		TimeEdit.SetValue(string(Class<MonsterHunt2>(BotmatchParent.GameClass).Default.TimeLimit));

	if(MaxPlayersEdit != None)
		MaxPlayersEdit.SetValue(string(Class<MonsterHunt2>(BotmatchParent.GameClass).Default.MaxPlayers));

	if(MaxSpectatorsEdit != None)
		MaxSpectatorsEdit.SetValue(string(Class<MonsterHunt2>(BotmatchParent.GameClass).Default.MaxSpectators));

	if((BotmatchParent.bNetworkGame) && (WeaponsCheck != none))
		WeaponsCheck.bChecked = Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bMultiWeaponStay;
	else
		WeaponsCheck.bChecked = Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bCoopWeaponMode;

	if(FragEdit != None)
		FragEdit.SetValue(string(Class<MonsterHunt2>(BotmatchParent.GameClass).Default.Live));
	
	if(TourneyCheck != None)
		TourneyCheck.bChecked = Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bUseTeamSkin;

	if(ForceRespawnCheck != None)
		ForceRespawnCheck.bChecked = Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bForceRespawn;
}

function Paint(Canvas C, float X, float Y)
{
	Super.Paint(C, X, Y);

	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'MHRulesBG');
}

function FragChanged()
{
	Class<MonsterHunt2>(BotmatchParent.GameClass).Default.Live = int(FragEdit.GetValue());
}

function TourneyChanged()
{
	Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bUseTeamSkin = TourneyCheck.bChecked;
}

function ForceRespawnChanged()
{
	Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bForceRespawn = ForceRespawnCheck.bChecked;
}

function TimeChanged()
{
	Class<MonsterHunt2>(BotmatchParent.GameClass).Default.TimeLimit = int(TimeEdit.GetValue());
}

function WeaponsChecked()
{
	if(BotmatchParent.bNetworkGame)
		Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bMultiWeaponStay = WeaponsCheck.bChecked;
	else
		Class<MonsterHunt2>(BotmatchParent.GameClass).Default.bCoopWeaponMode = WeaponsCheck.bChecked;
}

function SaveConfigs()
{
	Super.SaveConfigs();
	BotmatchParent.GameClass.static.StaticSaveConfig();
	GetPlayerOwner().SaveConfig();
}

defaultproperties
{
     TourneyText="Force team colours"
     TourneyHelp="If enabled, players will use red team skins and HUD, otherwise they will use their own skin and HUD settings."
     FragText="Lives"
     FragHelp="Set the number of lives each hunter starts with for each round. Set it to 0 for no limit."
}
