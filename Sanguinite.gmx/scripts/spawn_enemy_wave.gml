/// spawn_enemy_wave();

switch(room)
{
    case rm_planet_small:
        repeat(5) spawn_random_enemy();
        break;
        
    case rm_planet_med:
        repeat(10) spawn_random_enemy();
        break;
        
    case rm_planet_large:
        repeat(20) spawn_random_enemy();
        break;
}

audio_play_sound(sfx_alarm, SFX_PRIORITY, false);
show_popup("Hostile surge detected.", c_red, 5);
