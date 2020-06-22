//=============================================================================
// FL_ModMenuItem.
//=============================================================================
class FL_ModMenuItem expands UMenuModMenuItem;

function Execute()
{
	MenuItem.Owner.Root.CreateWindow(class'FL_FramedWindow',0,0,125,95);
}

defaultproperties
{
}
