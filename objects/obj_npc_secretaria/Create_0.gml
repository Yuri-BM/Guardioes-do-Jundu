// Evento Create de obj_npc_secretaria

// --- 1. DEFINIÇÃO DO DIÁLOGO (MENSAGENS) ---
dialogo_texto[0] = "Ah vocês vieram!";
dialogo_texto[1] = "Estamos prontos para iniciar o plantio de jundu!";

// --- 2. SISTEMA DE ESCOLHAS ---
tem_escolha = false; // Diálogo normal
mostrar_lousa = true; // Depois do diálogo, mostra a lousa informativa

// --- 3. NOME E SPRITE DE DIÁLOGO ---
npc_nome = "Ana Carolina"; // Nome que aparece no diálogo
npc_dialogo_sprite = SecretariaSprite_01; // Sprite de retrato da secretária

// --- 4. VARIÁVEIS DE ESTADO E REFERÊNCIA ---
dialogo_ativo = false; // Se o diálogo está na tela
player_sprite_ref = obj_player.sprite_index;
