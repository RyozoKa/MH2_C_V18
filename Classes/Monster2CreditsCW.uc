class Monster2CreditsCW expands UTCreditsCW;

#exec TEXTURE IMPORT NAME=MHCreditsBG FILE=Textures\MHCreditsBG.PCX GROUP=Rules LODSET=0

function Paint(Canvas C, float X, float Y)
{
	Super.Paint(C, X, Y);
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'MHCreditsBG');
}

defaultproperties
{
     ProgrammerNames(0)="Nelsona"
     MaxProgs=1
     DesignerNames(0)="Nelsona"
     DesignerNames(1)="Gopostal"
     DesignerNames(2)="Shrimp"
     DesignerNames(3)="And so on..."
     MaxDesigners=4
     ArtText="Testers"
     ArtNames(0)="Nelsona"
     ArtNames(1)="Gopostal"
     ArtNames(2)="Some random players"
     ArtNames(3)="Other testers removed - they "
     ArtNames(4)="didn't tested nothing leaving"
     ArtNames(5)="XX errors to be solved"
     ArtNames(6)="with a lot of work..."
     MaxArts=7
     MusicSoundText="Special Thanks"
     MusicNames(0)="Gopostal, AF_Core, UsAaR33 - good codes done"
     MusicNames(1)="Waffnuffly - he inspired me in monster attitude"
     MusicNames(2)="The Dane - small but important deals with monsters"
     MusicNames(3)="Timmypowergamer - good stuff for attached MH versions"
     MusicNames(4)="Zeal - a man who worked a lot to improve original MH"
     MusicNames(5)="Gust - for some work (I couldn't find him in private...)"
     MusicNames(6)="War_Master - he inspired me to develop antispam codes"
     MusicNames(7)=" AND more... Even Mars007 in how to make a smaller U"
     MusicNames(8)=" "
     MusicNames(9)=" EPIC GAMES - No game without them. Special thanks for meshes missing..."
     MaxMusics=10
     BizText="Contact info"
     BizNames(0)="A personal Home production (living-room)"
     BizNames(1)=" "
     BizNames(2)="Email - no spams needed :P"
     BizNames(3)="Web - servers can crash or can be damaged"
     BizNames(4)="Nobody lives forever, do other MH if you"
     BizNames(5)="don't like this attached version..."
     MaxBiz=6
}
