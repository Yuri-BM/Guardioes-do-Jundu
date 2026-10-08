// Evento Create de obj_npc_nelson

// Controle da missão
missao_iniciada = false;
missao_completa = false;

// --- 1. DEFINIÇÃO DO DIÁLOGO (MENSAGENS) ---
dialogo_texto[0] = "Olá! Eu sou o Nelson, biólogo marinho.";
dialogo_texto[1] = "Preciso de ajuda! Há lixo eletrônico espalhado pela praia.";
dialogo_texto[2] = "Você pode coletar 5 peças de lixo eletrônico para mim?";

// Diálogo após iniciar missão
dialogo_em_progresso[0] = "Continue coletando o lixo eletrônico!";
dialogo_em_progresso[1] = "Ainda faltam algumas peças.";

// Diálogo ao completar
dialogo_final[0] = "Excelente trabalho!";
dialogo_final[1] = "Você ajudou muito a preservar nossa praia!";
dialogo_final[2] = "O lixo eletrônico é muito prejudicial ao meio ambiente.";

// --- 2. SISTEMA DE ESCOLHAS ---
tem_escolha = true; // Terá escolha para aceitar a missão
escolhas[0] = "Aceitar missão";
escolhas[1] = "Recusar";
escolha_callback = "nelson_missao";

// --- 3. NOME E SPRITE DE DIÁLOGO ---
npc_nome = "Nelson"; // Nome que aparece no diálogo
npc_dialogo_sprite = NelsonSprite_01; // Sprite do Nelson para o diálogo

// --- 4. VARIÁVEIS DE ESTADO E REFERÊNCIA ---
dialogo_ativo = false; // Se o diálogo está na tela
player_sprite_ref = obj_player.sprite_index;
