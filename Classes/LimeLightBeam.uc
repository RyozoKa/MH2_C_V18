class LimeLightBeam extends FlashLightBeam;

function BeginPlay()
{
   DrawType = DT_None;
   SetTimer(1.0,True);
}

function Timer()
{
   MakeNoise(0.3);
}

defaultproperties
{
}
