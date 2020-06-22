class MH2ShieldBeltEffect extends Effects;

var Texture LowDetailTexture;
var int FatnessOffset;

simulated function Destroyed()
{
	if ( bHidden && (Owner != None) )
	{
		if ( Level.NetMode == NM_Client )
		{
			Owner.Texture = Owner.Default.Texture;
			Owner.bMeshEnviromap = Owner.Default.bMeshEnviromap;
		}
		else
			Owner.SetDefaultDisplayProperties();
	}
	Super.Destroyed();
}

simulated function PostBeginPlay()
{
	if ( !Level.bHighDetailMode && ((Level.NetMode == NM_Standalone) || (Level.NetMode == NM_Client)) )
	{
		Timer();//Hahaha are you kidding me Epic?
		bHidden = true;
		SetTimer(1.0, true);
	}
}

simulated function Timer()
{
	local int TeamNum;

	bHidden = true;
		TeamNum = 2;
	LowDetailTexture = class'UT_Shieldbelt'.Default.TeamTextures[TeamNum];
	if ( Level.NetMode == NM_Client )
	{
		Owner.Texture = LowDetailTexture;
		Owner.bMeshEnviromap = true;
	}
	else
		Owner.SetDisplayProperties(Owner.Style, LowDetailTexture, false, true);
}

simulated function Tick(float DeltaTime)
{
	local int IdealFatness;

	if ( bHidden /*|| (Level.NetMode == NM_DedicatedServer)*/ || (Owner == None) )
	{
		Disable('Tick');
		return;
	}

	IdealFatness = Owner.Fatness; // Convert to int for safety.
	IdealFatness += FatnessOffset;

	if ( Fatness > IdealFatness )
		Fatness = Max(IdealFatness, Fatness - 130 * DeltaTime);
	else
		Fatness = Min(IdealFatness, 255);
}

defaultproperties
{
     LowDetailTexture=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
     FatnessOffset=29
     bAnimByOwner=True
     bOwnerNoSee=True
     bNetTemporary=False
     bTrailerSameRotation=True
     Physics=PHYS_Trailer
     RemoteRole=ROLE_SimulatedProxy
     DrawType=DT_Mesh
     Style=STY_Translucent
     Texture=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
     ScaleGlow=0.500000
     AmbientGlow=64
     Fatness=157
     bUnlit=True
     bMeshEnviroMap=True
}
