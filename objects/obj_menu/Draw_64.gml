// Evento Draw GUI de obj_menu

// Define a fonte
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Cor de fundo do menu (escuro)
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// Título do jogo
draw_set_color(c_lime);
draw_text(display_get_gui_width() / 2, 150, "GUARDIOES DO JUNDU");

// Desenha as opções
var _y_inicial = display_get_gui_height() / 2;
var _espacamento = 50;

for (var i = 0; i < total_opcoes; i++) {
    var _y_pos = _y_inicial + (i * _espacamento);
    
    // Se for a opção selecionada, destaca
    if (i == opcao_selecionada) {
        draw_set_color(c_yellow);
        draw_text(display_get_gui_width() / 2, _y_pos, "> " + opcoes[i] + " <");
    } else {
        draw_set_color(c_white);
        draw_text(display_get_gui_width() / 2, _y_pos, opcoes[i]);
    }
}

// Instruções
draw_set_color(c_gray);
draw_text(display_get_gui_width() / 2, display_get_gui_height() - 50, "[SPACE/ENTER] para confirmar");

// Reseta configurações de draw
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
