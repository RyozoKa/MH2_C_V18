class MyPageControlPage extends UWindowTabControlItem;

var UWindowPageWindow	Page;

function RightClickTab()
{
	Page.RightClickTab();
}

function MyPageControlPage NextPage()
{
	return MyPageControlPage(Next);
}

defaultproperties
{
}
