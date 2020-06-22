class LimeLight extends Flashlight;

#exec TEXTURE IMPORT NAME=Beelight FILE=TEXTURES\Beelight.PCX GROUP="Icons" MIPS=OFF

var FlashLightBeam s;
var float TimeChange;
var Vector HitNormal,HitLocation,EndTrace,StartTrace,X,Y,Z,NewHitLocation;

state Activated
{
   function endstate()
   {
      if (s!=None) s.Destroy();
      bActive = false;
   }
   function Tick( float DeltaTime )
   {
      TimeChange += DeltaTime*10;
      if (TimeChange > 1)
      {
         if ( s == None )
         {
            UsedUp();
            return;
         }
         Charge -= int(TimeChange);
         TimeChange = TimeChange - int(TimeChange);
      }
      if (s == None) Return;
      if ( Pawn(Owner) == None )
      {
         s.Destroy();
         UsedUp();
         return;
      }
      if (Charge<-0)
      {
         s.Destroy();
         Pawn(Owner).ClientMessage(ExpireMessage);
         UsedUp();
      }
      if (Charge==255)
         Pawn(Owner).ClientMessage("Battery is running out!!!");
      if (Charge<255) s.LightBrightness=byte(Charge);
         GetAxes(Pawn(Owner).ViewRotation,X,Y,Z);
      EndTrace = Pawn(Owner).Location + 10000* Vector(Pawn(Owner).ViewRotation);
      Trace(HitLocation,HitNormal,EndTrace,Pawn(Owner).Location, True);
      s.SetLocation(HitLocation-vector(Pawn(Owner).ViewRotation)*64);
   }
   function BeginState()
   {
      TimeChange = 0;
      Owner.PlaySound(ActivateSound);
      GetAxes(Pawn(Owner).ViewRotation,X,Y,Z);
      EndTrace = Pawn(Owner).Location + 10000* Vector(Pawn(Owner).ViewRotation);
      Trace(HitLocation,HitNormal,EndTrace,Pawn(Owner).Location+Y*17);
      s = Spawn(class'LimeLightBeam',Owner, '', HitLocation+HitNormal*40);
      s.LightHue = LightHue;
      s.LightRadius = LightRadius;
      if (Charge<255) s.LightBrightness=byte(Charge);
      if (s==None) GoToState('DeActivated');
   }
   Begin:
}

state DeActivated
{
   Begin:
      s.Destroy();
      Owner.PlaySound(DeActivateSound);
}

defaultproperties
{
     PickupMessage="You picked up the enhanced Flashlight"
     RespawnTime=5.000000
     Charge=20000
     DeActivateSound=Sound'LadderSounds.LadderSounds.lsChange1'
     MultiSkins(0)=Texture'MH2_C_V18.Icons.Beelight'
     MultiSkins(1)=Texture'MH2_C_V18.Icons.Beelight'
     LightHue=167
     LightRadius=30
     LightCone=255
}
