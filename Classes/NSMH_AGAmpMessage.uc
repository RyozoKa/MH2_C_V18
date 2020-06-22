//=============================================================================
// NSMH_AGAmpMessage.
//=============================================================================
class NSMH_AGAmpMessage expands CriticalEventPlus;

#exec AUDIO IMPORT FILE="Sounds\UDamagePickup.wav" NAME="Blood" GROUP="Snd"

var(Message) string AmpMessage[12];

static function int GetFontSize( int Switch )
{
	return 2;
}

static function string GetString
( optional int Spree,
optional PlayerReplicationInfo RelatedPRI_1,
optional PlayerReplicationInfo RelatedPRI_2,
optional Object OptionalObject )

{
	return Default.AmpMessage[Rand(12)];
}

static simulated function ClientReceive
	( PlayerPawn P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject )

{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	P.PlaySound(Sound'MH2_C_V18.Snd.Blood',,4.0);
	return;
}

defaultproperties
{
     AmpMessage(0)="Incoming!"
     AmpMessage(1)="Empowered now!"
     AmpMessage(2)="OH YEAH!"
     AmpMessage(3)="Killing time!"
     AmpMessage(4)="Death coming faster!"
     AmpMessage(5)="YEEHAW!"
     AmpMessage(6)="Killl!"
     AmpMessage(7)="Attack damage 3X!"
     AmpMessage(8)="Good Hunting!"
     AmpMessage(9)="Monster Hunt!"
     AmpMessage(10)="Genocide!"
     AmpMessage(11)="L O L"
     DrawColor=(R=254,G=120,B=120)
}
