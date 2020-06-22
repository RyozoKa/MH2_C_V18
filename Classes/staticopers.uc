class staticopers expands Object;

static function color setcolor(byte R, byte G, byte B, optional byte A)
{
local color col;

col.R=R;
col.G=G;
col.B=B;
col.A=A;
return col;
}

defaultproperties
{
}
