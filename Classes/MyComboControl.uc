class MyComboControl extends UWindowComboControl;


function Paint(Canvas C, float X, float Y)
{
	C.Style=GetPlayerOwner().ERenderStyle.STY_Modulated;
C.DrawColor.R=255;
C.DrawColor.G=255;
C.DrawColor.B=255;
    DrawStretchedTextureSegment( C, 0, 0, WinWidth +2, 32, 0, 0, 16, 16, Texture'Shade' );
C.Style=GetPlayerOwner().ERenderStyle.STY_Normal;	
    TextX=5;
	Super.Paint(C, X, Y);
	
}

function DropDown()
{
	if(!Button.bDisabled)
	    Super.DropDown();
}

defaultproperties
{
}
