//*********************************************************************************************************************
//**********************************************************************************************************************


class MonsterHunt2 expands TeamGamePlus 	//We start as a subclass of a .... TeamGamePlus which belongs to DeadMatchPlus...
	config(MH2_C_V18);			//some values are just called coming from deep root (GameInfo) to Tournament form.
	
var config bool bUseTeamSkin, bUseLive, bNoGreen;
var config string StartUpMessage;
var config int Live, SkillMonster, Ncheck;
var int TN, LastPt, NumPts;
var bool bReset;
var bool bStupidMap, bGarbRemoved, bStartedHunt, bReadyToCountdown;
var string TimeOutMessage;
var int LivePpl, PlainPpl, TotalMonsters, TotalHunters, PlayerTeamID;
var CStats StatsMut;
var PlayerPawn TempPawn;
var int RebootCountDown;
var bool bRebootPending;
var float ServerTravelTime;
var class<bot> Bots[10];

var config string DefaultGame, Mutators, DefaultMap;

struct PlayerData{
var string PlayerName;
var int Score;
var int Deaths;
var int Headshots;
var int KilledMonsters;
var int Lives;
var string IP;
};
var PlayerData Players[32];//Those are used to save data for players, avoids cheatings and helps stats. Also saves all variables if a player reconnects. Is automatically reset when controller is destroyed at end game
var int index;// is used as hash index to speed up algorithms.
var string Map;

//IP location controller
var IP2CountryModule IP2C;

var int TimeLevel;

function PostBeginPlay()
{	
	local int i;
	local PathNode PN;
	local NavigationPoint Np;
	local Pawn P;
	local ScriptedPawn S;
	local pawn pawnlink;
	local MonsterWaypoint WP;
	local NsWayPoint Nwe;
	local MonsterEnd Me;
	local NSMonsterEnd ex;
	local MonsterBasePlus MBP;
	
	local Actor A;

	//Defining actor casts.
	MBP=MonsterBasePlus(basemutator);
	
	IP2C = Spawn(class'IP2CountryModule');
	//-----------------------------------------------------------------------------------------------
	log("Controller is resetting default values. (mostly for the server if ServerTravel failed)");

	
	foreach AllActors(class'Actor',A)
	{
		A.bTravel=false;
	}


	bGarbRemoved = False;
	//if(ServerIP==""){
	    //ServerIP=MonsterBasePlus(BaseMutator).GetServerIP();
		//SaveConfig();}

	foreach AllActors(class'ScriptedPawn', S)	//Actually this is a kind of hack to make monsters relaxed before starting game
		{						//before starting game, can be 500, more or less,
		if (S != None )				//won't spent too much time for this, game is still intializing and waiting will be called
			{
				if ( !S.IsA('Nali') && !S.IsA('Cow') )
				{
					S.AttitudeToPlayer=ATTITUDE_Ignore;
				}
			}
		}
		PlayerTeamID=0;
		foreach AllActors (class 'NavigationPoint', Np)
		{
			if (Np != None)
			{
				Np.bOneWayPath = False; //Desired equipment for Christmas
				Np.bPlayerOnly = False;
			}
		}

	//Check anti-bullshit
	if (Ncheck < 50)
		Ncheck = 50;
	if (Ncheck > 140)
		Ncheck = 40;

	TN = 0;

	foreach AllActors (class 'PathNode', PN)
	{
		if (PN != none)
			TN++;
	}

	if (TN < Ncheck)
		bStupidMap=True; //Often meet case :(
	else
		bStupidMap=False; //Better this case but isn't often

	if (bNoGreen)
		stopgreens();

	foreach AllActors(class 'MonsterEnd', ME)		//Nasty, right ? We need other trigger or else map cannot be ended
	{
		if (ME != none)						//If We have an End we attach something new
		{
			ex = Spawn(class 'NSMonsterEnd', , , ME.location + vect(-1, -1, 0));
			if (ME.Tag != '') ex.tag = ME.Tag;
			if (ME.Event != '') ex.event = ME.Event;
			if (ME.AttachTag != '') ex.AttachTag = ME.AttachTag;
			ex.SetCollisionSize(ME.CollisionRadius, ME.CollisionHeight);
			if (ME.bInitiallyActive) ex.bInitiallyActive = True;
			else ex.bInitiallyActive = False;
			if (ME.bMovable) ex.bMovable = True;
			else ex.bMovable = False;
			ME.Tag = '';
			log (ex$" - new trigger for ending added succesfully");
		}
		break;
	}

	foreach AllActors (class 'MonsterWaypoint', WP) //Time to blast some ass :D
	{
		if (WP != None)
		{
			Nwe=Spawn(class'NsWayPoint',,,WP.Location + vect(-1,0,0));
			Nwe.tag=WP.Tag;
			Nwe.Event=WP.Event;
			Nwe.AttachTag=WP.Attachtag;
			Nwe.SetCollisionSize(WP.CollisionRadius, WP.CollisionHeight);
			Nwe.Position=WP.Position; //Doh
			Nwe.TriggerItem=WP.TriggerItem;
			Nwe.TriggerEvent1=WP.TriggerEvent1;
			Nwe.TriggerEvent2=WP.TriggerEvent2;
			Nwe.TriggerEvent3=WP.TriggerEvent3;
			Nwe.TriggerEvent4=WP.TriggerEvent4;
			log ("Detected possible WayPoint, added estimated target to be: "@Nwe@" Position "@Nwe.Position);
		}
	}
	NumPts = 0;

	foreach AllActors(class'NsWayPoint', Nwe)
	{
		if (Nwe != None)
			NumPts ++;
	}

	foreach AllActors (class'MonsterWaypoint', WP)	//Remove it, just accesed nones useless
		{							//New Keypoints set, I would like a pawn
		if (WP != None)					//But nvm, let's see the new technology...
			WP.Destroy();
		}
	MonsterReplicationInfoTwo(GameReplicationInfo).Monster = TotalMonsters;
	MonsterReplicationInfoTwo(GameReplicationInfo).Live = Live;
//	MonsterReplicationInfoTwo(GameReplicationInfo).bUseTeamSkin = bUseTeamSkin;
	if ( MonsterReplicationInfoTwo(GameReplicationInfo).Live <= 0 )
		MonsterReplicationInfoTwo(GameReplicationInfo).bUseLive = False; 
	else
		MonsterReplicationInfoTwo(GameReplicationInfo).bUseLive = True;

	Super.PostBeginPlay();
	
	StatsMut.initStats();
	SetTimer(1.1, true);
	log ("MH2 Controller finished PostBeginPlay...");
}
//Had to find an alternate way, otherwise compiler error, can't parse such big array bla bla bla.......
function final PlayerData GetData(int index)
{
	return Players[index];
}

exec function final SaveMyConfig()
{
	MonsterBasePlus(BaseMutator).SaveConfig();
	SaveConfig();
	
	log("Changes has been made to the game settings at:"@Level.Year$"/"$Level.Month$"/"$Level.Day@Level.Hour$":"$Level.Minute$":"$Level.Second);
}

exec function DoReboot()
{
	bRebootPending=True;
}

exec function final BroadcastThisMessage(string Message)
{
	BroadcastMessage(Message);
}

function final stopgreens()
{
	local MonsterEvent Moe;
	local ExSpecialEvent Ee;
	local string st;

	log ("Detected request for switching to Blue Messages.");
	ForEach AllActors(class 'MonsterEvent', Moe)
	{
		if (Moe != None)
		{
		Moe.SetCollision(false,false,false);
		Ee = Spawn(class 'MH2_C_V18.ExSpecialEvent',,,Moe.location + vect(0, 0, 1));
		if (Moe.Tag != '')
			{
			Ee.Tag = Moe.Tag;
			Moe.Tag = '';
			}
		if (Moe.Event != '')
			{
			Ee.event = Moe.Event;
			Moe.Event = '';
			}
		st = Moe.Message;
		Ee.Message = st;
		if (Moe.AttachTag != '') Ee.AttachTag = Moe.AttachTag;
		Ee.SetCollisionSize(Moe.CollisionRadius, Moe.CollisionHeight); //Zzzz
		if (Moe.bMovable) Ee.bMovable = True;
		else Ee.bMovable = False;
		if (!Moe.bStatic || !Moe.bNoDelete)
			Moe.Destroy(); //Yeehaaww !

		log (Ee$" - new Message Trigger was succesfully added.");
		}
	}
	log ("Switching to Blue Messages has been ended.");
}

function float PlaySpawnEffect(inventory Inv)
{
	spawn( class 'MH2EnhancedReSpawn',Inv,, Inv.Location );
	return 0.3;
}


/*	Master of all relevancy checks

*/
function bool IsRelevant( actor Other )
{
	local byte bSuperRelevant;
	
	if(Other == none) return false;	//Possible?
	if(Other.IsA('ReplicationInfo')) return true;
	if(MH2MedBox(Other) != none || MH2Base(Other) != none) return true;
	if ( Other.IsA('ThingFactory'))
	    return true;
	if(Other.IsA('CStats')) return true;
	// let the mutators mutate the actor or choose to remove it
	if ( BaseMutator != none && BaseMutator.AlwaysKeep(Other) )
		return true;
	if(Other == none)
		return false;
	if (BaseMutator != none && BaseMutator.CheckReplacement(Other, bSuperRelevant)) //Anything replaced here will be returned false
			return false;

	return true;	//Relevant by default
}

//=====================================Server console MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult();
function final Commandlet(string Request, PlayerPawn Pl)
{
	local Pawn aPawn;
	local PlayerPawn P;
	local string IP;
	local int j, Denied, Allowed;
	local Actor A;
	local Class FClass;

	if(Pl == none)
		return;

if(Request ~= "help")
{
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Printing help table");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("These are some basic commands that can be input to the console");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("ban <PlayerName>     ,Adds a ban of the input player.");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("unban <PlayerName>   ,Removed a ban of the input player.");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("print banlist        ,Prints a list of all banned players.");
//	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("print systat         ,Prints a list of the server's system status.");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("playerlist           ,Prints a list of all players and general info.");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("exit			       ,Stops the server");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("relaunch			   ,Restarts the server");
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("All other standard UT commands are also available.");
}
else if(left(request,3) ~= "ban")
{
	for( aPawn=Level.PawnList; aPawn!=None; aPawn=aPawn.NextPawn ){
		if
		(	aPawn.bIsPlayer
			&&	aPawn.PlayerReplicationInfo.PlayerName ~= mid(request,4)		
			&&	(PlayerPawn(aPawn)!=None))
		{
			BroadcastMessage("A ban has been placed against"@PlayerPawn(aPawn).PlayerReplicationInfo.PlayerName@"by"@Pl.PlayerReplicationInfo.PlayerName);
			IP = PlayerPawn(aPawn).GetPlayerNetworkAddress();
			if(Level.Game.CheckIPPolicy(IP))
			{
				IP = Left(IP, InStr(IP, ":"));
				Log("Adding IP Ban for: "$IP@PlayerPawn(aPawn).PlayerReplicationInfo.PlayerName@"by"@Pl.PlayerReplicationInfo.PlayerName);
				for(j=0;j<50;j++)
					if(Level.Game.IPPolicies[j] == "")
						break;
				if(j < 50)
					Level.Game.IPPolicies[j] = "DENY,"$IP$"::"$PlayerPawn(aPawn).PlayerReplicationInfo.PlayerName;
				Level.Game.SaveConfig();
			}
			aPawn.Destroy();
			MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Sucessfully banned"@mid(request,4)@"............[OK]");
			return;
		}
		}
		MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Failed to find player"@mid(request,4)@"................[FAIL]");
}
else if(left(request,5) ~= "unban")
{
	for( aPawn=Level.PawnList; aPawn!=None; aPawn=aPawn.NextPawn ){
		if
		(	aPawn.bIsPlayer
			&&	aPawn.PlayerReplicationInfo.PlayerName ~= mid(request,6)		
			&&	(PlayerPawn(aPawn)!=None))
		{
			BroadcastMessage("Ban for"@PlayerPawn(aPawn).PlayerReplicationInfo.PlayerName@"has been removed by"@Pl.PlayerReplicationInfo.PlayerName);
			IP = PlayerPawn(aPawn).GetPlayerNetworkAddress();
			if(!Level.Game.CheckIPPolicy(IP))
			{
				IP = Left(IP, InStr(IP, ":"));
				Log("Removing IP Ban for: "$IP@"by"@Pl.PlayerReplicationInfo.PlayerName);
				for(j=0;j<50;j++)
					if(mid(Level.Game.IPPolicies[j],InStr(Level.Game.IPPolicies[j],",")+1,InStr(Level.Game.IPPolicies[j],"::")) ~= IP)
						break;
				if(j < 50)
					Level.Game.IPPolicies[j]="ACCEPT"$mid(Level.Game.IPPolicies[j],InStr(Level.Game.IPPolicies[j],","));
				Level.Game.SaveConfig();
			}
			aPawn.Destroy();
			MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Sucessfully unbanned"@mid(request,6)@"............[OK]");
			return;
		}
		}
		MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Failed to find player"@mid(request,6)@"................[FAIL]");
}

	else if(request ~= "print banlist")
	{
	MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Printing ban history.....");
		for(j=1;j<50;j++)
		{
			if(Level.Game.IPPolicies[j]!="")
			{
				if(Left(Level.Game.IPPolicies[j],6) ~= "ACCEPT"){
					MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult(Mid(Level.Game.IPPolicies[j],InStr(Level.Game.IPPolicies[j],"::")+2)@"......................[OK]");
						Allowed++;}
				if(Left(Level.Game.IPPolicies[j],6) ~= "DENY"){
					MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult(Mid(Level.Game.IPPolicies[j],InStr(Level.Game.IPPolicies[j],"::")+2)@"......................[FAIL]");
					Denied++;
				}
			}
		}
		MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Allowed:"$Allowed@"Denied"$Denied);
	}
	else if(request ~= "playerlist")
	{
		foreach AllActors(class'PlayerPawn',P)
		{
			MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Player:"@P.PlayerReplicationInfo.PlayerName@"Ping:"@P.PlayerReplicationInfo.Ping@"Health:"@P.Health);
		}
	}
	else if(left(request,7) ~= "foreach")
	{
		FClass = Class(DynamicLoadObject(Mid(request,instr(request," ")+1),Class'Class'));
		if(FClass == none) return;
		ForEach AllActors(Class<Actor>(FClass),A)
		{
			MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult("Actor:"@A);
		}
	}

	else MHReplicationInfo(Pl.PlayerReplicationInfo).ReturnResult(ConsoleCommand(request));

}

//===================================== Bot related
function Bot SpawnBot(out NavigationPoint StartSpot)
{
	local bot NewBot;
	local int BotN;
	local Pawn P;


	//Difficulty = BotConfig.Difficulty;

	BotN = BotConfig.ChooseBotInfo();
	
	// Find a start spot.
	StartSpot = FindPlayerStart(None, 255);
	if( StartSpot == None )
	{
		log("Could not find starting spot for Bot");
		return None;
	}

	// Try to spawn the bot.
	NewBot = Spawn(class'Squirrel.SquirrelBot',,,StartSpot.Location,StartSpot.Rotation);

	if ( NewBot == None )
		log("Couldn't spawn Bot at "$StartSpot);

	if ( NewBot == None )
		NewBot = Spawn(BotConfig.CHGetBotClass(0),,,StartSpot.Location,StartSpot.Rotation);

	if ( NewBot != None )
	{
		// Set the player's ID.
		NewBot.PlayerReplicationInfo.PlayerID = CurrentID++;

		NewBot.PlayerReplicationInfo.Team = 0;//Changed team
		BotConfig.CHIndividualize(NewBot, BotN, NumBots);
		NewBot.ViewRotation = StartSpot.Rotation;
		// broadcast a welcome message.
		BroadcastMessage( NewBot.PlayerReplicationInfo.PlayerName$EnteredMessage, false );

		ModifyBehaviour(NewBot);
		AddDefaultInventory( NewBot );
		NumBots++;
		if ( bRequireReady && (CountDown > 0) )
			NewBot.GotoState('Dying', 'WaitingForStart');
		NewBot.AirControl = AirControl;

		if ( (Level.NetMode != NM_Standalone) && (bNetReady || bRequireReady) )
		{
			// replicate skins
			for ( P=Level.PawnList; P!=None; P=P.NextPawn )
				if ( P.bIsPlayer && (P.PlayerReplicationInfo != None) && P.PlayerReplicationInfo.bWaitingPlayer && P.IsA('PlayerPawn') )
				{
					if ( NewBot.bIsMultiSkinned )
						PlayerPawn(P).ClientReplicateSkins(NewBot.MultiSkins[0], NewBot.MultiSkins[1], NewBot.MultiSkins[2], NewBot.MultiSkins[3]);
					else
						PlayerPawn(P).ClientReplicateSkins(NewBot.Skin);	
				}						
		}
	}

	return NewBot;
}


//=======================================================================================================================

function int ReduceDamage(int Damage, name DamageType, pawn injured, pawn instigatedBy)
{
    //Damage = Super.ReduceDamage(Damage, DamageType, injured, instigatedBy);
    
    if ( instigatedBy == None )
        return Damage;
	if(Injured == none) return 0;
    // This removes some Scorekill and TakeDamage script errors
    if (injured.IsA('ScriptedPawn'))
        return Damage;

    if ( (instigatedBy != injured) && injured.bIsPlayer && instigatedBy.bIsPlayer)
    {
    return (Damage*FriendlyFireScale);
    }
    else
        return Damage;
}

function PreCacheReferences()
{	//never called - here to force precaching of meshes like in any normal UT game...
	//continuing mission in attempt to reduce lag as much as possible
	Spawn(Class'UnrealShare.BruteCarcass');
	Spawn(Class'UnrealShare.LesserBruteCarcass');
	Spawn(Class'UnrealShare.CowCarcass');
	Spawn(Class'UnrealShare.DevilfishCarcass');
	Spawn(Class'UnrealShare.FlyCarcass');
	Spawn(Class'UnrealI.GassiusCarcass');
	Spawn(Class'UnrealI.KrallCarcass');
	Spawn(Class'UnrealShare.MantaCarcass');
	Spawn(Class'UnrealI.MercCarcass');
	Spawn(Class'UnrealShare.NaliCarcass');
	Spawn(Class'UnrealI.PupaeCarcass');
	Spawn(Class'UnrealShare.CreatureCarcass');
	Spawn(Class'UnrealShare.SkaarjCarcass');
	Spawn(Class'UnrealI.TrooperCarcass');
	Spawn(Class'UnrealShare.SlithCarcass');
	Spawn(Class'UnrealShare.TentacleCarcass');
	Spawn(Class'UnrealI.WarlordCarcass');
	Spawn(Class'Unrealshare.CreatureChunks');
	Spawn(class'ExCreatureCarcass');
	Spawn(class'ExCreatureChunks');

}

function bool IsOnTeam(Pawn Other, int TeamNum)	//Added
{
	if ( PlayerPawn(Other) != none && Other.PlayerReplicationInfo.Team == 0 )
		return True;
	else
	if ( Other.IsA('ScriptedPawn') && ScriptedPawn(Other).Team == 1 )
		return True;
	else
	return false;
}

function float GameThreatAdd(Bot aBot, Pawn Other)	//Added
{
	if ( Other.IsA('ScriptedPawn') && !Other.IsA('Nali') && !Other.IsA('Cow') )
		return 5;
	else
		return 0;
}

function byte AssessBotAttitude(Bot aBot, Pawn Other)	//Added
{
	if ( Other.IsA('PlayerPawn') || Other.IsA('Bot') || Other.IsA('Nali') || Other.IsA('Cow'))
		return 3;
	return super(DeathMatchPlus).AssessBotAttitude(aBot, Other);
}
/*
We had initially an option to decrease score for killing friendly creatures but nothing to stop a bot
to kill them. Anyway some idiots mappers used them triggered to open ways or end maps.
So, will be a must to kill them, but I won't be agree to decrease score for completing mission :P, assholes...
Check ScoreKill as well...
*/

function AddDefaultInventory( pawn PlayerPawn )
{
	local Weapon newWeapon;
	local class<Weapon> WeapClass;
	bUseTranslocator = false;
	PlayerPawn.JumpZ = PlayerPawn.Default.JumpZ * PlayerJumpZScaling();
	 
	if( PlayerPawn.IsA('Spectator') )
		return;

	// Spawn default weapon.
	/*WeapClass = BaseMutator.MutatedDefaultWeapon();
	if( (WeapClass!=None) && (PlayerPawn.FindInventoryType(WeapClass)==None) )
	{
		newWeapon = Spawn(WeapClass,,,PlayerPawn.Location);
		if( newWeapon != None )
		{
			newWeapon.Instigator = PlayerPawn;
			newWeapon.BecomeItem();
			PlayerPawn.AddInventory(newWeapon);
			newWeapon.BringUp();
			newWeapon.GiveAmmo(PlayerPawn);
			newWeapon.SetSwitchPriority(PlayerPawn);
			newWeapon.WeaponSet(PlayerPawn);
		}
	}*/
	BaseMutator.ModifyPlayer(PlayerPawn);
}

event InitGame( string Options, out string Error )
{
	local string InOpt;
	local Mutator M, last;
	local class<Mutator> MutatorClass;
	local int i;

//	MaxTeams = Min(MaxTeams,MaxAllowedTeams);
	MaxTeams = 2;

	// Here some byte was set, I'm so glaaaad :D, Yaay !

	//Checking stupid values. Bullshits aren't accepted...
	if (SkillMonster > 7) SkillMonster = 7;
	if (SkillMonster < 1) SkillMonster = 1; //Not accept 0 value :P.

	if (/* SkillMonster == 0 || */ SkillMonster == 1)
		Difficulty = 0;
	if (SkillMonster == 2 || SkillMonster == 3)
		Difficulty = 1;
	if (SkillMonster == 4 || SkillMonster == 5)
		Difficulty = 2;
	if (SkillMonster == 6 || SkillMonster == 7)
		Difficulty = 3;
/*
These are history, I won't use them anyway, in low gravity a pupae is really stupid
Only a dumbass will use these. Is time to leave things normal.
	for (M = BaseMutator; M != None; M = M.NextMutator)
	{
		if (M.class == class'Botpack.LowGrav')
		{
			last.NextMutator = M.NextMutator;
			M.Destroy();
			M = last;
		}
		if (M.class == class'Botpack.InstaGibDM')
		{
			last.NextMutator = M.NextMutator;
			M.Destroy();
			M = last;
		}
	}
*/
	// This lot is a crappy hack to get Tournament mode
	// to work... Hacked from DeathMatchPlus
	// - Nelsona - Note: You should hack some Assault and/or CTF codes, options for A.I. are a real mess
	// I'll show you some crappy hack right in tail of code

	Super(TournamentGameInfo).InitGame(Options, Error);

	RemainingTime = 60 * TimeLimit;
	GameReplicationInfo.RemainingTime = RemainingTime;
	SetGameSpeed(GameSpeed);
//	FragLimit = GetIntOption( Options, "FragLimit", FragLimit );
	FragLimit = 0; //LOL. What is for this one ?
	//imeLimit = GetIntOption( Options, "TimeLimit", TimeLimit );
//	MaxCommanders = GetIntOption( Options, "MaxCommanders", MaxCommanders );
	MaxCommanders = 0; //Really ? Need craps ? Where are used these ?
	InOpt = ParseOption( Options, "CoopWeaponMode");
	if ( InOpt != "" ) bCoopWeaponMode = bool(InOpt);
	//IDnum = -1;
	//IDnum = GetIntOption( Options, "Tournament", IDnum );
	//if ( IDnum > 0 )
	//	{
	//	bRatedGame = true;
	//	TimeLimit = 0;
	//	RemainingTime = 0;
	//	}
	if ( Level.NetMode == NM_StandAlone )
		{
		bRequireReady = true;
		CheckReady();
		}
	if ( Level.NetMode == NM_StandAlone )
		{
		bRequireReady = true;
		CountDown = 1;
		}
	if ( !bRequireReady && (Level.NetMode != NM_Standalone) )
		{
		bRequireReady = true;
		bNetReady = true;
		}
	bJumpMatch = False;
	bNoMonsters = False;
	bNoTeamChanges = True;
	bBalanceTeams = False;
	bPlayersBalanceTeams = False;
	bCanChangeSkin = True;	//By default, :P
	bLocalLog = False;	//Really, take a break to spam craps with Skaarj.
	bWorldLog = False;	//Bla bla too much talk, keep bandwidth clean because you piss me off.
}

function bool SetEndCams(string Reason)
{
	local TeamInfo BestTeam;
	local int i;
	local pawn P, Best, PL;
	local PlayerPawn player;
	local bool bGood;
	local ScriptedPawn S;
	local CreatureCarcass C;
	local ThingFactory T;
	local SpawnPoint SP;
	local Bot B;
	bGood = True;
	log("Set end cams");
	MonsterReplicationInfoTwo(GameReplicationInfo).bGameEnded=True;
	bGameEnded = true; //Must stop timers before destroying bots
	bDontRestart=True;
	// find individual winner
	for ( P=Level.PawnList; P!=None; P=P.nextPawn )
		if ( P.bIsPlayer  && ((Best == None) || (P.PlayerReplicationInfo.Score > Best.PlayerReplicationInfo.Score)) )
			Best = P;
	//if(Best == none) return false;	//End game with no players?
	if ( Reason == "No Hunters" )
	{
		bGood = False;
		GameEndedMessage = "Mission failed! All hunters has been eliminated!";
	}

	if ((RemainingTime == 0) && (TimeLimit >= 1))
	{
		bGood = False;
		GameReplicationInfo.GameEndedComments = TimeOutMessage;
	}
	else
		GameReplicationInfo.GameEndedComments = GameEndedMessage;
	EndTime = Level.TimeSeconds + 3.0;

	for ( P=Level.PawnList; P!=None; P=P.nextPawn )
	{
		player = PlayerPawn(P);

		if ( Player != None )	//Player != None implies Best != None
		{
		//if (!bTutorialGame)
			//PlayWinMessage(Player, bGood); No thanks.
			player.bBehindView = true;
		if ( Player == Best )
			Player.ViewTarget = None;
		else
			Player.ViewTarget = Best;
			Best.SetLocation(Best.Location);
			Best.Velocity.X = 0;
			Best.Velocity.Y = 0;
			Best.Velocity.Z = 0;
			player.ClientGameEnded();
			if(!bGood)
			player.ClientPlaySound(Sound'MH2_C_V18.Fail',false,false);
			else	player.ClientPlaySound(Sound'MH2_C_V18.Win',false,false);
		}
		P.GotoState('GameEnded');
	}

	if (!bGarbRemoved)
	{

	foreach AllActors (class 'CreatureCarcass', C)
		{
		if (C != None && (!C.bStatic || !C.bNoDelete))
		C.GoToState('Corroding','');
		}
	foreach AllActors ( class 'SpawnPoint', SP )
	{
		if (SP != None)
			SP.tag = 'somebullshits';
	}
	foreach AllActors (class 'ThingFactory', T)
	{
		if (T != None)
			T.capacity = 0;
	}
	foreach AllActors (class 'ScriptedPawn', S)
	{
		if (S != None)
			S.Destroy();
	}
	foreach AllActors(class'Bot', B)
	{
		B.Destroy();
	}
	

	bGarbRemoved = True; //For maps with player and bots under trigger to not repeat craps
	}

	return true;
}

function final string ServerCommand(String Command)
{
return ConsoleCommand(Command);
}

function bool AllowsBroadcast( actor broadcaster, int Len )
{
	return true;//Override UT's original message Spam add setting here later?
}

function final HandlePM(string Message,PlayerPawn Sender, PlayerPawn Receiver)
{
MHReplicationInfo(Receiver.PlayerReplicationInfo).ReceivePM(Message,Sender);
}

function PlayStartUpMessage(PlayerPawn NewPlayer)	//This is for that Green Message when player is joining to server
{
	local int i;
	local color Green, DarkGreen, Red;

	NewPlayer.ClearProgressMessages();

	Green.G = 255;
	Green.B = 64;
	DarkGreen.G = 200;
	DarkGreen.B = 64;
	Red.R=200;
	Red.B=64;
	NewPlayer.SetProgressColor(Green, i);

	NewPlayer.SetProgressMessage(GameName, i++);
	if ( bRequireReady && (Level.NetMode != NM_Standalone) )
	{
		NewPlayer.SetProgressColor(Green, i);
		NewPlayer.SetProgressMessage(TourneyMessage, i++);
	}
	else
	{
		NewPlayer.SetProgressColor(Green, i);
		NewPlayer.SetProgressMessage(StartUpMessage, i++);
	}

	if ( Level.NetMode == NM_Standalone )
	{
		NewPlayer.SetProgressColor(Green, i);
		NewPlayer.SetProgressMessage(SingleWaitingMessage, i++);
	}
	if ( !NewPlayer.bReadyToPlay)
	{
		NewPlayer.SetProgressColor(Red, i);
		NewPlayer.SetProgressMessage("YOU ARE NOT READY! Press fire to begin.", i++);
	}
	else if ( NewPlayer.bReadyToPlay)
	{
		NewPlayer.SetProgressColor(Green, i);
		NewPlayer.SetProgressMessage("READY! Waiting for other players.", i++);
	}
}


//I messed with this function first intentionally to replace the spectator class, and I dont want to use CheckReplacement for several reasons...
//Anyway I stumbled upon several more issues made by Epic that I now fixed here.
event playerpawn Login
(
	string Portal,
	string Options,
	out string Error,
	class<playerpawn> SpawnClass
)
{
	Local NavigationPoint StartSpot;
    Local bool bDontAdd;
	local int i;
	local string OverrideClass, InVoice;
	local class<PlayerPawn> SpecClass;
	local PlayerPawn      NewPlayer, TestPlayer;
	local Pawn            PawnLink;
	local string          InName, InPassword, InSkin, InFace, InChecksum;
	local byte            InTeam;
	local bool bSpawnSpectator;
	
	//Fixed Spectator
	OverrideClass = ParseOption ( Options, "OverrideClass" );
	if(OverrideClass != "")
	{
		SpawnClass = class'MH2_C_V18.MH2CHSpectator';
		bSpawnSpectator=True;
	}
	
		//========================================== From GameInfo

	BaseMutator.ModifyLogin(SpawnClass, Portal, Options);

	// Get URL options.
	InName     = Left(ParseOption ( Options, "Name"), 20);//Maby better so I leave that way
	InTeam     = GetIntOption( Options, "Team", 255 ); // default to "no team"
	InPassword = ParseOption ( Options, "Password" );
	InSkin	   = ParseOption ( Options, "Skin"    );
	InFace     = ParseOption ( Options, "Face"    );
	InChecksum = ParseOption ( Options, "Checksum" );
	 
	// Find a start spot.
	StartSpot = FindPlayerStart( None, InTeam, Portal );
	


	if( StartSpot == None )
	{
		Error = FailedPlaceMessage;
		return None;
	}

	// Try to match up to existing unoccupied player in level,
	// for savegames and coop level switching.
	for( PawnLink=Level.PawnList; PawnLink!=None; PawnLink=PawnLink.NextPawn )
	{
		TestPlayer = PlayerPawn(PawnLink);
		if
		(	TestPlayer!=None
		&&	TestPlayer.Player==None 
		&&  TestPlayer.PlayerReplicationInfo != None
		&&  TestPlayer.bIsPlayer
		&&	TestPlayer.PlayerReplicationInfo.PlayerName != class'PlayerReplicationInfo'.default.PlayerName
		)
		{
			if
			(	(Level.NetMode==NM_Standalone)
			||	(TestPlayer.PlayerReplicationInfo.PlayerName~=InName && TestPlayer.Password~=InPassword) )
			{
				// Found matching unoccupied player, so use this one.
				NewPlayer = TestPlayer;
				break;
			}
		}
	}

	// In not found, spawn a new player.
	if( NewPlayer==None )
	{

		NewPlayer = Spawn(SpawnClass,,,StartSpot.Location,StartSpot.Rotation);
		if( NewPlayer!=None )
			NewPlayer.ViewRotation = StartSpot.Rotation;
	}
	
	

	// Handle spawn failure.
	if( NewPlayer == None )
	{
		log("Couldn't spawn player at "$StartSpot);
		Error = FailedSpawnMessage;
		return None;
	}

	if(!NewPlayer.IsA('Spectator'))
	NewPlayer.static.SetMultiSkin(NewPlayer, InSkin, InFace, InTeam);

	// Set the player's ID.
	NewPlayer.PlayerReplicationInfo.PlayerID = CurrentID++;

	// Init player's information.
	NewPlayer.ClientSetRotation(NewPlayer.Rotation);
	if( InName=="" )
		InName=DefaultPlayerName;
	if( Level.NetMode!=NM_Standalone || NewPlayer.PlayerReplicationInfo.PlayerName==DefaultPlayerName )
		ChangeName( NewPlayer, InName, false );

	if( NewPlayer.IsA('Spectator') && (Level.NetMode == NM_DedicatedServer) )
		NumSpectators++;

	// Init player's administrative privileges
	NewPlayer.Password = InPassword;
	NewPlayer.bAdmin = GetPropertyText("AdminPassword")!="" && caps(InPassword)==caps(GetPropertyText("AdminPassword"));
	
	NewPlayer.PlayerReplicationInfo.bAdmin = NewPlayer.bAdmin;
	if( NewPlayer.bAdmin )
		log( "Administrator logged in!" );

	// Init player's replication info
	NewPlayer.GameReplicationInfo = GameReplicationInfo;

	// If we are a server, broadcast a welcome message.
//	if( Level.NetMode==NM_DedicatedServer || Level.NetMode==NM_ListenServer )
//		BroadcastMessage( NewPlayer.PlayerReplicationInfo.PlayerName$EnteredMessage, false );

	// Teleport-in effect.
	StartSpot.PlayTeleportEffect( NewPlayer, true );

	NewPlayer.ReceivedSecretChecksum = !(InChecksum ~= "NoChecksum");
	NewPlayer.GotoState('PlayerSwimming');
	if ( !NewPlayer.IsA('Spectator') )
		NumPlayers++;
		
	//======================================================================
	
	if ( newPlayer == None)
		return None;

		
		if ( NewPlayer != None )
	{
			NewPlayer.AirControl = AirControl;
			NewPlayer.PlayerReplicationInfo.Team=0;//We initiate this at root, not a bad idea.
		//Check if the players name exists from the user ini and is not "player"
		if ( Left(NewPlayer.PlayerReplicationInfo.PlayerName, 6) ~= "Player" )
		{
			ChangeName( NewPlayer, NewPlayer.GetDefaultURL("Name"), false );//This will fetch the name from the User.ini file
		}
		//If that didnt help well then give him something else
		if ( Left(NewPlayer.PlayerReplicationInfo.PlayerName, 6) ~= "Player" )
		{
			ChangeName( NewPlayer, ("PleaseChangeMyName"$NumPlayers), false );
		}
		NewPlayer.bAutoActivate = true;
		if ( (bGameEnded || (bRequireReady && (CountDown > 0))) && !NewPlayer.IsA('Spectator') )
			NewPlayer.PlayerRestartState = 'PlayerWaiting';
		else
			NewPlayer.PlayerRestartState = NewPlayer.Default.PlayerRestartState;

		if ( NewPlayer.IsA('TournamentPlayer') )
		{
			TournamentPlayer(NewPlayer).StartSpot = LastStartSpot;
			//if ( NewPlayer.IsA('Commander') )
				//NumCommanders++; Stupid idea for MH.....
		}
	}
		
		
	PlayerTeamNum = NewPlayer.PlayerReplicationInfo.Team;
		if (bUseLive)
		if ( (NewPlayer != None) && !NewPlayer.IsA('Spectator') )
			MHReplicationInfo(NewPlayer.PlayerReplicationInfo).Lives=MonsterReplicationInfoTwo(GameReplicationInfo).Live;
	
	for(i=0;Players[i].PlayerName!="";i++)
	    if(Players[i].PlayerName == newPlayer.PlayerReplicationinfo.PlayerName && newPlayer.GetPlayerNetworkAddress() == Players[i].IP){//Small chance that player changes name... but what the heck we can record IP too just in case.....
		    bDontAdd=True;//Already logged before..
			MHReplicationInfo(newPlayer.PlayerReplicationInfo).Lives=Players[i].Lives;
			MHReplicationInfo(newPlayer.PlayerReplicationInfo).Deaths=Players[i].Deaths;
			MHReplicationInfo(newPlayer.PlayerReplicationInfo).Score=Players[i].Score;
			MHReplicationInfo(newPlayer.PlayerReplicationInfo).KilledMonster=Players[i].KilledMonsters;
			MHReplicationInfo(newPlayer.PlayerReplicationInfo).Headshots=Players[i].Headshots;
			}
	if(!bDontAdd)//New so we add
	{
		Players[index].PlayerName=newPlayer.PlayerReplicationinfo.PlayerName;
		Players[index].IP = newPlayer.GetPlayerNetworkAddress();
		index++; // added
	}

if ( NewPlayer != None )
	{
		if ( !NewPlayer.IsA('Spectator') )
		{
			InVoice = ParseOption ( Options, "Voice" );
			if ( InVoice != "" )
				NewPlayer.PlayerReplicationInfo.VoiceType = class<VoicePack>(DynamicLoadObject(InVoice, class'Class'));
			if ( NewPlayer.PlayerReplicationInfo.VoiceType == None )
				NewPlayer.PlayerReplicationInfo.VoiceType = class<VoicePack>(DynamicLoadObject(NewPlayer.VoiceType, class'Class'));
			if ( NewPlayer.PlayerReplicationInfo.VoiceType == None )
				NewPlayer.PlayerReplicationInfo.VoiceType = class<VoicePack>(DynamicLoadObject("Botpack.VoiceMaleOne", class'Class'));
		}
	}

//	CountHunters();
	return newPlayer;
}

event PostLogin(playerpawn P)
{
local Pawn PawnLink;
local MHReplicationInfo MHR;

Super.PostLogin(P);

	TempPawn=P;
	MHR=MHReplicationInfo(P.PlayerReplicationinfo);
	MHR.SetOwner(P);
	IP2C.GetIPToCountry(P.GetPlayerNetworkAddress(), P);
	
	//Keep me logged in cookie
	if(P.GetDefaultURL("Login")!="")
	{
		MonsterBasePlus(BaseMutator).ServerAttemptLogin(Left(P.GetDefaultURL("Login"),InStr(P.GetDefaultURL("Login"),":")),Mid(P.GetDefaultURL("Login"),InStr(P.GetDefaultURL("Login"),":")+1),P);
	}
	
	//if(Level.Song == none)
	//	P.ClientSetMusic( Music'LasGone.LasGone', 0, 255, MTRAN_Fade);

}

function bool RestartPlayer( pawn aPlayer )	
{
	local NavigationPoint startSpot;
	local bool foundStart;
	local Pawn P;
	local Pawn PawnLink;
	
	if (MonsterReplicationInfoTwo(GameReplicationInfo).bUseLive) //No really comment, um, oh, yes - retarded option
	{
		if( bRestartLevel && Level.NetMode!=NM_DedicatedServer && Level.NetMode!=NM_ListenServer )
			return true;

		if ( aPlayer.IsA('Playerpawn') && MHReplicationInfo(aPlayer.PlayerReplicationInfo).Lives < 1 )
		{
			BroadcastMessage(aPlayer.PlayerReplicationInfo.PlayerName$" has been lost!", true, 'MonsterCriticalEvent');

		//	if ( aPlayer.IsA('Bot') )
		//	{
		//		aPlayer.PlayerReplicationInfo.bIsSpectator = true;
		//		aPlayer.PlayerReplicationInfo.bWaitingPlayer = true;
		//		aPlayer.GotoState('GameEnded');
		//		return false;
		//	}
		}
		
		startSpot = FindPlayerStart(None, 255);
		if( startSpot == None )
			return false;

		foundStart = aPlayer.SetLocation(startSpot.Location);
		if( foundStart )
		{
			startSpot.PlayTeleportEffect(aPlayer, true);
			aPlayer.SetRotation(startSpot.Rotation);
			aPlayer.ViewRotation = aPlayer.Rotation;
			aPlayer.Acceleration = vect(0,0,0);
			aPlayer.Velocity = vect(0,0,0);
			aPlayer.Health = aPlayer.Default.Health;
			aPlayer.ClientSetRotation( startSpot.Rotation );
			aPlayer.bHidden = false;
			aPlayer.SoundDampening = aPlayer.Default.SoundDampening;
			if ( aPlayer.isa('PlayerPawn') && MHReplicationInfo(aPlayer.PlayerReplicationInfo).Lives < 1 )
			{
				aPlayer.bHidden = true;
				aPlayer.PlayerRestartState = 'PlayerSpectating';
			} 
			else
			{
				aPlayer.SetCollision( true, true, false );	//Hm, interesting anyway...
				AddDefaultInventory(aPlayer);				//Wow, what inventory ? Will see... 
			}
		}
		
	if(StartSpot.Region.Zone.bWaterZone)
	{
		aPlayer.SetPhysics(PHYS_Swimming);
		aPlayer.GotoState('PlayerSwimming');
	}

//	for(PawnLink=Level.PawnList;Pawnlink!=none;Pawnlink=PawnLink.NextPawn)
	 //   if(PawnLink.IsA('PlayerPawn') && aPlayer.IsA('PlayerPawn') && PawnLink!=aPlayer)//Don't call for himself.
	//	    MHReplicationInfo(PawnLink.PlayerReplicationInfo).NewPlayer(PlayerPawn(aPlayer));//Notify players of new incoming player.
		
		return foundStart;
	}
	else {
	//	for(PawnLink=Level.PawnList;Pawnlink!=none;Pawnlink=PawnLink.NextPawn)
	//		if(PawnLink.IsA('PlayerPawn') && aPlayer.IsA('PlayerPawn') && PawnLink!=aPlayer)//Don't call for himself.
	//			MHReplicationInfo(PawnLink.PlayerReplicationInfo).NewPlayer(PlayerPawn(aPlayer));
		return Super.RestartPlayer(aPlayer);
	}
}

function Logout(pawn Exiting)
{
	
	local int i;
	
	Super.Logout(Exiting);
    Teams[Exiting.PlayerReplicationInfo.Team].Size--;
	CheckEndGame();
//	if ( !bGameEnded && bBalanceTeams && !bRatedGame )
//		ReBalance();
	//CountHunters(); //Cough
}

function ProcessServerTravel( string URL, bool bItems )
{
	local playerpawn P, LocalPlayer;

	// Notify clients we're switching level and give them time to receive.
	// We call PreClientTravel directly on any local PlayerPawns (ie listen server)
	log("ProcessServerTravel:"@URL);
	foreach AllActors( class'PlayerPawn', P )
		if( NetConnection(P.Player)!=None )
			P.ClientTravel( URL, TRAVEL_Relative, bItems );
		else
		{	
			LocalPlayer = P;
			P.PreClientTravel();
		}

	if ( (Level.NetMode == NM_ListenServer) && (LocalPlayer != None) )
		Level.NextURL = Level.NextURL$"?Skin="$LocalPlayer.GetDefaultURL("Skin")
					 $"?Face="$LocalPlayer.GetDefaultURL("Face")
					 $"?Team="$LocalPlayer.GetDefaultURL("Team")
					 $"?Name="$LocalPlayer.GetDefaultURL("Name")
					 $"?Class="$LocalPlayer.GetDefaultURL("Class");

}

function CheckEndGame()		//If a dude is losing lives will be removed from party, too bad
{
	local Pawn PawnLink;
//	local int StillPlaying;
//	local bool bStillHuman;
	local bot B, D;

	if ( bGameEnded )
		return;

	LivePpl = 0;
	PlainPpl = 0;

	for ( PawnLink=Level.PawnList; PawnLink!=None; PawnLink=PawnLink.nextPawn )
		if ( PawnLink.IsA('PlayerPawn') )
		{
			if ( ( MHReplicationInfo(PawnLink.PlayerReplicationInfo).Lives > 0 ) && 
				!PawnLink.PlayerReplicationInfo.bIsSpectator && !PawnLink.PlayerReplicationInfo.bIsABot )
				LivePpl ++;
		}
	if (LivePpl == 0 )	//So don't end game with No Hunters if server is empty. An empty server does not yield game over. If server is not empty, but all players lost their lives. Game over. Only time limit will end game with no players
		EndGame("No Hunters");
}

function EndGame( string Reason )
{
	local actor A;
	local Mutator M;
	if(bGameEnded) return;	//Ehh
	// don't end game if not really ready
	// mutator can set bOverTime if doesn't want game to end

	//if ( BaseMutator.HandleEndGame()  )
	//{
	//	bOverTime = true;
	//	return;
	//}
	
	SetEndCams(Reason);

	
	foreach AllActors(class'Actor', A, 'EndGame')
		A.trigger(self, none);
}

function Killed( pawn killer, pawn Other, name damageType )
{
	local bool bSpecialDamage;
	local String Message, KillerWeapon, OtherWeapon;
	
	if ( Killer != None  && Other != none) 	//Modifications added for avoid cheating bUseLives option (I don't really need it)
	{				//See also Scorekill for this fix (is about suicide with a few HP to save a life)
		if((Killer.IsA('PlayerPawn')) && Other.IsA('ScriptedPawn') && damageType == 'decapitated'){
			MHReplicationInfo(Killer.PlayerReplicationInfo).Headshots++;
            switch(Rand(5))
            {
              case 0 :
			  Killer.ReceiveLocalizedMessage(class'MH2HeadShotMessage5');
                     break;
			 case 1 :
			      Killer.ReceiveLocalizedMessage(class'MH2HeadShotMessage4');
			      break;
			 case 2 :
			      Killer.ReceiveLocalizedMessage(class'MH2HeadShotMessage3');
			      break;
			 case 3 :
			      Killer.ReceiveLocalizedMessage(class'MH2HeadShotMessage2');
			      break;
		     default :
			      Killer.ReceiveLocalizedMessage(class'MH2HeadShotMessage');
			      break;
		    }	
	}
		
	if ( !bFirstBlood )
		if ( Killer.IsA('PlayerPawn') && (Killer != Other) )
		{
			bFirstBlood = True;
			BroadcastLocalizedMessage( class'FirstBloodMessage', 0, Killer.PlayerReplicationInfo );
		}

		if (Killer.IsA('PlayerPawn') && (Killer == Other))
		{
		//Suicide
			if (Killer.Spree > 0)
				Killer.Spree = 0;
			Other.PlayerReplicationInfo.Score -= 100;
			MHReplicationInfo(Other.PlayerReplicationInfo).Lives -= 1;
			CheckEndGame();
		}
		else if (Killer.IsA('PlayerPawn') && Killer != Other && Other.IsA('PlayerPawn'))
		{
			if (Killer.Spree > 0)
			Killer.Spree = 0;
			if (Killer.PlayerReplicationInfo.Score > 10)
				Killer.PlayerReplicationInfo.Score /= 5;
			else Killer.PlayerReplicationInfo.Score = 0;
			MHReplicationInfo(Other.PlayerReplicationInfo).Lives -= 1;
			Killer.Died(Killer,'Suicided',Killer.Location);
		}

		else if ( Killer.IsA('ScriptedPawn') && Other.IsA('PlayerPawn') /*&& !MonsterReplicationInfoTwo(GameReplicationInfo).bUseLive*/ )
		{
			MHReplicationInfo(Other.PlayerReplicationInfo).Lives -= 1;
			if (Other.Spree > 0)
				Other.Spree = 0;
			CheckEndGame();
		}
	}

	else if (Killer == None && Other != none)//Suicide with no instigator
	{
	if (Other.IsA('PlayerPawn'))
		{
			if (Other.Spree > 0)
				Other.Spree = 0;
			Other.PlayerReplicationInfo.Score -= 100;
			MHReplicationInfo(Other.PlayerReplicationInfo).Lives -=1;
			CheckEndGame();
		}
	}
//	Super.Killed(Killer, Other, damageType);
//	Super(GameInfo).Killed(Killer, Other, damageType);

//---------------------------------------------------------------------------------------
//Inherit other craps.......

if (Other != none && Other.IsA('PlayerPawn') || Other.IsA('Bot'))
	{
		if(Killer != none && Killer.IsA('ScriptedPawn') && (Other.IsA('Bot') || Other.IsA('PlayerPawn')))
		{
		BroadcastMessage(Other.PlayerReplicationInfo.PlayerName@"was killed by"@Killer.NameArticle@Killer.MenuName,,);
		}
		else if ( (Killer != None) && (!Killer.IsA('PlayerPawn')) )
		{
			BroadcastMessage( Killer.KillMessage(damageType, Other), false);
			return;
		}
		else if ( Killer != none && (DamageType == 'SpecialDamage') && (SpecialDamageString != "") && Killer.IsA('PlayerPawn') )
		{
			BroadcastMessage( ParseKillMessage(
					Killer.PlayerReplicationInfo.PlayerName,
					Other.PlayerReplicationInfo.PlayerName,
					Killer.Weapon.ItemName,
					SpecialDamageString
					),
				false);
			bSpecialDamage = True;
		}
		Other.PlayerReplicationInfo.Deaths += 1;
		if ( Other != none &&((Killer == Other) || (Killer == None)))
		{
			// Player Deaths,in suicide case? Eventually....
			if (!bSpecialDamage)
			{
				if ( damageType == 'Fell' )
					BroadcastLocalizedMessage(DeathMessageClass, 2, Other.PlayerReplicationInfo, None);
				else if ( damageType == 'Eradicated' )
					BroadcastLocalizedMessage(DeathMessageClass, 3, Other.PlayerReplicationInfo, None);
				else if ( damageType == 'Drowned' )
					BroadcastLocalizedMessage(DeathMessageClass, 4, Other.PlayerReplicationInfo, None);
				else if ( damageType == 'Burned' )
					BroadcastLocalizedMessage(DeathMessageClass, 5, Other.PlayerReplicationInfo, None);
				else if ( damageType == 'Corroded' )
					BroadcastLocalizedMessage(DeathMessageClass, 6, Other.PlayerReplicationInfo, None);
				else if ( damageType == 'Mortared' )
					BroadcastLocalizedMessage(DeathMessageClass, 7, Other.PlayerReplicationInfo, None);
				else
					BroadcastLocalizedMessage(DeathMessageClass, 1, Other.PlayerReplicationInfo, None);
			}
		} 
		else 
		{
			if ( Killer != none && Killer.IsA('PlayerPawn') )// simple crap.....
			{
				KillerWeapon = "None";
				if (Killer.Weapon != None)
					KillerWeapon = Killer.Weapon.ItemName;
				OtherWeapon = "None";
				if (Other.Weapon != None)
					OtherWeapon = Other.Weapon.ItemName;
				if (!bSpecialDamage && (Other != None))
				{
					BroadcastRegularDeathMessage(Killer, Other, damageType);
				}
			}
		}
	}
	ScoreKill(Killer, Other);
}

function ScoreKill(pawn Killer, pawn Other)
{
	local Pawn P;
	local ScriptedPawn S;
	local int ph;
	local string damageType;

/*
	if ( Other.bIsPlayer && !Other.IsA('ScriptedPawn') && ( Killer == None || Killer.bIsPlayer ))
	{
		if ( (Killer == Other) || (Killer == None) )
			CheckEndGame();
	}
*/
	if ( Killer != None )
	{
/*	if ( (Killer == None) || (Killer == Other) || !Other.bIsPlayer || (Killer.PlayerReplicationInfo.Team != Other.PlayerReplicationInfo.Team) )
		Super(GameInfo).ScoreKill(Killer, Other);
		//Here are some negative problems Killer.Team != Other.Team
		//if is no killer or Self Blasted or not player or if they are on the same team no score. Why score ?
*/
		if (!Other.IsA('ScriptedPawn')) return;

	 	if ( Killer != Other)
    		BroadcastMessage(Killer.GetHumanName()@"killed"$Other.GetHumanName());

		if (Killer.Isa('StationaryPawn')) return;

// =========================================================================
// Score depending on the max health of the monster killed.

	if (Killer.IsA('PlayerPawn') && !Killer.IsA('ScriptedPawn') && Other.IsA('ScriptedPawn'))
		{
			ph = ScriptedPawn(Other).Default.Health;
			if (Other.IsA('Nali') || Other.IsA('Cow'))
			{
				Killer.PlayerReplicationInfo.Score += 0.02*ph; // Bullshits ? Give me a break. Now they are fixed.
			}
			else if (ScriptedPawn(Other).bIsBoss)
			{
				Killer.PlayerReplicationInfo.Score += 0.06*ph; // Will be Nice
			}
			else
			{
				Killer.PlayerReplicationInfo.Score += 0.04*ph; // Really nice
			}
		}
	else if (Killer.IsA('ScriptedPawn') && Other.IsA('ScriptedPawn') && (Killer == Other) ) //Some dudes forgot to die and they suicided
		{
		BroadcastMessage(Killer.GetHumanName()@"Had an aneurysm.");
		return;
		}
	}
	else if (Killer == None && Other.IsA('ScriptedPawn'))
	return;
	BaseMutator.ScoreKill(Killer, Other);
}

//-----------------------------------------------------------
//Fixed because old accessed nones....
//-----------------------------------------------------------
function NavigationPoint FindPlayerStart( Pawn Player, optional byte InTeam, optional string incomingName )
{
	local PlayerStart Dest;
	local Teleporter Tel;
	local PlayerStart Destinations[64];
	local int i, Random;
	
	goto JL0013;
	
JL0012:
    for(i=0;i<ArrayCount(Destinations);i++){ //Clean the array
	    Destinations[i]=none;}
	goto JL0013;
	
JL0013:
i=0;
    if (bSpawnInTeamArea) goto JL0014;
	else goto JL0015;
	
	JL0014:
	    ForEach AllActors(class'PlayerStart',Dest){
	        if(Dest.bEnabled && Dest.TeamNumber == InTeam){
	    	    Destinations[i]=Dest;
	    		i++;}
			
	    	else if (Dest.bEnabled){
	    	Destinations[i]=Dest;
	    	i++;}}
			goto JL0016;
	JL0015:
		    ForEach AllActors(class'PlayerStart',Dest){
	        if(Dest.bEnabled){
	    	    Destinations[i]=Dest;
	    		i++;}}
				goto JL0016;
JL0016:
	Random=Rand(i);
	
	if (Destinations[Random] != none)		
	    return Destinations[Random];
	else goto JL0012;
	
		
}


function SetBotOrders(Bot NewBot)
{
	local Pawn P, L;
	local int num, total;

	// only follow players, if there are any
	if ( (NumSupportingPlayer == 0)
		 || (NumSupportingPlayer < Teams[NewBot.PlayerReplicationInfo.Team].Size/2 - 1) ) 
	{
		For ( P=Level.PawnList; P!=None; P= P.NextPawn )
		{
		if(!P.IsA('ScriptedPawn')){
			if ( P.IsA('PlayerPawn') && (P.PlayerReplicationInfo.Team == NewBot.PlayerReplicationInfo.Team)
				&& !P.IsA('Spectator') )
	     	{
			num++;
			if ( (L == None) || (FRand() < 1.0/float(num)) )
				L = P;
	    	}
		}}

		if ( L != None )
		{
			NumSupportingPlayer++;
			NewBot.SetOrders('Follow',L,true);
			return;
		}
	}
	num = 0;
	For ( P=Level.PawnList; P!=None; P= P.NextPawn )
	if(!P.IsA('ScriptedPawn')){
		if ( P.bIsPlayer && (P.PlayerReplicationInfo.Team == NewBot.PlayerReplicationInfo.Team) )
		{
			total++;
			if ( (P != NewBot) && P.IsA('Bot') && (Bot(P).Orders == 'FreeLance') )
			{
				num++;
				if ( (L == None) || (FRand() < 1/float(num)) )
					L = P;
			}
		}}
				
	if ( (L != None) && (FRand() < float(num)/float(total)) )
	{
		NewBot.SetOrders('Follow',L,true);
		return;
	}
	NewBot.SetOrders('Freelance', None,true);
}	

function StartPlayer(PlayerPawn Other)
{				
	if( Level.NetMode==NM_DedicatedServer || Level.NetMode==NM_ListenServer || !bRestartLevel )
		Other.GotoState(Other.PlayerRestartState);
	else
		Other.ClientTravel( "?restart", TRAVEL_Relative, false );
}
		 

function ChangeName( Pawn Other, coerce string S, bool bNameChange )
{
	if( S == "" )
		return;
	if (Other.IsA('ScriptedPawn')) return;
	Other.PlayerReplicationInfo.PlayerName = S;
	if( bNameChange )
		Other.ClientMessage( NameChangedMessage $ Other.PlayerReplicationInfo.PlayerName );
}

function AddToTeam( int num, Pawn Other )
{
	local int TeamNum;
	

	if ( Other != None )
	{
			//Stupid to use num if we already know the teams
		

		if(Other.IsA('Cow') || Other.IsA('Nali'))
		{
			ScriptedPawn(Other).Team = 0;
			TeamNum = 0;
		}
		else if ( Other.IsA('PlayerPawn') || Other.IsA('Bot')) 
		{
			Other.PlayerReplicationInfo.TeamName = "Hunters";
			Other.PlayerReplicationInfo.Team = 0;
			Other.PlayerReplicationInfo.TeamID = PlayerTeamID++;
			TeamNum = 0;
		}
		else if(Other.IsA('ScriptedPawn')){
		    ScriptedPawn(Other).Team = 1;
			//ScriptedPawns doesn't have PlayerReplicationInfo....
			TeamNum = 1;
		}
		if(Teams[TeamNum] == none)
			Teams[TeamNum] = Spawn(class'TeamInfo');
		Teams[TeamNum].Size++;
	}
}

function StartMatch()
{
	local Pawn P;
	local ScriptedPawn S;

	for (P=Level.PawnList; P!=None; P=P.NextPawn)
	{
	S=ScriptedPawn(P);
		if(S != None)	//Game has started - We turn back the Hate for humanity, kill players, go, go, go... .
		{			//Of course we don't trigger friendly classes :P.
			if (!S.IsA('Nali') && !S.IsA('Cow') )
			{
			S.AttitudeToPlayer=ATTITUDE_Hate;
			}
		}
	}
	//CountHunters();
	if (NumPts > 0)
		BroadcastMessage("Map seems to have"@NumPts@"WayPoints.");
	if (TN < 20)
		BroadcastMessage("Map seems to have "@TN@"Pathnodes. We don't expect more Relics and/or Bot Support.");
	bStartedHunt = True;
	MonsterReplicationInfoTwo(GameReplicationInfo).bStartedHunt=true;
	super.StartMatch();
	log ("MH2_C_V18.MonsterHunt game-mod has been initialized and started"); //Yep, let's see the start.
}

function final CountHunters()
{
	TotalHunters = NumPlayers + NumBots;
	MonsterReplicationInfoTwo(GameReplicationInfo).Hunter = TotalHunters;
}

function ClearOrders(Pawn Leaving) //reservation, no problem next time will treat it as needed
{
	local Pawn P;

	for ( P=Level.PawnList; P!=None; P=P.NextPawn )
		if ( P.IsA('Bot') && (Bot(P).OrderObject == Leaving) )
			Bot(P).SetOrders('Attack', None);
}

function PickAmbushSpotFor(Bot aBot)
{
	local NavigationPoint N;

	for ( N=Level.NavigationPointList; N!=None; N=N.NextNavigationPoint )
		if ( N.IsA('Ambushpoint') && !N.taken )
		{
			if ( aBot.Orders == 'Defend' )
			{
				if ( N.IsA('DefensePoint') && (DefensePoint(N).team == aBot.PlayerReplicationInfo.team) )
				{
					if ( (DefensePoint(aBot.Ambushspot) == None)
						|| (DefensePoint(N).priority > DefensePoint(aBot.Ambushspot).priority) )
						aBot.Ambushspot = Ambushpoint(N);
					else if ( (DefensePoint(N).priority == DefensePoint(aBot.Ambushspot).priority)
						&& (FRand() < 0.4) ) 
						aBot.Ambushspot = Ambushpoint(N);
				}		
				else if ( (DefensePoint(aBot.AmbushSpot) == None)
						&& (VSize(N.Location - aBot.OrderObject.Location) < 1500)
						&& FastTrace(aBot.OrderObject.Location, N.Location)
						&& ((aBot.Ambushspot == None) || (FRand() < 0.5)) )
							aBot.Ambushspot = Ambushpoint(N);
			}
			else if ( (aBot.AmbushSpot == None)
				|| (VSize(aBot.Location - aBot.Ambushspot.Location)
					 > VSize(aBot.Location - N.Location)) )
				aBot.Ambushspot = Ambushpoint(N);
		}
}

function bool FindSpecialAttractionFor(Bot aBot)
{
	local Pawn P;
	local ScriptedPawn S;
	local bool bFound;
	local NavigationPoint N;
	local NsWayPoint WP;
	local NsWayPoint NextPoint;
	local NSMonsterEnd E;
	local int ActualP;

	if ((aBot != None) && (aBot.Health < 1))
	{
		aBot.GotoState('GameEnded');
		return false;
	}

	if ( aBot.LastAttractCheck == Level.TimeSeconds )
		return false;
	aBot.Visibility = 180;
//	foreach aBot.VisibleActors(class 'ScriptedPawn', S)
//	foreach AllActors (class 'ScriptedPawn', S)
	for (P=Level.PawnList; P!=None; P=P.NextPawn)
	{
	S = ScriptedPawn(P);
	if ( S != None && S.Health > 0)
	{
	if (S.IsA('Nali') || S.IsA('Cow') || S.Health <= 0 || VSize(aBot.Location - S.Location) > 4500)
            continue;
	if (S.LineOfSightTo(aBot))
	if (S.Enemy == None || VSize(S.Location - S.Enemy.Location) >
		VSize(S.Location - aBot.Location)+200)
		{
		if ((!S.Region.Zone.bWaterZone && !aBot.Region.Zone.bWaterZone )
			 || (aBot.Region.Zone.bWaterZone && !S.Region.Zone.bWaterZone && S.bHasRangedAttack)
			 || (!aBot.Region.Zone.bWaterZone && S.Region.Zone.bWaterZone && S.bHasRangedAttack)
			 || (S.Region.Zone.bWaterZone && aBot.Region.Zone.bWaterZone))
			{
			S.Hated = aBot;
			S.Enemy = aBot;
			if (S.SetEnemy(aBot))
				S.GotoState('RangedAttack','ReadyToAttack');
			if (aBot.Enemy == None || (VSize(aBot.Enemy.Location - aBot.Location) > VSize(S.Location - aBot.Location)+200 && FRand() > 0.35))
				{
				aBot.Enemy = S;
				aBot.GotoState('Hunting', 'SpecialNavig');
				}
			}
		}
	if (aBot.LineOfSightTo(S))
	if (aBot.Enemy == None || VSize(aBot.Location - aBot.Enemy.Location) >
		VSize(aBot.Location - S.Location)+200)
		{
		if ((!S.Region.Zone.bWaterZone && !aBot.Region.Zone.bWaterZone)
			 || (aBot.Region.Zone.bWaterZone && !S.Region.Zone.bWaterZone && (S.bHasRangedAttack || S.Event != ''))
			 || (!aBot.Region.Zone.bWaterZone && S.Region.Zone.bWaterZone && (S.bHasRangedAttack || S.Event != ''))
			 || (S.Region.Zone.bWaterZone && aBot.Region.Zone.bWaterZone))
			{
			aBot.Enemy = S;
			aBot.GotoState('Hunting','SpecialNavig');
			if (S.Enemy == None || (VSize(S.Enemy.Location - S.Location) > VSize(aBot.Location - S.Location)+200 && FRand() > 0.35))
				{
			S.Hated = aBot;
			S.Enemy = aBot;
			if (S.SetEnemy(aBot))
				S.GotoState('RangedAttack','ReadyToAttack');
				}
			}
		}
	}
	}
	aBot.LastAttractCheck = Level.TimeSeconds;
	if ( !aBot.IsInState('Roaming') && aBot.Enemy == None && FRand() > 0.4 )
			{
			aBot.bNoClearSpecial = True;
			aBot.GotoState('Roaming', '');
			}

//********* Section added... Is not the perfect ideea but might help enough, :P...
	if (aBot.Orders == 'Freelance')
		aBot.bLeading = True;

	if ((aBot.OrderObject != None && aBot.Orders == 'Attack') || aBot.Orders != '' )
	{	
		if (aBot.IsInState('Roaming') && !bStupidMap && (aBot.MoveTarget == None || aBot.MoveTarget.IsA('InventorySpot')) && aBot.Enemy == None && FRand() > 0.45)
		{
//		ForEach AllActors(class 'PathNode', PN) //Nah, faster
		for ( N=Level.NavigationPointList; N!=None; N=N.NextNavigationPoint )
			{
			if (N != None && N.IsA('Pathnode'))
				{
			ActualP = Vsize(aBot.Location - N.Location);
			if ( ActualP > 2500)
					continue;
			if ( ActualP > 80 && aBot.CanSee(N) && ((aBot.Location.Z - N.Location.Z) > -95) && !aBot.Region.Zone.bWaterZone && !N.Region.Zone.bWaterZone )
				{
				if (aBot.ActorReachable(N))
						aBot.Target = N;
					aBot.MoveTarget = N;
//		BroadcastMessage(aBot.GetHumanName()$": I'm forcing a desired temporary destination...");
					aBot.bCamping = False;
					aBot.MoveTimer = 1.0;
				if (aBot.MoveTarget != None)
					{
					SetForcedStateFor(aBot);
					return True;
					}
				}
				}
			}
		}
	}
//********** End of section added...
	if (aBot.Orders == 'Attack' && ( aBot.Enemy == None || Vsize(aBot.Enemy.Location - aBot.Location) > 1500 ) || (aBot.bLeading && FRand() > 0.2 && ( aBot.Enemy == None || Vsize(aBot.Enemy.Location - aBot.Location) > 1500 )))
	{
		foreach AllActors( class 'NsWayPoint', WP )
		{
			if (!WP.bVisited && (WP.Position == LastPt + 1))
			{
				NextPoint = WP;
				if (aBot.ActorReachable(NextPoint))
					aBot.MoveTarget = NextPoint;
				else
					aBot.MoveTarget = aBot.FindPathToward(NextPoint);
				NumPts --;
			if ( aBot.MoveTarget != None )
				{
				SetAttractionStateFor(aBot);
				return True;
				}
				else
				{
					if ( aBot.bVerbose )
					log(aBot$" - I cannot see a way to hunt, Wtf can I do now ?");
				return False;			
				}
			}
		}

		if (NumPts <= 0)
		{
		foreach AllActors (class 'NSMonsterEnd', E)
			{
			if (E != None)
				{
				if ( aBot.ActorReachable(E) )
					aBot.MoveTarget = E;
				else
					aBot.MoveTarget = aBot.FindPathToward(E);
				if ( aBot.MoveTarget != None )
					{
					SetAttractionStateFor(aBot);
					return True;
					}
				else
					{
			if ( aBot.bVerbose )
			log(aBot$" - No path to End, Wtf can I do now ?");
			return False;
					}
				}
			}
		}
	}
    return false;
}

function SetForcedStateFor(Bot aBot)
{
	aBot.bNoClearSpecial = true;
	aBot.TweenToRunning(0.1);
	if (Vsize(aBot.MoveTarget.Location - aBot.Location) < 600)
		{
		aBot.Movetarget = None;
//	BroadcastMessage(aBot.GetHumanName()$": I'm removing temporary destination...");
		aBot.GotoState('Roaming','SpecialNavig');
		}
}

function bool NeverStakeOut(Bot Other)
{
	if ( Other.Region.Zone.bWaterZone || Other.Region.Zone.IsA('KillingField') )
		return True;
	return False;
}

function bool CanStakeOut(ScriptedPawn Other)
{
	if ( Other.Region.Zone.bWaterZone || Other.Region.Zone.IsA('KillingField') )
		return False;
	return True;
}

exec function AddBots(int Num)
{
local int i;
if(Num>0)
{
	for(i=Num;i>0;i--)
	{
		ForceAddBot();
	}
}

else if(Num<0)
{
	Num=Abs(Num);
	if(NumBots >= Num)
		for(i=Num;i>0;i--)
			RemoveBot();
}
}

function RemoveBot()
{
local Bot B;
Foreach AllActors(class'Bot',B)
{
	MinPlayers--;
	B.Destroy();
	return;
}
}

function SetGameSpeed( Float T )
{
	if(T>10)
		T /= 100;
	GameSpeed = FMax(T, 0.1);
	if ( bHardCoreMode )
	{
		if ( bChallengeMode )
			Level.TimeDilation = 1.25 * GameSpeed;
		else
			Level.TimeDilation = 1.1 * GameSpeed;
	}
	else
		Level.TimeDilation = GameSpeed;
	SaveConfig();
	SetTimer(1.1, true);
}

exec function DoGameSpeed( Float T)
{
	if(T>10)
		T /= 100;
	GameSpeed = FMax(T, 0.1);
	if ( bHardCoreMode )
	{
		if ( bChallengeMode )
			Level.TimeDilation = 1.25 * GameSpeed;
		else
			Level.TimeDilation = 1.1 * GameSpeed;
	}
	else
		Level.TimeDilation = GameSpeed;
	SaveConfig();
	SetTimer(1.1, true);
}

function TGT()
{
local byte ReadyNum;
local Pawn P;


	if ( !bOverTime && (TimeLimit > 0) )
	{
		GameReplicationInfo.bStopCountDown = false;
		--RemainingTime;
		//GameReplicationInfo.RemainingTime = RemainingTime;
		//if ( RemainingTime % 60 == 0 )
		//	GameReplicationInfo.RemainingMinute = RemainingTime;
		if ( RemainingTime == 0 )
			EndGame("timelimit");
	}
	else
	{
		ElapsedTime++;
		GameReplicationInfo.ElapsedTime = ElapsedTime;
	}

	if(bStartedHunt || bGameEnded) return; // if game is started we return timer.


	if ( NumPlayers > 0 ) // This is for not starting match before players connected, prevents game from being started before all players arrive.
		ElapsedTime++;
	else
		ElapsedTime = 0;
	if(!bReadyToCountdown)
	{
	for ( P = Level.PawnList; P!=None; P=P.nextPawn )
		if ( P.IsA('PlayerPawn') )
		{
			PlayerPawn(P).ClearProgressMessages();
			PlayStartupMessage(PlayerPawn(P));
		}
	}
	if ( ElapsedTime >= NetWait ) // NetWait is the # of seconds to wait before players are allowed to start the game
	{
	
	if(bRequireReady && !bStartedHunt)
	{
		if ( !bReadyToCountdown )
		{
			for (P=Level.PawnList; P!=None; P=P.NextPawn )
				if ( PlayerPawn(P)!=none  && Spectator(P) == none){
					PlayerPawn(P).SetProgressTime(2);
					if(PlayerPawn(P).bReadyToPlay)
						ReadyNum++;
				}
			
		if(ReadyNum==NumPlayers)
			bReadyToCountdown=True;
		}
	}
	
		else if(!bRequireReady)
		{
			for (P=Level.PawnList; P!=None; P=P.NextPawn )
			if ( PlayerPawn(P)!=none )
			{
				PlayerPawn(P).SetProgressTime(2);
				if(PlayerPawn(P).bReadyToPlay && Spectator(P) == none)
				{
					bReadyToCountdown=True;
					break;
				}
			}
		}
	}

	if(bReadyToCountdown)
	{
		log("Is ready to countdown");
		bReadyToCountdown = false;
		if ( /*(NumPlayers + NumBots < 4)*/NumPlayers > 0 && NeedPlayers() ) //If we have a player on the server we check if we have to give him some friends.
			AddBot();
		
		
		CountDown--;
		if ( CountDown <= 0 )
			StartMatch();
		else
		{
			for ( P = Level.PawnList; P!=None; P=P.nextPawn )
				if ( P.IsA('PlayerPawn') )
				{
					PlayerPawn(P).SetProgressTime(2);
					PlayerPawn(P).ClearProgressMessages();
					if ( (CountDown < 11) && P.IsA('TournamentPlayer') )
						TournamentPlayer(P).TimeMessage(CountDown);
					else
						PlayerPawn(P).SetProgressMessage(CountDown$CountDownMessage, 0);
				}
		}
		
	}

}

function bool AddBot()
{
	local bot NewBot;
	local NavigationPoint StartSpot, OldStartSpot;
	local int DesiredTeam, i, MinSize;

	NewBot = SpawnBot(StartSpot);
	if ( NewBot == None )
	{
		log("Failed to spawn bot");
		return false;
	}

	AddToTeam(0,NewBot);//Call this for bots instead, to give him right team
	
	if ( bSpawnInTeamArea )
	{
		OldStartSpot = StartSpot;
		StartSpot = FindPlayerStart(NewBot,0);
		if ( StartSpot != None )
		{
			NewBot.SetLocation(StartSpot.Location);
			NewBot.SetRotation(StartSpot.Rotation);
			NewBot.ViewRotation = StartSpot.Rotation;
			NewBot.SetRotation(NewBot.Rotation);
			StartSpot.PlayTeleportEffect( NewBot, true );
		}
		else
			StartSpot = OldStartSpot;
	}

	StartSpot.PlayTeleportEffect(NewBot, true);

	SetBotOrders(NewBot);


	return true;
}

function Timer()
{
	Local Pawn P;
	local int i,j;
	local Actor a;
	local MonsterReplicationInfoTwo GRI;

	Super(GameInfo).Timer();
	if(!bRebootPending)
		TGT();
	if(bReset && Level.TimeSeconds/Level.TimeDilation > ServerTravelTime + 4){
		if(Level.NextURL == "")
		{
			if(Level.NextSwitchCountdown < 0)
			{
				log("ServerTravel has failed because of missing files");
				Level.ServerTravel("?restart",false);
			}
		}
	}
	
	if(bRebootPending)
	{
		RebootCountDown--;
		if(RebootCountDown <=0){
			
			Level.ServerTravel("ServerTravel ?restart", false);
			bRebootPending=False;//Just in case
		}
	}

	TotalMonsters = 0;
    for(P=Level.PawnList;P!= none;P=P.NextPawn)
	{
		if(ScriptedPawn(P) != none)
			TotalMonsters++;
	    if(P.IsA('TournamentPlayer'))
		    {
			    for(i=0;i<32;i++){
				    if(Players[i].PlayerName==P.PlayerReplicationInfo.PlayerName)
					    {
						Players[i].Lives=MHReplicationInfo(P.PlayerReplicationInfo).Lives;
			            Players[i].Deaths=MHReplicationInfo(P.PlayerReplicationInfo).Deaths;
			            Players[i].Score=MHReplicationInfo(P.PlayerReplicationInfo).Score;
			            Players[i].KilledMonsters=MHReplicationInfo(P.PlayerReplicationInfo).KilledMonster;
			            Players[i].Headshots=MHReplicationInfo(P.PlayerReplicationInfo).Headshots;
						}
					}
			}
	
	}
	MonsterReplicationInfoTwo(GameReplicationInfo).Monster = TotalMonsters;
	//countmonsters();
}

defaultproperties
{
     bUseLive=True
     bNoGreen=True
     StartUpMessage="Work with your teammates to hunt down the monsters!"
     Live=19
     SkillMonster=7
     Ncheck=50
     TimeOutMessage="Time's up, hunt failed!"
     RebootCountDown=10
     DefaultGame="MH2_C_V18.MonsterHunt"
     bNoTeamChanges=True
     bBalanceTeams=False
     bPlayersBalanceTeams=False
     MaxAllowedTeams=2
     MinPlayers=10
     TimeLimit=300
     NetWait=2
     RestartWait=2
     StartMessage="Good Hunting!"
     GameEndedMessage="Game Over!"
     SingleWaitingMessage="Press Fire To Start The Game"
     MaxCommanders=0
     ExplodeMessage=" Was Blown Up To Pieces"
     FallMessage=" Was Smashed To The Ground"
     DrownedMessage=" Drowned "
     BurnedMessage=" Was Incinerated"
     CorrodedMessage=" Was Dissolved In Slime"
     HackedMessage=" Was Hacked Into Pieces"
     MortarMessage=" Was Blown Up By A Mortar"
     bDisallowOverride=True
     bCanChangeSkin=True
     GameSpeed=1.300000
     DefaultWeapon=class'MP5'
     AdminPassword="Chris"
     GamePassword=""
     ScoreBoardType=Class'MH2_C_V18.MH2ScoreBoard1'
     BotMenuType="MH2_C_V18.Monster2BotConfig"
     RulesMenuType="MH2_C_V18.Monster2HuntRules"
     SettingsMenuType="MH2_C_V18.Monster2Settings"
     HUDType=Class'MH2_C_V18.CMonsterHUD'
     MapListType=Class'MonsterHunt.MonsterMapList'
     MapPrefix="MH"
     LeftMessage=" Left (Quitter)."
     EnteredMessage=" Joined"
     GameName="MonsterHunt"
     DMMessageClass=Class'MH2_C_V18.HuntMessage'
     MutatorClass=Class'MH2_C_V18.MonsterBasePlus'
     GameReplicationInfoClass=Class'MH2_C_V18.MonsterReplicationInfoTwo'
     bLocalLog=False
     bWorldLog=False
     bBatchLocal=False
     bAlwaysRelevant=True
}
