// Evento Draw de obj_dialogo

// DEBUG
show_debug_message("Desenhando dialogo - Frame: " + string(texto_atual_index) + " de " + string(array_length(dialogo_texto_array)));

// 1. DESENHAR OS RETRATOS PRIMEIRO (ATRÁS DA CAIXA)

var _tamanho_portrait = 600; // Tamanho máximo do retrato (padrão)
var _margem_retrato = 50;    // Margem esquerda


// A. NPC (Canto Esquerdo) - GRANDE E ATRÁS
if (speaker_sprite != noone && sprite_exists(speaker_sprite)) {
    show_debug_message("Desenhando sprite NPC: " + sprite_get_name(speaker_sprite));
    
    var _sprite_w = sprite_get_width(speaker_sprite);
    var _sprite_h = sprite_get_height(speaker_sprite);
    
    // Tamanho especial para a secretária
    var _tamanho_npc = _tamanho_portrait;
    
    var _escala = _tamanho_npc / max(_sprite_w, _sprite_h);
    
    // Posiciona no canto inferior esquerdo - MAIS EMBAIXO
    var _x_pos = _margem_retrato;
    var _y_pos = room_height - (_sprite_h * _escala); // Mudou de 150 para 50
    
    // Desenha o sprite do NPC grande no canto esquerdo
    draw_sprite_ext(speaker_sprite, 0, _x_pos, _y_pos, _escala, _escala, 0, c_white, 1);
} else {
    show_debug_message("speaker_sprite não existe ou é noone!");
}


// B. PLAYER (Canto Direito) - NÃO DESENHA MAIS
// (Removido para não aparecer o boneco voando)


// 2. Desenhar a Caixa de Fundo (Retângulo Escuro) - APENAS NA PARTE DE BAIXO
draw_set_alpha(0.85); // 85% de opacidade
draw_set_color(c_black);
// Caixa menor - deixa espaço para os retratos aparecerem
var _altura_caixa = 200; // Altura da caixa de diálogo
draw_rectangle(0, room_height - _altura_caixa, room_width, room_height, false);
draw_set_alpha(1); // Volta à opacidade normal


// 3. Desenhar os NOMES dos personagens
var _margem_texto = 20; // Margem para texto (sempre positiva)
draw_set_font(fonte_dialogo);
draw_set_color(c_yellow);

// Nome do NPC (esquerda)
if (speaker_nome != "") {
    draw_text(_margem_texto, room_height - _altura_caixa + 10, speaker_nome);
}

// Nome do Player (direita)
if (player_nome != "") {
    var _nome_largura = string_width(player_nome);
    draw_text(room_width - _margem_texto - _nome_largura, room_height - _altura_caixa + 10, player_nome);
}


// 4. Desenhar o Texto do Diálogo
draw_set_color(cor_texto);

// Calcular a área onde o texto fica
var _x_texto = _margem_texto;
var _y_texto = room_height - _altura_caixa + 40; // Abaixo do nome
var _largura_texto = room_width - (_margem_texto * 2);

// Se tem escolhas, mostra as opções
if (tem_escolha) {
    // Desenha a pergunta
    var _frase = dialogo_texto_array[texto_atual_index];
    draw_text_ext(_x_texto, _y_texto, _frase, -1, _largura_texto);
    
    // Desenha as opções de escolha
    var _y_escolha = _y_texto + 50;
    for (var i = 0; i < array_length(escolhas); i++) {
        // Destaca a opção selecionada
        if (i == escolha_selecionada) {
            draw_set_color(c_yellow);
            draw_text(_x_texto + 20, _y_escolha, "> " + escolhas[i]);
        } else {
            draw_set_color(c_white);
            draw_text(_x_texto + 20, _y_escolha, "  " + escolhas[i]);
        }
        _y_escolha += 25;
    }
    
    // Instrução
    draw_set_color(c_yellow);
    draw_text(room_width - 220, room_height - 30, "↑↓ Escolher | [ESPAÇO] Confirmar");
    
} else {
    // Diálogo normal - Pega a frase atual
    var _frase = dialogo_texto_array[texto_atual_index];

    // Desenha a frase atual na caixa
    draw_text_ext(_x_texto, _y_texto, _frase, -1, _largura_texto);

    // Opcional: Desenhar um indicador para o player apertar para avançar
    draw_set_color(c_yellow);
    draw_text(room_width - 150, room_height - 30, "Aperte [ESPAÇO]");
}