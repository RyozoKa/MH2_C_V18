class MyAdminConsole expands MyTab;

var MySecondEditControl NetSpeed, Lives, FFS, SFS, At, Dt, TL, GS, Add, MMH, MHM, MS, HRPS, MHR, MH, ARPS, MAR, DH;
var color colors, white;
var MySmallButton Save, Adds, Reset, reboot;
var MonsterReplicationinfotwo GRI;
var MHReplicationInfo PRI;
var MyCheckBox Ua, Uc, Bop, RR;
var MyLabelControl ClientMessagesText, GameRles, States, SPRS, RegenL; 
var UWindowDynamicTextArea logwindow;
function Created()
{
Super.Created();
WinLeft = (Root.WinWidth - WinWidth) / 2;
WinTop = (Root.WinHeight - WinHeight) / 2;
Colors.R=0;
Colors.G=255;
Colors.B=0;
white.R=255;
white.G=255;
white.B=255;
GRI=MonsterReplicationinfotwo(GetPlayerOwner().GameReplicationInfo);
PRI=MHReplicationInfo(GetPlayerOwner().PlayerReplicationInfo);
PRI.Console=self;
LogWindow=addDynamicTextArea();

    NetSpeed = MySecondEditControl(CreateControl(Class'MySecondEditControl', 44 , 335 , 300, 1 ));
	NetSpeed.SetTextColor(Colors);
	NetSpeed.NotifyWindow=Self;
	NetSpeed.EditBoxWidth=200;
	NetSpeed.SetText(LangObj.default.SendConsole);
	NetSpeed.SetNumericOnly( false ) ;
	NetSpeed.SetHistory( False ) ;
	NetSpeed.SetMaxLength( 100 ) ;
	

reboot = MySmallButton(CreateControl(Class'MySmallButton', 354 , 335 , 64, 1 ));
reboot.WinHeight=16;
reboot.SetText(LangObj.default.Send);
reboot.bDisabled=False;

}

function Notify(UWindowDialogControl C, byte E)
{

	if(E==DE_EnterPressed)
	{
		if(C==netspeed && netspeed.GetValue() != "")
		{
			PRI.ServerRequest(netspeed.GetValue(),GetPlayerOwner());
		}
	}
	if(E==DE_Click)
	{
		if(C==reboot && NetSpeed.GetValue() != "")
		{
			PRI.ServerRequest(netspeed.GetValue(),GetPlayerOwner());
		}
	}
	SaveConfigs();
}

function AddResult(string Message)
{
local int numlines;
local string text1, text2, text3, text4, Sum, Other;
Sum=Message;
numlines++;
//So first we check weither the incoming message needs a new line or not.
text1=left(Message,HUD.GetNumChars(Sum))$"\\n";//We can set this emediately to make the function smaller.
if(HUD.GetNumChars(Sum) < len(Sum))
{
//If so we start to calculate how many lines we need to split it up in.
Other=mid(Sum,HUD.GetNumChars(Sum));//The number of characters in this string is the remaining ones after the first line is mesured.
//For now we know that the number of lines will be more than one.(So we assign Text2 too)
text2=left(Other,HUD.GetNumChars(Other))$"\\n";
numlines++;//2
    if(HUD.GetNumChars(Other) < len(Other))//Now we know that we need more than 2 lines, at this moment "Other" is our focusing "total string".
	{
	Other=mid(Other,HUD.GetNumChars(Other));
	text3=left(Other,HUD.GetNumChars(Other))$"\\n";
	numlines++;//3
	    if(HUD.GetNumChars(Other) < len(Other))//Now we know that we need more than 3 lines, at this moment "Other" is our focusing "total string".
     	{
	    Other=mid(Other,HUD.GetNumChars(Other));
	    text4=left(Other,HUD.GetNumChars(Other))$"\\n";
	    numlines++;//4
    	}
	}
}
if(numlines==1)
Sum=message;

if(numlines==2)
Sum=text1$text2;

if(numlines==3)
Sum=text1$text2$text3;

if(numlines==4)
Sum=text1$text2$text3$text4;

LogWindow.AddText(Sum);
}

function UWindowDynamicTextArea addDynamicTextArea() {
	local MyMapListFrameCW frame;
	local UWindowDynamicTextArea textArea;
	
	frame = MyMapListFrameCW(createwindow(class'MyMapListFrameCW', 44, 25, 450, 300));
	frame.bUseBlack=True;
	textArea = UWindowDynamicTextArea(CreateControl(class'MyDynamicTextArea', 44, 25, 450, 300));
	textArea.setTextColor(white);
    textArea.bTopCentric = false;
	frame.frame.setFrame(textArea);
	
	return textArea;
}

function Paint(Canvas C, float X, Float Y)
{
Super.Paint(C,X,Y);

C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
//Draw the nice background.
DrawStretchedTextureSegment( C, 0, 0, 544, winheight, 0, 0, 544, winheight, Texture'BackgroundTwo' );
}


function SaveConfigs()
{
Super.SaveConfigs();
if(HUD!=none)
HUD.SaveConfig();
}

defaultproperties
{
}
