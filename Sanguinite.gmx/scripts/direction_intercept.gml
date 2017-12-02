///dir = direction_intercept(x, y, speed, target_x, target_y, target_speed, target_dir);
/*
    Returns the direction a projectile needs to point in ordered
    to intercept a moving target (assuming constant speeds).

    Originally form GMLscripts.com
    
    Modified to use target attributes instead of target's instance ID to
    make it more flexible and general-purpose.
*/

var originx,originy,pspeed,dir,alpha,phi,beta,tar_x,tar_y,tar_speed,tar_dir;
originx = argument0;
originy = argument1;
pspeed = argument2;
tar_x = argument3;
tar_y = argument4;
tar_speed = argument5;
tar_dir = argument6;

dir = point_direction(originx,originy,tar_x,tar_y);

alpha = tar_speed / pspeed;
phi = degtorad(tar_dir - dir);
beta = alpha * sin(phi);
if (abs(beta) >= 1) {
    return (-1);
}
dir += radtodeg(arcsin(beta));

return dir;


