//=============================================================================
// Standard Item List Box
//=============================================================================

class MyItemListBox extends UWindowListBox;

var color baseColor;
var color selectColor;

function drawItem(Canvas c, UWindowList item, float x, float y, float w, float h) {
	local int offsetX;
	local texture flagTex;
	local color backgroundColor;
	local float X2,Y2;
	
	// Draw background.
	//backgroundColor = getBackgroundColor(MyPlayerListItem(item));
	//if (backgroundColor != baseColor) {
		c.drawColor = basecolor;
	c.style=getplayerowner().ERenderstyle.STY_Normal;
	if(MyItemListItem(item).bSelected)
		drawStretchedTexture(c, x, y, w, h, Texture'selected');
	else
	drawStretchedTexture(c, x, y, w, h, Texture'unselected');

	offsetX = 6;
	
	//C.StrLen(getDisplayText(MyItemListItem(item)),X2,Y2);
	
	
	// Draw text.
	if(Item == none) return;
	c.drawColor = getDisplayColor(MyItemListItem(item));
	c.font = getDisplayFont(MyItemListItem(item));
	clipText(c, x + offsetX,y + 6, getDisplayText(MyItemListItem(item)));
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Called when an item was double clicked on.
 *  $PARAM        item  The item which was double clicked.
 *  $REQUIRE      item != none
 *  $OVERRIDE
 *
 **************************************************************************************************/
function doubleClickItem(UWindowListBoxItem item) {
	if (notifyWindow != none) {
		notifyWindow.notify(self, DE_DoubleClick);
	}
}


function SetSelectedItem(UWindowListBoxItem NewSelected)
{
	if(NewSelected != None && SelectedItem != NewSelected)
	{
		if(SelectedItem != None)
			SelectedItem.bSelected = False;

		SelectedItem = NewSelected;

		if(SelectedItem != None)
			SelectedItem.bSelected = True;
		
		Notify(DE_Click);
	}
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Returns the font in which the text should be displayed for a list item.
 *  $PARAM        item  The item for which its display font has to be determined.
 *  $REQUIRE      item != none
 *  $RETURN       The font in which the text should be displayed for the specified item.
 *
 **************************************************************************************************/
function font getDisplayFont(MyItemListItem item) {
	return root.fonts[F_Normal];
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Returns the text displayed for a list item.
 *  $PARAM        item  The item for which its display text has to be determined.
 *  $REQUIRE      item != none
 *  $RETURN       The text that should be displayed for the specified item in the listbox.
 *
 **************************************************************************************************/
function string getDisplayText(MyItemListItem item) {
	return item.ItemName;
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Returns the color of the background in which the text should be displayed for a
 *                list item.
 *  $PARAM        item  The item for which its background color has to be determined.
 *  $REQUIRE      item != none
 *  $RETURN       The background color of the the specified item.
 *
 **************************************************************************************************/
function color getBackgroundColor(MyPlayerListItem item) {
	if (item.bSelected) {
		return baseColor;
	} else {
		return baseColor;
	}
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Returns the color in which the text should be displayed for a list item.
 *  $PARAM        item  The item for which its display color has to be determined.
 *  $REQUIRE      item != none
 *  $RETURN       The color in which the text should be displayed for the specified item.
 *
 **************************************************************************************************/
function color getDisplayColor(MyItemListItem item) {
    if(item.bSelected)
	return class'staticopers'.static.setcolor(0,0,0);
	else return class'staticopers'.static.setcolor(0,0,0);
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Adds a new player to the list.
 *  $RETURN       The player item that was added to the list.
 *  $ENSURE       result != none
 *
 **************************************************************************************************/
function MyItemListItem addItem() {
	return MyItemListItem(items.append(class'MyItemListItem'));
}




/***************************************************************************************************
 *
 *  $DESCRIPTION  Retrieves the player item with the specified player number.
 *  $PARAM        playerNum  Indicates the player to return.
 *  $REQUIRE      playerNum >= 0
 *  $RETURN       The player item that has the specified player number, or none if there is no 
 *                player item with the specified player number.
 *
 **************************************************************************************************/
function MyItemListItem GetItem(string ItemName) {
	local MyItemListItem item;

	// Search for ItemName.
	for (item = MyItemListItem(items); item != none; item = MyItemListItem(item.next)) {
		if (item.ItemName ~= ItemName) {
			return item;
		}
	}
	
	// ItemName not found, return none.
	return none;
}

defaultproperties
{
     BaseColor=(R=255,G=255,B=255)
     selectColor=(R=250,G=200,B=150)
     ItemHeight=32.000000
     ListClass=Class'MH2_C_V18.MyItemListItem'
}
