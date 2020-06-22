class Monster2BotConfig expands UTBotConfigClient
	config(MH2_C_V18);

#exec TEXTURE IMPORT NAME=MHBotsBG FILE=Textures\MHBotsBG.PCX GROUP=Rules LODSET=0

function Created()
{
	Super.Created();
	if (BalanceTeamsCheck != None)
	BalanceTeamsCheck.HideWindow();	
}

function Paint(Canvas C, float X, float Y)
{
	Super.Paint(C, X, Y);
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'MHBotsBG');
}

function NumBotsChanged()
{
	if (int(NumBotsEdit.GetValue()) > 32)
		NumBotsEdit.SetValue("32");

	if(BotmatchParent.bNetworkGame)
		class<MonsterHunt2>(BotmatchParent.GameClass).default.MinPlayers = int(NumBotsEdit.GetValue());
	else
		class<MonsterHunt2>(BotmatchParent.GameClass).default.InitialBots = int(NumBotsEdit.GetValue());
	BotmatchParent.GameClass.static.StaticSaveConfig();
}

function LoadCurrentValues()
{
	Super.LoadCurrentValues();
	if(BotmatchParent.bNetworkGame)
		NumBotsEdit.SetValue(string(class'MH2_C_V18.MonsterHunt2'.Default.MinPlayers));
	else
		NumBotsEdit.SetValue(string(class'MH2_C_V18.MonsterHunt2'.Default.InitialBots));
}

function BaseChanged()
{
	Super.BaseChanged();
	class<MonsterHunt2>(BotmatchParent.GameClass).Default.SkillMonster = BaseCombo.GetSelectedIndex();
	class<MonsterHunt2>(BotmatchParent.GameClass).static.StaticSaveConfig();
}

defaultproperties
{
     MinPlayersText="Min. Total Hunters"
     BaseText="A.I. Hunter Skill:"
     SkillTaunts(0)="They might know how to kill a Fly."
     SkillTaunts(2)="Look out monsters!"
     SkillTaunts(3)="Monsters are in for a good beating."
     SkillTaunts(4)="I wouldn't like to be in the monsters shoes..."
     SkillTaunts(5)="It's a pity the monsters can't respawn."
     SkillTaunts(6)="Those poor monsters are already dead."
     SkillTaunts(7)="Rest in peace, monsters..."
}
