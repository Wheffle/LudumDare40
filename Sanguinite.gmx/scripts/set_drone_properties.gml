/// set_drone_properties();
/*
    Run within "obj_drone" context.
*/

with(obj_player_properties)
{
    other.thrust_force = thrust_force;
    other.hp_max = hp_max;
    other.hp = hp_max;
    other.firepower = firepower;
    other.firespeed = firespeed;
    other.fire_timer_set = fire_timer_set;
    other.firearea = firearea;
    other.bombsize = bombsize;
    other.bombcharge = bombcharge;
    
    if (thrust_force < 60)
    {
        other.flame_image_blend = c_red;
    }
    else if (thrust_force < 80)
    {
        other.flame_image_blend = c_yellow;
    }
    else
    {
        other.flame_image_blend = c_aqua;
    }
}
