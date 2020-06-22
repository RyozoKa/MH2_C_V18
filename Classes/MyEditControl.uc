class MyEditControl extends UWindowDialogControl;

var	float			EditBoxWidth;
var float			EditAreaDrawX, EditAreaDrawY;
var MyEditBox	EditBox;
var MyMutatorConfigWindow Main;

function Created()
{
	local Color C;

	Super.Created();
	
	EditBox = MyEditBox(CreateWindow(class'MyEditBox', 0, 0, WinWidth, 24)); 
	EditBox.NotifyOwner = Self;
	EditBox.bSelectOnFocus = True;
	
	WinHeight=24;

	EditBoxWidth = WinWidth / 2;

	SetEditTextColor(LookAndFeel.EditBoxTextColor);
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

function Paint(Canvas C, float X, float Y)
{
//	Editbox_Draw(C);
	
	//Super.Paint(C, X, Y);
}

function Editbox_Draw(Canvas C)
{
	DrawMiscBevel(C, EditAreaDrawX, 0, EditBoxWidth, WinHeight, LookAndFeel.Misc, LookAndFeel.EditBoxBevel);

	
	
	if(Text != "")
	{
		C.DrawColor = TextColor;
		ClipText(C, TextX, TextY, Text);
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
}

function BeforePaint(Canvas C, float X, float Y)
{
	Super.BeforePaint(C, X, Y);
	Editbox_SetupSizes(Self, C);
}


function Editbox_SetupSizes(MyEditControl W, Canvas C)
{
	local float TW, TH;
	local int B;

	B = LookAndFeel.EditBoxBevel;
		
	C.Font = W.Root.Fonts[W.Font];
	W.TextSize(C, Text, TW, TH);
	
	W.WinHeight = 24 + LookAndFeel.MiscBevelT[B].H + LookAndFeel.MiscBevelB[B].H;
	
	switch(W.Align)
	{
	case TA_Left:
		W.EditAreaDrawX = W.WinWidth - W.EditBoxWidth;
		W.TextX = 0;
		break;
	case TA_Right:
		W.EditAreaDrawX = 0;	
		W.TextX = W.WinWidth - TW;
		break;
	case TA_Center:
		W.EditAreaDrawX = (W.WinWidth - W.EditBoxWidth) / 2;
		W.TextX = (W.WinWidth - TW) / 2;
		break;
	}

	W.EditAreaDrawY = (W.WinHeight - 2) / 2;
	W.TextY = (W.WinHeight - TH) / 2;

	W.EditBox.WinLeft = W.EditAreaDrawX + LookAndFeel.MiscBevelL[B].W;
	W.EditBox.WinTop = LookAndFeel.MiscBevelT[B].H;
	W.EditBox.WinWidth = W.EditBoxWidth - LookAndFeel.MiscBevelL[B].W - LookAndFeel.MiscBevelR[B].W;
	W.EditBox.WinHeight = W.WinHeight - LookAndFeel.MiscBevelT[B].H - LookAndFeel.MiscBevelB[B].H;
}

function SetDelayedNotify(bool bDelayedNotify)
{
	Editbox.bDelayedNotify = bDelayedNotify;
}

defaultproperties
{
}
