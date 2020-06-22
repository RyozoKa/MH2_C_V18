class CSInfoClass expands Object;

//All we do here is predefine the rotator adjustments for the weapons to draw on HUD

static final function rotator GetAdjustment(class ClassM)
{

	switch(ClassM)
	{
	
		case Class'AK47':
			return rot(-3000, 0, -16383);
		case class'XM1014':
			return rot(-16363, 32766, -16383);
		case class'Famas':
			return rot(12000, 0, -16383);
		case class'sg550':
			return rot(-4500, 0, -16383);
		case class'AWP':
			return rot(-3400, 0, -16383);
		case class'P90':
			return rot(-5000, 0, -16383);
		case class'MP5':
			return rot(-14600, 32766, -16383);
		case class'g3sg1':
			return rot(-3500, 0, -16383);
		case class'M3':
			return rot(-6000, 0, -16383);
		case class'M249':
			return rot(-800, 0, -16383);
		case class'TMP':
			return rot(-7000, 0, -16383);
		case class'Mac10':
			return rot(-32766, 32766, -16383);
		case class'GrenadeFrag':
			return rot(8000, 0, 0);
		case class'Galil':
			return rot(19000, 0, -16383);
		case class'M4A1':
			return rot(6000, 0, -16383);
		case class'UMP45':
			return rot(4000, 0, -16383);
		
		default:
			return rot(0,0,0);	//Invalid
	}
}