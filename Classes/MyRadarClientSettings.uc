class MyRadarClientSettings expands MyTab;

/*
============================================================
The reason why I am saving variables in the HUD class is because it's existing
from gamestart, saving it in this class, then referring it to the HUD class, will
give no value until the window is brought up, so best to save it there, and have
some defaults.
============================================================
*/
#exec texture import file=Textures/Abstract.pcx name=AbstractOne
var MyComboControl Type;
var localized string Posing[8];
var localized string Colours[8];
var MyComboControl Pos;
var MyComboControl Colour;
var MyCheckBox UseRadar, UseShowRadar, DrawEnd, DrawMonsters, DrawMonsterNames, DrawPlayers, DrawPlayerNames;
var MySmallButton Send, Save, Close;
var UwindowEditControl ChatLab;

function AfterCreate()
{
local color colors;
Super.AfterCreate();
WinLeft = (Root.WinWidth - WinWidth) / 2;
WinTop = (Root.WinHeight - WinHeight) / 2;
	Colors.R=0;
	Colors.G=255;
	Colors.B=255;
//RadarType
if(type==none)
Type = MyComboControl(CreateControl(class'MyComboControl', 20, 270, 200, 1));
Type.SetTextColor(Colors);
Type.SetText(LangObj.default.Type);
//Type.SetHelpText("Set the radar type.");
Type.SetFont(F_Normal);
Type.SetEditable(False);
//Type.AddItem(LangObj.default.IT1);//0
Type.AddItem(LangObj.default.IT2);//1
Type.AddItem(LangObj.default.IT3);//2

    Switch(HUD.RadarTex)
	    {
		
		//case Texture'OriginalRadarConsole':
		//    Type.SetSelectedIndex(0);
		//break;
		case Texture'RadarConsole':
		    Type.SetSelectedIndex(0);
		break;
		case Texture'Radar_a00':
		    Type.SetSelectedIndex(1);
		break;
		default:
			Type.SetSelectedIndex(1);
		}

 //Positioning
 
 if(pos==none)
 	Pos = MyComboControl(CreateControl(class'MyComboControl', 20, 300, 200, 1));
	Pos.SetTextColor(Colors);
	Pos.SetText(LangObj.default.Pos);
	//Pos.SetHelpText("Set the radar position on the HUD.");
	Pos.SetFont(F_Normal);
	Pos.SetEditable(False);
	Pos.AddItem(LangObj.default.Posing[0]);
	Pos.AddItem(LangObj.default.Posing[1]);
	Pos.AddItem(LangObj.default.Posing[2]);
	Pos.AddItem(LangObj.default.Posing[3]);
	Pos.AddItem(LangObj.default.Posing[4]);
	Pos.AddItem(LangObj.default.Posing[5]);
	Pos.AddItem(LangObj.default.Posing[6]);
	Pos.AddItem(LangObj.default.Posing[7]);
	Pos.SetFont(F_Normal);
	if (HUD.Position == RADAR_TopLeft)	//--This can be optimized by using enums for what they're supposed to be..
	    Pos.SetSelectedIndex(0);
	else if (HUD.Position == RADAR_TopMiddle)
	    Pos.SetSelectedIndex(1);
	else if (HUD.Position == RADAR_TopRight)
	    Pos.SetSelectedIndex(2);
	else if (HUD.Position == RADAR_MiddleLeft)
	    Pos.SetSelectedIndex(3);
	else if (HUD.Position == RADAR_MiddleRight)
	    Pos.SetSelectedIndex(4);
	else if (HUD.Position == RADAR_BottomLeft)
	    Pos.SetSelectedIndex(5);
	else if (HUD.Position == RADAR_BottomMiddle)
	    Pos.SetSelectedIndex(6);
	else if (HUD.Position == RADAR_BottomRight)
	    Pos.SetSelectedIndex(7);
 
 //Colors
    if(Colour==none)
	Colour = MyComboControl(CreateControl(class'MyComboControl', 20, 330, 200, 1));
	Colour.SetTextColor(Colors);
	Colour.SetText(LangObj.default.Colour);
	//Colour.SetHelpText("Set the radar color on the HUD.");
	Colour.SetFont(F_Normal);
	Colour.SetEditable(False);
	Colour.AddItem(LangObj.default.Blue);
	Colour.AddItem(LangObj.default.Green);
	Colour.AddItem(LangObj.default.Cyan);
	Colour.AddItem(LangObj.default.Gold);
	Colour.AddItem("HUD");
	Colour.AddItem(LangObj.default.Nones);

	if (HUD.RadarColor == COL_Blue)
	    Colour.SetSelectedIndex(0);
	if (HUD.RadarColor == COL_Green)
	    Colour.SetSelectedIndex(1);
	if (HUD.RadarColor == COL_Cyan)
	    Colour.SetSelectedIndex(2);
	if (HUD.RadarColor == COL_Gold)
	    Colour.SetSelectedIndex(3);
	if (HUD.RadarColor == COL_HUD)
	    Colour.SetSelectedIndex(4);
	if (HUD.RadarColor == COL_None)
	    Colour.SetSelectedIndex(5);
		
    if(UseRadar==none)
	UseRadar = MyCheckBox(CreateControl(class'MyCheckBox', 20, 360, 200, 1));
	UseRadar.SetTextColor(Colors);
	UseRadar.SetText(LangObj.default.UseRadar);
	UseRadar.SetFont(F_Normal);
	UseRadar.bChecked = HUD.bClientUseRadar;
	if(DrawEnd==none)
	DrawEnd = MyCheckBox(CreateControl(class'MyCheckBox', 256, 390, 200, 1));
	DrawEnd.SetTextColor(Colors);
	DrawEnd.SetText(LangObj.default.DrawEnd);
	DrawEnd.SetFont(F_Normal);
	DrawEnd.bChecked = HUD.bDrawEnd;
    //Right side settings
	if(DrawMonsters==none)
	DrawMonsters = MyCheckBox(CreateControl(class'MyCheckBox', 256, 270, 200, 1));
	DrawMonsters.SetTextColor(Colors);
	DrawMonsters.SetText(LangObj.default.DrawMonsters);
	DrawMonsters.SetFont(F_Normal);
	DrawMonsters.bChecked = HUD.bDrawMonsters;
	
	if(DrawMonsterNames==none)
	DrawMonsterNames = MyCheckBox(CreateControl(class'MyCheckBox', 256, 300, 200, 1));
	DrawMonsterNames.SetTextColor(Colors);
	DrawMonsterNames.SetText(LangObj.default.DrawMonsterNames);
	DrawMonsterNames.SetFont(F_Normal);
	DrawMonsterNames.bChecked = HUD.bDrawMonsterNames;
	
	if(DrawPlayers==none)
	DrawPlayers = MyCheckBox(CreateControl(class'MyCheckBox', 256, 330, 200, 1));
	DrawPlayers.SetTextColor(Colors);
	DrawPlayers.SetText(LangObj.default.DrawPlayers);
	DrawPlayers.SetFont(F_Normal);
	DrawPlayers.bChecked = HUD.bClientUseRadarPreview;
	
	
	if(DrawPlayerNames==none)
	DrawPlayerNames = MyCheckBox(CreateControl(class'MyCheckBox', 256, 360, 200, 1));
	DrawPlayerNames.SetTextColor(Colors);
	DrawPlayerNames.SetText(LangObj.default.DrawPlayerNames);
	DrawPlayerNames.SetFont(F_Normal);
	DrawPlayerNames.bChecked = HUD.bClientUseRadarPreview;
	
	if(UseShowRadar==none)
	UseShowRadar = MyCheckBox(CreateControl(class'MyCheckBox', 20, 390, 200, 1));
	UseShowRadar.SetTextColor(Colors);
	UseShowRadar.SetText(LangObj.default.UseShowRadar);
	UseShowRadar.SetFont(F_Normal);
	UseShowRadar.bChecked = HUD.bClientUseRadarPreview;
	ChangeLan();
	
	}

function ChangeLan()
{
local UWindowComboListItem I;
local int Count;

Super.ChangeLan();
UseShowRadar.SetText(LangObj.default.UseShowRadar);
DrawPlayerNames.SetText(LangObj.default.DrawPlayerNames);
DrawPlayers.SetText(LangObj.default.DrawPlayers);
DrawMonsterNames.SetText(LangObj.default.DrawMonsterNames);
DrawMonsters.SetText(LangObj.default.DrawMonsters);
DrawEnd.SetText(LangObj.default.DrawEnd);
UseRadar.SetText(LangObj.default.UseRadar);
Colour.SetText(LangObj.default.Colour);
Pos.SetText(LangObj.default.Pos);
Type.SetText(LangObj.default.Type);

//
	
	SetNewValue(0,Colour.List,LangObj.default.Blue);
	SetNewValue(1,Colour.List,LangObj.default.Green);
	SetNewValue(2,Colour.List,LangObj.default.Cyan);
	SetNewValue(3,Colour.List,LangObj.default.Gold);

	SetNewValue(5,Colour.List,LangObj.default.Nones);
	

		
//

	SetNewValue(0,Pos.List,LangObj.default.Posing[0]);
	SetNewValue(1,Pos.List,LangObj.default.Posing[1]);
	SetNewValue(2,Pos.List,LangObj.default.Posing[2]);
	SetNewValue(3,Pos.List,LangObj.default.Posing[3]);
	SetNewValue(4,Pos.List,LangObj.default.Posing[4]);
	SetNewValue(5,Pos.List,LangObj.default.Posing[5]);
	SetNewValue(6,Pos.List,LangObj.default.Posing[6]);
	SetNewValue(7,Pos.List,LangObj.default.Posing[7]);

SetNewValue(0,Type.List,LangObj.default.IT2);//1
SetNewValue(1,Type.List,LangObj.default.IT3);//2

	if (HUD.RadarColor == COL_Blue)
	    Colour.SetSelectedIndex(0);
	if (HUD.RadarColor == COL_Green)
	    Colour.SetSelectedIndex(1);
	if (HUD.RadarColor == COL_Cyan)
	    Colour.SetSelectedIndex(2);
	if (HUD.RadarColor == COL_Gold)
	    Colour.SetSelectedIndex(3);
	if (HUD.RadarColor == COL_HUD)
	    Colour.SetSelectedIndex(4);
	if (HUD.RadarColor == COL_None)
	    Colour.SetSelectedIndex(5);
		
	if (HUD.Position == RADAR_TopLeft)
	    Pos.SetSelectedIndex(0);
	if (HUD.Position == RADAR_TopMiddle)
	    Pos.SetSelectedIndex(1);
	if (HUD.Position == RADAR_TopRight)
	    Pos.SetSelectedIndex(2);
	if (HUD.Position == RADAR_MiddleLeft)
	    Pos.SetSelectedIndex(3);
	if (HUD.Position == RADAR_MiddleRight)
	    Pos.SetSelectedIndex(4);
	if (HUD.Position == RADAR_BottomLeft)
	    Pos.SetSelectedIndex(5);
	if (HUD.Position == RADAR_BottomMiddle)
	    Pos.SetSelectedIndex(6);
	if (HUD.Position == RADAR_BottomRight)
	    Pos.SetSelectedIndex(7);
		
	Switch(HUD.RadarTex)
	    {
		
		//case Texture'OriginalRadarConsole':
		//    Type.SetSelectedIndex(0);
		//break;
		case Texture'RadarConsole':
		    Type.SetSelectedIndex(0);
		break;
		case Texture'Radar_a00':
		    Type.SetSelectedIndex(1);
		break;
		}
}


function SetNewValue(int Index, UWindowComboList list, string NewValue)
{
	local UWindowComboListItem I;
	local int Count;

	I = UWindowComboListItem(list.Items.Next);
	Count = 0;
		
	while(I != None)
	{
		if(Count == Index) I.Value = NewValue;

		Count++;
		I = UWindowComboListItem(I.Next);
	}
}

//Function that handles notifications when something happens
function Notify(UWindowDialogControl C, byte E)
{

	switch(E)
	{
		case DE_Change:
			switch(C)
			{
			    case Type:
			    DynamicSetType();
				break;
				case Pos:
                    PosChanged();
					break;
				case Colour:
				ColChanged();
				break;
				case UseRadar:
				HUD.bClientUseRadar=UseRadar.bChecked;
				//HUD.SaveConfig();
				break;
				case UseShowRadar:
                HUD.bClientUseRadarPreview=UseShowRadar.bChecked;
				//HUD.SaveConfig();
				break;
				case DrawEnd:
				HUD.bDrawEnd=DrawEnd.bChecked;
				//HUD.SaveConfig();
				break;
				case DrawMonsters:
				HUD.bDrawMonsters=DrawMonsters.bChecked;
				//HUD.SaveConfig();
				break;
				case DrawMonsterNames:
				HUD.bDrawMonsterNames=DrawMonsterNames.bChecked;
				//HUD.SaveConfig();
				break;
				case DrawPlayers:
				HUD.bDrawPlayers=DrawPlayers.bChecked;
				//HUD.SaveConfig();
				break;
				case DrawPlayerNames:
				HUD.bDrawPlayerNames=DrawPlayerNames.bChecked;
				//HUD.SaveConfig();
				break;
			}
			break;
	}
	SaveConfigs();
}

function PosChanged()
{


	switch(Pos.GetSelectedIndex())
	{
		case 0:
			HUD.Position = RADAR_TopLeft;
			break;
		case 1:
			HUD.Position = RADAR_TopMiddle;
			break;
		case 2:
			HUD.Position = RADAR_TopRight;
			break;
		case 3:
			HUD.Position = RADAR_MiddleLeft;
			break;
		case 4:
			HUD.Position = RADAR_MiddleRight;
			break;
		case 5:
			HUD.Position = RADAR_BottomLeft;
			break;
		case 6:
			HUD.Position = RADAR_BottomMiddle;
			break;
		case 7:
			HUD.Position = RADAR_BottomRight;
			break;
	}
}



function ColChanged()
{


	switch(Colour.GetSelectedIndex())
	{
		case 0:
			HUD.RadarColor = COL_Blue;
			break;
		case 1:
			HUD.RadarColor = COL_Green;
			break;
		case 2:
			HUD.RadarColor = COL_Cyan;
			break;
		case 3:
			HUD.RadarColor = COL_Gold;
			break;
		case 4:
			HUD.RadarColor = COL_HUD;
			break;
		case 5:
			HUD.RadarColor = COL_None;
			break;
	}
}

function DynamicSetType()
{

switch (Type.GetSelectedIndex())
    {
	case 0:
	    HUD.RadarTex = Texture'RadarConsole';
	break;
	case 1:
	    HUD.RadarTex = Texture'Radar_a00';
	break;
	
	}
}


function BeforePaint(Canvas C, float X, Float Y)
{
Winheight=512;

Super.BeforePaint(C,X,Y);


}


function Paint(Canvas C, float X, Float Y)
{
Super.Paint(C,X,Y);
C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
//Draw the nice background.
DrawStretchedTextureSegment( C, 0, 0, 544, 512, 0, 0, 544, 512, Texture'BackgroundTwo' );
//C.Style = GetPlayerOwner().ERenderStyle.STY_Translucent;
//DrawStretchedTextureSegment( C, 0, 0, 544, winheight, 480, 0, 544, 512, Texture'MyGlass' );
//Draw the radar preview.
if(!HUD.bClientUseRadarPreview) return;
	if (HUD.RadarColor == COL_Blue)
	    C.DrawColor=HUD.BlueColor;
	if (HUD.RadarColor == COL_Green)
	    C.DrawColor=HUD.GreenColor;
	if (HUD.RadarColor == COL_Cyan)
	    C.DrawColor=HUD.CyanColor;
	if (HUD.RadarColor == COL_Gold)
	    C.DrawColor=HUD.GoldColor;
	if (HUD.RadarColor == COL_HUD)
	    C.DrawColor=HUD.HUDColor;
C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
DrawStretchedTexture(C, WinLeft + 140, 0, 256, 256, Texture'Blackness');
DrawStretchedTexture(C, WinLeft + 140, 0, 256, 256, HUD.RadarTex);
//Other infos...

}


function SaveConfigs()
{
Super.SaveConfigs();
HUD.SaveConfig();//Not too bad, better using dynamic so no player need reconnect!
GetPlayerOwner().SaveConfig();
}

defaultproperties
{
     posing(0)="Top Left"
     posing(1)="Top Middle"
     posing(2)="Top Right"
     posing(3)="Middle Left"
     posing(4)="Middle Right"
     posing(5)="Bottom Left"
     posing(6)="Bottom Middle"
     posing(7)="Bottom Right"
     Colours(0)="White"
     Colours(1)="Red"
     Colours(2)="Blue"
     Colours(3)="Green"
     Colours(4)="Cyan"
     Colours(5)="None"
     Colours(6)="Gold"
     Colours(7)="HUD"
}
