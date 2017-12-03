/// music_set_gain(gain);
/*  
    gain between 0 and 1
*/

with(music_system)
{
    gain = argument0;
    if (audio_exists(current_track_id) && audio_is_playing(current_track_id))
    {
        audio_sound_gain(current_track_id, gain, 0);
    }
}

