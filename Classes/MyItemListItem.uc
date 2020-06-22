//=============================================================================
// Player List Box
//=============================================================================
class MyItemListItem extends UWindowListBoxItem;

var string ItemName;
var byte ItemNum;
var color colour;

function copyTo(MyItemListItem target) {
	target.ItemName = self.ItemName;
	target.ItemNum = self.ItemNum;

}

defaultproperties
{
}
