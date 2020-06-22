class MyPageControl extends UWindowTabControl;

var MyTabControlTabArea NewTabArea;

var MyTabControlLeftButton NewLeftButton;
var MyTabControlRightButton NewRightButton;

function Created()
{
	Super(UWindowListControl).Created();

	SelectedTab = None;

	NewTabArea = MyTabControlTabArea(CreateWindow(class'MyTabControlTabArea', 
					0, 0, 512,
					 32));

	NewTabArea.bAlwaysOnTop = True;

	NewLeftButton = MyTabControlLeftButton(CreateWindow(class'MyTabControlLeftButton', 0, 0, 16, 32));
	NewRightButton = MyTabControlRightButton(CreateWindow(class'MyTabControlRightButton', 528, 0, 16, 32));
}

function ResolutionChanged(float W, float H)
{
	local UWindowPageControlPage I;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
		if(I.Page != None && I != SelectedTab )
			I.Page.ResolutionChanged(W, H);
	
	if(SelectedTab != None)
		UWindowPageControlPage(SelectedTab).Page.ResolutionChanged(W, H);
}

function SetMultiLine(bool InMultiLine)
{
	//Nulled because of nones, multilines is never used for my design anyway.
}

function NotifyQuitUnreal()
{
	local UWindowPageControlPage I;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
		if(I.Page != None)
			I.Page.NotifyQuitUnreal();
}

function NotifyBeforeLevelChange()
{
	local UWindowPageControlPage I;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
		if(I.Page != None)
			I.Page.NotifyBeforeLevelChange();
}

function NotifyAfterLevelChange()
{
	local UWindowPageControlPage I;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
		if(I.Page != None)
			I.Page.NotifyAfterLevelChange();
}

function GetDesiredDimensions(out float W, out float H)
{
	local float MaxW, MaxH, TW, TH;
	local UWindowPageControlPage I;
	
	MaxW = 0;
	MaxH = 0;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
	{
		if(I.Page != None)
			I.Page.GetDesiredDimensions(TW, TH);

		if(TW > MaxW) MaxW = TW;
		if(TH > MaxH) MaxH = TH;
	}
	W = MaxW;
	H = 32;//MaxH + NewTabArea.WinHeight;
}


function BeforePaint(Canvas C, float X, float Y)
{
	local float OldWinHeight;
	local UWindowPageControlPage I;

	OldWinHeight = WinHeight;
	NewTabArea.WinTop = 0;
	NewTabArea.WinLeft = 16;

	//if(bMultiLine)
	//	NewTabArea.WinWidth = WinWidth;
	//else
		//NewTabArea.WinWidth = 512;

	NewTabArea.LayoutTabs(C);
	WinHeight = 32;
	NewTabArea.WinHeight = WinHeight;
	Super(UWindowListControl).BeforePaint(C, X, Y);
	WinHeight = OldWinHeight;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
		Tab_SetTabPageSize(Self, I.Page);
}

function Tab_SetTabPageSize(MyPageControl W, UWindowPageWindow P)
{
	P.WinLeft = 2;
	P.WinTop = W.NewTabArea.WinHeight-(LookAndFeel.TabSelectedM.H-LookAndFeel.TabUnselectedM.H) + 3;
	P.SetSize(W.WinWidth - 4, W.WinHeight-(W.NewTabArea.WinHeight-(LookAndFeel.TabSelectedM.H-LookAndFeel.TabUnselectedM.H)) - 6);
}

function Paint(Canvas C, float X, float Y)
{
	DrawStretchedTextureSegment( C, 0, 0, WinWidth, 32, 0, 0, 512, 32, texture'backborder' );
	//Tab_DrawTabPageArea( C, UWindowPageControlPage(SelectedTab).Page);
}

function Tab_DrawTabPageArea( Canvas C, UWindowPageWindow P)
{
	DrawUpBevel( C, 0, NewTabArea.WinHeight-(LookAndFeel.TabSelectedM.H-LookAndFeel.TabUnselectedM.H), WinWidth, WinHeight-(NewTabArea.WinHeight-(LookAndFeel.TabSelectedM.H-LookAndFeel.TabUnselectedM.H)), GetLookAndFeelTexture());
}

function UWindowPageControlPage AddPage(string Caption, class<UWindowPageWindow> PageClass, optional name ObjectName)
{
	local UWindowPageControlPage P;
	P = UWindowPageControlPage(AddTab(Caption));
	P.Page = UWindowPageWindow(CreateWindow(PageClass, 0, 
				30, 
				WinWidth, 512,,,ObjectName));
	P.Page.OwnerTab = P;

	if(P != SelectedTab) 
		P.Page.HideWindow();
	else
	if(UWindowPageControlPage(SelectedTab) != None && WindowIsVisible())
	{
		UWindowPageControlPage(SelectedTab).Page.ShowWindow();
		UWindowPageControlPage(SelectedTab).Page.BringToFront();
	}

	return P;
}

function UWindowPageControlPage InsertPage(UWindowPageControlPage BeforePage, string Caption, class<UWindowPageWindow> PageClass, optional name ObjectName)
{
	local UWindowPageControlPage P;

	if(BeforePage == None)
		return AddPage(Caption, PageClass);

	P = UWindowPageControlPage(InsertTab(BeforePage, Caption));
	P.Page = UWindowPageWindow(CreateWindow(PageClass, 0, 
				NewTabArea.WinHeight-(LookAndFeel.TabSelectedM.H-LookAndFeel.TabUnselectedM.H), 
				WinWidth, WinHeight-(TabArea.WinHeight-(LookAndFeel.TabSelectedM.H-LookAndFeel.TabUnselectedM.H)),,,ObjectName));
	P.Page.OwnerTab = P;

	if(P != SelectedTab) 
		P.Page.HideWindow();
	else
	if(UWindowPageControlPage(SelectedTab) != None && WindowIsVisible())
	{
		UWindowPageControlPage(SelectedTab).Page.ShowWindow();
		UWindowPageControlPage(SelectedTab).Page.BringToFront();
	}

	return P;
}

function UWindowPageControlPage GetPage(string Caption)
{
	return UWindowPageControlPage(GetTab(Caption));
}

function DeletePage(UWindowPageControlPage P)
{
	P.Page.Close(True);
	P.Page.HideWindow();
	DeleteTab(P);
}

function Close(optional bool bByParent)
{
	local UWindowPageControlPage I;

	for(I = UWindowPageControlPage(Items.Next); I != None; I = UWindowPageControlPage(I.Next))
		if(I.Page != None)
			I.Page.Close(True);

	Super.Close(bByParent);
}

function GotoTab(UWindowTabControlItem NewSelected, optional bool bByUser)
{
	local UWindowPageControlPage I;

	if(SelectedTab != NewSelected && bByUser)
		LookAndFeel.PlayMenuSound(Self, MS_ChangeTab);
	SelectedTab = NewSelected;
	NewTabArea.bShowSelected = True;


	for(I = UWindowPageControlPage(Items.Next);I != None;I = UWindowPageControlPage(I.Next))
	{
		if(I != NewSelected)
			I.Page.HideWindow();			
	}

	if(UWindowPageControlPage(NewSelected) != None)
		UWindowPageControlPage(NewSelected).Page.ShowWindow();
}

function UWindowPageControlPage FirstPage()
{
	return UWindowPageControlPage(Items.Next);
}

defaultproperties
{
     ListClass=Class'UWindow.UWindowPageControlPage'
}
