// Evento Draw de obj_missoes

// Não desenha se houver diálogo ativo
if (instance_exists(obj_dialogo)) {
    exit;
}

// Fundo da janela (semi-transparente)
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(x_janela, y_janela, x_janela + largura_janela, y_janela + altura_janela, false);
draw_set_alpha(1);

// Borda dourada
draw_set_color(c_yellow);
draw_rectangle(x_janela, y_janela, x_janela + largura_janela, y_janela + altura_janela, true);
draw_rectangle(x_janela + 1, y_janela + 1, x_janela + largura_janela - 1, y_janela + altura_janela - 1, true);

// Título
draw_set_font(fnt_principal);
draw_set_color(c_yellow);
draw_text(x_janela + 10, y_janela + 10, "MISSÕES");

// Desenhar missões ativas
draw_set_color(c_white);
var _y_missao = y_janela + 40;

for (var i = 0; i < array_length(missoes_ativas); i++) {
    var _missao = missoes_ativas[i];
    
    // Cor diferente se completa
    if (_missao.completa) {
        draw_set_color(c_lime);
        draw_text(x_janela + 15, _y_missao, "✓ " + _missao.titulo);
    } else {
        draw_set_color(c_white);
        draw_text(x_janela + 15, _y_missao, "• " + _missao.titulo);
    }
    
    _y_missao += 25;
    
    // Limite de missões visíveis
    if (i >= 3) break;
}

// Contador de missões
draw_set_color(c_gray);
var _total = array_length(missoes_ativas);
var _completas = 0;
for (var i = 0; i < _total; i++) {
    if (missoes_ativas[i].completa) _completas++;
}
draw_text(x_janela + largura_janela - 60, y_janela + altura_janela - 25, string(_completas) + "/" + string(_total));
