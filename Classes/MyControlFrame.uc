class MyControlFrame expands UWindowWindow;
#exec obj load file=..\Textures\MetalMys.utx
var UWindowWindow Framed;
var bool bUseBlack;
function SetFrame(UWindowWindow W)
{
	Framed = W;
	W.SetParent(Self);
}

function BeforePaint(Canvas C, float X, float Y)
{
	if(Framed != None)
		ControlFrame_SetupSizes(Self, C);		
}

function ControlFrame_Draw( Canvas C)
{
	if(bUseBlack)
	{
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
		DrawStretchedTexture(C, 0, 0,WinWidth, WinHeight, Texture'BlackTexture');
	}
	else
	{
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
		DrawStretchedTexture(C, 0, 0,WinWidth, WinHeight, Texture'WhiteTexture');
	}
	DrawStretchedTexture(C, -10, -10,WinWidth+10, WinHeight+10, Texture'MysMetl2');
	
	DrawMiscBevel(C, 0, 0, WinWidth, WinHeight, LookAndFeel.Misc, LookAndFeel.EditBoxBevel);
}

function ControlFrame_SetupSizes(MyControlFrame W, Canvas C)
{
	local int B;

	B = 2;
		
	W.Framed.WinLeft = LookAndFeel.MiscBevelL[B].W;
	W.Framed.WinTop = LookAndFeel.MiscBevelT[B].H;
	W.Framed.SetSize(W.WinWidth - LookAndFeel.MiscBevelL[B].W - LookAndFeel.MiscBevelR[B].W, W.WinHeight - LookAndFeel.MiscBevelT[B].H - LookAndFeel.MiscBevelB[B].H);
}
/*
final function DrawUpBevel( Canvas C, float X, float Y, float W, float H, Texture T)
{
	local Region R;

	R = LookAndFeel.BevelUpTL;
	DrawStretchedTextureSegment( C, X, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpT;
	DrawStretchedTextureSegment( C, X+LookAndFeel.BevelUpTL.W, Y, 
									W - LookAndFeel.BevelUpTL.W
									- LookAndFeel.BevelUpTR.W,
									R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpTR;
	DrawStretchedTextureSegment( C, X + W - R.W, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );
	
	R = LookAndFeel.BevelUpL;
	DrawStretchedTextureSegment( C, X, Y + LookAndFeel.BevelUpTL.H,
									R.W,  
									H - LookAndFeel.BevelUpTL.H
									- LookAndFeel.BevelUpBL.H,
									R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpR;
	DrawStretchedTextureSegment( C, X + W - R.W, Y + LookAndFeel.BevelUpTL.H,
									R.W,  
									H - LookAndFeel.BevelUpTL.H
									- LookAndFeel.BevelUpBL.H,
									R.X, R.Y, R.W, R.H, T );

	
	R = LookAndFeel.BevelUpBL;
	DrawStretchedTextureSegment( C, X, Y + H - R.H, R.W, R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpB;
	DrawStretchedTextureSegment( C, X + LookAndFeel.BevelUpBL.W, Y + H - R.H, 
									W - LookAndFeel.BevelUpBL.W
									- LookAndFeel.BevelUpBR.W,
									R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpBR;
	DrawStretchedTextureSegment( C, X + W - R.W, Y + H - R.H, R.W, R.H, R.X, R.Y, 
									R.W, R.H, T );

	R = LookAndFeel.BevelUpArea;
	DrawStretchedTextureSegment( C, X + LookAndFeel.BevelUpTL.W,
	                                Y + LookAndFeel.BevelUpTL.H,
									W - LookAndFeel.BevelUpBL.W
									- LookAndFeel.BevelUpBR.W,
									H - LookAndFeel.BevelUpTL.H
									- LookAndFeel.BevelUpBL.H,
									R.X, R.Y, R.W, R.H, T );

}
*/
function Paint(Canvas C, float X, float Y)
{
	ControlFrame_Draw(C);
}

defaultproperties
{
}
