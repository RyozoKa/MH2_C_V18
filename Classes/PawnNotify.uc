// ============================================================
//EverythingNotify
// ============================================================

class PawnNotify expands SpawnNotify;

function prebeginplay(); //don't check for relevance

simulated function PostBeginPlay()
{
	local actor other;
	local ScriptedPawn S;

	//Don't add to notifylist if server, but keep available, so it's existence is replicated to clients
	if (level.netmode == NM_DedicatedServer) //mutator works on server.
		return;
	Super.PostBeginPlay(); //add.
	log ("Pawn Notify Initialized");
	ForEach Allactors(class'actor',other)
	{	//mask.
		if (other.style==STY_NORMAL && (other.IsA('decoration') && ((other.isa('tree') || left(getitemname(string(other.class)),5)~="plant")) || (other.role==role_authority&&other.isa('pawn')&&(other.isa('skaarjwarrior')||other.isa('krall')||other.isa('warlord')||other.isa('bird1')||other.isa('Slith')||other.isa('manta')))))
			Other.Style=Sty_masked;
		if (other.IsA('scriptedpawn') && !other.isa('tentacle') && pawn(other).shadow==none)	//no decal for them.
		{
			scriptedpawn(other).Shadow = Spawn(class'Monster2Shadow',other,,other.location);
		}
	}
}

simulated event Actor SpawnNotification(Actor other)
{
	if (other.style==STY_NORMAL && (other.IsA('decoration') && ((other.isa('tree')||left(getitemname(string(other.class)),5)~="plant"))||(other.role==role_authority&&other.isa('pawn')&&(other.isa('skaarjwarrior')||other.isa('krall')||other.isa('warlord')||other.isa('bird1')||other.isa('Slith')||other.isa('manta')))))
			Other.Style=Sty_masked;
	if (other.IsA('scriptedpawn') && !other.isa('tentacle') && pawn(other).shadow==none)	//no decal for them.
	{
		scriptedpawn(other).Shadow = Spawn(class'Monster2Shadow',other,,other.location);
	}
	if(Other.IsA('ScriptedPawn'))
		ScriptedPawn(Other).UnderWaterTime = ScriptedPawn(Other).health;
	return other;
}

defaultproperties
{
}
