class MyTabControlRightButton extends UWindowButton;
#exec texture import file=Textures/Leftn.pcx name=Leftn FLAG=2
#exec texture import file=Textures/Rightn.pcx name=Rightn FLAG=2

#exec texture import file=Textures/Lefto.pcx name=Lefto FLAG=2
#exec texture import file=Textures/Righto.pcx name=Righto FLAG=2

#exec texture import file=Textures/Leftd.pcx name=Leftd FLAG=2
#exec texture import file=Textures/Rightd.pcx name=Rightd FLAG=2
function BeforePaint(Canvas C, float X, float Y)
{
C.Style=GetPlayerOwner().ERenderStyle.STY_Translucent;
	Tab_SetupRightButton();
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
		MyPageControl(ParentWindow).NewTabArea.TabOffset++;
}

function Tab_SetupRightButton()
{
	local Texture T;


	WinWidth = 16;
	WinHeight = 32;
	WinTop = 0;
	WinLeft = 528;//Right or tight?

	bUseRegion = false;

	UpTexture = texture'rightn';
	DownTexture = texture'rightd';
	OverTexture = texture'righto';
	DisabledTexture = texture'rightn';

}

defaultproperties
{
     bNoKeyboard=True
}
