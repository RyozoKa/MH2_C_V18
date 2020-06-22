//=============================================================================
// ExFlyCarcass
// Added to spy a dead ExFly, to not spawn again others for this carcass
// looping anoying
//=============================================================================
class ExFlyCarcass extends FlyCarcass;

function ForceMeshToExist()
{
	//never called
	Spawn(class 'ExFly');
}

defaultproperties
{
     Mass=50.000000
}
