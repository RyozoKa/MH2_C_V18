//=============================================================================
// FL_Beam.
//=============================================================================
class FL_Beam expands Light;

var bool bHideMe;

replication
{
	reliable if ( (Role == ROLE_Authority) && bNetOwner && !bDemoRecording )
		bHideMe;
}

simulated function PostNetBeginPlay()
{
	if ( bHideMe )
	LightType = LT_None;
}

defaultproperties
{
     bStatic=False
     bHidden=False
     bNoDelete=False
     DrawType=DT_None
     bMovable=True
     LightEffect=LE_NonIncidence
     LightBrightness=240
     LightHue=32
     LightSaturation=135
     LightRadius=16
}
