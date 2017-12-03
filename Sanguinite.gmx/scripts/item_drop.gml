/// item_drop();
/*
    Run within "obj_drone" context.
*/
if (cargo != noone)
{
    audio_play_sound(sfx_drop, SFX_PRIORITY, false);
    with(cargo) event_user(EV_ITEM_DROP);
    cargo.drone_id = noone;
    cargo = noone;
    cargo_timer = cargo_timer_set;
    image_index = 0;
    physics_mass_properties(drone_mass, phy_com_x, phy_com_y, phy_inertia);
    
    mining_timer = 0;
    phy_active = true;
}   
