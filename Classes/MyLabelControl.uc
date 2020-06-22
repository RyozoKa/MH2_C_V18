class MyLabelControl extends UWindowDialogControl;

function Created()
{
	TextX = 0;
	TextY = 0;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local float W, H;
	
	// Implemented in a child class
	
	

	Super(UWindowWindow).BeforePaint(C, X, Y);
	
	//Root.Fonts[Font];
	
	TextSize(C, Text, W, H);
	WinHeight = H+1;
	//WinWidth = W+1;
	TextY = (WinHeight - H) / 2;
	/*switch (Align)
	{
		case TA_Left:
			break;
		case TA_Center:
			TextX = (WinWidth - W)/2;
			break;
		case TA_Right:
			TextX = WinWidth - W;
			break;
	}*/
	TextX = (WinWidth - W)/2;
}


function Paint(Canvas C, float X, float Y)
{
C.Style=GetPlayerOwner().ERenderStyle.STY_Modulated;
C.DrawColor.R=255;
C.DrawColor.G=255;
C.DrawColor.B=255;
    DrawStretchedTextureSegment( C, 0, 0, WinWidth +2, 32, 0, 0, 16, 16, Texture'Shade' );
C.Style=GetPlayerOwner().ERenderStyle.STY_Normal;

	if(Text != "")
	{
		C.DrawColor = TextColor;
		C.Font = Root.Fonts[Font];
		ClipText(C, TextX, TextY, Text);
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
}

defaultproperties
{
}
