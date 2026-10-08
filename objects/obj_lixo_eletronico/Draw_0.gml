// Evento Draw de obj_lixo_eletronico

// Desenha o sprite do lixo
draw_self();

// Se o player está perto, mostra indicação
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (_dist < 200) {
        draw_set_font(fnt_principal);
        draw_set_color(c_yellow);
        draw_text(x - 20, y - 30, "[E] Coletar");
    }
}
