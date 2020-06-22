// UWindowEditBox - simple edit box, for use in other controls such as 
// UWindowComboxBoxControl, UWindowEditBoxControl etc.

class MyBigEditBox extends UWindowDialogControl;

var string		Value;
var string		Value2;
var string		Password;
var int			CaretOffset;
var int			CaretX,CaretY;
var int			MaxLength;
var float		LastDrawTime;
var bool		bShowCaret;
var float		Offset;
var UWindowDialogControl	NotifyOwner;
var bool		bNumericOnly;
var bool		bNumericFloat;
var bool		bCanEdit;
var bool		bAllSelected;
var bool		bSelectOnFocus;
var bool		bDelayedNotify;
var bool		bChangePending;
var bool		bControlDown;
var bool		bShiftDown;
var bool		bHistory;
var bool 		bPassword;
var string test;
var bool		bKeyDown;
var UWindowEditBoxHistory	HistoryList;
var UWindowEditBoxHistory	CurrentHistory;
var TextObj Rows[32]; //Size can be configured here
var int NumRows;

function Created()
{
	Super.Created();
	bCanEdit = True;
	bControlDown = False;
	bShiftDown = False;
	//WinHeight=12;

	MaxLength = 255;
	CaretOffset = 0;
	Offset = 0;
	LastDrawTime = GetLevel().TimeSeconds;
}

function SetHistory(bool bInHistory)
{
	bHistory = bInHistory;

	if(bHistory && HistoryList==None)
	{
		HistoryList = new(None) class'UWindowEditBoxHistory';
		HistoryList.SetupSentinel();
		CurrentHistory = None;
	}
	else
	if(!bHistory && HistoryList!=None)
	{
		HistoryList = None;
		CurrentHistory = None;
	}
}

function SetEditable(bool bEditable)
{
	bCanEdit = bEditable;
}

function SetValue(string NewValue, optional string NewValue2)
{
	local int i;
	Value = NewValue;
	Value2 = NewValue2;
	
	for(i=0x0;i<=Len(NewValue);i++)
	{
		Password=Password$"*";
	}

	if(CaretOffset > Len(Value))
		CaretOffset = Len(Value);		
	Notify(DE_Change);
}

function Clear()
{
	CaretOffset = 0;
	Value="";
	Password="";
	Value2="";
	bAllSelected = False;
	if(bDelayedNotify)
		bChangePending = True;
	else
		Notify(DE_Change);
}

function SelectAll()
{
return; //Not implemented
}

function string GetValue()
{
	local String NewValue;
	local int i;
	for(i=0;i<NumRows;i++)
		NewValue = NewValue $"\\n"$ Rows[i].Text;
	return NewValue;
}

function string GetValue2()
{
	return Value2;
}

function Notify(byte E)
{
	if(NotifyOwner != None)
	{
		NotifyOwner.Notify(E);
	} else {
		Super.Notify(E);
	}
}

function InsertText(string Text)
{
	local int i;
	
NotifyWindow.Notify(self,DE_Change);
	for(i=0;i<Len(Text);i++)
		Insert(Asc(Mid(Text,i,1)));
}

// Inserts a character at the current caret position
function bool Insert(byte C)
{
	local string	NewValue,GetVal;
	local TextObj tmp;
	local int i,j;
	if(Rows[0] == none){//First occurence
		Rows[0] = new Class'TextObj';
		NumRows=1;}
	assert(Rows[CaretY] != none);
	GetVal = Rows[CaretY].Text;
	if(C != 92)
	{
		NewValue = Left(GetVal, CaretX) $ Chr(C) $ Mid(GetVal, CaretX);
		if(Len(NewValue) > 25)//Enter a new line 
		{
			NewValue = Left(Left(GetVal, CaretX) $ Chr(C) $ Mid(GetVal,CaretX),25);
			Rows[NumRows] = new class'TextObj';
			Rows[CaretY].Text = NewValue;
			Rows[CaretY].Len  = Len(Rows[NumRows].Text);
			Rows[NumRows].Index = ++CaretY;
			Rows[NumRows].Text = Mid(Left(GetVal, CaretX) $ Chr(C) $ Mid(GetVal,CaretX),25);//Should just be a single character.
			Rows[NumRows].Len = Len(Rows[NumRows].Text);
			NumRows++;
			CaretX=0;
		}
		else {//Good case
			Rows[CaretY].Text = NewValue;	
			Rows[CaretY].Len = Len(NewValue);
	//	CaretOffset++;
		CaretX++;}
	}
	else
	{
		Rows[NumRows] = new class'TextObj';
		Rows[NumRows].Index = ++CaretY;
		NumRows++;
		CaretX=0;
	}
	//Simple sort the array
	if(NumRows>1)
	for(i=0;i<NumRows;i++)
	{
		for(j=i+1;j<NumRows;j++)
		{
			if(Rows[j].Index < Rows[i].Index)
			{
			//Swap
				tmp=Rows[j];
				Rows[j]=Rows[i];
				Rows[i]=tmp;
			}
		}
	}
	if(bDelayedNotify)
		bChangePending = True;
	else
		Notify(DE_Change);
	return True;
}

function bool Backspace()
{
	local string	NewValue;

	if(CaretX==0 && NumRows<2) return false;
	NewValue = Left(Rows[CaretY].Text, CaretX - 1) $ Mid(Rows[CaretY].Text, CaretX);
	if(CaretX == 0)
	{
		CaretY--;
		CaretX=Rows[CaretY].Len;
	}
	else{
	CaretOffset--;
	CaretX--;}

	Rows[CaretY].Text = NewValue;
	
	if(bDelayedNotify)
		bChangePending = True;
	else
		Notify(DE_Change);
	return True;
}

function bool Delete()
{
	local string	NewValue;

	if(CaretX == Rows[CaretY].Len) return False;

	NewValue = Left(Rows[CaretY].Text, CaretX) $ Mid(Rows[CaretY].Text, CaretX + 1);

	Rows[CaretY].Text = NewValue;
	Notify(DE_Change);
	return True;
}

function bool WordLeft()
{
	while(CaretOffset > 0 && Mid(Value, CaretOffset - 1, 1) == " ")
	{
		CaretOffset--;
		CaretX--;
	}
	while(CaretOffset > 0 && Mid(Value, CaretOffset - 1, 1) != " ")
	{
		CaretOffset--;
		CaretX--;
	}

	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function bool MoveLeft()
{
	if(CaretX == 0 && NumRows<2) return False;
	if(CaretX == 0){
		CaretY--;
		CaretX=Rows[CaretY].Len;}
	else
		CaretX--;

	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function bool MoveRight()
{
	if(CaretX == Rows[CaretY].Len && CaretY>=NumRows-1) return False;
	if(CaretX == Rows[CaretY].Len){
		CaretY++;
		CaretX=0;}
	else
		CaretX++;

	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function bool MoveUp()
{
	if(CaretY <= 0) return False;
	--CaretY;
	if(CaretX>Rows[CaretY].Len)
		CaretX=Rows[CaretY].Len;
	Log("Y: "$CaretY@"X:"$CaretX);
	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}
function bool MoveDown()
{
	if(CaretY >= NumRows-1) return False;
	++CaretY;
	if(CaretX>Rows[CaretY].Len)
		CaretX=Rows[CaretY].Len;
	Log("Y: "$CaretY@"X:"$CaretX);
	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function bool WordRight()
{
	while(CaretOffset < Len(Value) && Mid(Value, CaretOffset, 1) != " ")
	{
		CaretOffset++;
		CaretX++;
	}
	while(CaretOffset < Len(Value) && Mid(Value, CaretOffset, 1) == " ")
	{
		CaretOffset++;
		CaretX++;
	}
	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function bool MoveHome()
{
	CaretOffset = 0;
	CaretX=0;
	CaretY=0;

	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function bool MoveEnd()
{
	CaretX = Rows[NumRows-1].Len;
	CaretOffset = CaretX;
	CaretY = NumRows-1;

	LastDrawTime = GetLevel().TimeSeconds;
	bShowCaret = True;

	return True;	
}

function EditCopy()
{
	if(bAllSelected || !bCanEdit)
		GetPlayerOwner().CopyToClipboard(Value);

}

function EditPaste()
{
	if(bCanEdit)
	{
		if(bAllSelected)
			Clear();
		InsertText(GetPlayerOwner().PasteFromClipboard());
	}
}

function EditCut()
{
	if(bCanEdit)
	{
		if(bAllSelected)
		{
			GetPlayerOwner().CopyToClipboard(Value);
			bAllSelected = False;
			Clear();
		}
	}
	else
		EditCopy();
}

function KeyType( int Key, float MouseX, float MouseY )
{

	if(bCanEdit && bKeyDown)
	{
		if( !bControlDown )
		{
			if(bAllSelected)
				Clear();

			bAllSelected = False;

			if(bNumericOnly)
			{
				if( Key>=0x30 && Key<=0x39 )  
				{
					Insert(Key);
				}
			}
			else
			{
				if(CorrectKey(Key))//Nicer solution for other characters in the EditBox.
					Insert(Key);
			}			
		}
	}
}

function bool CorrectKey(byte Key)
{
local PlayerPawn P;
P=GetPlayerOwner();
return ( Key != P.EInputKey.IK_PageDown && Key != P.EInputKey.IK_PageDown && Key != P.EInputKey.IK_Backspace);
}

function KeyUp(int Key, float X, float Y)
{
	local PlayerPawn P;
	bKeyDown = False;
	P = GetPlayerOwner();
	switch (Key)
	{
	case P.EInputKey.IK_Ctrl:
		bControlDown = False;
		break;
	case P.EInputKey.IK_Shift:
		bShiftDown = False;
		break;
	}
}

function KeyDown(int Key, float X, float Y)
{
	local PlayerPawn P;

	bKeyDown = True;
	P = GetPlayerOwner();

	switch (Key)
	{
	case P.EInputKey.IK_Ctrl:
		bControlDown = True;
		break;
	case P.EInputKey.IK_Shift:
		bShiftDown = True;
		break;
	case P.EInputKey.IK_Escape:
		break;
	case P.EInputKey.IK_Enter:
		if(bCanEdit)
		{
			InsertText("\\");
			Notify(DE_EnterPressed);
		}
		break;
	case P.EInputKey.IK_MouseWheelUp:
		if(bCanEdit)
			Notify(DE_WheelUpPressed);
		break;
	case P.EInputKey.IK_MouseWheelDown:
		if(bCanEdit)
			Notify(DE_WheelDownPressed);
		break;

	case P.EInputKey.IK_Right:
		if(bCanEdit) 
		{
			if(bControlDown)
				WordRight();
			else
				MoveRight();
		}
		bAllSelected = False;
		break;
	case P.EInputKey.IK_Left:
		if(bCanEdit)
		{
			if(bControlDown)
				WordLeft();
			else
				MoveLeft();
		}
		bAllSelected = False;
		break;
	case P.EInputKey.IK_Up:
		if(bCanEdit)
		{
			MoveUp();
		}
		break;
	case P.EInputKey.IK_Down:
		if(bCanEdit)
		{
			MoveDown();
		}
		break;
	case P.EInputKey.IK_Home:
		if(bCanEdit)
			MoveHome();
		bAllSelected = False;
		break;
	case P.EInputKey.IK_End:
		if(bCanEdit)
			MoveEnd();
		bAllSelected = False;
		break;
	case P.EInputKey.IK_Backspace:
		if(bCanEdit)
		{
			if(bAllSelected)
				Clear();
			else
				Backspace();
		}
		bAllSelected = False;
		break;
	case P.EInputKey.IK_Delete:
		if(bCanEdit)
		{
			if(bAllSelected)
				Clear();
			else
				Delete();
		}
		bAllSelected = False;
		break;
	case P.EInputKey.IK_Period:
	case P.EInputKey.IK_NumPadPeriod:
		if (bNumericFloat)
			Insert(Asc("."));
		break;
	default:
		if( bControlDown )
		{
			if( Key == Asc("c") || Key == Asc("C"))
				EditCopy();

			if( Key == Asc("v") || Key == Asc("V"))
				EditPaste();

			if( Key == Asc("x") || Key == Asc("X"))
				EditCut();
		}
		else
		{
			if(NotifyOwner != None)
				NotifyOwner.KeyDown(Key, X, Y);
			else
				Super.KeyDown(Key, X, Y);
		}
		break;
	}
}

function Click(float X, float Y)
{
	Notify(DE_Click);
}

function LMouseDown(float X, float Y)
{
	Super.LMouseDown(X, Y);
	Notify(DE_LMouseDown);
}

function Paint(Canvas C, float X, float Y)
{
	local float W, H;
	local float TextY;
	local int rowlen[32];
	local int row,i;
	local string value3;

	C.Font = Root.Fonts[Font];

	TextSize(C, "A", W, H);
	TextSize(C, Left(Rows[CaretY].Text,CaretX),W,H);
	TextY = 2;//(WinHeight - H) / 2;
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;

	if(W + Offset < 0)
		Offset = -W;

	if(W + Offset > (WinWidth - 2))
	{
		Offset = (WinWidth - 2) - W;
		if(Offset > 0) Offset = 0;
	}

	C.DrawColor = TextColor;

	if(bAllSelected)
	{
		//DrawStretchedTexture(C,  1, TextY, W, WinHeight, Texture'UWindow.WhiteTexture');

		// Invert Colors
		C.DrawColor.R = 255 ^ C.DrawColor.R;
		C.DrawColor.G = 255 ^ C.DrawColor.G;
		C.DrawColor.B = 255 ^ C.DrawColor.B;
	}
	//Divide the string into rows
	//Value3 = Value$"\\n";
	//while(InStr(Value3,"\\n") != -1)
	//{
		for(i=0;i<NumRows;i++)
			ClipText(C, 3, TextY +(H * i),Rows[i].Text);
	//	Value3 = Mid(Value3,InStr(Value3,"\\n")+2);
	//}
	
		

	if((!bHasKeyboardFocus) || (!bCanEdit))
		bShowCaret = False;
	else
	{
		if((GetLevel().TimeSeconds > LastDrawTime + 0.3) || (GetLevel().TimeSeconds < LastDrawTime))
		{
			LastDrawTime = GetLevel().TimeSeconds;
			bShowCaret = !bShowCaret;
		}
	}

	if(bShowCaret)
		ClipText(C, (W) - 1, TextY + (CaretY*H), "|");
}

function Close(optional bool bByParent)
{
	if(bChangePending)
	{
		bChangePending = False;
		Notify(DE_Change);
	}
	bKeyDown = False;
	Super.Close(bByParent);
}

function FocusOtherWindow(UWindowWindow W)
{
	if(bChangePending)
	{
		bChangePending = False;
		Notify(DE_Change);
	}

	if(NotifyOwner != None)
		NotifyOwner.FocusOtherWindow(W);
	else
		Super.FocusOtherWindow(W);
}

function KeyFocusEnter()
{
	if(bSelectOnFocus && !bHasKeyboardFocus)
		SelectAll();

	Super.KeyFocusEnter();
}

function DoubleClick(float X, float Y)
{
	Super.DoubleClick(X, Y);
	SelectAll();
}

function KeyFocusExit()
{
	bAllSelected = False;
	Super.KeyFocusExit();
}
	

defaultproperties
{
}
