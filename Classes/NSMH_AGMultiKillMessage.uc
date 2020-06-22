//=============================================================================
// NSMH_AGMultiKillMessage.
//=============================================================================
class NSMH_AGMultiKillMessage expands LocalMessagePlus;

#exec OBJ LOAD FILE=..\Sounds\Announcer.uax
#exec AUDIO IMPORT FILE="Sounds\Ludicrouskill.wav" NAME="Ludicrouskill" GROUP="Snd"
#exec AUDIO IMPORT FILE="Sounds\HolyShit.wav" NAME="Holyshit" GROUP="Snd"
#exec AUDIO IMPORT FILE="Sounds\Dominating.wav" NAME="Dominating" GROUP="Snd"
#exec AUDIO IMPORT FILE="Sounds\femmultikill.wav" NAME="milti"
#exec AUDIO IMPORT FILE="Sounds\femdoublekill.wav" NAME="double"
#exec AUDIO IMPORT FILE="Sounds\femmegakill.wav" NAME="mega"
#exec AUDIO IMPORT FILE="Sounds\femWrecker.wav" NAME="triple"
#exec AUDIO IMPORT FILE="Sounds\femdominating.wav" NAME="domi"
#exec AUDIO IMPORT FILE="Sounds\femholy.wav" NAME="holy"
#exec AUDIO IMPORT FILE="Sounds\yamero.wav" NAME="yamero"
#exec AUDIO IMPORT FILE="Sounds\Score.wav" NAME="Score"
#exec AUDIO IMPORT FILE="Sounds\Femfb.wav" NAME="First"

static function float GetOffset(int Switch, float YL, float ClipY )
{
	return (Default.YPos/768.0) * ClipY + YL;
}

static function int GetFontSize( int Switch )
{
	if ( Switch == 1 )
		return Default.FontSize;
	else
		return 2;
}

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	switch (Switch)
	{
		case 1:
			return "Double Kill!";
			break;
		case 2:
			return "Triple Kill!";
			break;
		case 3:
			return "Multi Kill!";
			break;
		case 4:
			return "Mega Kill!";
			break;
		case 5:
			return "TOP GUN!!";
			break;
		case 6:
			return "HOLY SHIT !!!";
			break;
		case 7:
			return "L U D I C R O U S  K I L L !!!";
			break;
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		case 18:
		case 19:
		case 20:
		case 21:
		case 22:
		case 23:
		case 24:
		case 25:
		case 26:
		case 27:
		case 28:
		case 29:
		case 30:
		case 31:
		case 32:
		case 33:
		case 34:
		case 35:
		case 36:
		case 37:
		case 38:
		case 39:
			return "DOMINATING !!!";
			break;
		case 40:
		case 41:
			return "YAMEROOO !!!";
			break;
	}
	return "";
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
	switch (Switch)
	{
		case 1:
			P.ClientPlaySound(sound'MH2_C_V18.double',, True);
			break;
		case 2:
			P.ClientPlaySound(sound'MH2_C_V18.triple',, True);
			break;
		case 3:
			P.ClientPlaySound(sound'MH2_C_V18.milti',, True);
			break;
		case 4:
			P.ClientPlaySound(sound'MH2_C_V18.mega',, True);
			break;
		case 5:
			P.ClientPlaySound(sound'MH2_C_V18.Score',, True);
			break;
		case 6:
			P.ClientPlaySound(sound'MH2_C_V18.holy',, True);
			break;
		case 7:
			P.ClientPlaySound(sound'MH2_C_V18.Snd.Ludicrouskill',, True);
			break;
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		case 18:
		case 19:
		case 20:
		case 21:
		case 22:
		case 23:
		case 24:
		case 25:
		case 26:
		case 27:
		case 28:
		case 29:
		case 30:
		case 31:
		case 32:
		case 33:
		case 34:
		case 35:
		case 36:
		case 37:
		case 38:
		case 39:
			P.ClientPlaySound(sound'MH2_C_V18.Snd.Dominating',, True);
			break;
		case 40:
		case 41:
			P.ClientPlaySound(sound'MH2_C_V18.yamero',, True);
			break;
	}
	return;
}

defaultproperties
{
     FontSize=1
     bIsSpecial=True
     bIsUnique=True
     bFadeMessage=True
     DrawColor=(G=0,B=0)
     YPos=196.000000
     bCenter=True
}
