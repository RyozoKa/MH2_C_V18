class MH2Dancer expands UTJDanceDoll;
#Exec OBJ LOAD File="..\System\Squirrel.u"
#Exec OBJ LOAD File="..\Textures\SquirrelSkins.utx"

defaultproperties
{
     bLoop=True
     fLoopAnimSpeed=0.800000
     DeathAnimSequence(0)=Dead1
     DeathAnimSequence(1)=Dead2
     DeathAnimSequence(2)=Dead3
     DeathAnimSequence(3)=Dead4
     DeathAnimSequence(4)=Dead7
     DeathAnimSequence(5)=Dead8
     DeathAnimSequence(6)=Dead11
     TriggerAnimSequence=Thrust
     StopAnimSequence=Thrust
     Physics=PHYS_Rotating
     AnimSequence=Victory1
     Velocity=(Z=5000.000000)
     Mesh=LodMesh'Squirrel.Squirrel'
     DrawScale=0.800000
     MultiSkins(0)=Texture'SquirrelSkins.Squi1'
     MultiSkins(1)=Texture'SquirrelSkins.Squi2'
     MultiSkins(2)=Texture'SquirrelSkins.squi1t_0_A07'
     bCollideWorld=False
     bFixedRotationDir=True
     RotationRate=(Yaw=-5000)
}
