class Monster2Settings expands UTSettingsCWindow
	config(MH2_C_V18);

#exec TEXTURE IMPORT NAME=MHSettingsBG FILE=Textures\MHSettingsBG.PCX GROUP=Rules LODSET=0

function Created()
{
	Super.Created();
	if (TranslocCheck != None)
	TranslocCheck.HideWindow();	
}

function Paint(Canvas C, float X, float Y)
{
	Super.Paint(C, X, Y);
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'MHSettingsBG');
}

defaultproperties
{
}
