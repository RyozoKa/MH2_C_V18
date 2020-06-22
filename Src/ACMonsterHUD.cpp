#include "MH2_C_V17Private.h"


void ACMonsterHUD::drawRadar(UCanvas* C)
{
    APawn *TP;
    int index, radius, i, k, m;
    int originX, originY;
    APawn *P;
    bool bOn;
	UViewport* View;
	FPlane asd;
	
	if(!bClientUseRadar) return;

//    radius = Canvas.sizeY/16;
	View = C->Viewport;
	radius = View->SizeY/7;

	switch(Position)
	{
	case RADAR_TopLeft:
		originX = 30;
		originY = 30;
	break;
		case RADAR_TopMiddle:
		originX = View->SizeX/2 - radius;
		originY = 30;
	break;
		case RADAR_TopRight:
		originX = View->SizeX - radius*2 - 30;
		originY = 30;
	break;
		case RADAR_MiddleLeft:
		originX = 10;
//originY = C.SizeY/2 - radius;
		originY = View->SizeY/1.75 - radius;
	break;
		case RADAR_MiddleRight:
//originX = C.SizeX - radius - 80;
		originX = View->SizeX - radius - 130;
//originY = C.SizeY/2 - radius;
		originY = View->SizeY/1.7 - radius;
	break;
		case RADAR_BottomLeft:
		originX = 30;
		originY = View->SizeY - radius*2 - 30;
	break;
		case RADAR_BottomMiddle:
		originX = View->SizeX/2 - radius;
		originY = View->SizeY - radius*2 - 30;
	break;
		case RADAR_BottomRight:
		originX = View->SizeX - radius*2 - 30;
		originY = View->SizeY - radius*2 - 30;
	break;
	}
	
	switch (RadarColor)
	{
	case COL_White:
	C->Color=WhiteColor;
	break;
	case COL_Red:
	C->Color=RedColor;
	break;
	case COL_Blue:
	C->Color=BlueColor;
	break;
	case COL_Green:
	C->Color=GreenColor;
	break;
	case	COL_Cyan:
	C->Color=CyanColor;
	break;
	case	COL_Gold:
	C->Color=GoldColor;
	break;
	case	COL_HUD:
	C->Color=HUDColor;
	case	COL_None:
	//none
	break;
	}
	
	C->Style = 3;    // new attempt at transparency
	C->CurX = originX;
	C->CurY = originY;
	C->DrawTile(RadarTex, radius*2, radius*2, 0, 0, 256, 256,0,0,NULL,0,asd,asd,NULL);
	//virtual void DrawTile( UTexture* Texture, FLOAT X, FLOAT Y, FLOAT XL, FLOAT YL, FLOAT U, FLOAT V, FLOAT UL, FLOAT VL, class FSpanBuffer* SpanBuffer, FLOAT Z, FPlane Color, FPlane Fog, DWORD PolyFlags ); // 23
//if(bDrawEnd)
  //  drawEndBlip(MELoc, C, originX, originY, radius);

}





void
	ACMonsterHUD::execNativePostRender(FFrame& Stack, RESULT_DECL)
{
guard(ACMonsterHUD::execNativePostRender)
P_GET_OBJECT(UCanvas,C);
P_FINISH;

	drawRadar(C);//Test
unguard;
}

