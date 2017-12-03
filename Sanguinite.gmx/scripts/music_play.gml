/// music_play(sound_id);
/*  
    changes the looping background music to the given sound
*/


with(music_system)
{
    if (argument0 != current_music || (alarm[0] > 0 && next_music != argument0))
    {
        next_music = argument0;
        
        if (audio_exists(current_track_id) && audio_is_playing(current_track_id))
        {
            audio_sound_gain(current_track_id, 0, fade_time);
        }
        
        alarm[0] = room_speed*(fade_time/1000);
    }
}

