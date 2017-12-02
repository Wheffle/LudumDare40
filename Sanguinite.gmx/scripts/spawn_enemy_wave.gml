/// spawn_enemy_wave();

repeat(7)
{
    spawn_random_enemy();
}

show_popup("Hostile surge detected.", c_red, 5);
