//========================================================================================
// Static string functions.
//========================================================================================

class StaticStringFuncs expands Object;


static final function String Rem(string str, int num)
{
	return Left(str,num);//Same function really.
}
static final function string ReplaceText(coerce string Text, coerce string Replace, coerce string With)
{
	local int i;
	local string Output;
 
	i = InStr(Text, Replace);
	while (i != -1) {	
		Output = Output $ Left(Text, i) $ With;
		Text = Mid(Text, i + Len(Replace));	
		i = InStr(Text, Replace);
	}
	Output = Output $ Text;
	return Output;
}

static final function string LTrim(coerce string S)
{
	while (Left(S, 1) == " ")
		S = Right(S, Len(S) - 1);
	return S;
}
static final function string RTrim(coerce string S)
{
	while (Right(S, 1) == " ")
		S = Left(S, Len(S) - 1);
	return S;
}
static final function string Trim(coerce string S)
{
	return LTrim(RTrim(S));
}

static final function string AlphaNumeric(string s)
{
	local string result;
	local int i, c;
 
	for (i = 0; i < Len(s); i++) {
		c = Asc(Right(s, Len(s) - i));
		if ( c == Clamp(c, 48, 57) ) // 0-9
			result = result $ Chr(c);
		else if ( c == Clamp(c, 65, 90) ) // A-Z
			result = result $ Chr(c);
		else if ( c == Clamp(c, 97, 122) ) // a-z
			result = result $ Chr(c - 32);	// convert to uppercase
	}
 
	return result;
}

static final function bool IsUpper(coerce string S)
{
    return S == Caps(S);
}
static final function bool IsLower(coerce string S)
{
    return S == Lower(S);
}

static final function string Lower(coerce string Text) {
 
  local int IndexChar;
 
  for (IndexChar = 0; IndexChar < Len(Text); IndexChar++)
    if (Mid(Text, IndexChar, 1) >= "A" &&
        Mid(Text, IndexChar, 1) <= "Z")
      Text = Left(Text, IndexChar) $ Chr(Asc(Mid(Text, IndexChar, 1)) + 32) $ Mid(Text, IndexChar + 1);
 
  return Text;
  }

defaultproperties
{
}
