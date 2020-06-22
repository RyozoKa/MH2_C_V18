//Some hacks to get the capture height for moving the window to be set bigger, big lot of replacement code for that shite.
class MyDialogWindow expands UWindowPageWindow;
var font CFont;
var bool bMouseDownT,bMoveT,bCloseProcedure;
var PlayerPawn Owner;
var class<UWindowWindow>	ClientClass;
var UWindowWindow			ClientArea;
var localized string		WindowTitle;
var string					StatusBarText;
var float					MoveX, MoveY;	// co-ordinates where the move was requested
var color Colors;
var MyExitSmallButton Close;

function Created()
{
Colors.R=0;
	Colors.G=255;
	Colors.B=0;
	SetSize(256,256);
	WinWidth=256;
	WinHeight=256;
	bLeaveOnScreen = true;	
	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop = (Root.WinHeight - WinHeight) / 2;
	ClientArea = CreateWindow(class'MyClientDialog', 8, 32, 240, 192, OwnerWindow);
	
	Close = MyExitSmallButton(CreateControl(Class'MyExitSmallButton', 128 , 224 , 128, 1 ));
	Close.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.Close);
	//Close.DownSound = Sound'Click' ;
	Close.WinHeight=32;
    Close.WinWidth=128;
	Owner=GetPlayerOwner();
}


function ChangeLan()
{
if(MyClientDialog(ClientArea)!=none)
	MyClientDialog(ClientArea).ChangeLan();
Close.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.Close);
}

function BeforePaint(Canvas C, float X, float Y)
{		
Super.BeforePaint(C,X,Y);
}

function FrameHitTest FW_HitTest( float X, float Y)
{
	if((X >= 3) && (X <= WinWidth-3) && (Y >= 0) && (Y <= 30))
		return HT_TitleBar;

	return HT_None;	
}

function WindowEvent(WinMessage Msg, Canvas C, float X, float Y, int Key) 
{

	if(Msg== WM_LMouseDown)
		if(!Root.CheckCaptureMouseDown())
		{
		        bMouseDownT=True;
				LMouseDown(X, Y);
		}
	if (Msg==WM_LMouseUp)
		if(!Root.CheckCaptureMouseUp())
		{
			//if(!MessageClients(Msg, C, X, Y, Key))
			    bMouseDownT=false;
				LMouseUp(X, Y);
		}

    super.WindowEvent(Msg,C,X,Y,Key);

}


function LMouseDown(float X, float Y)
{
	local FrameHitTest H;
	H = FW_HitTest( X, Y);
	Super(UWindowWindow).LMouseDown(X, Y);


	if(H == HT_TitleBar)
	{
		MoveX = X;
		MoveY = Y;
		bMoveT = True;
		//Root.CaptureMouse();

		return;
	}
}

function Notify(UWindowDialogControl C, byte E)
{

	if(C==Close && E==DE_Click){
		hidewindow();
	}

	super.Notify(C,E);
}

function Paint(Canvas C, float X, float Y)
{
local color HUDColor, BaseColor;

//Super(UWindowWindow).Paint(C,X,Y);
//Dynamically set the WindowTitle

CFont=C.Font;

//WindowTitle="MH2 Client Settings                        "@DrawTwoDigit(owner.Level.year)$"-"$DrawTwoDigit(Owner.level.Month)$"-"$DrawTwoDigit(Owner.Level.Day)@GetDayOfWeek()@"     "@DrawTwoDigit(Owner.Level.Hour)$":"$DrawTwoDigit(Owner.Level.Minute)$":"$DrawTwoDigit(Owner.Level.Second);

	C.Style =Owner.ERenderStyle.STY_Translucent;
	
		
	c.drawcolor.R=250;
	c.drawcolor.G=250;
	c.drawcolor.B=250;

	drawStretchedTexture(c, 0, 1, 556, 32, Texture'EditBoxT');

   
   if(bMoveT && bMouseDownT)
	{
		WinLeft = Int(WinLeft + X - MoveX);
		WinTop = Int(WinTop + Y - MoveY);
	}
	else
		bMoveT = False;
		
		
		//Sides
		//Left
		DrawStretchedTexture(C, 0, 31, 8, 514, Texture'SideBorder');
		//Right
		DrawStretchedTexture(C, winwidth-8, 31, 8, 514, Texture'SideBorder');
		//Bottom
		C.Style =Owner.ERenderStyle.STY_Normal;
        DrawStretchedTexture(C, 0, winheight-32, 256, 32, Texture'EditBoxT');

		}



function Resized()
{
//Null this shit.
}

function AfterPaint(Canvas C, float X, float Y)
{
	Super.AfterPaint(C, X, Y);
}


//

defaultproperties
{
}
