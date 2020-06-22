class MyHSliderControl extends UWindowHSliderControl;


var	float	MinValue;
var	float	MaxValue;
var	float	Value;
var	int		Step;		// 0 = continuous

var	float	SliderWidth;
var	float	SliderDrawX, SliderDrawY;
var float	TrackStart;
var float	TrackWidth;
var bool	bSliding;
var bool	bNoSlidingNotify;

function Paint(Canvas C, float X, float Y)
{
C.Style=GetPlayerOwner().ERenderStyle.STY_Modulated;
C.DrawColor.R=255;
C.DrawColor.G=255;
C.DrawColor.B=255;
DrawStretchedTextureSegment( C, 0, 0, WinWidth +2, 32, 0, 0, 16, 16, Texture'Shade' );
C.Style=GetPlayerOwner().ERenderStyle.STY_Normal;

Super.Paint(C,X,Y);
}

defaultproperties
{
}
