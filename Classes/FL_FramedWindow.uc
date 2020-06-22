//=============================================================================
// FL_FramedWindow.
//=============================================================================
class FL_FramedWindow expands UWindowFramedWindow;

function BeginPlay()
{
	Super.BeginPlay();

	WindowTitle = "Flashlight";
	ClientClass = class'FL_ClientWindow';
}

function Created()
{
	Super.Created();

	WinLeft = Int((Root.WinWidth-WinWidth)/2);
	WinTop = Int((Root.WinHeight-WinHeight)/2);
}

defaultproperties
{
}
