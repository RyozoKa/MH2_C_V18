//=============================================================================
// AssertMover.
//=============================================================================
class AssertMoverFix extends AssertMover;

// A mover which keeps opening as long as the instigator stays within
// the trigger's radius.  If the instigator steps out, the mover will
// stay in it's current position for WaitUnAssertTime time, and then
// close all the way back to the beginning.  If the bTriggerOnceOnly
// variable is true, once it reaches the last keyframe, it will
// stay there forever if bOnceOnlyStopOpen is true, or it will go back
// to the first frame (after waiting for StayOpenTime) and stay there 
// forever if bOnceOnlyStopOpen is false.  If bTriggerOnceOnly is 
// false, when it reaches the last keyframe, after it waits for 
// StayOpenTime, it will return to the first keyframe, and the
// entire process will be repeatable.
// Note: When the last keyframe is reached, Event will be called. M.
/*
	Note: This is about the worst I've seen
	No name for who I can blame? Epic..
	Setting max 6 keyframes without any Min/Max causing arrays out of bound...
*/


function DoOpen_Fix() 
{

	// Open through to the next keyframe.
	//
	bOpening = true;
	bDelaying = false;
	if(KeyNum > 5)
		KeyNum = 5;
	if(KeyNum < 0)
		KeyNum = 0;
	LastKeyNum = KeyNum;
	InterpolateTo (KeyNum+1, OpenTimes[Keynum]);
	PlaySound (OpeningSound);
	AmbientSound = MoveAmbientSound;
}

function DoClose_Fix() 
{

	// Close through to the next keyframe.
	//
	bOpening = false;
	bDelaying = false;
	if(KeyNum > 6)
		KeyNum = 6;
	if(KeyNum < 1)
		KeyNum = 1;
	LastKeyNum = KeyNum;
	InterpolateTo (KeyNum-1, CloseTimes[Keynum-1]);
	PlaySound (ClosingSound);
	AmbientSound = MoveAmbientSound;
}

defaultproperties
{
}
