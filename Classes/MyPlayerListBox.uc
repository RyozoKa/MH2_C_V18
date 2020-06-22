//=============================================================================
// Player List Box
//=============================================================================

#exec TEXTURE IMPORT NAME=noCountry FILE=Textures/noCountry.bmp FLAGS=2 MIPS=OFF
#exec TEXTURE IMPORT NAME=selected FILE=Textures/EditBox_checked.bmp MIPS=ON
#exec TEXTURE IMPORT NAME=unselected FILE=Textures/EditBox_unchecked.bmp MIPS=ON
class MyPlayerListBox extends UWindowListBox;

var color baseColor;
var color selectColor;
var MyPMLog OwnerWind;
/***************************************************************************************************
 *
 *  $DESCRIPTION  Renders the specified listbox item.
 *  $PARAM        c     The canvas object on which the rendering will be performed.
 *  $PARAM        item  Item to render.
 *  $PARAM        x     Horizontal offset on the canvas.
 *  $PARAM        y     Vertical offset on the canvas.
 *  $PARAM        w     Width of the item that is to be rendered.
 *  $PARAM        h     Height of the item that is to be rendered.
 *  $REQUIRE      c != none && item != none
 *  $OVERRIDE
 *
 **************************************************************************************************/
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
	if(MyPlayerListItem(item).bSelected)
		drawStretchedTexture(c, x, y, w, h, Texture'selected');
	else
	drawStretchedTexture(c, x, y, w, h, Texture'unselected');
	//}
	
	// Draw country flag.
	offsetX = 4;
	
		c.drawColor = baseColor;
		flagTex = MyPlayerListItem(item).getFlagTex();
		if (flagTex == none) {
			flagTex = texture'noCountry';
		}
		drawClippedTexture(c, x + offsetX, y + 5.5, flagTex);
		offsetX += 18;
	C.StrLen(getDisplayText(MyPlayerListItem(item)),X2,Y2);
	
	// Draw text.
	if(Item == none) return;
	c.drawColor = getDisplayColor(MyPlayerListItem(item));
	c.font = getDisplayFont(MyPlayerListItem(item));
	clipText(c, x + offsetX, y + 6.5, getDisplayText(MyPlayerListItem(item)));
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
	
	if( OwnerWind!=none && OwnerWind.LB!=none && SelectedItem != none && OwnerWind.LB.SelectedItem!=none && SelectedItem==OwnerWind.LB.SelectedItem && OwnerWind.Block.SelectedItem!=none)
	{
	OwnerWind.Block.SelectedItem.bSelected=false;
	OwnerWind.Block.SelectedItem=none;
	}
	
	if( OwnerWind!=none && OwnerWind.Block!=none && SelectedItem != none && OwnerWind.Block.SelectedItem!=none && SelectedItem==OwnerWind.Block.SelectedItem && OwnerWind.LB.SelectedItem != none)
	{
	OwnerWind.LB.SelectedItem.bSelected=false;
	OwnerWind.LB.SelectedItem=none;
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
function font getDisplayFont(MyPlayerListItem item) {
	return root.fonts[F_Bold];
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Returns the text displayed for a list item.
 *  $PARAM        item  The item for which its display text has to be determined.
 *  $REQUIRE      item != none
 *  $RETURN       The text that should be displayed for the specified item in the listbox.
 *
 **************************************************************************************************/
function string getDisplayText(MyPlayerListItem item) {
	return item.playerName;
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
function color getDisplayColor(MyPlayerListItem item) {
    if(item.bSelected)
	return class'staticopers'.static.setcolor(255,255,255);
	else return class'staticopers'.static.setcolor(0,0,0);
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Adds a new player to the list.
 *  $RETURN       The player item that was added to the list.
 *  $ENSURE       result != none
 *
 **************************************************************************************************/
function MyPlayerListItem addPlayer() {
	return MyPlayerListItem(items.append(class'MyPlayerListItem'));
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Removes the player with the specified player code from the list.
 *  $PARAM        playerNum  The player to remove.
 *  $REQUIRE      playerNum >= 0
 *  $ENSURE       getPlayer(playerNum) == none
 *
 **************************************************************************************************/
function removePlayer(string playerNum) {
	local MyPlayerListItem item;

	// Search for player.
	for (item = MyPlayerListItem(items); item != none; item = MyPlayerListItem(item.next)) {
		if (item.playerName == playerNum) {
			item.remove();
		}
	}
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
function MyPlayerListItem getPlayer(string PlayerName) {
	local MyPlayerListItem item;

	// Search for player.
	for (item = MyPlayerListItem(items); item != none; item = MyPlayerListItem(item.next)) {
		if (item.PlayerName ~= PlayerName) {
			return item;
		}
	}
	
	// Player not found, return none.
	return none;
}



/***************************************************************************************************
 *
 *  $DESCRIPTION  Moves the selected item to the specified player listbox.
 *  $PARAM        target  The player listbox where the currently selected item should be moved to.
 *  $REQUIRE      target != none
 *  $ENSURE       selectedItem == none
 *
 **************************************************************************************************/
function moveSelectedPlayerTo(MyPlayerListBox target) {
	local MyPlayerListItem item;
	
	if (selectedItem != none) {
		item = target.addPlayer();
		MyPlayerListItem(selectedItem).copyTo(item);
		selectedItem.remove();
		selectedItem = none;
		target.setSelectedItem(item);
	}
}

defaultproperties
{
     BaseColor=(R=255,G=255,B=255)
     selectColor=(R=250,G=200,B=150)
     ItemHeight=32.000000
     ListClass=Class'MH2_C_V18.MyPlayerListItem'
}
