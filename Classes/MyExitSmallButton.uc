class MyExitSmallButton extends UWindowButton;

#exec TEXTURE IMPORT File=Textures/ExitButton.pcx NAME=ExitingButton

var MyMutatorConfigWindow Main;
function Created()
{
	bNoKeyboard = True;

	Super.Created();

	ToolTipString = "";
	//SetText("");
	SetFont(F_Normal);

	//WinHeight = 32;
	ImageX = 0;
	ImageY = 0;
}

function AutoWidth(Canvas C)
{
	local float W, H;
	C.Font = Root.Fonts[Font];
	
	TextSize(C, RemoveAmpersand(Text), W, H);

	if(WinWidth < W + 10)
		WinWidth = W + 10;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local float W, H;
	
	/*if(bDisabled){
	UpTexture=Texture'unselected';
	DownTexture=Texture'unselected';
	DisabledTexture=Texture'unselected';
	OverTexture=Texture'unselected';
	}
	else{
	UpTexture=Texture'selected';
	DownTexture=Texture'selectedtwo';
	DisabledTexture=Texture'unselected';
	OverTexture=Texture'selectedtwo';
	}*/
	OverSound=none;
	
	C.Font = Root.Fonts[Font];
	
	TextSize(C, RemoveAmpersand(Text), W, H);

	TextX = (WinWidth-W)/2;
	TextY = (WinHeight-H)/2;

	if(bMouseDown && !bDisabled)
	{
		TextX += 1;
		TextY += 1;
	}
}
function Paint(Canvas C, float X, float Y)
{

    C.Font = Root.Fonts[Font];
	//LookAndFeel.Button_DrawSmallButton(Self, C);
	C.DrawColor=class'staticopers'.static.SetColor(255,255,255);
	C.style=GetPlayerOwner().ERenderStyle.STY_Normal;
	if(WinWidth==128 && WinHeight==32){
	if(bDisabled)
	    DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'NeutralMyButton' );
	else{
	    if   (bMouseDown)
			DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'MouseDownMyButton' );
		else if(MouseIsOver())
			DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'ExitingButton' );
		else
			DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'NeutralMyButton' );
	}}
	else if(WinWidth==64 && WinHeight==16){
	if(bDisabled)
	    DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'NeutralMyButton_16' );
	else{
	    if   (bMouseDown)
			DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'MouseDownMyButton_16' );
		else if(MouseIsOver())
			DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'MouseOverMyButton_16' );
		else
			DrawStretchedTexture( C, 0, 0, WinWidth, WinHeight, Texture'NeutralMyButton_16' );
	}}
	//Super.Paint(C, X, Y);
	if(!bDisabled)
	    C.DrawColor = class'staticopers'.static.SetColor(255,255,255);
	else
	    C.DrawColor = class'staticopers'.static.SetColor(10,10,10);
	ClipText(C, TextX, TextY, Text, True);
}

function LMouseDown(float X, float Y)
{
if(Main!= none) // only for main frame
			    Main.Notify(self,DE_Click);

Super.LmouseDown(X,Y);
}

defaultproperties
{
}
