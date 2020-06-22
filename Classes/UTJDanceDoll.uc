class UTJDanceDoll expands decoration;

var (UTJAnimSetting) bool bAnim;
var (UTJAnimSetting) bool bCanStopAnim;
var (UTJAnimSetting) bool bLoop;
var (UTJAnimSetting) float fLoopAnimSpeed;
var (UTJAnimSetting) float fOnceAnimSpeed;
var (UTJAnimSetting) float fStopAnimSpeed;
var (UTJAnimSetting) float fDeathAnimSpeed;
var (UTJAnimSetting) bool bStopAnim;
var (UTJAnimSetting) bool bUseSound;
var (UTJAnimSetting) bool bFalling;
var (UTJAnimSetting) bool bUseDamageTrigger;
var (UTJAnimSetting) Name DamageEvent;
var (UTJAnimSetting) bool bIsHit;
var (UTJAnimSetting) int Health;
var (UTJAnimSetting) Name DeathAnimSequence[7];
var (UTJAnimSetting) Name TriggerAnimSequence;
var (UTJAnimSetting) Name StopAnimSequence;
var (UTJAnimSetting) Sound HitSound[4];
var (UTJAnimSetting) Sound DeathSound[5];
var bool bIsStartAnim;
var bool bAnimEnable;


function PostBeginPlay()
{
   Super.PostBeginPlay();
   bIsStartAnim = False;
   bAnimEnable = True;
   if(!bIsHit)SetCollision(False);
   SetCollisionSize(CollisionRadius*DrawScale,CollisionHeight*DrawScale);
}

Auto State DanceDoll
{
   function TakeDamage( int NDamage, Pawn instigatedBy, Vector hitlocation, Vector momentum, name damageType)
   {
      local actor A;
      if(bIsHit && instigatedBy.IsA('TournamentPlayer'))
      {
         Instigator = InstigatedBy;
	 if (Health<0) Return;
	 if ( Instigator != None )
	    MakeNoise(1.0);
	 bBobbing = false;
	 if(bFalling)SetPhysics(PHYS_Falling);

 	 Health -= NDamage;
	 if (Health <0)
	 {
	    if(bUseSound)PlaySound(DeathSound[rand(5)]);
	       GotoState( 'DanceDoll','Death');
	    if( Event != '' )
	    foreach AllActors( class 'Actor', A, Event )
	       A.Trigger( instigatedBy, instigatedBy );
	 } 
         else
	 {// hitsound etc
	    if(bUseSound)PlaySound(HitSound[rand(4)]);
	    if(bUseDamageTrigger)
            {
	       if( DamageEvent != '' )
	       foreach AllActors( class 'Actor', A, DamageEvent )
	          A.Trigger( instigatedBy, instigatedBy );
	    }
	 }
      }
      else Return;
   }

   function Trigger( actor Other, pawn EventInstigator )
   {
      if(bLoop && !bIsStartAnim && bAnimEnable)
      {
         GotoState( 'DanceDoll','Loop');
	 bIsStartAnim = True;
      }
      else if(bCanStopAnim && bIsStartAnim && bLoop && bAnimEnable)
      {
         bIsStartAnim = False;
	 GotoState( 'DanceDoll','StopDoll');
      }
      else if(!bLoop && bAnimEnable)
      {
         GotoState( 'DanceDoll','Once');
      }
   }

   Begin:
   if(bAnim)
   {
      bIsStartAnim = True;
      if(bLoop)GotoState( 'DanceDoll','StartDance');
      else GotoState( 'DanceDoll','StartOnce');
   }
   Stop;
   StartDance:
      LoopAnim(AnimSequence,fLoopAnimSpeed);
      Stop;
   StartOnce:
      PlayAnim(AnimSequence,fOnceAnimSpeed);
      FinishAnim();
      Stop;
   Death:
      SetCollision(False);
      Disable('Trigger');
      PlayAnim(DeathAnimSequence[rand(7)],fDeathAnimSpeed);
      FinishAnim();
      bIsStartAnim=False;
      bAnimEnable=False;
      Enable('Trigger');
      Stop;
   Loop:
      LoopAnim(TriggerAnimSequence,fLoopAnimSpeed);
      Stop;
   Once:
      Disable('Trigger');
      PlayAnim(TriggerAnimSequence,fOnceAnimSpeed);
      FinishAnim();
      Enable('Trigger');
      bIsStartAnim = False;
      Stop;
   StopDoll:
      if(bStopAnim)
      {
	 PlayAnim(StopAnimSequence,fStopAnimSpeed);
      }
      FinishAnim();
      Stop;
}

defaultproperties
{
     bAnim=True
     fLoopAnimSpeed=1.000000
     fOnceAnimSpeed=1.000000
     fStopAnimSpeed=1.000000
     fDeathAnimSpeed=1.000000
     bFalling=True
     Health=100
     TriggerAnimSequence=Victory1
     StopAnimSequence=Victory1
     bStatic=False
     AnimSequence=Thrust
     DrawType=DT_Mesh
     CollisionRadius=17.000000
     CollisionHeight=39.000000
     bCollideActors=True
     bCollideWorld=True
     bBlockActors=True
     bBlockPlayers=True
}
