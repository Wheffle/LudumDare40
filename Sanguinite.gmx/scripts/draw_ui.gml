/// draw_ui();

draw_set_font(font_small);

var xx = 8;
var yy = 8;

var bar_width = 100;
var bar_height = 16;

// Draw drone stats
with(obj_drone)
{
    var pct = hp / hp_max;
    draw_bar(xx, yy, xx+bar_width, yy+bar_height, c_green, "Drone", c_white, pct);
    yy += 24;
    
    if (cargo != noone)
    {
        draw_set_color(c_white);
        draw_text(xx, yy, "Cargo: " + cargo.name);
        yy += 20;
        
        draw_portrait(xx, yy, cargo.portrait);
        yy += 54;
        
    }
}

// Draw lives
with(obj_player_properties)
{
    yy = 6;
    xx = view_wview[0] div 2;
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
}
yy += 20;





