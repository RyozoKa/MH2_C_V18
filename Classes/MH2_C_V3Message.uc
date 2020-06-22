//=============================================================================
// MH2_C_V3 is a warining message when a player shoot another player
//=============================================================================
class MH2_C_V3Message expands LocalMessagePlus;

#exec AUDIO IMPORT FILE="Sounds\ious.wav" NAME="ious" GROUP="Snd"

static function float GetOffset(int Switch, float YL, float ClipY )
{
	return (Default.YPos/768.0) * ClipY + YL;
}

static function int GetFontSize( int Switch )
{
	return 2;
}

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	if(RelatedPRI_1.PlayerName != "Player")
	{
		if(Switch == 9999)
			return RelatedPRI_1.PlayerName@" is a  teamkiller!";
		else if(Switch > 0)
			return "Stop it you fool!! Your teammate "@RelatedPRI_1.PlayerName@" has :"@Switch;
		else
			return "You killed:"@RelatedPRI_1.PlayerName;
		return "";
	}
}

static function ClientReceive( 
	PlayerPawn P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	if(Switch <= 0 || Switch == 9999)
			P.ClientPlaySound(sound'MH2_C_V18.Snd.ious',, True);
	return;
}

defaultproperties
{
     FontSize=1
     bIsSpecial=True
     bIsUnique=True
     bFadeMessage=True
     DrawColor=(R=0,B=0)
     YPos=172.000000
     bCenter=True
     SoundVolume=255
}
