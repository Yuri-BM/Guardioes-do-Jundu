// Evento Create de obj_npc_padrao (CÓDIGO UNIFICADO)

// --- 1. DEFINIÇÃO DO DIÁLOGO (MENSAGENS) ---
dialogo_texto[0] = "Olá, viajante. Bem-vindo ao IFSP!";
dialogo_texto[1] = "Acho que vi algo interessante perto da praia...";
dialogo_texto[2] = "Mas cuidado com as algas marinhas!";

// --- 2. SISTEMA DE ESCOLHAS ---
tem_escolha = false; // Este NPC NÃO tem escolhas (diálogo normal)

// --- 3. NOME E SPRITE DE DIÁLOGO ---
npc_nome = "Juliana"; // Nome que aparece no diálogo
npc_dialogo_sprite = JulianaSprite_01; // Sprite da Juliana para o diálogo

// --- 4. VARIÁVEIS DE ESTADO E REFERÊNCIA ---
dialogo_ativo = false; // Se o diálogo está na tela
player_sprite_ref = obj_player.sprite_index;