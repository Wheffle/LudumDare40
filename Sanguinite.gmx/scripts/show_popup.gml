/// show_popup(text, text_color, seconds);

with(ctrl_planet)
{
    draw_set_font(font_small);
    message = argument0;
    message_color = argument1;
    message_timer = argument2*room_speed;
    message_width = string_width_ext(message, -1, 150);
    message_height = string_height_ext(message, -1, 150);
}
