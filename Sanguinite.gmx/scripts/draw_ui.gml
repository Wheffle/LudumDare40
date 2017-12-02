/// draw_ui();

draw_set_font(font_small);

var xx = 8;
var yy = 8;

var bar_width = 100;
var bar_height = 14;

// Draw drone stuff
with(obj_drone)
{
    var pct = hp / hp_max;
    draw_bar(xx, yy, xx+bar_width, yy+bar_height, c_green, "Drone", c_white, pct);
    yy += 22;
    
    pct = 1-(bomb_timer/bombcharge);
    draw_bar(xx, yy, xx+bar_width, yy+bar_height, c_blue, "Pulse Charge", c_white, pct);
    yy += 22;
    
    switch (rightclick_state)
    {
        case secondary.drop:
            draw_set_color(c_yellow);
            draw_text(xx, yy, "Right Click:#  drop cargo");
            break;
            
        case secondary.bomb:
            draw_set_color(c_aqua);
            draw_text(xx, yy, "Right Click:#  pulse bomb");
            break;
            
        case secondary.liftoff:
            draw_set_color(c_green);
            draw_text(xx, yy, "Right Click:#  leave planet");
            break;
    }
    
    yy += 32;
    
    if (cargo != noone)
    {
        draw_portrait(xx, yy, cargo.portrait);
        yy += 54;   
        
        draw_set_color(c_white);
        draw_text(xx, yy, "Cargo:#" + cargo.name);
        yy += 20;    
    }
    
    
}

// Draw lives
with(obj_player_properties)
{
    yy = 6;
    xx = 22+bar_width;
    draw_sprite_ext(s_drone, 0, xx, yy+8, 0.5, 0.5, 0, c_white, 1);
    draw_set_color(c_white);
    draw_text(xx+12, yy, "x" + string(drones));
}

// Draw dropship stats
yy = 8;
xx = view_wview[0]-bar_width-8;
with(obj_dropship)
{
    var pct = sanguinite / sanguinite_max;
    draw_bar(xx, yy, xx+bar_width, yy+bar_height, c_maroon, "Sanguinite", c_white, pct);
    yy += 22;
    
    if (sanguinite >= sanguinite_max)
    {
        draw_set_color(c_green);
        draw_text(xx, yy, "Ready for#liftoff");
    }
}

// Draw planet danger
yy = 8;
with(ctrl_planet)
{
    xx = (view_wview[0] div 2) - (bar_width div 2);
    draw_bar(xx, yy, xx+bar_width, yy+bar_height, c_fuchsia, "Danger", c_white, danger);
}

//Draw message
with(ctrl_planet)
{
    if (message_timer > 0)
    {
        message_timer--;
        draw_message(message_width, message_height, message, message_color);
    }
}


