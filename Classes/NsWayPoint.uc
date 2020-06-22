//******************** Introduction ********************
//*** This one is added right near that original copying values
//*** to make things to work normally as expected. Is about Bot Support for MH.
//*** If you don't know that, better read original help and do not be disgusted :P
//***	In fact this is also modified to ruin a default bullshit.
//******************** End of Introduction ************

class NsWayPoint extends Keypoint;

var(Waypoint) int Position;
var(Waypoint) Actor TriggerItem;
var(Waypoint) Name TriggerEvent1;
var(Waypoint) Name TriggerEvent2;
var(Waypoint) Name TriggerEvent3;
var(Waypoint) Name TriggerEvent4;
var actor TriggerActor1;
var actor TriggerActor2;
var actor TriggerActor3;
var actor TriggerActor4;
var bool bVisited;
var bool bEnabled;

function PostBeginPlay()
{
	local Actor A;

	TriggerActor1 = None;
	TriggerActor2 = None;
	TriggerActor3 = None;
	TriggerActor4 = None;

	ForEach AllActors(class 'Actor', A)
	{
		if ( A.Event == TriggerEvent1)
		{
			if (TriggerActor1 == None)
				TriggerActor1 = A;
		}
		if ( A.Event == TriggerEvent2)
		{
			if (TriggerActor2 == None)
				TriggerActor2 = A;
		}
		if ( A.Event == TriggerEvent3)
		{
			if (TriggerActor3 == None)
				TriggerActor3 = A;
		}
		if ( A.Event == TriggerEvent4)
		{
			if (TriggerActor4 == None)
				TriggerActor4 = A;
		}
	}
}

/*
This one is modified because exist enough people who aren't using Bots... Good !
Original MonsterWaypoint is the only one shit who trigger some Mover only touched - visited by Bots, yeah, only by Bots...
From my side, I never anticipated this crap, people modified already a map, me too, Bots will finish it...
My controller works a bit better and I pathed it like should be by default but noobs aren't able to
deal with a freaky Bot. Even with this, was recommended Bot support. Really ? Like yours ?
End of stupidity right now...
*/

function Touch ( actor Other )
{
	if (!bVisited && bEnabled && (Other.IsA('PlayerPawn') || Other.IsA('Bot')))
	{
		if (MonsterHunt2(Level.Game).LastPt + 1 == Position) //Cough, no more triggered shit earlier...
		{
		if ( Other.IsA('Bot') )						//Added (for spam :P)
			Bot(Other).SendTeamMessage(None, 'OTHER', 11, 15);

		if ((TriggerActor1 != None) && (Other.IsA('PlayerPawn') || Other.IsA('Bot')))// K.O. to idiotic things...
			{	//Lol ... need some brain. How about that rock-bridge in Trials ? No fucking kidding me !
				//That's why you recommended Bots ? I think you have mental problems sometimes (like me :P ?)
			if (TriggerActor1.IsA('Mover'))
				TriggerActor1.Bump(Other);
			TriggerActor1.Trigger(Self, Pawn(Other));
			}
		if ((TriggerActor2 != None) && (Other.IsA('PlayerPawn') || Other.IsA('Bot')))
			{
			if (TriggerActor2.IsA('Mover'))
				TriggerActor2.Bump(Other);
			TriggerActor2.Trigger(Self, Pawn(Other));
			}
		if ((TriggerActor3 != None) && (Other.IsA('PlayerPawn') || Other.IsA('Bot')))
			{
			if (TriggerActor3.IsA('Mover'))
				TriggerActor3.Bump(Other);
			TriggerActor3.Trigger(Self, Pawn(Other));
			}
		if ((TriggerActor4 != None) && (Other.IsA('PlayerPawn') || Other.IsA('Bot')))
			{
			if (TriggerActor4.IsA('Mover'))
				TriggerActor4.Bump(Other);
			TriggerActor4.Trigger(Self, Pawn(Other));
			}
		if ((TriggerItem != None) && (Other.IsA('PlayerPawn') || Other.IsA('Bot'))) //I want to see when was used this crap anyway...
			{
			if (TriggerItem.IsA('Mover'))
				TriggerItem.Bump(Other);
			TriggerItem.Trigger(Self, Pawn(Other));
			}
			MonsterHunt2(Level.Game).LastPt = Position;
			bVisited = True;
			bEnabled = False;
		}
	}
}

defaultproperties
{
     bEnabled=True
     bStatic=False
     Texture=Texture'MonsterHunt.MHMarker'
     CollisionRadius=30.000000
     CollisionHeight=30.000000
     bCollideActors=True
}
