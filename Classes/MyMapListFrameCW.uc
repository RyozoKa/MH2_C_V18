class MyMapListFrameCW expands UMenuDialogClientWindow;

var MyControlFrame Frame;
var bool bUseBlack;

function Created()
{
	Frame = MyControlFrame(CreateWindow(class'MyControlFrame', 0, 0, WinWidth, WinHeight));
	Super.Created();
}

function BeforePaint(Canvas C, float X, float Y)
{
	Super.BeforePaint(C, X, Y);

	Frame.WinLeft = 5;
	Frame.WinTop = 5;
	Frame.bUseBlack=bUseBlack;
	Frame.SetSize(WinWidth - 10, WinHeight - 10);
}

defaultproperties
{
}
