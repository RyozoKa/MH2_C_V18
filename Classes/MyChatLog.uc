class MyChatLog expands MyTab;

#exec obj load file=..\Textures\Coret_FX.utx
#exec texture import file=Textures/Aero_Glass.pcx name=MyGlass

var color Colors;
var UWindowDynamicTextArea logwindow;
const NumChars = 52;
var MyCheckBox SaveOn;
var MySmallButton Send, Save, Close, clear, Dump;
var MyEditControl ChatLab;
var Canvas Can;//Attempting to use this instead to fill the window and use StrLen.

var string statusstr;

function beforecreate()
{
Super.beforecreate();
	HUD.ChatContainer.LogWindow=Self;
}

function Created()
{
	Super.Created();
	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop = (Root.WinHeight - WinHeight) / 2;
	Colors.R=0;
	Colors.G=255;
	Colors.B=0;
	LogWindow=addDynamicTextArea();
    clear = MySmallButton(CreateControl(Class'MySmallButton', 44 , 355 , 64, 1 ));
	clear.WinHeight=16;
	clear.SetText(LangObj.default.clear);
	clear.DownSound = Sound'Click' ;
	GetMessages();
	ChangeLan();
}
	
function AfterCreate()
{
	Super.AfterCreate();
}

function ChangeLan()
{
	Super.ChangeLan();
	clear.SetText(LangObj.default.clear);
}

function NotifyAfterLevelChange()
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.NotifyAfterLevelChange();

	HUD.ChatContainer.AddMessage("--------- New Level "@GetLevel()@"-----------");
}
	
function Notify(UWindowDialogControl C, byte E)
{

	switch(E)
	{
		case DE_Change:
			

		break;
		case DE_Click:
		    if(C == clear){
		        HUD.ChatContainer.clean();
				LogWindow.clear();
				HUD.ChatContainer.SaveConfig();}
		break;
	}
		SaveConfigs();
}

function GetMessages()
{
local int i;
	LogWindow.Clear();
	for(i=0;i<HUD.ChatContainer.index;i++){
		HUD.addchatmessage(HUD.ChatContainer.getarray(i));
	}
}


function AddNewMessage(string Message)
{
	HUD.addchatmessage(Message);
}
function beforepaint(Canvas C, float X, Float Y)
{
	super.beforepaint(C,X,Y);

}
function Paint(Canvas C, float X, Float Y)
{
	Super.Paint(C,X,Y);
	C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
	
	//Draw the nice background.
	DrawStretchedTextureSegment( C, 0, 0, 544, 512, 0, 0, 544, 512, Texture'BackgroundTwo' );
	//C.Style = GetPlayerOwner().ERenderStyle.STY_Translucent;
	//DrawStretchedTextureSegment( C, 0, 0, 544, winheight, 480, 0, 544, 512, Texture'MyGlass' );
	C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
}


function SaveConfigs()
{
	Super.SaveConfigs();
	HUD.SaveConfig();//Not too bad, better using dynamic so no player need reconnect! :D
}


function UWindowDynamicTextArea addDynamicTextArea() {
	local UMenuMapListFrameCW frame;
	local UWindowDynamicTextArea textArea;
	
	frame = UMenuMapListFrameCW(createwindow(class'UMenuMapListFrameCW', 44, 25, 450, 300));
	textArea = UWindowDynamicTextArea(CreateControl(class'UWindowDynamicTextArea', 44, 25, 450, 300));
	textArea.setTextColor(lookAndFeel.editBoxTextColor);
    textArea.bTopCentric = false;
	frame.frame.setFrame(textArea);
	
	return textArea;
}

defaultproperties
{
}
