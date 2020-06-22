class MyTabControlTabArea extends UWindowWindow;
#exec texture import file=Textures/back.pcx name=backborder
#exec texture import file=Textures/MouseOver.pcx name=MouseOver
#exec texture import file=Textures/MouseDown.pcx name=MouseDown
var int TabOffset;
var bool bShowSelected;
var UWindowTabControlItem FirstShown;
var bool bDragging;
var UWindowTabControlItem DragTab;
var int TabRows;
var globalconfig bool bArrangeRowsLikeTimHates;
var float UnFlashTime;
var bool bFlashShown;

function Created()
{
	TabOffset = 0;
	Super.Created();
}

function SizeTabsSingleLine(Canvas C)
{
	local UWindowTabControlItem I, Selected, LastHidden;
	local int Count, TabCount;
	local float ItemX, W, H;
	local bool bHaveMore;

	ItemX = LookAndFeel.Size_TabXOffset;
	TabCount=0;
	for( 
			I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
			I != None; 
			I = UWindowTabControlItem(I.Next) 
		)
	{
		Tab_GetTabSize( C, RemoveAmpersand(I.Caption), W, H);
		I.TabWidth = W;
		I.TabHeight = H;
		I.TabTop = 0;
		I.RowNumber = 0;
		TabCount++;
	}

	Selected = UWindowTabControl(ParentWindow).SelectedTab;
	
	while(True)
	{
		ItemX = 1;
		Count = 0;
		LastHidden = None;
		FirstShown = None;
		for( 
				I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
				I != None; 
				I = UWindowTabControlItem(I.Next) 
			)
		{
			if( Count < TabOffset)
			{
				I.TabLeft = -1;
				LastHidden = I;
			}
			else
			{
				if(FirstShown == None) FirstShown = I;
				I.TabLeft = ItemX;
				if(I.TabLeft + I.TabWidth >= WinWidth + 32) bHaveMore = True;
				ItemX += I.TabWidth;
			}
			Count++;

		}

		if( TabOffset > 0 && LastHidden != None && LastHidden.TabWidth + 5 < WinWidth - ItemX)
			TabOffset--;
		else 
		if(	bShowSelected && TabOffset < TabCount - 1 
			&&	Selected != None &&	Selected != FirstShown 
			&& Selected.TabLeft + Selected.TabWidth > WinWidth - 5
		  ) 
			TabOffset++;
		else				
			break;
	}
	bShowSelected = False;

	MyPageControl(ParentWindow).NewLeftButton.bDisabled = TabOffset <= 0;
	MyPageControl(ParentWindow).NewRightButton.bDisabled = !bHaveMore;
	TabRows = 1;
}

function SizeTabsMultiLine(Canvas C)
{
	local UWindowTabControlItem I, Selected;
	local float W, H;
	local int MinRow;
	local float RowWidths[10];
	local int TabCounts[10];
	local int j;
	local bool bTryAnotherRow;
		
	TabOffset = 0;
	FirstShown = None;

	TabRows = 1;
	bTryAnotherRow = True;

	while(bTryAnotherRow && TabRows <= 10)
	{	
		bTryAnotherRow = False;
		for(j=0;j<TabRows;j++)
		{
			RowWidths[j] = 0;
			TabCounts[j] = 0;		
		}

		for( 
				I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
				I != None; 
				I = UWindowTabControlItem(I.Next) 
			)
		{
			Tab_GetTabSize( C, RemoveAmpersand(I.Caption), W, H);
			I.TabWidth = W;
			I.TabHeight = H;

			// find the best row for this tab
			MinRow = 0;
			for(j=1;j<TabRows;j++)
				if(RowWidths[j] < RowWidths[MinRow])
					MinRow = j;

			if(RowWidths[MinRow] + W > WinWidth)
			{
				TabRows ++;
				bTryAnotherRow = True;
				break;
			}
			else
			{
				RowWidths[MinRow] += W;
				TabCounts[MinRow]++;
				I.RowNumber = MinRow;
			}
		}
	}

	Selected = UWindowTabControl(ParentWindow).SelectedTab;

	if(TabRows > 1)
	{
		for( 
				I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
				I != None; 
				I = UWindowTabControlItem(I.Next) 
			)
		{
			I.TabWidth += (WinWidth - RowWidths[I.RowNumber]) / TabCounts[I.RowNumber];
		}
	}

	for(j=0;j<TabRows;j++)
		RowWidths[j] = 0;

	for( 
			I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
			I != None; 
			I = UWindowTabControlItem(I.Next) 
		)
	{
		I.TabLeft = RowWidths[I.RowNumber];

		if(bArrangeRowsLikeTimHates)
			I.TabTop = ((I.RowNumber + ((TabRows - 1) - Selected.RowNumber)) % TabRows) * I.TabHeight;
		else
			I.TabTop = I.RowNumber * I.TabHeight;

		RowWidths[I.RowNumber] += I.TabWidth;
	}
}

function Tab_GetTabSize(Canvas C, string Text, out float W, out float H)
{
	local float TW, TH;

	//C.Font = Root.Fonts[F_Bold];

	//TextSize( C, Text, TW, TH );
	W = 128;//TW + LookAndFeel.Size_TabSpacing;
	H = 32;//LookAndFeel.Size_TabAreaHeight;
}

function LayoutTabs(Canvas C)
{
	//if(UWindowTabControl(ParentWindow).bMultiLine)
	//	SizeTabsMultiLine(C);
	//else
		SizeTabsSingleLine(C);
}

function Paint(Canvas C, float X, float Y)
{
	local UWindowTabControlItem I;
	local int Count;
	local int Row;
	local float T;
	
	T = GetEntryLevel().TimeSeconds;

	if(UnFlashTime < T)
	{
		bFlashShown = !bFlashShown;

		if(bFlashShown)
			UnFlashTime = T + 0.5;
		else
			UnFlashTime = T + 0.3;
	}
	
	for(Row=0;Row<TabRows;Row++)
	{
		Count = 0;
		for( 
				I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
				I != None; 
				I = UWindowTabControlItem(I.Next) 
			)
		{
			if( Count < TabOffset)
			{
				Count++;
				continue;
			}
			if(I.RowNumber == Row)
				DrawItem(C, I, I.TabLeft, I.TabTop, I.TabWidth, 32, (!I.bFlash) || bFlashShown);
		}
	}
}

function LMouseDown(float X, float Y)
{
	local UWindowTabControlItem I;
	local int Count;

	Super.LMouseDown(X, Y);

	Count = 0;
	for( 
			I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
			I != None; 
			I = UWindowTabControlItem(I.Next) 
		)
	{
		if( Count < TabOffset)
		{
			Count++;
			continue;
		}
		if( X >= I.TabLeft && X <= I.TabLeft + I.TabWidth && (TabRows==1 || (Y >= I.TabTop && Y <= I.TabTop + I.TabHeight)) )
		{
			if(!UWindowTabControl(ParentWindow).bMultiLine)
			{
				bDragging = True;
				DragTab = I;
				Root.CaptureMouse();
			}
			UWindowTabControl(ParentWindow).GotoTab(I, True);
		}
	}
}

function MouseMove(float X, float Y)
{
	if(bDragging && bMouseDown)
	{
		if(X < DragTab.TabLeft)
			TabOffset++;

		if(X > DragTab.TabLeft + DragTab.TabWidth && TabOffset > 0)
			TabOffset--;	
	}
	else
		bDragging = False;
}

function RMouseDown(float X, float Y)
{
	local UWindowTabControlItem I;
	local int Count;

	Super.LMouseDown(X, Y);

	Count = 0;
	for( 
			I = UWindowTabControlItem(UWindowTabControl(ParentWindow).Items.Next);
			I != None; 
			I = UWindowTabControlItem(I.Next) 
		)
	{
		if( Count < TabOffset)
		{
			Count++;
			continue;
		}
		if( X >= I.TabLeft && X <= I.TabLeft + I.TabWidth )
		{
			I.RightClickTab();
		}
	}
}

function DrawItem(Canvas C, UWindowList Item, float X, float Y, float W, float H, bool bShowText)
{
	if(Item == UWindowTabControl(ParentWindow).SelectedTab)
		Tab_DrawTab( C, True, FirstShown==Item, X, Y, W, H, UWindowTabControlItem(Item).Caption, bShowText);
	else
		Tab_DrawTab( C, False, FirstShown==Item, X, Y, W, H, UWindowTabControlItem(Item).Caption, bShowText);
}


function Tab_DrawTab( Canvas C, bool bActiveTab, bool bLeftmostTab, float X, float Y, float W, float H, string Text, bool bShowText)
{
	local Region R;
	local Texture T;
	local float TW, TH;

	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;

	T = GetLookAndFeelTexture();
	
	if(bActiveTab)
	{
		//R = LookAndFeel.TabSelectedL;
		//DrawStretchedTextureSegment( C, X, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );

		//R = LookAndFeel.TabSelectedM;
		DrawStretchedTextureSegment( C, X, Y, W, H, 0 , 0, 128, 32, texture'MouseOver' );

		//R = LookAndFeel.TabSelectedR;
		//DrawStretchedTextureSegment( C, X + W - R.W, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );

		C.Font = Root.Fonts[F_Normal];
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;

		if(bShowText)
		{
			TextSize(C, Text, TW, TH);
			ClipText(C, X + (W-TW)/2, Y + 3, Text, True);
		}
	}
	else
	{
		//R = LookAndFeel.TabUnselectedL;
		//DrawStretchedTextureSegment( C, X, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );

		//R = LookAndFeel.TabUnselectedM;
		//DrawStretchedTextureSegment( C, X+LookAndFeel.TabUnselectedL.W, Y, 
		//								W - LookAndFeel.TabUnselectedL.W
		//								- LookAndFeel.TabUnselectedR.W,
		//								R.H, R.X, R.Y, R.W, R.H, T );
//
		//R = LookAndFeel.TabUnselectedR;
		//DrawStretchedTextureSegment( C, X + W - R.W, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );

		//C.Font = Root.Fonts[F_Normal];
		//C.DrawColor.R = 0;
		//C.DrawColor.G = 0;
		//C.DrawColor.B = 0;
		
		DrawStretchedTextureSegment( C, X, Y, W, H, 0 , 0, 128, 32, texture'MouseDown' );

		if(bShowText)
		{
			C.Font = Root.Fonts[F_Normal];
			TextSize(C, Text, TW, TH);
			ClipText(C, X + (W-TW)/2, Y + 4, Text, True);
		}
	}
}


function bool CheckMousePassThrough(float X, float Y)
{
	return Y >= 32*TabRows;
}

defaultproperties
{
}
