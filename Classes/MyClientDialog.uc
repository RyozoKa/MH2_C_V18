//

//Created by chris 2014-04-17
class MyClientDialog expands UWindowPageWindow;

var MySecondEditControl User, Password;
var MyCheckBox Show, Remember;
var CMonsterHUD HUD;
var class<MyLanguageClass> LangObj;
var string Text;
var MySmallButton Login, logOut;
function Created()
{
Super.Created();

	HUD=CMonsterHUD(GetPlayerOWner().MyHUD);
	LangObj=HUD.LangObj;
	Text=LangObj.default.L_PendingDetails;
	
	remember = MyCheckBox(CreateControl(class'MyCheckBox', 20, 90, 200, 1));
	remember.SetTextColor(class'staticopers'.static.setcolor(0,255,0));
	remember.SetText(LangObj.default.remember);
	remember.SetFont(F_Normal);
	remember.bChecked = (GetPlayerOwner().GetDefaultURL("Login") != "");
	
	User = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 20 , 200, 1 ));
	//User.SetTextColor(Colors);
	User.SetText(LangObj.default.User);
	User.SetNumericOnly( False ) ;
	User.SetHistory( False ) ;
	User.SetTextColor(class'staticopers'.static.setcolor(0,255,0));
		if(Remember.bChecked)
		{
		User.SetValue(Left(GetPlayerOwner().GetDefaultURL("Login"),InStr(GetPlayerOwner().GetDefaultURL("Login"),":")));
		}

	
	Password = MySecondEditControl(CreateControl(Class'MySecondEditControl', 20 , 50 , 200, 1 ));
	//Password.SetTextColor(Colors);
	Password.SetText(LangObj.default.Password);
	Password.SetNumericOnly( False ) ;
	Password.SetHistory( False ) ;
	Password.SetTextColor(class'staticopers'.static.setcolor(0,255,0));
	Password.EditBox.bPassword=True;
	if(Remember.bChecked)
		{
		Password.SetValue(Mid(GetPlayerOwner().GetDefaultURL("Login"),InStr(GetPlayerOwner().GetDefaultURL("Login"),":")+1));
		}
	
	Show = MyCheckBox(CreateControl(class'MyCheckBox', 20, 70, 200, 1));
	Show.SetTextColor(class'staticopers'.static.setcolor(0,255,0));
	Show.SetText(LangObj.default.Show);
	Show.SetFont(F_Normal);
	Show.bChecked = false;
	

	
	Login = MySmallButton(CreateControl(Class'MySmallButton', 20 , 111 , 64, 1 ));
	Login.WinHeight=16;
	Login.SetText(LangObj.default.Login);
	
		if(GetPlayerOwner().PlayerReplicationInfo!=none && GetPlayerOwner().PlayerReplicationInfo.bAdmin){
		login.SetText(LangObj.default.logOut);
		Text=LangObj.default.L_Sucess;}
	else if(GetPlayerOwner().PlayerReplicationInfo!=none) login.SetText(LangObj.default.login);
	
	//logOut = MySmallButton(CreateControl(Class'MySmallButton', 124 , 111 , 64, 1 ));
	//logOut.WinHeight=16;
	//logOut.SetText(LangObj.default.logOut);
}

function AfterCreate()
{
	Super.AfterCreate();
	DesiredWidth = 256;
	DesiredHeight = 256;
}

function Notify(UWindowDialogControl C, byte E)
{
if(GetPlayerOwner() == none || MHReplicationInfo(GetPlayerOwner().PlayerReplicationInfo) == none) return;
	if(GetPlayerOwner().PlayerReplicationInfo!=none && GetPlayerOwner().PlayerReplicationInfo.bAdmin){
		login.SetText(LangObj.default.logOut);
		Text=LangObj.default.L_Sucess;}
	else if(GetPlayerOwner().PlayerReplicationInfo!=none) login.SetText(LangObj.default.login);
	
	switch(E)
	{	
		//case DE_EnterPressed:
		//break;
		case DE_Click:
		if(C==Login && GetPlayerOwner().PlayerReplicationInfo != none && !GetPlayerOwner().PlayerReplicationInfo.bAdmin)
		{
			if(User.GetValue() != "" && Password.GetValue() != "")
			{
			
			if(Remember.bChecked)
			{
			GetPlayerOwner().UpdateURL("Login",User.GetValue()$":"$Password.GetValue(),true);
			}
			
			Text=LangObj.default.L_AtemptLogin;
				//if(MHReplicationInfo(GetPlayerOwner().PlayerReplicationInfo).AttemptLogin(User.GetValue(),Password.GetValue(),GetPlayerOwner())){
			//	}
				MHReplicationInfo(GetPlayerOwner().PlayerReplicationInfo).AttemptLogin(User.GetValue(),Password.GetValue(),GetPlayerOwner());
			//	if(GetPlayerOwner().PlayerReplicationInfo.bAdmin){
					//HUD.MainClientWindow.GiveAdminTabs();
				//}
				Text=LangObj.default.L_MissingValue;
			}			
			else Text=LangObj.default.L_MissingValue;
			
			
			
		}
		else if(C==login && GetPlayerOwner().PlayerReplicationInfo != none && GetPlayerOwner().PlayerReplicationInfo.bAdmin)
		{
			GetPlayerOwner().ConsoleCommand("Adminlogout");
		}

		break;
		case DE_Change:
		if(C==Show)
			Password.EditBox.bPassword = !Show.bChecked;
		if(C==Remember)
		{
			if(Remember.bChecked && GetPlayerOwner().PlayerReplicationInfo != none && !GetPlayerOwner().PlayerReplicationInfo.bAdmin)
			{
				GetPlayerOwner().UpdateURL("Login",User.GetValue()$":"$Password.GetValue(),true);
			}
			else if(!Remember.bChecked)
			{
				GetPlayerOwner().UpdateURL("Login","",true);
			}
		}
			
		break;
	}
	super.Notify(C,E);
}

function Paint(Canvas C, float X, float Y)
{
//Super.Paint(C,X,Y);
C.DrawColor=class'staticopers'.static.setcolor(255,255,255);
C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
DrawStretchedTextureSegment( C, 0, 0, winwidth, winheight, 0, 0, 1, 1, Texture'Shade' );

C.Style = GetPlayerOwner().ERenderStyle.STY_Modulated;
DrawStretchedTextureSegment( C, 20, 130, 200, 50, 0, 0, 1, 1, Texture'Shade' );
C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
C.DrawColor=class'staticopers'.static.setcolor(0,255,0);
ClipText(C, 23, 133, LangObj.default.MyStatus);
ClipText(C, 23, 145, Text);

if(GetPlayerOwner().PlayerReplicationInfo.bAdmin){
	Text=LangObj.default.L_Sucess;
	HUD.MainClientWindow.GiveAdminTabs();
}
				
}

function ChangeLan()
{
LangObj=HUD.LangObj;
Show.SetText(LangObj.default.Show);
Password.SetText(LangObj.default.Password);
User.SetText(LangObj.default.User);
Text=LangObj.default.L_PendingDetails;
}

function SaveConfigs()
{
	Super.SaveConfigs();
}

defaultproperties
{
}
