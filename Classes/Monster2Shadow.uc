//========================================================================================
// Check Out.... Wow what a mess.... have to deal with this....comeon?
//========================================================================================

class Monster2Shadow expands Decal;
var vector OldOwnerLocation;
//var vector offset;
var float lastanimframe; //stasis check
var bool timing; //check if timeing.
simulated event PostBeginPlay()
{
//initial 0.028
//Rework for some big asses making night arround them, grr...
//Maybe is better to not check names... I guess I can gain some speed
	if (Owner.CollisionRadius < 69) //Limit the big one to Behemoth option
		drawscale = (0.030 * Owner.CollisionRadius)* Owner.DrawScale;
else
	if (Owner.CollisionRadius >= 69 && Owner.CollisionRadius < 116)
		drawscale = (0.015 * Owner.CollisionRadius)* Owner.DrawScale;
else
	drawscale = (0.009 * Owner.CollisionRadius)* Owner.DrawScale;
//Don't worry, I think as server you cannot change Constants In Client Ever without permision...
//Is like the same as for FOG. Client can decide if is true or false not server, server might suggest
//turning on or off... So, big monsters 3-4 at Drawscale still have too small shadow :( as client.
/*
	drawscale=(0.025*owner.default.collisionradius)*owner.drawscale; //I'm basing this kinda on the playerpawn one :P
	if (owner.isa('ledino')||owner.isa('nali')||owner.isa('slith')||owner.isa('manta'))
		drawscale=(0.014*owner.default.collisionradius)*owner.drawscale;
//		drawscale*=0.75;
	//if (owner.isa('ledino'))
		//offset=vect(-40,0,0);
*/
}
simulated function bool CheckRender()
{
	local bool bRetVal;
	if (lastanimframe==0)
		bRetVal=false;
	else
		bretval=(lastanimframe!=owner.animframe);
	lastanimframe=owner.animframe;
	return bRetVal;
}
simulated event timer()
{
	//local pawn p;
	owner.style=owner.default.style;
	/*(  for (p=level.pawnlist;p!=none;p=p.nextpawn)
			if (p.isa('playerpawn')){
				p.clientmessage(owner@"reset to normal at"@level.timeseconds@"with anim"@owner.animsequence);
				return;
			}
	*/
}

simulated event tick(float delta)
{
	local Actor HitActor;
	local Vector HitNormal,HitLocation, ShadowStart;
	//masked stuff?
	if (Owner != None)
	{
		if (!timing&&owner.style==STY_MASKED&&owner.default.style==STY_NORMAL&&(level.game==none||level.game.gamereplicationinfo.priarray[0]!=none&&(/*owner.isa('slith')||*/owner.isa('SkaarjWarrior'))&&!owner.IsInState('startup')&&(owner.bstasis||!owner.IsInState('waiting'))&&owner.PlayerCanSeeMe())&&CheckRender()/*&&owner.IsAnimating()&&(owner.bviewtarget||owner.PlayCanSeeMe())&&owner.RenderInterface!=none&&owner.RenderInterface.Observer!=none*/)
		{
			timing=true;
			SetTimer(0.08,false);
			//owner.style=owner.default.style;
			//bstasis=false;
		}
			//owner.style=owner.default.style;
		if ( OldOwnerLocation == Owner.Location )
			return;

		OldOwnerLocation = Owner.Location;
	
		DetachDecal();
		if ( !Level.bHighDetailMode )
			return;
		if (Owner.Style == STY_Translucent )
			return;
		if (owner.isa('skaarj')&&owner.AnimSequence == 'Death2')	//feign death.
		return;
		ShadowStart = Owner.Location +/*offset+ */Owner.CollisionRadius * vect(0.1,0.1,0);
		DrawScale *= (ShadowStart.Z - Owner.Location.Z) - int(ShadowStart.Z - Owner.Location.Z);// becomes smaller depending on the distance of the monster and the floor
		HitActor = Trace(HitLocation, HitNormal, ShadowStart - vect(0,0,300), ShadowStart, false);
	
		if ( HitActor == None )
			return;
	
		SetLocation(HitLocation);
		SetRotation(rotator(HitNormal));
		AttachDecal(10, vect(0.1,0.1,0));
	}
	else
	{

		DetachDecal();
		//Disable('Tick');
		Destroy();
	}
}

defaultproperties
{
     MultiDecalLevel=3
     Texture=Texture'Botpack.energymark'
     DrawScale=0.500000
}
