// Evento Draw de obj_door

// Desenha o sprite da porta
draw_self();

// Se o player está perto, mostra indicação
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (_dist < 100 && variable_instance_exists(id, "target_room")) { // Aumentado para 100!
        draw_set_font(fnt_principal);
        draw_set_color(c_yellow);
        
        // Mostra o nome da room de destino
        var _room_name = room_get_name(target_room);
        draw_set_halign(fa_center);
        draw_text(x, y - 40, "[E] Ir para " + _room_name);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
    }
}
