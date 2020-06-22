//=============================================================================
// NSMH_AGRandomHealthMsg
//=============================================================================

class NSMH_AGRandomHealthMsg expands CriticalEventPlus;
#exec AUDIO IMPORT File="Sounds\3.wav" name="c3"
#exec AUDIO IMPORT File="Sounds\2.wav" name="c2"
#exec AUDIO IMPORT File="Sounds\1.wav" name="c1"
var(Message) string	RHealthMessage[5];
var(Message) sound	RHealthSound[5];

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{

	if(Switch == 0)
       	return RelatedPRI_1.PlayerName$Default.RHealthMessage[Switch];
	else
       	return Default.RHealthMessage[Switch];

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

	if(Switch < 5)P.ClientPlaySound(Default.RHealthSound[Switch],, True);
}

defaultproperties
{
     RHealthMessage(0)=" Gets HP +500!"
     RHealthMessage(1)="1..."
     RHealthMessage(2)="2..."
     RHealthMessage(3)="3..."
     RHealthMessage(4)="Random Health Coming Up!"
     RHealthSound(0)=Sound'MH2_C_V18.c1'
     RHealthSound(1)=Sound'Botpack.Pickups.UTSuperHeal'
     RHealthSound(2)=Sound'MH2_C_V18.c2'
     RHealthSound(3)=Sound'MH2_C_V18.c3'
     RHealthSound(4)=Sound'Botpack.Generic.RespawnSound2'
}
