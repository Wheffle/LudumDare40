/// play_repeat_sound(sound_fx);

if (!audio_is_playing(argument0))
{
    audio_play_sound(argument0, SFX_PRIORITY, false);
}
