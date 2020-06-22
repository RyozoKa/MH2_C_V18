//=============================================================================
// MyCheckbox - a checkbox
//=============================================================================
class MyCheckbox extends UWindowCheckBox;
#exec texture import file=Textures/CheckBackground.pcx name=CheckBackground

function Paint(Canvas C, float X, float Y)
{
C.Style=GetPlayerOwner().ERenderStyle.STY_Modulated;
C.DrawColor.R=255;
C.DrawColor.G=255;
C.DrawColor.B=255;
    DrawStretchedTextureSegment( C, 0, 0, WinWidth +2, 32, 0, 0, 16, 16, Texture'Shade' );
C.Style=GetPlayerOwner().ERenderStyle.STY_Normal;	
 TextX=5;
    ImageY=1;
	Super(UWindowButton).Paint(C, X, Y);
}

defaultproperties
{
}
