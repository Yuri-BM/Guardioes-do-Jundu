// Evento Create de obj_npc_cidade

// --- 1. DEFINIÇÃO DO DIÁLOGO (MENSAGENS) ---
dialogo_texto[0] = "Ah, olá estudante, há um problema na praia da cidade, quer vir comigo?";

// --- 2. SISTEMA DE ESCOLHAS ---
tem_escolha = true; // Este NPC tem escolhas
escolhas[0] = "Ir com ele";
escolhas[1] = "Não ir";
escolha_callback = "npc_cidade"; // ID para identificar qual ação tomar

// --- 3. NOME E SPRITE DE DIÁLOGO ---
npc_nome = "Secretário"; // Nome que aparece no diálogo
npc_dialogo_sprite = SecretarioSprite_01; // Sprite do secretário para o diálogo

// --- 4. VARIÁVEIS DE ESTADO E REFERÊNCIA ---
dialogo_ativo = false; // Se o diálogo está na tela
player_sprite_ref = obj_player.sprite_index;