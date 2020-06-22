//
#exec TEXTURE IMPORT File=Textures/border.pcx NAME=border_up MIPS=ON FLAGS=2
#exec TEXTURE IMPORT File=Textures/SideBorder.pcx NAME=SideBorder MIPS=ON FLAGS=2
#exec TEXTURE IMPORT File=Textures/TextBox.pcx NAME=TextBox
//Created by chris 2014-02-17

//Some hacks to get the capture height for moving the window to be set bigger, big lot of replacement code for that shite.
class MyMutatorConfigWindow expands UWindowPageWindow;
var font CFont;
var bool bMouseDownT,bMoveT,bCloseProcedure;
var PlayerPawn Owner;
var float HD,WD;
var MySmallButton Send;
var MyExitSmallButton Close;
var MyEditControl ChatLab;
var class<UWindowWindow>	ClientClass;
var UWindowWindow			ClientArea;
var localized string		WindowTitle;
var string					StatusBarText;
var float					MoveX, MoveY;	// co-ordinates where the move was requested
var color Colors;


function Created()
{
CMonsterHUD(GetPlayerOwner().MyHUD).MainWindow=Self;
//WinHeight=576;
Colors.R=0;

	Colors.G=255;
	Colors.B=0;
	SetSize(576, 530);
	WinWidth-=20;
	HD=WinHeight;
	WD=WinWidth;
	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop = (Root.WinHeight - WinHeight) / 2;
    //clientArea = createWindow(class'MyMutatorConfigClient', 10, 10, 500, 500);
	bLeaveOnScreen = true;
	ClientArea = CreateWindow(ClientClass, 6, 16, 544, 528, OwnerWindow);
	ChatLab = MyEditControl(CreateControl(Class'MyEditControl', 20, 550 , 276, 32 ));
	ChatLab.SetTextColor(Colors);
	ChatLab.WinHeight=32;
	ChatLab.EditBoxWidth=246;
	ChatLab.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.ChatLab);
	ChatLab.SetNumericOnly( False ) ;
	ChatLab.SetHistory( True ) ;
	ChatLab.SetMaxLength( 512 ) ;
	ChatLab.Main=Self;
	//ChatLab.SetFont(F_Normal);
	//Send button
	Send = MySmallButton(CreateControl(Class'MySmallButton', 300 , 544 , 128, 1 ));
	Send.WinHeight=32;
	Send.WinWidth=128;
	Send.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.Send);
	//Send.DownSound = Sound'Click' ;
	Send.bDisabled=true;
	Send.Main=Self;

	//Close button
	Close = MyExitSmallButton(CreateControl(Class'MyExitSmallButton', 428 , 544 , 128, 1 ));
	Close.SetText(CMonsterHUD(GetPlayerOwner().MyHUD).LangObj.default.Close);
	//Close.DownSound = Sound'Click' ;
	Close.WinHeight=32;
    Close.WinWidth=128;
	Close.Main=Self;
	ChangeLan();
}

function NotifyBeforeLevelChange()
{
Super.NotifyBeforeLevelChange();
//Super.Close();
HideWindow();
Root.Console.bQuickKeyEnable=False;
}

function ChangeLan()
{
	if(Close!=none && Send !=none && ChatLab!=none){
		Close.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.Close);
		Send.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.Send);
		ChatLab.SetText(CMonsterHUD(GetPlayerOWner().MyHUD).LangObj.default.ChatLab);
	}
}

function BeforePaint(Canvas C, float X, float Y)
{		
//if(!bCloseProcedure)
//WinHeight=576;
}

function FrameHitTest FW_HitTest( float X, float Y)
{
	if((X >= 3) && (X <= WinWidth-3) && (Y >= 0) && (Y <= 30))
		return HT_TitleBar;

	return HT_None;	
}

function WindowEvent(WinMessage Msg, Canvas C, float X, float Y, int Key) 
{
if(CMonsterHUD(GetPlayerOWner().MyHUD).Modal != none && CMonsterHUD(GetPlayerOWner().MyHUD).Modal.bWindowVisible && MSG != WM_Paint)return;
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
	if(msg == WM_KeyDown)
			MyMainPage(CMonsterHUD(GetPlayerOWner().MyHUD).Tabs[0]).KeyDown(Key, X, Y);


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

	switch(E)
	{	
		case DE_EnterPressed:
		   if(C == ChatLab){
			    GetPlayerOwner().ConsoleCommand("Say "$ChatLab.GetValue());
				ChatLab.SetValue("");}//Clean it}
		break;
		case DE_Click:
			if(C == Send && !Send.bDisabled){
			    GetPlayerOwner().ConsoleCommand("Say "$ChatLab.GetValue());
				ChatLab.SetValue("");}
			if(C == Close)
			    initclose();
		break;
	}
}

function Paint(Canvas C, float X, float Y)
{
local color HUDColor, BaseColor;

if(bCloseProcedure){
if(WinHeight > 4)
	    WinHeight-=15.0;
if(WinWIdth > 4)
	    WinWIdth-=15.0;

	else{
	bCloseProcedure=false;
	Root.Close();
	}
	}
//Super(UWindowWindow).Paint(C,X,Y);
//Dynamically set the WindowTitle

CFont=C.Font;
Owner=GetPlayerOwner();
//WindowTitle="MH2 Client Settings                        "@DrawTwoDigit(owner.Level.year)$"-"$DrawTwoDigit(Owner.level.Month)$"-"$DrawTwoDigit(Owner.Level.Day)@GetDayOfWeek()@"     "@DrawTwoDigit(Owner.Level.Hour)$":"$DrawTwoDigit(Owner.Level.Minute)$":"$DrawTwoDigit(Owner.Level.Second);

	C.Style =Owner.ERenderStyle.STY_Translucent;
	
		
	c.drawcolor.R=250;
	c.drawcolor.G=250;
	c.drawcolor.B=250;
//	c.font=cfont;
   // C.drawColor=CMonsterHUD(Owner.MyHUD).calccolor();
   //Top
	drawStretchedTexture(c, 0, 1, 556, 32, Texture'EditBoxT');
   // clipText(c, 5, 5, WindowTitle);
   
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
        DrawStretchedTexture(C, 0, 544, 556, 32, Texture'EditBoxT');


        drawStretchedTexture(c, 40, 544, 256, 32, Texture'TextBox');

		}
function initclose()
{
bCloseProcedure=True; 
}


function Resized()
{
//Null this shit.
}

function AfterPaint(Canvas C, float X, float Y)
{
	Super.AfterPaint(C, X, Y);
		if(ChatLab.GetValue() == "")
Send.bDisabled=true;
else Send.bDisabled=false;
}

function string DrawTwoDigit(int i)
{
if ( i > 9 ) return string(i);
return "0"$string(i);
}

function string GetDayOfWeek()
{
switch(Owner.Level.DayOfWeek)
{
    case 1:
    return "Monday";
    case 2:
	return "Tuesday";
	case 3:
	return "Wednesday";//Actual day of which I write this piece of code.
	case 4:
	return "Thursday";
	case 5:
	return "Friday";
	case 6:
	return "Saturday";
	case 7:
	return "Sunday";
}}

//
function UWindowDialogControl CreateControl(class<UWindowDialogControl> ControlClass, float X, float Y, float W, float H, optional UWindowWindow OwnerWindow)
{
	local UWindowDialogControl C;

	C = UWindowDialogControl(CreateWindow(ControlClass, X, Y, W, H, OwnerWindow));
	//C.Register(Self);
	C.Notify(C.DE_Created);

	return C;
}

defaultproperties
{
     ClientClass=Class'MH2_C_V18.MyMutatorConfigClient'
}
