/// item_pickup(item);
/*
    Run within "obj_drone" context.
*/
if (cargo == noone)
{
    audio_play_sound(sfx_pickup, SFX_PRIORITY, false);
    cargo = argument0;
    cargo.drone_id = id;
    with(cargo) event_user(EV_ITEM_PICKUP);
    image_index = 1;
    physics_mass_properties(drone_mass+cargo.mass, phy_com_x, phy_com_y, phy_inertia);
}   
