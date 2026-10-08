// Evento Draw GUI de obj_player

// Desenha corações de vida no canto superior esquerdo
var _x_coracao = 20;
var _y_coracao = 20;
var _espacamento = 35;

draw_set_font(fnt_principal);

for (var i = 0; i < vida_maxima; i++) {
    if (i < vida_atual) {
        // Coração cheio
        draw_set_color(c_red);
        draw_text(_x_coracao + (i * _espacamento), _y_coracao, "♥");
    } else {
        // Coração vazio
        draw_set_color(c_gray);
        draw_text(_x_coracao + (i * _espacamento), _y_coracao, "♡");
    }
}

draw_set_color(c_white);
