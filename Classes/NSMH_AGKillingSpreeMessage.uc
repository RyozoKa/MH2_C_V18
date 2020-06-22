//=============================================================================
// NSMH_AGKillingSpreeMessage.
//=============================================================================
class NSMH_AGKillingSpreeMessage expands CriticalEventLowPlus;

#exec AUDIO IMPORT FILE="Sounds\femspree.wav" NAME="femspree" Group="Snd"
#exec AUDIO IMPORT FILE="Sounds\femrampage.wav" NAME="femrampage" Group="Snd"
#exec AUDIO IMPORT FILE="Sounds\femdominating.wav" NAME="femdominating" Group="Snd"
#exec AUDIO IMPORT FILE="Sounds\femunstop.wav" NAME="femunstop" Group="Snd"
#exec AUDIO IMPORT FILE="Sounds\femgodlike.wav" NAME="femgodlike" Group="Snd"
#exec AUDIO IMPORT FILE="Sounds\femwicked.wav" NAME="femwicked" Group="Snd"

var(Messages)	localized string EndSpreeNote, EndSelfSpree, EndFemaleSpree, EndSpreeNoteTrailer;
var(Messages)	localized string Spreenote[6];
var(Messages)	sound SpreeSound[6];

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if (RelatedPRI_2 == None)
	{
		if (RelatedPRI_1 == None)
			return "";

		if (RelatedPRI_1.PlayerName != "")
			return RelatedPRI_1.PlayerName@Default.SpreeNote[Switch];
	} 
	else 
	{
		return RelatedPRI_2.PlayerName$Default.EndSpreeNote@Switch;

	}
	return "";
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

	if (RelatedPRI_2 != None)
		return;

	if (RelatedPRI_1 != P.PlayerReplicationInfo)
	{
		P.PlaySound(sound'SpreeSound',, 6.0);
		return;
	}
	P.ClientPlaySound(Default.SpreeSound[Switch],, true);

}

defaultproperties
{
     EndSpreeNote=" was died. Total kill: "
     EndSelfSpree="was looking good till he killed himself!"
     EndFemaleSpree="was looking good till she killed herself!"
     spreenote(0)="is on a killing spree!"
     spreenote(1)="is on a rampage!"
     spreenote(2)="is dominating!"
     spreenote(3)="is unstoppable!"
     spreenote(4)="is Godlike!"
     spreenote(5)="is Whicked Sick!"
     SpreeSound(0)=Sound'MH2_C_V18.Snd.femspree'
     SpreeSound(1)=Sound'MH2_C_V18.Snd.femrampage'
     SpreeSound(2)=Sound'MH2_C_V18.Snd.femdominating'
     SpreeSound(3)=Sound'MH2_C_V18.Snd.femunstop'
     SpreeSound(4)=Sound'MH2_C_V18.Snd.femgodlike'
     SpreeSound(5)=Sound'MH2_C_V18.Snd.femwicked'
     bBeep=False
}
