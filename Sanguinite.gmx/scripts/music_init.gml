/// music_init(priority, fade_time);
/*  
    initializes music system
    priority:   audio priority of music tracks
    fade_time:  fade-in and fade-out when music switches, in milliseconds
*/


var system = instance_create(0, 0, music_system);
system.priority = argument0;
system.fade_time = argument1;

