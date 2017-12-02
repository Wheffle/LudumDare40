/// deploy_drone();

with(obj_dropship)
{
    var drone = instance_create(x, y-70, obj_drone);
    with(drone) physics_apply_local_impulse(x, y, 0, -20);
    view_object[0] = obj_drone;
}
