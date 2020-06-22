class MH2EnhancedReSpawn expands EnhancedReSpawn;

simulated function BeginPlay()
{
    Super(Effects).BeginPlay();
    PlayAnim('All',0.8);
}

simulated function PostBeginPlay()
{
    local inventory Inv;

    Super(Effects).PostBeginPlay();
    if ( Level.bDropDetail )
        LightType = LT_None;
    if ( Owner != None )
    {
        Inv = Inventory(Owner);
        if ( Inv != None )
        {
            if ( Inv.PickupViewScale == 1.0 )
                Mesh = Inv.PickUpViewMesh;
            else
                Mesh = Owner.Mesh;

	MakeSound(Inv);

            /*if ( Inv.RespawnTime < 15 )
                LifeSpan = 0.5;*/
        }
        else
            Mesh = Owner.Mesh;
        Animframe = Owner.Animframe;
        Animsequence = Owner.Animsequence;
    }
}

function MakeSound(Inventory Inv)
{
	PlaySound(Inv.RespawnSound);
}

defaultproperties
{
}
