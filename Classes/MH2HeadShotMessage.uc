class MH2HeadShotMessage extends DecapitationMessage;

#exec Audio Import File="Sounds\headshotone.wav" Name="headshotone"

static simulated function ClientReceive(PlayerPawn P,optional int Switch,optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2,optional Object OptionalObject)
{
   Super(LocalMessagePlus).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
   P.ClientPlaySound(sound'MH2_C_V18.headshotone',, true);
}

static function string GetString(optional int Switch,optional PlayerReplicationInfo RelatedPRI_1,optional PlayerReplicationInfo RelatedPRI_2,optional Object OptionalObject)
{

   return "Area Secured!";
}

defaultproperties
{
     SoundVolume=150
}
