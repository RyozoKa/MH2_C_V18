//=============================================================================
// ut_ShieldBelt.
//=============================================================================
class MH2ShieldBelt extends UT_ShieldBelt;

#exec mesh import mesh=BattleSuitv3 anivfile=Models\BattleSuitv3_a.3d datafile=Models\BattleSuitv3_d.3d x=0 y=0 z=0 MLOD=1 LODSTYLE=0
#exec MESH LODPARAMS MESH=BattleSuitv3 STRENGTH=0.25
#exec mesh origin mesh=BattleSuitv3 x=0 y=0 z=0
#exec mesh sequence mesh=BattleSuitv3 seq=All startframe=0 numframes=1

#exec meshmap new meshmap=BattleSuitv3 mesh=BattleSuitv3
#exec meshmap scale meshmap=BattleSuitv3 x=0.081 y=0.081 z=0.162

//Audio import
#exec AUDIO IMPORT NAME="InvulnerablePick" FILE=SOUNDS\InvulnerablePick.wav GROUP="BattleSuit"
#exec AUDIO IMPORT NAME="InvulnerableWarn" FILE=SOUNDS\InvulnerableWarn.wav GROUP="BattleSuit"
#exec AUDIO IMPORT NAME="InvulnerableEnd" FILE=SOUNDS\InvulnerableEnd.wav GROUP="BattleSuit"

//FX import
#exec TEXTURE IMPORT NAME=BattleSuitNew FILE=Textures\BattleSuitNew.pcx GROUP=Skins FLAGS=2
#exec TEXTURE IMPORT NAME=BattleSuitNew FILE=Textures\BattleSuitNew.pcx GROUP=Skins PALETTE=BattleSuitNew

#exec obj load file=..\Textures\SpaceFX.utx package=SpaceFX


var UT_ShieldBeltEffect MyEffect;
var() string TeamFireTextureStrings[4];
var() string TeamTextureStrings[4];
var firetexture TeamFireTextures[4];
var texture TeamTextures[4];
var int TeamNum;
var BattleCorona Effect1;

simulated function PostBeginPlay()
{
	Effect1 = Spawn(Class'BattleCorona', Self);

	Super.PostBeginPlay();
}


function bool HandlePickupQuery( inventory Item )
{
	local Inventory I;

	if (item.class == class) 
	{
		// remove other armors
		for ( I=Owner.Inventory; I!=None; I=I.Inventory )
			if ( I.bIsAnArmor && (I != self) )
				I.Destroy();
	}

	return Super.HandlePickupQuery(Item);
}

function ArmorImpactEffect(vector HitLocation)
{ 
	if ( Owner.IsA('PlayerPawn') )
	{
		PlayerPawn(Owner).ClientFlash(-0.05,vect(400,400,400));
		PlayerPawn(Owner).PlaySound(DeActivateSound, SLOT_None, 2.7*PlayerPawn(Owner).SoundDampening);
	}
	if ( MyEffect != None )
	{
		//MyEffect.Texture = MyEffect.LowDetailTexture;
		MyEffect.ScaleGlow = 4.0;
		MyEffect.Fatness = 255;
		SetTimer(0.8, false);
	}
}

function Timer()
{
	if ( MyEffect != None )
	{
		MyEffect.Fatness = MyEffect.Default.Fatness;
		SetEffectTexture();
	}
}

function Destroyed()
{
	if ( Owner != None )
	{
		Owner.SetDefaultDisplayProperties();
		if( Owner.Inventory != None )
			Owner.Inventory.SetOwnerDisplay();
	}
	if ( MyEffect != None )
		MyEffect.Destroy();
	Super.Destroyed();
}

function PickupFunction(Pawn Other)
{
	local Inventory I;

	MyEffect = Spawn(class'UT_ShieldBeltEffect', Other,,Other.Location, Other.Rotation); 
	MyEffect.Mesh = Owner.Mesh;
	MyEffect.DrawScale = Owner.Drawscale;
		TeamNum = 2;
	SetEffectTexture();

	I = Pawn(Owner).FindInventoryType(class'UT_Invisibility');
	if ( I != None )
		MyEffect.bHidden = true;
	
	// remove other armors
	for ( I=Owner.Inventory; I!=None; I=I.Inventory )
		if ( I.bIsAnArmor && (I != self) )
			I.Destroy();
}

function SetEffectTexture()
{
	if ( TeamNum != 3 )
		MyEffect.ScaleGlow = 0.5;
	else
		MyEffect.ScaleGlow = 1.0;
	MyEffect.ScaleGlow *= (0.25 + 0.75 * Charge/Default.Charge);
	if ( TeamFireTextures[TeamNum] == None )
		TeamFireTextures[TeamNum] =FireTexture(DynamicLoadObject(TeamFireTextureStrings[TeamNum], class'Texture'));
	MyEffect.Texture = TeamFireTextures[TeamNum];
	if ( TeamTextures[TeamNum] == None )
		TeamTextures[TeamNum] = Texture(DynamicLoadObject(TeamTextureStrings[TeamNum], class'Texture'));
	MyEffect.LowDetailTexture = TeamTextures[TeamNum];
}

defaultproperties
{
     TeamFireTextureStrings(0)="UnrealShare.Belt_fx.ShieldBelt.RedShield"
     TeamFireTextureStrings(1)="UnrealShare.Belt_fx.ShieldBelt.BlueShield"
     TeamFireTextureStrings(2)="UnrealShare.Belt_fx.ShieldBelt.Greenshield"
     TeamFireTextureStrings(3)="UnrealShare.Belt_fx.ShieldBelt.N_Shield"
     TeamTextureStrings(0)="MH2_C_Pickups.Skins.ShieldBelt.BattleSuitNew"
     TeamTextureStrings(1)="MH2_C_Pickups.Skins.ShieldBelt.BattleSuitNew"
     TeamTextureStrings(2)="MH2_C_Pickups.Skins.ShieldBelt.BattleSuitNew"
     TeamTextureStrings(3)="MH2_C_Pickups.Skins.ShieldBelt.BattleSuitNew"
     TeamFireTextures(0)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
     TeamFireTextures(1)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
     TeamFireTextures(2)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
     TeamFireTextures(3)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
     TeamTextures(0)=Texture'MH2_C_V18.Skins.BattleSuitNew'
     TeamTextures(1)=Texture'MH2_C_V18.Skins.BattleSuitNew'
     TeamTextures(2)=Texture'MH2_C_V18.Skins.BattleSuitNew'
     TeamTextures(3)=Texture'MH2_C_V18.Skins.BattleSuitNew'
     PickupViewMesh=LodMesh'MH2_C_V18.BattleSuitv3'
     Mesh=LodMesh'MH2_C_V18.BattleSuitv3'
     MultiSkins(0)=WetTexture'SpaceFX.worm3c'
     MultiSkins(3)=Texture'Botpack.Ammocount.AmmoCountJunk'
}
