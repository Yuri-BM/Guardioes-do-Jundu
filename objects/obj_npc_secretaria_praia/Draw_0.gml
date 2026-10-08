// Evento Draw de obj_npc_secretaria_praia

// Desenha o sprite do NPC
draw_self();

// Indicador de interação (se o diálogo não foi iniciado automaticamente ainda)
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (_dist < 60 && !instance_exists(obj_dialogo)) { // Diminuído para 60 pixels
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(x, y - sprite_height - 10, "[E] Falar");
        draw_set_halign(fa_left);
    }
}
