// Evento Create de obj_lousa_jundu

// Garantir que fique acima de tudo
depth = -10001;

// Pausar o jogo
global.lousa_aberta = true;

// Posição e tamanho da lousa
lousa_largura = 700;  // Aumentado de 600 para 700
lousa_altura = 450;   // Aumentado de 400 para 450
lousa_x = (room_width - lousa_largura) / 2;
lousa_y = (room_height - lousa_altura) / 2 - 50; // Um pouco mais acima

// Sprite da secretária (mesma posição e tamanho do diálogo)
secretaria_sprite = SecretariaSprite_01;
var _sprite_w = sprite_get_width(secretaria_sprite);
var _sprite_h = sprite_get_height(secretaria_sprite);
var _tamanho_base = 500; // Mesmo tamanho do diálogo
secretaria_escala = _tamanho_base / max(_sprite_w, _sprite_h);
secretaria_x = 50; // Mesma posição do diálogo
secretaria_y = room_height - (_sprite_h * secretaria_escala) - 20; // Mais embaixo (era -50)

// Diálogo da secretária
dialogo_secretaria = "O Jundu é a vegetação de restinga que protege a praia da erosão e do avanço do mar. Ele ajuda a manter a nossa orla segura e saudável.";

// Informações sobre o Jundu
titulo = "O QUE É O JUNDU?";
texto_info = "O Jundu (Spartina ciliata) é uma planta nativa da restinga brasileira.\n\n" +
             "CARACTERÍSTICAS:\n" +
             "• Gramínea perene de até 1 metro\n" +
             "• Raízes profundas e resistentes\n" +
             "• Cresce em solos arenosos e salinos\n\n" +
             "BENEFÍCIOS AMBIENTAIS:\n" +
             "• Fixa e estabiliza dunas de areia\n" +
             "• Previne erosão costeira\n" +
             "• Protege a biodiversidade local\n" +
             "• Preserva o ecossistema marinho\n" +
             "• Ajuda na recuperação de áreas degradadas\n\n" +
             "IMPORTÂNCIA:\n" +
             "Essencial para manter o equilíbrio da costa brasileira!";

// Sprite/Foto do Jundu
foto_jundu = Jundu; // Sprite da planta Jundu
