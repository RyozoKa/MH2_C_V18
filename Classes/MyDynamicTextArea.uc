class MyDynamicTextArea expands UWindowDynamicTextArea;

function float DrawTextLine(Canvas C, UWindowDynamicTextRow L, float Y)
{
	local float X, W, H, S, K;

	if(bHCenter)
	{
		TextAreaTextSize(C, L.Text, W, H);
		if(VertSB.bWindowVisible)
			X = int(((WinWidth - VertSB.WinWidth) - W) / 2);
		else
			X = int((WinWidth - W) / 2);
	}
	else
		X = 2;
		//This is all for that nice Linux style.
	if(InStr(L.Text,"[OK]") != -1)
	{
	//Make sure that it's not longer than one line! and that it's the last word in the line.
		C.StrLen(Left(L.Text,InStr(L.Text,"OK]")),S,K);
		TextAreaClipText(C, X, Y, Left(L.Text,InStr(L.Text,"OK]")));
		C.DrawColor.R=0;
		C.DrawColor.G=255;
		C.DrawColor.B=0;
		TextAreaClipText(C, S+3, Y, "OK");
		C.DrawColor=TextColor;
		C.StrLen(Left(L.Text,InStr(L.Text,"]")),S,K);
		TextAreaClipText(C, S+5, Y, "]");
		if(InStr(L.Text,"]")<Len(L.Text))
				TextAreaClipText(C, S+10, Y, Right(L.Text,(Len(L.Text)-InStr(L.Text,"]")-1)));
	}
	else if(InStr(L.Text,"[WARNING]") != -1)
	{
	//Make sure that it's not longer than one line! and that it's the last word in the line.
		C.StrLen(Left(L.Text,InStr(L.Text,"WARNING]")),S,K);
		TextAreaClipText(C, X, Y, Left(L.Text,InStr(L.Text,"WARNING]")));
		C.DrawColor.R=255;
		C.DrawColor.G=255;
		C.DrawColor.B=0;
		TextAreaClipText(C, S+3, Y, "WARNING");
		C.DrawColor=TextColor;
		C.StrLen(Left(L.Text,InStr(L.Text,"]")),S,K);
		TextAreaClipText(C, S+5, Y, "]");
		if(InStr(L.Text,"]")<Len(L.Text))
				TextAreaClipText(C, S+10, Y, Right(L.Text,(Len(L.Text)-InStr(L.Text,"]")-1)));
	}
	else if(InStr(L.Text,"[FAIL]") != -1)
	{
	//Make sure that it's not longer than one line! and that it's the last word in the line.
		C.StrLen(Left(L.Text,InStr(L.Text,"FAIL]")),S,K);
		TextAreaClipText(C, X, Y, Left(L.Text,InStr(L.Text,"FAIL]")));
		C.DrawColor.R=255;
		C.DrawColor.G=0;
		C.DrawColor.B=0;
		TextAreaClipText(C, S+3, Y, "FAIL");
		C.DrawColor=TextColor;
		C.StrLen(Left(L.Text,InStr(L.Text,"]")),S,K);
		TextAreaClipText(C, S+5, Y, "]");
			if(InStr(L.Text,"]")<Len(L.Text))
				TextAreaClipText(C, S+10, Y, Right(L.Text,(Len(L.Text)-InStr(L.Text,"]")-1)));
			
	}
	else
	TextAreaClipText(C, X, Y, L.Text);

	return DefaultTextHeight;
}

defaultproperties
{
}
