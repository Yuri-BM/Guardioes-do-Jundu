// Evento Draw de obj_inventario

// Fundo semi-transparente (escurece a tela)
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Janela do inventário (fundo)
draw_set_color(c_dkgray);
draw_rectangle(janela_x, janela_y, janela_x + janela_largura, janela_y + janela_altura, false);

// Borda da janela
draw_set_color(c_white);
draw_rectangle(janela_x, janela_y, janela_x + janela_largura, janela_y + janela_altura, true);

// Título
draw_set_font(fnt_principal);
draw_set_color(c_yellow);
draw_text(janela_x + 10, janela_y + 10, "INVENTÁRIO");

// Instruções
draw_set_color(c_ltgray);
draw_set_font(fnt_principal);
draw_text(janela_x + 10, janela_y + janela_altura - 25, "[I/ESC] Fechar  [↑↓] Navegar  [ESPAÇO] Usar");

// Lista de itens
var _y_item = janela_y + 50;
var _item_altura = 30;

if (array_length(itens) == 0) {
    // Inventário vazio
    draw_set_color(c_white);
    draw_text(janela_x + 20, _y_item, "Inventário vazio");
} else {
    // Mostrar itens
    for (var i = 0; i < array_length(itens); i++) {
        var _item = itens[i];
        
        // Destaca o item selecionado
        if (i == item_selecionado) {
            draw_set_color(c_yellow);
            draw_rectangle(janela_x + 10, _y_item - 2, janela_x + janela_largura - 10, _y_item + _item_altura - 8, false);
            draw_set_color(c_black);
        } else {
            draw_set_color(c_white);
        }
        
        // Nome do item e quantidade
        draw_text(janela_x + 20, _y_item, _item.nome + " x" + string(_item.quantidade));
        
        _y_item += _item_altura;
    }
    
    // Descrição do item selecionado
    if (item_selecionado >= 0 && item_selecionado < array_length(itens)) {
        var _item_sel = itens[item_selecionado];
        draw_set_color(c_ltgray);
        draw_text(janela_x + 20, janela_y + janela_altura - 50, _item_sel.descricao);
    }
}