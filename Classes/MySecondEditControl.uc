class MySecondEditControl extends UWindowEditControl;

var	float			EditBoxWidth;
var float			EditAreaDrawX, EditAreaDrawY;
var MySecondEditBox	EditBox;
var MyMutatorConfigWindow Main;
var bool bUseBorder;

function Created()
{
	local Color C;

	Super(UWindowDialogControl).Created();
	
	EditBox = MySecondEditBox(CreateWindow(class'MySecondEditBox', 0, 0, WinWidth, WinHeight)); 
	EditBox.NotifyOwner = Self;
	EditBox.bSelectOnFocus = True;

	EditBoxWidth = WinWidth / 2;

	SetEditTextColor(LookAndFeel.EditBoxTextColor);
}


function Paint(Canvas C, float X, float Y)
{

	C.Style=GetPlayerOwner().ERenderStyle.STY_Modulated;
C.DrawColor.R=255;
C.DrawColor.G=255;
C.DrawColor.B=255;
DrawStretchedTextureSegment( C, 0, 0, WinWidth +2, 32, 0, 0, 16, 16, Texture'Shade' );
C.Style=GetPlayerOwner().ERenderStyle.STY_Normal;
Editbox_Draw(C);
	//Super.Paint(C, X, Y);
}

function Notify(byte E)
{
	if(NotifyWindow != None)
	{
		NotifyWindow.Notify(Self, E);
	}
	if(main!=none)
	Main.Notify(self,E);
}

function SetNumericOnly(bool bNumericOnly)
{
	EditBox.bNumericOnly = bNumericOnly;
}

function SetNumericFloat(bool bNumericFloat)
{
	EditBox.bNumericFloat = bNumericFloat;
}

function SetFont(int NewFont)
{
	Super.SetFont(NewFont);
	EditBox.SetFont(NewFont);
}

function SetHistory(bool bInHistory)
{
	EditBox.SetHistory(bInHistory);
}

function SetEditTextColor(Color NewColor)
{
	EditBox.SetTextColor(NewColor);
}

function Clear()
{
	EditBox.Clear();
}

function string GetValue()
{
	return EditBox.GetValue();
}

function SetValue(string NewValue)
{
	EditBox.SetValue(NewValue);	
}

function SetMaxLength(int MaxLength)
{
	EditBox.MaxLength = MaxLength;
}


function BeforePaint(Canvas C, float X, float Y)
{
	Super(UWindowDialogControl).BeforePaint(C, X, Y);
	Editbox_SetupSizes(C);
}

function Editbox_Draw(Canvas C)
{
	DrawMiscBevel(C, EditAreaDrawX, 0, EditBoxWidth, WinHeight, LookAndFeel.Misc, LookAndFeel.EditBoxBevel);
	TextX=5;
	
	if(Text != "")
	{
		C.DrawColor = TextColor;
		ClipText(C, TextX, TextY, Text);
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
}

function Editbox_SetupSizes( Canvas C)
{
	local float TW, TH;
	local int B;

	B = LookAndFeel.EditBoxBevel;
		
	C.Font = Root.Fonts[Font];
	TextSize(C, Text, TW, TH);
	
	WinHeight = 12 + LookAndFeel.MiscBevelT[B].H + LookAndFeel.MiscBevelB[B].H;
	
	switch(Align)
	{
	case TA_Left:
		EditAreaDrawX = WinWidth - EditBoxWidth;
		TextX = 0;
		break;
	case TA_Right:
		EditAreaDrawX = 0;	
		TextX = WinWidth - TW;
		break;
	case TA_Center:
		EditAreaDrawX = (WinWidth - EditBoxWidth) / 2;
		TextX = (WinWidth - TW) / 2;
		break;
	}

	EditAreaDrawY = (WinHeight - 2) / 2;
	TextY = (WinHeight - TH) / 2;

	EditBox.WinLeft = EditAreaDrawX + LookAndFeel.MiscBevelL[B].W;
	EditBox.WinTop = LookAndFeel.MiscBevelT[B].H;
	EditBox.WinWidth = EditBoxWidth - LookAndFeel.MiscBevelL[B].W - LookAndFeel.MiscBevelR[B].W;
	EditBox.WinHeight = WinHeight - LookAndFeel.MiscBevelT[B].H - LookAndFeel.MiscBevelB[B].H;
}

function SetDelayedNotify(bool bDelayedNotify)
{
	Editbox.bDelayedNotify = bDelayedNotify;
}

defaultproperties
{
}
