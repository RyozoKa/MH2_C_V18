class Monster2CreditsWindow expands UTCreditsWindow;

function Created() 
{
	bStatusBar = False;
	bSizable = True;

	Super.Created();

	WinWidth = Min(600, Root.WinWidth - 10);
	WinHeight = Min(400, Root.WinHeight - 10);

	MinWinWidth = 620;
	MinWinHeight = 380;

	WinLeft = Root.WinWidth/2 - WinWidth/2;
	WinTop = Root.WinHeight/2 - WinHeight/2;

//	CloseButton = UWindowSmallCloseButton(CreateWindow(class'UWindowSmallCloseButton', WinWidth-56, WinHeight-24, 48, 16));
}

defaultproperties
{
     ClientClass=Class'MH2_C_V18.Monster2CreditsCW'
     WindowTitle="MonsterHunt2 SHDW Credits"
}
