//=============================================================================
// FL_Mutator.
//=============================================================================
class FL_Mutator extends Mutator
	config(MH2_C_V18);

var config bool bInitiallyOn, bBrightPlayer, bSearchlight;

function PostBeginPlay()
{
	local Pawn P;

	for ( P = Level.PawnList; P != None; P = P.NextPawn )
	if ( (P.IsA('PlayerPawn')) && (PlayerPawn(P).Player != None) )
	ModifyPlayer(P);
	saveconfig();
	if ( NextMutator != None )
		NextMutator.PostBeginPlay();
}

function Mutate(string MutateString, PlayerPawn Sender)
{
	local Inventory Inv;

	if ( MutateString ~= "Flashlight" )
	{
		if ( (Sender.Health <= 0) || Sender.PlayerReplicationInfo.bIsSpectator )
		return;

		if ( !bSearchLight )
		Inv = Sender.FindInventoryType(class'FL_Flashlight');
		else
		Inv = Sender.FindInventoryType(class'FL_Searchlight');

		if ( Inv != None )
		{
			if ( Inv.bActive )
			{
				Inv.GoToState('DeActivated');
				Inv.bActive = False;
			}
			else
				Inv.GoToState('Activated');
		}
		else
		{
			if ( !bSearchlight )
			Sender.ClientMessage("You have no Flashlight.");
			else
			Sender.ClientMessage("You have no Searchlight.");
		}
		return;
	}
   if ( NextMutator != None )
		NextMutator.Mutate(MutateString, Sender);
}

function ModifyPlayer(Pawn Other)
{
	local Inventory Inv;

	Super.ModifyPlayer(Other);

	if ( !Other.IsA('PlayerPawn') )
	return;

	if ( !bSearchlight )
	{
		Inv = Spawn(class'FL_Flashlight',Other,,Other.Location);

		if ( Inv == None )
		return;

		Inv.GiveTo(Other);
		if ( bInitiallyOn )
		Inv.Activate();
	}
	else
	{
		Inv = Spawn(class'FL_Searchlight',Other,,Other.Location);

		if ( Inv == None )
		return;

		Inv.GiveTo(Other);
		if ( bInitiallyOn )
		Inv.Activate();
	}
	if ( NextMutator != None )
		NextMutator.ModifyPlayer(Other);
}

defaultproperties
{
     bInitiallyOn=True
}
