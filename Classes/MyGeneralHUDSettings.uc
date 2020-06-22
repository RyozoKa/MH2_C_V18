class MyGeneralHUDSettings expands MyTab;

/*
============================================================
The reason why I am saving variables in the HUD class is because it's existing
from gamestart, saving it in this class, then referring it to the HUD class, will
give no value until the window is brought up, so best to save it there, and have
some defaults.
============================================================
*/

var MyComboControl Type;

var MyCheckBox DrawMiniScoreBoard,DrawChatMessages, DrawDeathMessages, DrawKillMessages , DrawCustSui;
var MyCheckBox DrawSyn, CustFont, AgeMessages;
var MyCheckBox UseRadar, DrawMonsterHealth, DrawEnd, DrawMonsters, DrawMonsterNames, DrawPlayers, DrawPlayerNames;
var color Colors;
var MyHSliderControl ColR, ColG, ColB, Secs, RedP, GreenP, BlueP, RedPM, GreenPM, BluePM, BlueEv, RedEv, GreenEv;
var MyLabelControl ClientMessagesText,ClientMessagesText2, ClientMessagesText3, ClientMessagesText4;
var MySecondEditControl txtMessage, txtMessage2, ChatLab;
var MyComboControl FontSize;
var MySmallButton Send, Save, Close;
var MyItemListBox ColorList;

function Created()
{
Super.Created();
WinLeft = (Root.WinWidth - WinWidth) / 2;
WinTop = (Root.WinHeight - WinHeight) / 2;

	Colors.R=0;
	Colors.G=255;
	Colors.B=0;
	//
	DrawMiniScoreBoard = MyCheckBox(CreateControl(class'MyCheckBox', 20, 235, 200, 1));
	DrawMiniScoreBoard.SetTextColor(Colors);
	DrawMiniScoreBoard.SetText(LangObj.default.DrawMiniScoreBoard);
	DrawMiniScoreBoard.SetFont(F_Normal);
	DrawMiniScoreBoard.bChecked = HUD.bClientShowMini;
	
	if(DrawSyn==none)
	DrawSyn = MyCheckBox(CreateControl(class'MyCheckBox', 20, 15, 200, 1));
	DrawSyn.SetTextColor(Colors);
	DrawSyn.SetText(LangObj.default.DrawSyn);
	DrawSyn.SetFont(F_Normal);
	DrawSyn.bChecked = HUD.bClientShowSynopsis;
	
	//ColR = MyHSliderControl(CreateControl(class'MyHSliderControl', 250, 20, 200, 1));
	//ColR.SetRange(0, 255, 1);
	//ColR.SetValue(HUD.SynColor.R);
	//ColR.SetTextColor(Colors);
	//ColR.SetText(LangObj.default.ColR@int(ColR.GetValue()));
	//ColR.SetFont(F_Normal);
	

	//ColG = MyHSliderControl(CreateControl(class'MyHSliderControl', 250, 40, 200, 1));
	//ColG.SetRange(0, 255, 1);
	//ColG.SetValue(float(HUD.SynColor.G));
	//ColG.SetTextColor(Colors);
	//ColG.SetText(LangObj.default.ColG@int(ColG.GetValue()));
	//ColG.SetFont(F_Normal);
	

	//ColB = MyHSliderControl(CreateControl(class'MyHSliderControl', 250, 60, 200, 1));
	//ColB.SetRange(0, 255, 1);
	//ColB.SetValue(HUD.SynColor.B);
	//ColB.SetTextColor(Colors);
	//ColB.SetText(LangObj.default.ColB@int(ColB.GetValue()));
	//ColB.SetFont(F_Normal);
	
	
	if(DrawMonsterHealth==none)
	DrawMonsterHealth = MyCheckBox(CreateControl(class'MyCheckBox', 20, 35, 200, 1));
	DrawMonsterHealth.SetTextColor(Colors);
	DrawMonsterHealth.SetText(LangObj.default.DrawMonsterHealth);
	DrawMonsterHealth.SetFont(F_Normal);
	DrawMonsterHealth.bChecked = HUD.ClientDrawMonsterName;
	
	if(ClientMessagesText==none)
	ClientMessagesText = MyLabelControl(CreateControl(class'MyLabelControl', 20, 55, 430, 1));
	ClientMessagesText.SetTextColor(Colors);
	ClientMessagesText.SetText("_______________________________________________________________________________________________________________________________");
	
	//ClientMessagesText2 = MyLabelControl(CreateControl(class'MyLabelControl', 20, 75, 100, 1));
	//ClientMessagesText2.SetTextColor(Colors);
	//ClientMessagesText2.SetText(LangObj.default.ClientMessagesText2);
	
	if(DrawChatMessages==none)
	DrawChatMessages = MyCheckBox(CreateControl(class'MyCheckBox', 20, 95, 200, 1));
	DrawChatMessages.SetTextColor(Colors);
	DrawChatMessages.SetText(LangObj.default.DrawChatMessages);
	DrawChatMessages.SetFont(F_Normal);
	DrawChatMessages.bChecked = HUD.bUseChat;
	
	if(DrawKillMessages==none)
	DrawKillMessages = MyCheckBox(CreateControl(class'MyCheckBox', 20, 115, 200, 1));
	DrawKillMessages.SetTextColor(Colors);
	DrawKillMessages.SetText(LangObj.default.DrawKillMessages);
	DrawKillMessages.SetFont(F_Normal);
	DrawKillMessages.bChecked = HUD.DrawKillMessages;
	
	if(DrawCustSui==none)
	DrawCustSui = MyCheckBox(CreateControl(class'MyCheckBox', 20, 135, 200, 1));
	DrawCustSui.SetTextColor(Colors);
	DrawCustSui.SetText(LangObj.default.DrawCustSui);
	DrawCustSui.SetFont(F_Normal);
	DrawCustSui.bChecked = HUD.bCustomDeathMessage;
	
	if(txtMessage==none)
	txtMessage = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 155 , 370, 1 ));
	txtMessage.SetTextColor(Colors);
	txtMessage.SetText(LangObj.default.txtMessage);
	txtMessage.SetNumericOnly( False ) ;
	txtMessage.SetHistory( True ) ;
	txtMessage.SetMaxLength( 512 ) ;
	txtMessage.SetValue(HUD.MaleSuicideString);
	
	if(txtMessage2==none)
	txtMessage2 = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 175 , 370, 1 ));
	txtMessage2.SetTextColor(Colors);
	txtMessage2.SetText(LangObj.default.txtMessage2);
	txtMessage2.SetNumericOnly( False ) ;
	txtMessage2.SetHistory( True ) ;
	txtMessage2.SetMaxLength( 512 ) ;
	txtMessage2.SetValue(HUD.FemaleSuicideString);
	
	if(!DrawCustSui.bChecked)
             	    {
                 		txtMessage.EditBox.SetEditable(False);
                  		txtMessage2.EditBox.SetEditable(False);
               		}
	//Use custom font size?
	if(CustFont==none)
	CustFont = MyCheckBox(CreateControl(class'MyCheckBox', 20, 195, 200, 1));
	CustFont.SetTextColor(Colors);
	CustFont.SetText(LangObj.default.CustFont);
	CustFont.SetFont(F_Normal);
	CustFont.bChecked = !HUD.bAutoAdjustFontSize;
	
	//Font sizes.
	if(FontSize==none)
	FontSize = MyComboControl(CreateControl(class'MyComboControl', 20, 215, 370, 1));
    FontSize.SetTextColor(Colors);
    FontSize.SetText(LangObj.default.FontSize);
    //Type.SetHelpText("Set the radar type.");
    FontSize.SetFont(F_Normal);
    FontSize.SetEditable(False);
	//FontSize.AddItem(LangObj.default.VerySmall);//0 
    FontSize.AddItem(LangObj.default.Small);//0 
    FontSize.AddItem(LangObj.default.Normal);//1
    FontSize.AddItem(LangObj.default.Big);//2
	FontSize.SetSelectedIndex(HUD.MsgFont); // 0, 1 , 2
	if(!CustFont.bChecked)
             	    {
                 		FontSize.Button.bDisabled=True;
               		}
	if(DrawDeathMessages==none)
	DrawDeathMessages = MyCheckBox(CreateControl(class'MyCheckBox', 20, 75, 200, 1));
	DrawDeathMessages.SetTextColor(Colors);
	DrawDeathMessages.SetText(LangObj.default.DrawDeathMessages);
	DrawDeathMessages.SetFont(F_Normal);
	DrawDeathMessages.bChecked = HUD.DrawDeathMessages;
	
	
	if(ColorList==none)
	ColorList=MyItemListBox(addListBox(class'MyItemListBox'));
	AddItems();
	
    //Red
	if(RedP==none)
	RedP = MyHSliderControl(CreateControl(class'MyHSliderControl', 200, 270, 300, 1));
	RedP.SetRange(1, 255, 1);
	RedP.SetValue(MyItemListItem(ColorList.SelectedItem).Colour.R,true);
	RedP.SetTextColor(Colors);
	RedP.SetText(LangObj.default.ColR@int(RedP.GetValue()));
	RedP.SetFont(F_Normal);
	
	//------------------------------------------------------------------------------------------------------------------------------------------
	//Green
	if(GreenP==none)
	GreenP = MyHSliderControl(CreateControl(class'MyHSliderControl', 200, 300, 300, 1));
	GreenP.SetRange(1, 255, 1);
	GreenP.SetValue(MyItemListItem(ColorList.SelectedItem).Colour.G,true);
	GreenP.SetTextColor(Colors);
	GreenP.SetText(LangObj.default.ColG@int(GreenP.GetValue()));
	GreenP.SetFont(F_Normal);
	//-------------------------------------------------------------------------------------------------------------------------------------------
	//Blue
	if(BlueP==none)
	BlueP = MyHSliderControl(CreateControl(class'MyHSliderControl', 200, 330, 300, 1));
	BlueP.SetRange(1, 255, 1);
	BlueP.SetValue(MyItemListItem(ColorList.SelectedItem).Colour.B,true);
	BlueP.SetTextColor(Colors);
	BlueP.SetText(LangObj.default.ColB@int(BlueP.GetValue()));
	BlueP.SetFont(F_Normal);
	//=======================================================================
	ChangeLan();
	
}

function ChangeLan()
{
local MyItemListItem item;
local int i;
Super.ChangeLan();

BlueP.SetText(LangObj.default.ColB@int(BlueP.GetValue()));
GreenP.SetText(LangObj.default.ColG@int(GreenP.GetValue()));
RedP.SetText(LangObj.default.ColR@int(RedP.GetValue()));
DrawDeathMessages.SetText(LangObj.default.DrawDeathMessages);
FontSize.SetText(LangObj.default.FontSize);
CustFont.SetText(LangObj.default.CustFont);
txtMessage2.SetText(LangObj.default.txtMessage2);
txtMessage.SetText(LangObj.default.txtMessage);
DrawCustSui.SetText(LangObj.default.DrawCustSui);
DrawKillMessages.SetText(LangObj.default.DrawKillMessages);
DrawChatMessages.SetText(LangObj.default.DrawChatMessages);
DrawMonsterHealth.SetText(LangObj.default.DrawMonsterHealth);
DrawSyn.SetText(LangObj.default.DrawSyn);
DrawMiniScoreBoard.SetText(LangObj.default.DrawMiniScoreBoard);
	for (item = MyItemListItem(ColorList.items); item != none; item = MyItemListItem(item.next))
	{
		Item.ItemName=LangObj.default.ColorItems[i++];
	}
	SetNewValue(0,FontSize.List,LangObj.default.Small);
	SetNewValue(1,FontSize.List,LangObj.default.Normal);
	SetNewValue(2,FontSize.List,LangObj.default.Big);
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

function AddItems()
{
local MyItemListItem list;
//Player Colors
list =ColorList.AddItem();
list.ItemName="Player Name Colors";
list.ItemNum=0;
list.Colour=HUD.NameColor;
ColorList.SetSelectedItem(list);
list=none;
//Chat Message Colors
list =ColorList.AddItem();
list.ItemName="Chat Message Colors";
list.ItemNum=1;
list.Colour=HUD.ChatMessageColor;
list=none;
//Event Colors
list =ColorList.AddItem();
list.ItemName="Lower Message Colors";
list.ItemNum=2;
list.Colour=HUD.EventColor;
list=none;
//Game Synopsis Colors
list =ColorList.AddItem();
list.ItemName="Game Synopsis Colors";
list.ItemNum=3;
list.Colour=HUD.SynColor;
list=none;
}

function UWindowListBox addListBox(class<UWindowListBox> listBoxClass) {
	local MyMapListFrameCW frame;
	local UWindowListBox listBox;
	
	frame = MyMapListFrameCW(Createwindow(class'MyMapListFrameCW', 20 , 265 , 150, 150 ));
	listBox = UWindowListBox(CreateControl(listBoxClass, 20 , 265 , 150, 150 ));
	frame.frame.setFrame(listBox);
	
	return listBox;
}

function Notify(UWindowDialogControl C, byte E)
{

	switch(E)
	{
		case DE_Change:
			switch(C)
			{
				case DrawSyn:
				HUD.bClientShowSynopsis = DrawSyn.bChecked;
			    case DrawMiniScoreBoard:
			    HUD.bClientShowMini=DrawMiniScoreBoard.bChecked;
				break;
				case RedP:
				UpdateValue();
				break;
				case GreenP:
				UpdateValue();
				break;
				case BlueP:
				UpdateValue();
				break;
				case DrawMonsterHealth:
				HUD.ClientDrawMonsterName=DrawMonsterHealth.bChecked;
				break;
				case DrawChatMessages:
				HUD.bUseChat = DrawChatMessages.bChecked;
				break;
				case DrawKillMessages:
				HUD.DrawKillMessages = DrawKillMessages.bChecked;
				break;
				case DrawCustSui:
				HUD.bCustomDeathMessage = DrawCustSui.bChecked;
				if(!DrawCustSui.bChecked)
             	    {
                 		txtMessage.EditBox.SetEditable(False);
                  		txtMessage2.EditBox.SetEditable(False);
               		}
				else {txtMessage.EditBox.SetEditable(True);
                  		txtMessage2.EditBox.SetEditable(True);}
				break;
				case txtMessage:
				HUD.MaleSuicideString=txtMessage.GetValue();
				break;
				case txtMessage2:
				HUD.FemaleSuicideString=txtMessage2.GetValue();
				break;
				case FontSize:
				HUD.MsgFont=FontSize.GetSelectedIndex();
				break;
                case CustFont:
				HUD.bAutoAdjustFontSize = !CustFont.bChecked;
				if(!CustFont.bChecked)
             	    {
                 		FontSize.Button.bDisabled=True;
               		}
				else FontSize.Button.bDisabled=False;
				break;
				case AgeMessages:
				HUD.bAgeMessages = AgeMessages.bChecked;
				break;
				case Secs:
				Secs.SetText(LangObj.default.Secs@int(Secs.GetValue()));
				HUD.StayTime=Secs.GetValue();
				break;
				case DrawDeathMessages:
				HUD.DrawDeathMessages=DrawDeathMessages.bChecked;
				break;
			}
			break;
			Case DE_Click:
			    if(C==ColorList && RedP!=none && GreenP!=none && BlueP!=none){
				RedP.SetValue(MyItemListItem(ColorList.SelectedItem).Colour.R,true);
				GreenP.SetValue(MyItemListItem(ColorList.SelectedItem).Colour.G,true);
				BlueP.SetValue(MyItemListItem(ColorList.SelectedItem).Colour.B,true);
				}
			break;
	}
	SaveConfigs();
}

function UpdateValue()
{
if(RedP!=none && GreenP!=none && BlueP!=none){
    Switch(MyItemListItem(ColorList.SelectedItem).ItemNum)
        {
		Case 0:
		HUD.NameColor.R=RedP.GetValue();
		HUD.NameColor.G=GreenP.GetValue();
		HUD.NameColor.B=BlueP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.R=RedP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.G=GreenP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.B=BlueP.GetValue();
		break;
		Case 1:
		HUD.ChatMessageColor.R=RedP.GetValue();
		HUD.ChatMessageColor.G=GreenP.GetValue();
		HUD.ChatMessageColor.B=BlueP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.R=RedP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.G=GreenP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.B=BlueP.GetValue();
		break;
		Case 2:
		HUD.EventColor.R=RedP.GetValue();
		HUD.EventColor.G=GreenP.GetValue();
		HUD.EventColor.B=BlueP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.R=RedP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.G=GreenP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.B=BlueP.GetValue();
		break;
		Case 3:
		HUD.SynColor.R=RedP.GetValue();
		HUD.SynColor.G=GreenP.GetValue();
		HUD.SynColor.B=BlueP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.R=RedP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.G=GreenP.GetValue();
		MyItemListItem(ColorList.SelectedItem).Colour.B=BlueP.GetValue();
		break;
		}
	}
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
C.DrawColor=MyItemListItem(ColorList.SelectedItem).Colour;
DrawStretchedTextureSegment( C, 200, 360, 300, 20, 0, 0, 1, 1, Texture'Whiteness' );

BlueP.SetText(LangObj.default.ColB@int(BlueP.GetValue()));
GreenP.SetText(LangObj.default.ColG@int(GreenP.GetValue()));
RedP.SetText(LangObj.default.ColR@int(RedP.GetValue()));
}


function SaveConfigs()
{
Super.SaveConfigs();
HUD.SaveConfig();
}


/*ClientMessagesText4 = MyLabelControl(CreateControl(class'MyLabelControl', 20, 245, 430, 1));
	ClientMessagesText4.SetTextColor(Colors);
	ClientMessagesText4.SetText("_______________________________________________________________________________________________________________________________");
	
	//Age messages?
	AgeMessages = MyCheckBox(CreateControl(class'MyCheckBox', 20, 265, 200, 1));
	AgeMessages.SetTextColor(Colors);
	AgeMessages.SetText(LangObj.default.AgeMessages);
	AgeMessages.SetFont(F_Normal);
	AgeMessages.bChecked = HUD.bAgeMessages;
	
	Secs = MyHSliderControl(CreateControl(class'MyHSliderControl', 20, 295, 370, 1));
	Secs.SetRange(1, 15, 1);
	Secs.SetValue(HUD.StayTime);
	Secs.SetTextColor(Colors);
	Secs.SetText(LangObj.default.Secs@int(Secs.GetValue()));
	Secs.SetFont(F_Normal);
	
	ClientMessagesText3 = MyLabelControl(CreateControl(class'MyLabelControl', 10, 315, 470, 1));
	ClientMessagesText3.SetTextColor(Colors);
	ClientMessagesText3.SetText("______  "$LangObj.default.PCol$" __________ "$LangObj.default.PChat$" _____________"$LangObj.default.Events$"____________________________________");
	//Player Name Colors.
	//Red
	RedP = MyHSliderControl(CreateControl(class'MyHSliderControl', 10, 335, 150, 1));
	RedP.SetRange(1, 255, 1);
	RedP.SetValue(HUD.NameColor.R);
	RedP.SetTextColor(Colors);
	RedP.SetText(LangObj.default.ColR@int(RedP.GetValue()));
	RedP.SetFont(F_Normal);
	
	//------------------------------------------------------------------------------------------------------------------------------------------
	//Green
	GreenP = MyHSliderControl(CreateControl(class'MyHSliderControl', 10, 355, 150, 1));
	GreenP.SetRange(1, 255, 1);
	GreenP.SetValue(HUD.NameColor.G);
	GreenP.SetTextColor(Colors);
	GreenP.SetText(LangObj.default.ColG@int(GreenP.GetValue()));
	GreenP.SetFont(F_Normal);
	//-------------------------------------------------------------------------------------------------------------------------------------------
	//Blue
	BlueP = MyHSliderControl(CreateControl(class'MyHSliderControl', 10, 375, 150, 1));
	BlueP.SetRange(1, 255, 1);
	BlueP.SetValue(HUD.NameColor.B);
	BlueP.SetTextColor(Colors);
	BlueP.SetText(LangObj.default.ColB@int(BlueP.GetValue()));
	BlueP.SetFont(F_Normal);
	//=======================================================================
    //Players Messages
		//Red
	RedPM = MyHSliderControl(CreateControl(class'MyHSliderControl', 170, 335, 150, 1));
	RedPM.SetRange(1, 255, 1);
	RedPM.SetValue(HUD.ChatMessageColor.R);
	RedPM.SetTextColor(Colors);
	RedPM.SetText(LangObj.default.ColR@int(RedPM.GetValue()));
	RedPM.SetFont(F_Normal);
	
	//------------------------------------------------------------------------------------------------------------------------------------------
	//Green
	GreenPM = MyHSliderControl(CreateControl(class'MyHSliderControl', 170, 355, 150, 1));
	GreenPM.SetRange(1, 255, 1);
	GreenPM.SetValue(HUD.ChatMessageColor.G);
	GreenPM.SetTextColor(Colors);
	GreenPM.SetText(LangObj.default.ColG@int(GreenPM.GetValue()));
	GreenPM.SetFont(F_Normal);
	//-------------------------------------------------------------------------------------------------------------------------------------------
	//Blue
	BluePM = MyHSliderControl(CreateControl(class'MyHSliderControl', 170, 375, 150, 1));
	BluePM.SetRange(1, 255, 1);
	BluePM.SetValue(HUD.ChatMessageColor.B);
	BluePM.SetTextColor(Colors);
	BluePM.SetText(LangObj.default.ColB@int(BluePM.GetValue()));
	BluePM.SetFont(F_Normal);
	//=======================================================================

	//=======================================================================
    //Event Messages
		//Red
	RedEv = MyHSliderControl(CreateControl(class'MyHSliderControl', 330, 335, 150, 1));
	RedEv.SetRange(1, 255, 1);
	RedEv.SetValue(HUD.EventColor.R);
	RedEv.SetTextColor(Colors);
	RedEv.SetText(LangObj.default.ColR@int(RedEv.GetValue()));
	RedEv.SetFont(F_Normal);
	
	//------------------------------------------------------------------------------------------------------------------------------------------
	//Green
	GreenEv = MyHSliderControl(CreateControl(class'MyHSliderControl', 330, 355, 150, 1));
	GreenEv.SetRange(1, 255, 1);
	GreenEv.SetValue(HUD.EventColor.G);
	GreenEv.SetTextColor(Colors);
	GreenEv.SetText(LangObj.default.ColG@int(GreenEv.GetValue()));
	GreenEv.SetFont(F_Normal);
	//-------------------------------------------------------------------------------------------------------------------------------------------
	//Blue
	BlueEv = MyHSliderControl(CreateControl(class'MyHSliderControl', 330, 375, 150, 1));
	BlueEv.SetRange(1, 255, 1);
	BlueEv.SetValue(HUD.EventColor.B);
	BlueEv.SetTextColor(Colors);
	BlueEv.SetText(LangObj.default.ColB@int(BlueEv.GetValue()));
	BlueEv.SetFont(F_Normal);*/
//===================================================================================
	

defaultproperties
{
}
