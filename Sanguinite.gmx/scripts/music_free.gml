/// music_free();
/*
    destroys current music system
*/  


with(music_system)
{
    if (audio_exists(current_track_id))
    {
        if (audio_is_playing(current_track_id))
        {
            audio_stop_sound(current_track_id);
        }
    }
    
    instance_destroy();
}

