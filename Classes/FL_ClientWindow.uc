//=============================================================================
// FL_ClientWindow.
//=============================================================================
class FL_ClientWindow expands UWindowDialogClientWindow;

var UWindowCheckBox bInitiallyOnEdit, bBrightPlayerEdit, bSearchlightEdit;

function Created()
{
	local int Offset;

	Super.Created();

	Offset = 10;

	bInitiallyOnEdit = UWindowCheckBox(CreateControl(class'UWindowCheckBox',15,Offset,90,1));
	bInitiallyOnEdit.bChecked = class'FL_Mutator'.default.bInitiallyOn;
	bInitiallyOnEdit.SetText("Initially On");
	Offset += 20;

	bBrightPlayerEdit = UWindowCheckBox(CreateControl(class'UWindowCheckBox',15,Offset,90,1));
	bBrightPlayerEdit.bChecked = class'FL_Mutator'.default.bBrightPlayer;
	bBrightPlayerEdit.SetText("Bright Player");
	Offset += 20;

	bSearchlightEdit = UWindowCheckBox(CreateControl(class'UWindowCheckBox',15,Offset,90,1));
	bSearchlightEdit.bChecked = class'FL_Mutator'.default.bSearchlight;
	bSearchlightEdit.SetText("Searchlight");
}

function Notify(UWindowDialogControl C, byte E)
{
	switch(E) {
		case DE_Change:
			switch(C) {
				case bInitiallyOnEdit: 
					class'FL_Mutator'.default.bInitiallyOn = bInitiallyOnEdit.bChecked;
					class'FL_Mutator'.static.StaticSaveConfig();
					break;
				case bBrightPlayerEdit: 
					class'FL_Mutator'.default.bBrightPlayer = bBrightPlayerEdit.bChecked;
					class'FL_Mutator'.static.StaticSaveConfig();
					break;
				case bSearchlightEdit: 
					class'FL_Mutator'.default.bSearchlight = bSearchlightEdit.bChecked;
					class'FL_Mutator'.static.StaticSaveConfig();
					break;
				}
			break;
	}
}

defaultproperties
{
}
