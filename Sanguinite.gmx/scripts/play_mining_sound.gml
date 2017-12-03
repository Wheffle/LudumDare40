/// play_thruster_sound();

if (!audio_is_playing(sfx_mining))
{
    audio_play_sound(sfx_mining, SFX_PRIORITY, false);
}
