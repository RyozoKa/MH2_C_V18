//Thanks to the makers of doublejumpUT I would of never knew how to finish this


class walldodge expands tournamentpickup config (walldodgev2);

var bool bdidit;
var config bool bInfiniteDodge;
var float count, taptime;
var config int distance, jumpheight;
var config float clicktime;
var int num;

replication
{
	reliable if( Role<ROLE_Authority )
		dodgeforward,dodgeleft,dodgeright,dodgeback;
	reliable if( Role==ROLE_Authority )
                     Clientplayanim,num;

}



simulated function PreBeginPlay()
{
	
	// Initialize keys
local playerpawn p;

foreach allactors(class'playerpawn', p)
{InitializeKeys(P);}
        
	

}

simulated function timer()
{

num=0;
bdidit=true;
}
simulated function InitializeKeys(PlayerPawn P)
{
	local string keyName;
	local string keyBinding;
	local int i;
	


	for (i=0; i<255; i++)
	{
		keyName = P.ConsoleCommand("Keyname"@i);
		
		if ((InStr( P.ConsoleCommand("Keybinding"@keyName), "MoveForward") != -1)
 && (InStr( P.ConsoleCommand("Keybinding"@keyName), "dodgeforward") == -1))
		{
			keyBinding = P.ConsoleCommand("Keybinding"@keyName);
			P.ConsoleCommand("SET INPUT"@keyName@"dodgeforward|"$keyBinding);
			
		}

		if ((InStr( P.ConsoleCommand("Keybinding"@keyName), "MoveBackward") != -1)
 && (InStr( P.ConsoleCommand("Keybinding"@keyName), "dodgeback") == -1))
		{
			keyBinding = P.ConsoleCommand("Keybinding"@keyName);
			P.ConsoleCommand("SET INPUT"@keyName@"dodgeback|"$keyBinding);
			
		}

		if ((InStr( P.ConsoleCommand("Keybinding"@keyName), "StrafeLeft") != -1)
 && (InStr( P.ConsoleCommand("Keybinding"@keyName), "dodgeleft") == -1))
		{
			keyBinding = P.ConsoleCommand("Keybinding"@keyName);
			P.ConsoleCommand("SET INPUT"@keyName@"dodgeleft|"$keyBinding);
			
		}

		if ((InStr( P.ConsoleCommand("Keybinding"@keyName), "StrafeRight") != -1)
 && (InStr( P.ConsoleCommand("Keybinding"@keyName), "dodgeright") == -1))
		{
			keyBinding = P.ConsoleCommand("Keybinding"@keyName);
			P.ConsoleCommand("SET INPUT"@keyName@"dodgeright|"$keyBinding);
			
		}




	}
}




simulated function tick(float delta)
{
    local vector X,Y,Z, TraceStart, TraceEnd, Dir, Cross, HitLocation, HitNormal,  TraceStart2, TraceEnd2;
    local Actor HitActor, hitactor2;
	local rotator TurnRot;

	if(Owner == none) return;
    GetAxes(TurnRot,X,Y,Z);


if ( owner.Physics == PHYS_walking &&bdidit==true||binfinitedodge)
    {bdidit=false;num=0;}

}





////////////////////////////////////////////////////////////////////
exec function dodgeforward()
{
  
   local vector X,Y,Z, TraceStart, TraceEnd, Dir, Cross, HitLocation, HitNormal;
    local Actor HitActor, hitactor2, hitactor3, hitactor4;
	local rotator TurnRot;


	TurnRot.Yaw = owner.Rotation.Yaw;
    GetAxes(TurnRot,X,Y,Z);



if ( owner.Physics == PHYS_Falling&&num==0)
    {num++;}
else if ( owner.Physics == PHYS_Falling&&num==1)
    {
num++;

if(playerpawn(owner)!=none){

            TraceEnd = -X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);}


            TraceEnd = X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor2 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor3 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = -Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor4 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
      
                         

}
else if ( owner.Physics == PHYS_walking){bdidit=false;num=0;}





   
  if(hitactor==level && bdidit==false){PlaySound(sound'land1', SLOT_Talk, 1.0, true, 800, 1.0 );playerpawn(owner).DodgeDir = DODGE_Active;
		bdidit=true;
		owner.velocity = 1.5*distance*X + (owner.velocity Dot Y)*Y;clientplayanim('flip',1.6 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z),0.0);
                  playerpawn(owner).SetPhysics(PHYS_Falling);owner.velocity.z=jumpheight;}
	

if (hitactor2==level && bdidit==false){playerpawn(owner).bwasforward=false;PlaySound(sound'land1', SLOT_Talk, 1.0, true, 800, 1.0 );bdidit=true;
			owner.velocity = -1.5*distance*X + (owner.velocity Dot Y)*Y;clientplayanim('flip',1.6 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z),0.0);
                        bdidit=true;playerpawn(owner).DodgeDir = DODGE_Active;
		playerpawn(owner).SetPhysics(PHYS_Falling);owner.velocity.z=jumpheight;}
	

settimer(clicktime,false);
}

		

exec function dodgeback()
{
  
   local vector X,Y,Z, TraceStart, TraceEnd, Dir, Cross, HitLocation, HitNormal;
    local Actor HitActor, hitactor2, hitactor3, hitactor4;
	local rotator TurnRot;


	TurnRot.Yaw = owner.Rotation.Yaw;
    GetAxes(TurnRot,X,Y,Z);



if ( owner.Physics == PHYS_Falling&&num==0)
    {num++;}
else if ( owner.Physics == PHYS_Falling&&num==1)
    {
num++;

if(playerpawn(owner)!=none){

            TraceEnd = -X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);}


            TraceEnd = X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor2 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor3 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = -Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor4 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
      
                         

}
else if ( owner.Physics == PHYS_walking){bdidit=false;num=0;}





   
  if(hitactor==level && bdidit==false){PlaySound(sound'land1', SLOT_Talk, 1.0, true, 800, 1.0 );playerpawn(owner).DodgeDir = DODGE_Active;
		bdidit=true;
		owner.velocity = 1.5*distance*X + (owner.velocity Dot Y)*Y;clientplayanim('flip',1.6 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z),0.0);
                  playerpawn(owner).SetPhysics(PHYS_Falling);owner.velocity.z=jumpheight;}
	

if (hitactor2==level && bdidit==false){playerpawn(owner).bwasforward=false;PlaySound(sound'land1', SLOT_Talk, 1.0, true, 800, 1.0 );bdidit=true;
			owner.velocity = -1.5*distance*X + (owner.velocity Dot Y)*Y;clientplayanim('flip',1.6 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z),0.0);
                        bdidit=true;playerpawn(owner).DodgeDir = DODGE_Active;
		playerpawn(owner).SetPhysics(PHYS_Falling);owner.velocity.z=jumpheight;}



settimer(clicktime,false);
	
}
exec function dodgeright()
{
  
   local vector X,Y,Z, TraceStart, TraceEnd, Dir, Cross, HitLocation, HitNormal;
    local Actor HitActor, hitactor2, hitactor3, hitactor4;
	local rotator TurnRot;


	TurnRot.Yaw = owner.Rotation.Yaw;
    GetAxes(TurnRot,X,Y,Z);



if ( owner.Physics == PHYS_Falling&&num==0)
    {num++;}
else if ( owner.Physics == PHYS_Falling&&num==1)
    {
num++;

if(playerpawn(owner)!=none){

            TraceEnd = -X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);}


            TraceEnd = X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor2 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor3 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = -Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor4 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
      
                         

}
else if ( owner.Physics == PHYS_walking){bdidit=false;num=0;}






if (hitactor4==level && bdidit==false){PlaySound(sound'land1', SLOT_Talk, 1.0, true, 800, 1.0 );bdidit=true;
			owner.velocity = 1.5*distance*y + (owner.velocity Dot X)*Y;clientplayanim('flip',1.0,0.0);bdidit=true;//playerpawn(owner).DodgeDir = DODGE_Active;

playerpawn(owner).SetPhysics(PHYS_Falling);owner.velocity.z=jumpheight;}

settimer(clicktime,false);
		
}
exec function dodgeleft()
{
  
   local vector X,Y,Z, TraceStart, TraceEnd, Dir, Cross, HitLocation, HitNormal;
    local Actor HitActor, hitactor2, hitactor3, hitactor4;
	local rotator TurnRot;


	TurnRot.Yaw = owner.Rotation.Yaw;
    GetAxes(TurnRot,X,Y,Z);



if ( owner.Physics == PHYS_Falling&&num==0)
    {num++;}
else if ( owner.Physics == PHYS_Falling&&num==1)
    {
num++;

if(playerpawn(owner)!=none){

            TraceEnd = -X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);}


            TraceEnd = X;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor2 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor3 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);

            TraceEnd = -Y;

        TraceStart = owner.Location - owner.CollisionHeight*Vect(0,0,1) + TraceEnd*43;
        TraceEnd = TraceStart + TraceEnd*32.0;
        HitActor4 = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
      
                         

}
else if ( owner.Physics == PHYS_walking){bdidit=false;num=0;}





   

if (hitactor3==level && bdidit==false){PlaySound(sound'land1', SLOT_Talk, 1.0, true, 800, 1.0 );bdidit=true;
			owner.velocity=vect(0,0,0);owner.velocity = -1.5*distance*y + (owner.velocity Dot X)*Y;clientplayanim('flip',1.0,0);bdidit=true;playerpawn(owner).DodgeDir = DODGE_Active;
			  	
playerpawn(owner).SetPhysics(PHYS_Falling);owner.velocity.z=jumpheight;}	

settimer(clicktime,false);
		}

simulated function Clientplayanim( name Sequence, optional float Rate, optional float TweenTime )
{
	Owner.PlayAnim(Sequence,rate, 0.05);
}

defaultproperties
{
     Distance=300
     jumpHeight=200
     ClickTime=0.400000
}
