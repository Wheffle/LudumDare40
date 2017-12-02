/// item_pickup(item);
/*
    Run within "obj_drone" context.
*/
if (cargo == noone)
{
    cargo = argument0;
    with(cargo) event_user(EV_ITEM_PICKUP);
    image_index = 1;
    physics_mass_properties(drone_mass+1, phy_com_x, phy_com_y, phy_inertia);
}   
