// Evento Draw de obj_inimigo_planta

// Desenha o sprite do inimigo
draw_self();

// Desenha barra de vida acima do inimigo (só se estiver vivo)
if (estado != "dying" && vida_atual < vida_maxima) {
    var _barra_largura = 40;
    var _barra_altura = 5;
    var _x_barra = x - (_barra_largura / 2);
    var _y_barra = y - sprite_height - 10;
    
    // Fundo da barra (vermelho)
    draw_set_color(c_red);
    draw_rectangle(_x_barra, _y_barra, _x_barra + _barra_largura, _y_barra + _barra_altura, false);
    
    // Vida atual (verde)
    var _vida_largura = (_barra_largura * vida_atual) / vida_maxima;
    draw_set_color(c_lime);
    draw_rectangle(_x_barra, _y_barra, _x_barra + _vida_largura, _y_barra + _barra_altura, false);
    
    // Borda da barra
    draw_set_color(c_white);
    draw_rectangle(_x_barra, _y_barra, _x_barra + _barra_largura, _y_barra + _barra_altura, true);
}
