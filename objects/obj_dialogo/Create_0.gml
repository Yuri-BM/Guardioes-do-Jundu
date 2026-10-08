// Evento Create de obj_dialogo

show_debug_message("=============================");
show_debug_message("OBJ_DIALOGO FOI CRIADO!");
show_debug_message("=============================");

// Garantir que o diálogo fique acima de tudo
depth = -9999;

// Dados de quem está falando (serão definidos quando o objeto for criado)
speaker_sprite = noone; // Sprite do NPC para diálogo
speaker_nome = ""; // Nome do NPC
speaker_mostrar_lousa = false; // Se deve abrir a lousa ao terminar
player_sprite = obj_player.sprite_index; // Pegamos o sprite atual do Player
player_nome = "Você"; // Nome do player
dialogo_texto_array = []; // Array que armazena todas as frases
texto_atual_index = 0; // Índice da frase que estamos mostrando

// Sistema de Escolhas
tem_escolha = false; // Se o diálogo tem escolhas
escolhas = []; // Array com as opções (ex: ["Sim", "Não"])
escolha_selecionada = 0; // Qual opção está selecionada (0 = primeira)
escolha_callback = noone; // Função a ser chamada quando escolher

// Variáveis de Estilo
box_largura = room_width;
box_altura = 150;
box_y = room_height - box_altura; // Fundo da tela

// Variáveis de Fonte/Textura
fonte_dialogo = fnt_principal; // Volta para a fonte principal temporariamente
cor_texto = c_white;