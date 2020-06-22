//=============================================================================
// PowerUpsBaseOv.
//=============================================================================
class PowerUpsBaseOv expands Effects;

#exec TEXTURE IMPORT NAME=TransInv FILE=SKINS\TransInv.bmp GROUP=Misc FLAGS=2

//Model Import
#exec mesh import mesh=UTPowerUpBaseOv anivfile=Models\UTPowerUpBase2M_a.3d datafile=Models\UTPowerUpBase2M_d.3d x=0 y=0 z=0 MLOD=0
#exec mesh origin mesh=UTPowerUpBaseOv x=0 y=0 z=0.25
#exec mesh sequence mesh=UTPowerUpBaseOv seq=All startframe=0 numframes=1

#exec meshmap new meshmap=UTPowerUpBaseOv mesh=UTPowerUpBaseOv
#exec meshmap scale meshmap=UTPowerUpBaseOv x=0.07411 y=0.07411 z=0.14822


#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBaseOv NUM=0 TEXTURE=TransInv
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBaseOv NUM=1 TEXTURE=TransInv
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBaseOv NUM=2 TEXTURE=TransInv
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBaseOv NUM=3 TEXTURE=TransInv
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBaseOv NUM=4 TEXTURE=TransInv
#exec MESHMAP SETTEXTURE MESHMAP=UTPowerUpBaseOv NUM=5 TEXTURE=TransInv

defaultproperties
{
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     DrawType=DT_Mesh
     Style=STY_Translucent
     Mesh=Mesh'MH2_C_V18.UTPowerUpBaseOv'
     ScaleGlow=2.000000
     bUnlit=True
}
