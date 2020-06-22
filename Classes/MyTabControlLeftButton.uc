class MyTabControlLeftButton extends UWindowButton;

function BeforePaint(Canvas C, float X, float Y)
{
C.Style=GetPlayerOwner().ERenderStyle.STY_Translucent;
	Tab_SetupLeftButton();
}

function Paint(Canvas C, float X, float Y)
{
C.Style=GetPlayerOwner().ERenderStyle.STY_Translucent;
Super.Paint(C,X,Y);
}
function LMouseDown(float X, float Y)
{
	Super.LMouseDown(X, Y);
	if(!bDisabled)
		MyPageControl(ParentWindow).NewTabArea.TabOffset--;
}

function Tab_SetupLeftButton()
{
	local Texture T;


	WinWidth = 16;
	WinHeight = 32;
	WinTop = 0;
	WinLeft = 0;

	bUseRegion = false;

	UpTexture = texture'leftn';
	DownTexture = texture'leftd';
	OverTexture = texture'lefto';
	DisabledTexture = texture'leftn';
}

defaultproperties
{
     bNoKeyboard=True
}
