/// item_get();
/*
    Run within "obj_drone" context.
*/
if (cargo != noone)
{
    audio_play_sound(sfx_itemget, SFX_PRIORITY, false);
    image_index = 0;
    with(cargo)
    { 
        event_user(EV_ITEM_GET);
        instance_destroy();
    }
    
    cargo = noone;
    physics_mass_properties(drone_mass, phy_com_x, phy_com_y, phy_inertia);
}   
