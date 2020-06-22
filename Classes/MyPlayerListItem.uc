//=============================================================================
// Player List Box
//=============================================================================
class MyPlayerListItem extends UWindowListBoxItem;

var string PlayerName;
var byte PlayerNum;
var string country;
var texture FlagTex;

function texture getflagtex()
{
if(FlagTex == none)
    FlagTex= Texture(DynamicLoadObject("CountryFlags2."$country, class'Texture', true));
	
if(FlagTex != none)
return FlagTex;
else
return texture'noCountry';
}

function copyTo(MyPlayerListItem target) {
	target.PlayerName = self.PlayerName;
	target.PlayerNum = self.PlayerNum;
	target.country = self.country;
	target.flagTex = self.flagTex;
}

defaultproperties
{
}
