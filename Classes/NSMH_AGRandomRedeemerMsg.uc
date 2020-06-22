//=============================================================================
// NSMH_AGRandomRedeemerMsg.
//=============================================================================
class NSMH_AGRandomRedeemerMsg expands CriticalEventPlus;

#exec AUDIO IMPORT FILE="Sounds\2K4slaughter.wav" NAME="2K4slaughter" GROUP="Snd"

var(Message) string	RRedeemerMessage[5];
var(Message) sound	RRedeemerSound[5];

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if(Switch == 0)
       	return RelatedPRI_1.PlayerName$Default.RRedeemerMessage[Switch];
	else
       	return Default.RRedeemerMessage[Switch];
}

static simulated function ClientReceive( 
	PlayerPawn P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
  	P.ClientPlaySound(Default.RRedeemerSound[Switch],true, true);
}

defaultproperties
{
     RRedeemerMessage(0)=" Gets Redeemer ! "
     RRedeemerMessage(1)=" 1.."
     RRedeemerMessage(2)=" 2.."
     RRedeemerMessage(3)=" 3.."
     RRedeemerMessage(4)=" Summon Random Redeemer ! :) "
     RRedeemerSound(0)=Sound'MH2_C_V18.Snd.2K4slaughter'
     RRedeemerSound(1)=Sound'MH2_C_V18.c1'
     RRedeemerSound(2)=Sound'MH2_C_V18.c2'
     RRedeemerSound(3)=Sound'MH2_C_V18.c3'
     RRedeemerSound(4)=Sound'Botpack.Generic.RespawnSound2'
}
