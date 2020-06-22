class MH2ScoreBoard1 expands TournamentScoreBoard config(MH2_C_V18);

//#exec TEXTURE IMPORT NAME=Scroll2 FILE=Textures\Scroll2.bmp Group=HUD MIPS=ON
//#exec TEXTURE IMPORT NAME=F2Logo FILE=Textures\F2Logo.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Blackness FILE=Textures\Blackness.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Whiteness FILE=Textures\Whiteness.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Icon_cpu FILE=Textures\Icon_cpu.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Icon_Con1 FILE=Textures\Icon_Con1.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Icon_Con2 FILE=Textures\Icon_Con2.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Icon_Con3 FILE=Textures\Icon_Con3.bmp Group=HUD MIPS=ON
#exec TEXTURE IMPORT NAME=Icon_Con4 FILE=Textures\Icon_Con4.bmp Group=HUD MIPS=ON
#exec Texture Import File=Textures\Shade.pcx Name=Shade Mips=Off
#exec New TrueTypeFontFactory FontName="CooperplateGothicBold" Name="ROBO" Height=35
var color GreenColor, WhiteColor, GoldColor, BlueColor, LightCyanColor, SilverColor, BronzeColor, CyanColor, RedColor,
          LightGreenColor, DarkGreenColor, BlackColor, BColor, ParchmentColor, FrigginDarkColor;

var string ScoreBoardText;
var string GameOverText;
var config bool UseCountry;
var GameReplicationInfo RGI;
var config string GroupName;

function DrawHeader( canvas Canvas )
{
	local GameReplicationInfo GRI;
	local float XL, YL;
	local font CanvasFont;

	Canvas.DrawColor = DarkGreenColor;
	GRI = PlayerPawn(Owner).GameReplicationInfo;

	Canvas.Font = MyFonts.GetHugeFont(Canvas.ClipX);
							if(Canvas.Font==none)
								Canvas.Font=Font'SmallFont';
	Canvas.bCenter = True;
	Canvas.StrLen("Test", XL, YL);
	//ScoreStart = 58.0/768.0 * Canvas.ClipY;
	ScoreStart = 0;
	CanvasFont = Canvas.Font;
//	if ( GRI.GameEndedComments != "" )
//	{
	//	Canvas.DrawColor = GoldColor;
	//	Canvas.SetPos(0, ScoreStart);
		//Canvas.DrawText(GRI.GameEndedComments, True);
	//	Canvas.DrawText(GameOverText, True);

	//}
//	else
	//{
		Canvas.SetPos(0, ScoreStart);
		DrawVictoryConditions(Canvas);
	//}
	Canvas.bCenter = False;
	Canvas.Font = CanvasFont;
	
	DrawTrailer(Canvas);
}

function DrawVictoryConditions(Canvas Canvas)
{
}

function DrawTrailer( canvas Canvas )
{
	local int Hours, Minutes, Seconds;
	local float XL, YL;
	local PlayerPawn PlayerOwner;
	
	Canvas.Style = ERenderStyle.STY_Modulated;
	Canvas.SetPos(0, Canvas.SizeY - 64);
	Canvas.DrawRect(Texture'Blackstuff2',2048,64);
}

function DrawCategoryHeaders(Canvas Canvas)
{
	local float Offset, XL, YL;

	Offset = Canvas.CurY;
	Canvas.DrawColor = LightGreenColor;

	Canvas.StrLen(PlayerString, XL, YL);
	Canvas.SetPos((Canvas.ClipX / 8)*2 - XL/2, Offset);
	Canvas.DrawText(PlayerString);

	Canvas.StrLen(FragsString, XL, YL);
	Canvas.SetPos((Canvas.ClipX / 8)*5.3 - XL/2, Offset);
	Canvas.DrawText(FragsString);

}

function DrawNameAndPing(Canvas Canvas, PlayerReplicationInfo PRI, float XOffset, float YOffset, bool bCompressed)
{
local float XL, YL, XL2, YL2, XL3, YL3, Eff;
local Font CanvasFont;
local bool bLocalPlayer;
local PlayerPawn PlayerOwner;
local int Time;
local int i;
PlayerOwner = PlayerPawn(Owner);
	Canvas.Reset();

	
        i=0;
	bLocalPlayer = (PRI.PlayerName == PlayerOwner.PlayerReplicationInfo.PlayerName);

	//Setup Background
	//Canvas.Style = ERenderStyle.STY_Normal;
	Canvas.Style=ERenderStyle.STY_Modulated;
	//Canvas.DrawColor = BlackColor;
	//Canvas.SetPos(Canvas.ClipX * 0.5 - 256, YOffset);
	//Canvas.SetPos(Canvas.ClipX * 0.5 - 384, YOffset );
	//Canvas.DrawRect(Texture'Shade', 768, 1, 0, 0, 1, 1);

	//Canvas.SetPos(Canvas.ClipX * 0.5 - 384, YOffset + 27);
	//Canvas.DrawTile(Texture'Shade', 768, 1, 0, 0, 1, 1);

     //  	Canvas.SetPos(Canvas.ClipX * 0.5 - 384, YOffset + 1);
	//Canvas.DrawTile(Texture'Shade', 1, 26, 0, 0, 1, 1);

	//Canvas.SetPos(Canvas.ClipX * 0.5 + 384, YOffset + 1);
	//Canvas.DrawTile(Texture'Shade', 1, 26, 0, 0, 1, 1);

	//Canvas.DrawColor.R = 20;
	//Canvas.DrawColor.G = 20;
	//Canvas.DrawColor.B = 20;
	//Canvas.Style = ERenderStyle.STY_Translucent;
	Canvas.SetPos(Canvas.ClipX * 0.5 - 382, YOffset);
	Canvas.DrawRect(Texture'Shade', 768, 29);
	Canvas.SetPos(Canvas.ClipX * 0.5 - 382, YOffset + 28);
	Canvas.DrawPattern( texture'redskin2', 768 , 2 , 1 );

        // Draw Player texture
	if ( !PlayerOwner.PlayerReplicationInfo.bIsSpectator )
		{
		if (PRI.TalkTexture != none)
		{
		Canvas.DrawColor = WhiteColor;
		Canvas.Style = ERenderStyle.STY_Normal;
		Canvas.SetPos(Canvas.ClipX * 0.5 - 383, YOffset + 1);
		Canvas.DrawTile(PRI.TalkTexture, 26, 26, 0, 0, 64, 64);
		}
		}
	// Draw Ping box
	Canvas.Font = MyFonts.GetSmallestFont(800);//Canvas.ClipX
	Canvas.SetPos(Canvas.ClipX * 0.5 + 358, YOffset + 1);
	Canvas.Style = ERenderStyle.STY_Translucent;
	Canvas.DrawColor = WhiteColor;
	if ( !PRI.bIsABot )
		{
		if ( PRI.Ping > 250 )
			{
			Canvas.DrawTile(Texture'Icon_Con1', 26, 26, 0, 0, 128, 128);
			}
		else if ( PRI.Ping > 150 )
			{
			Canvas.DrawTile(Texture'Icon_Con2', 26, 26, 0, 0, 128, 128);
			}
		else if ( PRI.Ping > 80 )
			{
			Canvas.DrawTile(Texture'Icon_Con3', 26, 26, 0, 0, 128, 128);
			}
		else
			{
			Canvas.DrawTile(Texture'Icon_Con4', 26, 26, 0, 0, 128, 128);
			}
		Canvas.Style = ERenderStyle.STY_Normal;
		Canvas.DrawColor = BColor;
		Canvas.StrLen(PRI.Ping, XL, YL );
		Canvas.SetPos(Canvas.ClipX * 0.5 + 370 - 0.5 * XL, YOffset + YL);
		Canvas.DrawText(PRI.Ping, false );
		Canvas.DrawColor = WhiteColor;
		Canvas.StrLen(PRI.Ping, XL, YL );
		Canvas.SetPos(Canvas.ClipX * 0.5 + 371 - 0.5 * XL, YOffset - 1 + YL);
		Canvas.DrawText(PRI.Ping, false );
		}
	else
		{
		Canvas.DrawTile(Texture'Icon_cpu', 26, 26, 0, 0, 64, 64);
		}

	// Draw Name
	Canvas.Style = ERenderStyle.STY_Normal;
	if ( PRI.bAdmin )
		Canvas.DrawColor = WhiteColor;
	else if ( bLocalPlayer ) 
		Canvas.DrawColor = GoldColor;
	else 
		Canvas.DrawColor = GreenColor;
        Canvas.Font = MyFonts.GetBigFont(800);
	Canvas.SetPos(Canvas.ClipX * 0.5 - 350, YOffset );
	Canvas.DrawText(PRI.PlayerName, False);
        Canvas.Font = MyFonts.GetSmallFont(800);
	Canvas.StrLen( "0000", XL, YL );

	if ( !PRI.bIsABot )
		{
		// Draw Score
		Canvas.SetPos(Canvas.ClipX * 0.5 -130, YOffset );
		Canvas.DrawText("Score:"@int(PRI.Score), false );

                // Draw Head Shots
		Canvas.DrawColor = LightCyanColor;
		Time = Max(1, (Level.TimeSeconds + PlayerOwner.PlayerReplicationInfo.StartTime - PRI.StartTime)/60);
		Canvas.SetPos( Canvas.ClipX * 0.5 + 204, YOffset - 4 + YL);
		Canvas.DrawText("Head shots: "$MHReplicationInfo(PRI).HeadShots, false );

		// Draw Deaths
		Canvas.DrawColor = GreenColor;
		Canvas.SetPos( Canvas.ClipX * 0.5 +200, YOffset );
		//Canvas.DrawText(" Deaths: "$NewMonsterReplicationInfo(PlayerOwner.GameReplicationInfo).Live - int(PlayerOwner.PlayerReplicationInfo.Deaths), false);
		Canvas.DrawText(" Kills: "@MHReplicationInfo(PRI).KilledMonster, false);
                //Canvas.DrawText("Games:", false );


		//Lower line
		Canvas.DrawColor = SilverColor;
		//Canvas.DrawColor = RedColor;
		Canvas.Font = MyFonts.GetSmallestFont(800);//Canvas.ClipX
		Canvas.SetPos( Canvas.ClipX * 0.5 - 130, YOffset - 4 + YL);
		if ( MHReplicationInfo(PRI).Country != "" )
		{
		   if (UseCountry)
		      Canvas.DrawText("Country:"$MHReplicationInfo(PRI).Country, false );
		   else
                     Canvas.DrawText("Country Disabled", false );
        }      
		else
                Canvas.DrawText("Getting Country", false );

                }
	else    // Bot scoreboard :(
		{
		// Draw Score
		Canvas.SetPos(Canvas.ClipX * 0.5, YOffset );
		Canvas.DrawText("Frags:"@int(PRI.Score), false );
		Canvas.DrawColor = SilverColor;
		Canvas.Font = MyFonts.GetSmallestFont(800);//Canvas.ClipX
		// Draw Time/FPH/Ping
		Time = Max(1, (Level.TimeSeconds + PlayerOwner.PlayerReplicationInfo.StartTime - PRI.StartTime)/60);
		Canvas.SetPos( Canvas.ClipX * 0.5 - 225, YOffset - 2 + YL);
		Canvas.DrawText("Time:"@Time$"   FPH: "@int(60 * PRI.Score/Time), false );
		}
		Canvas.Reset();
}


function SortScores(int N)
{
	local int I, J, Max;
	local PlayerReplicationInfo TempPRI;

	for ( I=0; I<N-1; I++ )
	{
		Max = I;
		for ( J=I+1; J<N; J++ )
		{
			if ( Ordered[J].Score > Ordered[Max].Score )
				Max = J;
			else if ((Ordered[J].Score == Ordered[Max].Score) && (Ordered[J].Deaths < Ordered[Max].Deaths))
				Max = J;
			else if ((Ordered[J].Score == Ordered[Max].Score) && (Ordered[J].Deaths == Ordered[Max].Deaths) &&
					 (Ordered[J].PlayerID < Ordered[Max].Score))
				Max = J;
		}

		TempPRI = Ordered[Max];
		Ordered[Max] = Ordered[I];
		Ordered[I] = TempPRI;
	}
}

function ShowScores( canvas Canvas )
{
local PlayerReplicationInfo PRI;
local int PlayerCount, i, ii;
local float XL, YL, Scale, XL2, YL2;
local float YOffset, YStart, YHeight;
local font CanvasFont;

	Canvas.Style = ERenderStyle.STY_Normal;
	// Header
	//Canvas.SetPos(0, 0);
	//DrawHeader(Canvas);
	Canvas.Reset();
//	Super.PostRender(Canvas);
    DrawTrailer(Canvas);
	// Wipe everything.
	for ( i=0; i<ArrayCount(Ordered); i++ )
		Ordered[i] = None;
	for ( i=0; i<32; i++ )
	{
		if (PlayerPawn(Owner).GameReplicationInfo.PRIArray[i] != None)
		{
			PRI = PlayerPawn(Owner).GameReplicationInfo.PRIArray[i];
			if ( !PRI.bIsSpectator || PRI.bWaitingPlayer )
			{
				Ordered[PlayerCount] = PRI;
				PlayerCount++;
				if ( PlayerCount == ArrayCount(Ordered) )
					break;
			}
		}
	}
	SortScores(PlayerCount);

	CanvasFont = Canvas.Font;
	Canvas.Font = MyFonts.GetBigFont(Canvas.ClipX);
	if(Canvas.Font==none)
		Canvas.Font=Font'SmallFont';
	Canvas.StrLen( "test", XL, YL );

	YOffset = YL * 5 + 40;
	if ( PlayerCount > 15 )
		PlayerCount = FMin(PlayerCount, (Canvas.ClipY - YStart)/YL - 1);

	// Blue Border.
	Canvas.Style = ERenderStyle.STY_Normal;
	Canvas.SetPos((Canvas.SizeX/2)-(768/2), YOffset-64);
	Canvas.DrawColor.B = 75;
	Canvas.DrawColor.G = 0;
	Canvas.DrawPattern( texture'blueskin2', 773 , 64 , 1 );
	//MonsterHunt Text.
	Canvas.StrLen( "Monster Hunt", XL2, YL2 );
	Canvas.SetPos((Canvas.SizeX/2) - (XL2/2) - 110, YOffset-48);
	Canvas.DrawColor.R = 255;//Yellow
	Canvas.DrawColor.G = 255;
	Canvas.DrawColor.B = 0;
	Canvas.Style = ERenderStyle.STY_Normal;
    Canvas.Font = Font'Robo';
	Canvas.DrawText("Monster Hunt", true);
	//TotalScore.
	Canvas.DrawColor.R = 200;
	Canvas.DrawColor.G = 0;
	Canvas.DrawColor.B = 0;
	Canvas.Font = Font'LEDFont2';
	Canvas.StrLen( string(PlayerPawn(Owner).GameReplicationInfo.SumFrags), XL2, YL2 );
	Canvas.SetPos((Canvas.SizeX/2) + (773/2) - (XL2) - 100, YOffset-48);
	Canvas.DrawText(string(PlayerPawn(Owner).GameReplicationInfo.SumFrags), true);
	
	YHeight=0;//Total pixel height of all players.
	for ( I=0; I<PlayerCount; I++ )
	{
		if ( YOffset < Canvas.ClipY-27 )
			{
			DrawNameAndPing( Canvas, Ordered[I], 0, YOffset, false );
			YOffset += 29;
			YHeight += 29;
			}
		else
			{
			ii++;
			}
		
	}
	
	Canvas.SetPos((Canvas.SizeX/2)-(768/2), YL * 5 + 40);
	Canvas.DrawPattern( texture'blueskin2', 4 , YHeight , 1 );
	Canvas.SetPos((Canvas.SizeX/2)+(768/2)+1, YL * 5 + 40);
	Canvas.DrawPattern( texture'blueskin2', 4 , YHeight , 1 );
	
	
	Canvas.DrawColor = WhiteColor;

	if ( ii > 0 )
		{
		Canvas.bCenter = True;
		Canvas.Font = MyFonts.GetSmallFont(Canvas.ClipX);
		Canvas.StrLen( ii, XL, YL );
		Canvas.SetPos(0, Canvas.ClipY - YL);
		if ( ii == 1 )
			Canvas.DrawText("(1 player not showing.)", false );
		else
			Canvas.DrawText("("$ii$" players not showing.)", false );
		Canvas.bCenter = False;
		}
	
	       // DrawF2background(Canvas);
       // ServerStats( Canvas );
}
/*
simulated function ServerStats(Canvas Canvas)
{
   local GameReplicationInfo GRI;
   local MHReplicationInfo PRI;
   local float XL, YL, YL2, YY, F;
 //  local PlayersCheck PS;
   local PlayerPawn PP;
	GRI = PlayerPawn(Owner).GameReplicationInfo;
	PRI = MHReplicationInfo(PlayerPawn(Owner).PlayerReplicationInfo);

        DrawF2background(Canvas);

	DrawTextAtBottomCenter(Canvas);

	Canvas.Style = ERenderStyle.STY_Normal;
	Canvas.DrawColor = WhiteColor;
	Canvas.Font = MyFonts.GetBigFont(Canvas.ClipX);
	Canvas.bCenter = True;
	Canvas.StrLen("Test", XL, YL2);
	Canvas.SetPos(0, 64);
	//Canvas.DrawText(GRI.ServerName, True);
	Canvas.Font = MyFonts.GetSmallFont(Canvas.ClipX);
	Canvas.StrLen("Test", XL, YL);
	Canvas.SetPos(0,64 + YL2);
	//Canvas.DrawText("Admin:"@GRI.AdminName$", Contact via:"@GRI.AdminEmail, True);

	Canvas.DrawColor = BlueColor;
        Canvas.Font = MyFonts.GetBigFont(Canvas.ClipX);
	YY = Canvas.ClipY * 0.75 - YL * 6;

	Canvas.SetPos(0, YY + YL +YL + YL);      //add one
	//Canvas.DrawText("Top 10 Players on the Server:", True);

        Canvas.Font = MyFonts.GetSmallFont(Canvas.ClipX);
	Canvas.SetPos(0, YY + YL + YL + YL * 2 + YL);
        Canvas.DrawColor = RedColor;
        //Canvas.Font = MyFonts.GetBigFont(Canvas.ClipX);
	F = PRI.Frags1;
	//D = PRI.Deaths1;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("1st"@PRI.Name1$" with"@PRI.Frags1$" points over"@PRI.G1$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 3);
	F = PRI.Frags2;
	//D = PRI.Deaths2;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawColor = FrigginDarkColor;
	//Canvas.Font = MyFonts.GetSmallFont(Canvas.ClipX);
	Canvas.DrawText("2nd"@PRI.Name2$" with"@PRI.Frags2$" points over"@PRI.G2$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 4);
	F = PRI.Frags3;
	//D = PRI.Deaths3;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawColor = FrigginDarkColor;
	Canvas.DrawText("3rd"@PRI.Name3$" with"@PRI.Frags3$" points over"@PRI.G3$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 5);
	F = PRI.Frags4;
	//D = PRI.Deaths4;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawColor = FrigginDarkColor;
	Canvas.DrawText("4th"@PRI.Name4$" with"@PRI.Frags4$" points over"@PRI.G4$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 6);
	F = PRI.Frags5;
	//D = PRI.Deaths5;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("5th"@PRI.Name5$" with"@PRI.Frags5$" points over"@PRI.G5$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 7);
	F = PRI.Frags6;
	//D = PRI.Deaths6;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("6th"@PRI.Name6$" with"@PRI.Frags6$" points over"@PRI.G6$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 8);
	F = PRI.Frags7;
	//D = PRI.Deaths7;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("7th"@PRI.Name7$" with"@PRI.Frags7$" points over"@PRI.G7$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 9);
	F = PRI.Frags8;
	//D = PRI.Deaths8;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("8th"@PRI.Name8$" with"@PRI.Frags8$" points over"@PRI.G8$" games.", True);

	Canvas.SetPos(0, YY + YL + YL + YL + YL * 10);
	F = PRI.Frags9;
	//D = PRI.Deaths9;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("9th"@PRI.Name9$" with"@PRI.Frags9$" points over"@PRI.G9$" games.", True);
	Canvas.SetPos(0, YY + YL + YL + YL + YL * 11);
	F = PRI.Frags10;
	//D = PRI.Deaths10;
	//Eff = F / (F + D);
	//Eff *= 100;
	Canvas.DrawText("10th"@PRI.Name10$" with"@PRI.Frags10$" points over"@PRI.G10$" games.", True);

        Canvas.SetPos(0, YY + YL + YL + YL + YL * 12);
	//Career score
	Canvas.Font = Font'BeaconNameFontLarge';
        Canvas.DrawColor = BlueColor;
	Canvas.DrawText("Your Lifetime score total:"@PRI.TotalScore, false );//PRI.TotalFrags2
        Canvas.bCenter = True;
        Canvas.SetPos(0, YY + YL + YL + YL + YL * 13 - 5);
        Canvas.DrawText(twodigit(Owner.Level.Hour)$":"$twodigit(Owner.Level.Minute)$":"$twodigit(Owner.Level.Second)@" "@Owner.Level.Day$"/"$Owner.Level.month$"/"$Owner.Level.Year , false );
        Canvas.bCenter = True;
}
*/
simulated function string twodigit(int ints)
{
if (ints < 9)
    return "0"$string(ints);
else
    return string(ints);
}

simulated function DrawF2background(Canvas Canvas)
{
local float XL, YL, DrawScale;

        //Canvas.DrawColor = RedColor;
	Canvas.Style = ERenderStyle.STY_Translucent;

	XL = Canvas.ClipX * 0.5;
	YL = Canvas.ClipY * 0.07;
	if ( Canvas.ClipX < 1024 )
		{
		DrawScale = Canvas.ClipX / 1024;
		}
	else
		{
		DrawScale = 1;
		}
	Canvas.SetPos( XL - (DrawScale * 512) , YL + 128 - ( DrawScale * 256 ) );
//	Canvas.DrawTile(Texture'F2logo', DrawScale * 1024, DrawScale * 512, 0, 0,1024,512);

	Canvas.DrawColor = ParchmentColor;
        XL = Canvas.ClipX * 0.5;
	YL = Canvas.ClipY * 0.8;
	if ( Canvas.ClipX < 1024 )
		{
		DrawScale = Canvas.ClipX / 1024;
		}
	else
		{
		DrawScale = 0.6;
		}
	Canvas.SetPos( XL - (DrawScale * 512) , YL - 64 );
	//Canvas.DrawTile(Texture'Scroll2', DrawScale * 1024, 256, 0, 0,1024,512);
	Canvas.Reset();
}

simulated function DrawTextAtBottomCenter(Canvas Canvas)
{

        local float XL, YL;

	Canvas.Style = ERenderStyle.STY_Normal;
	Canvas.DrawColor = WhiteColor;
	Canvas.Font = MyFonts.GetSmallFont( Canvas.ClipX );
	Canvas.StrLen("GOPOSTALSUCKS", XL, YL);
	Canvas.bCenter = True;
	Canvas.SetPos(0, Canvas.ClipY);
//	Canvas.DrawText(ScoreBoardText);
	Canvas.bCenter = False;
	Canvas.Reset();
}

defaultproperties
{
     GreenColor=(G=255)
     WhiteColor=(R=255,G=255,B=255)
     GoldColor=(R=255,G=255)
     BlueColor=(B=255)
     LightCyanColor=(R=128,G=255,B=255)
     SilverColor=(R=138,G=164,B=166)
     BronzeColor=(R=203,G=147,B=52)
     CyanColor=(G=128,B=255)
     RedColor=(R=255)
     LightGreenColor=(G=136)
     DarkGreenColor=(G=255,B=128)
     ParchmentColor=(R=227,G=210,B=176)
     FrigginDarkColor=(R=4,G=4,B=4)
     GameOverText="Game Over! We hope you all had fun!"
     UseCountry=True
     GroupName="The server"
}
