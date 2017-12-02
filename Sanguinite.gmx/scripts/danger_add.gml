/// danger_add(amount);

with(ctrl_planet)
{
    danger += argument0;
    if (danger > 1) danger = 1;
}
