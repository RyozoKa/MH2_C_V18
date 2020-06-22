class Monster2MenuItem expands UMenuModMenuItem;

function Execute()
{
	MenuItem.Owner.Root.CreateWindow(class'MH2_C_V18.Monster2CreditsWindow', 100, 100, 100, 100);
}

defaultproperties
{
     MenuCaption="&Monster Hunt Credits - Personal Edition"
     MenuHelp="The most of the people behind Monster Hunt!"
}
