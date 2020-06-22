class MyPMLog expands MyTab;


/*
I'm aware that this is a bit of a mess....
*/

var color Colors;
const NumChars = 52;

var MySmallButton Send, Save, Close, clear, Dump, Sendpm;
var MySecondEditControl PMLab;
var Canvas Can;//Attempting to use this instead to fill the window and use StrLen.
var MyPlayerListBox LB, Block;
var string statusstr;
var UwindowDynamicTextArea History;
var GameReplicationInfo GRI;
var MyLabelControl BlockedMessage, AllowedMessage;
function beforecreate()
{
Super.beforecreate();
HUD.PMContainer.LogWindow=Self;
} 

function Created()
{
Super.Created();
WinLeft = (Root.WinWidth - WinWidth) / 2;
WinTop = (Root.WinHeight - WinHeight) / 2;

	Colors.R=0;
	Colors.G=255;
	Colors.B=0;
	
if(BlockedMessage==none)
BlockedMessage = MyLabelControl(CreateControl(class'MyLabelControl', 379, 5, 60, 1));
BlockedMessage.SetTextColor(class'staticopers'.static.setcolor(0,255,0));
BlockedMessage.SetText(LangObj.default.BlockedMessage);

if(AllowedMessage==none)
AllowedMessage = MyLabelControl(CreateControl(class'MyLabelControl', 79, 5, 60, 1));
AllowedMessage.SetTextColor(class'staticopers'.static.setcolor(0,255,0));
AllowedMessage.SetText(LangObj.default.AllowedMessage);
		

History=AddDynamicTextArea();

//LogWindow=addDynamicTextArea();
if(LB==none)
LB=MyPlayerListBox(addlistbox(Class'MyPlayerListBox',44));
LB.OwnerWind=self;
LB.register(self);

if(Block==none)
Block=MyPlayerListBox(addlistbox(Class'MyPlayerListBox',344));
Block.register(self);
Block.OwnerWind=self;
//PM Lab

if(pmlab==none)
    PMLab = MySecondEditControl(CreateControl(Class'MySecondEditControl', 44 , 177 , 300, 1 ));
	PMLab.SetTextColor(Colors);
	PMLab.EditBoxWidth=200;
	if(Getselecteditem(LB) != none)
	    PMLab.SetText(LangObj.default.PMLab@Getselecteditem(LB).PlayerReplicationInfo.PlayerName);
	else PMLab.SetText(LangObj.default.PMLab@"None");
	PMLab.SetNumericOnly( False ) ;
	PMLab.SetHistory( True ) ;
	PMLab.SetMaxLength( 512 ) ;
	
	if(sendpm==none)
	Sendpm = MySmallButton(CreateControl(Class'MySmallButton', 364 , 177 , 64, 1 ));
	SendPM.WinHeight=16;
	Sendpm.SetText(LangObj.default.Send);
	Sendpm.bDisabled=true;

	//addplayers();
	
	//===================================================================================
	
	clear = MySmallButton(CreateControl(Class'MySmallButton', 44 , 440 , 64, 1 ));
	clear.WinHeight=16;
	clear.SetText(LangObj.default.clear);
	
	ChangeLan();
}
	
function ChangeLan()
{
	Super.ChangeLan();
	Sendpm.SetText(LangObj.default.Send);
	if(Getselecteditem(LB) != none)
			PMLab.SetText(LangObj.default.PMLab@Getselecteditem(LB).PlayerReplicationInfo.PlayerName);
		else PMLab.SetText(LangObj.default.PMLab@"None");
	AllowedMessage.SetText(LangObj.default.AllowedMessage);
	BlockedMessage.SetText(LangObj.default.BlockedMessage);
}
	
function addplayers()
{
local int i;

for(i=0;i<ArrayCount(GRI.PRIArray);i++)
    {
	    if(GRI.PRIArray[i] != none && PlayerPawn(GRI.PRIArray[i].Owner) != none && GRI.PriArray[i].PlayerName != "Player")
		{
            if(HUD.PMContainer.IsBlocked(PlayerPawn(GRI.PRIArray[i].Owner)))
			    addblockedplayer(GRI.PRIArray[i]);
			else
			    addplayer(GRI.PRIArray[i]);//Only add player pawns eg Spectator or TournamentPlayer.
		}
	}
}	



function addplayer(PlayerReplicationInfo PRI)
{
local MyPlayerListItem list;
if(PlayerExists(PlayerPawn(PRI.Owner)) || PRI.bIsABot) return;
list =LB.addplayer();
list.PlayerName=PRI.PlayerName;
list.PlayerNum=PRI.PlayerID;
list.country=MHReplicationInfo(PRI).Country;
}

function addblockedplayer(PlayerReplicationInfo PRI)
{
local MyPlayerListItem list;
if(PlayerExists(PlayerPawn(PRI.Owner)) || PRI.bIsABot) return; // already exists in the list.
list =Block.addplayer();
list.PlayerName=PRI.PlayerName;
list.PlayerNum=PRI.PlayerID;
list.country=MHReplicationInfo(PRI).Country;
}

function addmessage(string message)
{
HUD.AddPMmessage(message);
}

function timer()
{
local UWindowList list;
local int i;


if(!bWindowVisible) return;// No need to update players if they are not viewing the window.

if(GRI == none)
	GRI=GetPlayerOwner().GameReplicationInfo;
	
	for(i=0;i<32 && GRI.PRIArray[i]!=none;i++)
	{
		if(!PlayerExists(PlayerPawn(GRI.PRIArray[i].Owner)) 
		&& PlayerPawn(GRI.PRIArray[i].Owner)!=GetPlayerOwner() 
		&& GRI.PRIArray[i].PlayerName != "Player")
		{
			if(HUD.PMContainer.IsBlocked(PlayerPawn(GRI.PRIArray[i].Owner)))
					addblockedplayer(GRI.PRIArray[i]);
				else
					addplayer(GRI.PRIArray[i]);
		}
	}
			
		for(list=LB.Items.next;list!=none;list=list.next)
		{
			if(MyPlayerListItem(list) != none && !PlayerMatchesList(list)){
			   list.remove();
			}
		}
		
		for(list=Block.Items.next;list!=none;list=list.next)
		{
			if(MyPlayerListItem(list) != none && !PlayerMatchesList(list)){
			   list.remove();
			}
		}
}

function bool PlayerMatchesList(UWindowList list)
{
local int i;
	for(i=0;i<32 && GRI.PRIArray[i]!=none ;i++){
		if(GRI.PRIArray[i].PlayerName == MyPlayerListItem(list).Playername)return true;
	}
return false;
}

function bool PlayerExists(PlayerPawn newPlayer)
{
local UWindowList list;
	for(list=LB.Items.next;list!=none;list=list.next){
	if(MyPlayerListItem(list).PlayerName==newplayer.playerreplicationinfo.playername) return true;}
	
	for(list=Block.Items.next;list!=none;list=list.next){
	if(MyPlayerListItem(list).PlayerName==newplayer.playerreplicationinfo.playername) return true;}
	
	return false;
}

function Notify(UWindowDialogControl C, byte E)
{

if( PMLab!=none && SendPM!=none && PMLab.GetValue() == "")
SendPM.bDisabled=true;
else if(PMLab!=none && SendPM!=none) SendPM.bDisabled=false;

	switch(E)
	{
	    case DE_EnterPressed:
			if(C==PMLab && PMLab.GetValue() != "" && LB.selecteditem!=none)
			{
			    AddMessage("["$Right("0"$GetPlayerOwner().Level.Hour,2)$":"$Right("0"$GetPlayerOwner().Level.Minute,2)$"] "$"Me"$":"@PMLab.GetValue());
			    MHReplicationInfo(GetPlayerOwner().PlayerReplicationinfo).SendPM(PMLab.GetValue(),GetPlayerOwner(),GetSelectedItem(LB));
		        PMLab.SetValue("");
    		}
		break;
		case DE_Click:

			if(C == LB)
			{
			if(Getselecteditem(LB) != none)
	            PMLab.SetText(LangObj.default.PMLab@Getselecteditem(LB).PlayerReplicationInfo.PlayerName);
	            else PMLab.SetText(LangObj.default.PMLab@"None");
			}
			if(C==clear)
			{
				History.Clear();
			}
			if(C==Sendpm && !Sendpm.bDisabled && Getselecteditem(LB) != none){
			    AddMessage("["$Right("0"$GetPlayerOwner().Level.Hour,2)$":"$Right("0"$GetPlayerOwner().Level.Minute,2)$"] "$"Me"$":"@PMLab.GetValue());
			    MHReplicationInfo(GetPlayerOwner().PlayerReplicationinfo).SendPM(PMLab.GetValue(),GetPlayerOwner(),GetSelectedItem(LB));
				PMLab.SetValue("");
				}
	
		break;
		case DE_DoubleClick:
		    if(C==LB && LB.selectedItem!=none)
			    {
				HUD.PMContainer.addblocked(MyPlayerListItem(LB.selecteditem));
				LB.moveSelectedPlayerTo(Block);
				if(Getselecteditem(LB) != none)
	            PMLab.SetText(LangObj.default.PMLab@Getselecteditem(LB).PlayerReplicationInfo.PlayerName);
	            else PMLab.SetText(LangObj.default.PMLab@"None");
				//Block.selecteditem=none;
				}
			if(C==Block && Block.Selecteditem!=none)
			    {
				HUD.PMContainer.removeblocked(MyPlayerListItem(Block.selecteditem));
				Block.moveSelectedPlayerTo(LB);
				if(Getselecteditem(LB) != none)
	            PMLab.SetText(LangObj.default.PMLab@Getselecteditem(LB).PlayerReplicationInfo.PlayerName);
	            else PMLab.SetText(LangObj.default.PMLab@"None");
				}
		break;
	}
		SaveConfigs();
}

function PlayerPawn GetSelectedItem(MyPlayerListBox list)
{
local int i;

for(i=0;i<ArrayCount(GRI.PRIArray);i++)
{
if ( list != none && list.selecteditem != none && MyPlayerListItem(list.selecteditem).playername ~= GRI.PRIArray[i].PlayerName && PlayerPawn(GRI.PRIArray[i].Owner) != none)//Find matching name.
    return PlayerPawn(GRI.PRIArray[i].Owner);
}

return none;
}
/***************************************************************************************************
 *
 *  $DESCRIPTION  Adds a new dynamic text area control component to the current region.
 *  $REQUIRE      0 <= currRegion && currRegion < regionCount
 *  $RETURN       The dynamic text area control that has been added to the panel.
 *  $ENSURE       result != none
 *
 **************************************************************************************************/
function UWindowListBox addListBox(class<UWindowListBox> listBoxClass, int in) {
	local MyMapListFrameCW frame;
	local UWindowListBox listBox;
	
	frame = MyMapListFrameCW(Createwindow(class'MyMapListFrameCW', in , 20 , 150, 150 ));
	listBox = UWindowListBox(CreateControl(listBoxClass, in , 20 , 150, 150 ));
	frame.frame.setFrame(listBox);
	
	return listBox;
}

function Paint(Canvas C, float X, Float Y)
{
Super.Paint(C,X,Y);
C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
//Draw the nice background.
DrawStretchedTextureSegment( C, 0, 0, 544, 512, 0, 0, 544, 512, Texture'BackgroundTwo' );
}


function AfterCreate()
{
	Super.AfterCreate();
}

function SaveConfigs()
{
Super.SaveConfigs();
HUD.SaveConfig();//Not too bad, better using dynamic so no player need reconnect! :D
}

function UWindowDynamicTextArea addDynamicTextArea() {
	local MyMapListFrameCW frame;
	local UWindowDynamicTextArea textArea;
	
	frame = MyMapListFrameCW(createwindow(class'MyMapListFrameCW', 44, 200, 450, 200));
	textArea = UWindowDynamicTextArea(CreateControl(class'UWindowDynamicTextArea', 44, 200, 450, 200));
	textArea.setTextColor(lookAndFeel.editBoxTextColor);
    textArea.bTopCentric = false;
	frame.frame.setFrame(textArea);
	
	return textArea;
}

defaultproperties
{
}
