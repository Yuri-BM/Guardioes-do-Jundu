// Evento Draw de obj_lousa_jundu

// Fundo escuro semi-transparente
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Lousa (fundo verde escuro tipo quadro negro)
draw_set_color(make_color_rgb(34, 139, 34)); // Verde escuro
draw_rectangle(lousa_x, lousa_y, lousa_x + lousa_largura, lousa_y + lousa_altura, false);

// Borda da lousa (madeira) - borda grossa desenhada múltiplas vezes
draw_set_color(make_color_rgb(139, 69, 19)); // Marrom
for (var i = 0; i < 8; i++) {
    draw_rectangle(lousa_x - 5 - i, lousa_y - 5 - i, lousa_x + lousa_largura + 5 + i, lousa_y + lousa_altura + 5 + i, true);
}

// Título
draw_set_font(fnt_principal);
draw_set_color(c_white);
draw_text(lousa_x + 20, lousa_y + 20, titulo);

// Foto do Jundu (se existir)
if (foto_jundu != noone && sprite_exists(foto_jundu)) {
    var _foto_tamanho = 180;
    draw_sprite_ext(foto_jundu, 0, lousa_x + 30, lousa_y + 80, 
                    _foto_tamanho / sprite_get_width(foto_jundu), 
                    _foto_tamanho / sprite_get_height(foto_jundu), 
                    0, c_white, 1);
} else {
    // Quadrado placeholder para a foto
    draw_set_color(c_white);
    draw_rectangle(lousa_x + 30, lousa_y + 80, lousa_x + 210, lousa_y + 260, true);
    draw_text(lousa_x + 80, lousa_y + 160, "[FOTO\nJUNDU]");
}

// Texto informativo
draw_set_color(c_white);
draw_text_ext(lousa_x + 230, lousa_y + 80, texto_info, 16, 350);

// Instrução para fechar
draw_set_color(c_yellow);
draw_text(lousa_x + lousa_largura - 180, lousa_y + lousa_altura - 30, "Aperte [ESPAÇO] para fechar");

// Sprite da Secretária (mesma posição do diálogo)
if (secretaria_sprite != noone && sprite_exists(secretaria_sprite)) {
    draw_sprite_ext(secretaria_sprite, 0, secretaria_x, secretaria_y, 
                    secretaria_escala, secretaria_escala, 0, c_white, 1);
}

// Caixa de diálogo da secretária (embaixo)
var _altura_caixa = 180; // Altura da caixa de diálogo
draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(0, room_height - _altura_caixa, room_width, room_height, false);
draw_set_alpha(1);

// Nome da secretária
draw_set_font(fnt_principal);
draw_set_color(c_yellow);
draw_text(20, room_height - _altura_caixa + 10, "Secretária");

// Texto do diálogo
draw_set_color(c_white);
draw_text_ext(20, room_height - _altura_caixa + 40, dialogo_secretaria, -1, room_width - 40);
