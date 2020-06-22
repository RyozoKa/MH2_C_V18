class MH2HeadShotMessage3 extends DecapitationMessage;

#exec Audio Import File="Sounds\headshotthree.WAV" Name="headshotthree"

static simulated function ClientReceive (PlayerPawn P,optional int Switch,optional PlayerReplicationInfo RelatedPRI_1,optional PlayerReplicationInfo RelatedPRI_2,optional Object OptionalObject)
{
   Super(LocalMessagePlus).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
   P.ClientPlaySound(sound'MH2_C_V18.headshotthree',, true);
}

static function string GetString(optional int Switch,optional PlayerReplicationInfo RelatedPRI_1,optional PlayerReplicationInfo RelatedPRI_2,optional Object OptionalObject)
{
return "Holy Shit!!!!";
}

defaultproperties
{
     SoundVolume=150
}
