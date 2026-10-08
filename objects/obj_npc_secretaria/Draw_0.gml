// Evento Draw de obj_npc_secretaria

// Desenha o sprite do NPC
draw_self();

// Se o player está perto, mostra indicação
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (_dist < 60) { // Diminuído para 60 pixels // Diminuído de 250 para 100
        draw_set_font(fnt_principal);
        draw_set_color(c_yellow);
        draw_text(x - 20, y - 40, "[E] Falar");
    }
}
