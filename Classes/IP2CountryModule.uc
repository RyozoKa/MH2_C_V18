class IP2CountryModule expands TCPLink config(MH2_C_V18);

var int LocalPort;
var String UserIP;
var PlayerPawn Player; //Last Player request
var config String RemoteIP;
var config int RemotePort;

function GetIPToCountry(String IP, PlayerPawn P)
{
	local IpAddr Addrs;
	
	UserIP = IP;
	
	Player = P;
	StringToIpAddr(RemoteIP, Addrs);
	Addrs.Port = RemotePort;
	
	//Set modes
	LinkMode = MODE_Text;
	ReceiveMode = RMODE_Event;
	
	LocalPort = BindPort();
	if(LocalPort == 0)
	{
		Log("Failed to bind port to 192.111.155.210" $ GetLastError());
		return;
	}
	if(!Open(Addrs))
	{
		Log("Failed to open connection to 192.111.155.210 " $ GetLastError());
		return;
	}
	
}

event Opened()
{
	local String Request;

	Request = "GET http://iptocountry.ut-files.com/iptocountry16.php?ip=37.250.23.84 HTTP/1.1" $Chr(13)$Chr(10) $ 
			"User-Agent: Mozilla/5.0 (Android 4.4; Mobile; rv:41.0) Gecko/41.0 Firefox/41.0"$Chr(13)$Chr(10) $	//Lol they never have to know! We're in fact not an android
			"Connection: close" $ Chr(13) $ Chr(10) $
			"Host: 192.111.155.210:80" $ Chr(13) $ Chr(10) $ Chr(13) $ Chr(10);
	if(SendText(Request) == 0)
	{
		Log("Failed to send request " $ Request);
		return;
	}

}

event ReceivedText( String Text )
{
	local String Country;
	local int Index;
	local int LastIndex;
	local int i;
	local MHReplicationInfo MHR;
	if(Player == None)
		return;	//Oups
		
	MHR = MHReplicationInfo(Player.PlayerReplicationInfo);
	Index = InStr(Text, ":");
	//Skip other delimiters and headers
	for(i = 0; i < 10; ++i)
	{
		Text = Mid( Text, Index + 1);
		Index = InStr(Text, ":");
	}
	if(Index != -1)
	{
		Country = Mid( Text, Index + 1); //Right part of the string
		Index = InStr(Country, ":");	//Find the second delimiter
		Country = Left( Country, Index);
		MHR.Country = Country;
		Player = None;	//Don't use it again
	}
}

event PostBeginPlay()
{
	GetIPToCountry("37.250.23.84", None);

}

defaultproperties
{
	RemoteIP="192.111.155.210"
	RemotePort=80
}