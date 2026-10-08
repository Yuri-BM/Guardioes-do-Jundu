// Evento Create de obj_npc_secretaria_praia

// Herda do pai
event_inherited();

// Nome do NPC
nome = "Secretária";

// Sprite do NPC
sprite_npc = SecretariaSprite_01;

// Controle de diálogo
dialogo_mostrado = false;
timer_dialogo = 0; // Timer para esperar alguns frames antes de abrir

// Diálogo antes de dar a espada
dialogo_antes = [
    "Olá! Você vai precisar se defender nesta praia.",
    "Há plantas perigosas por aqui!",
    "Tome esta espada, ela vai te ajudar!"
];

// Diálogo depois de dar a espada
dialogo_depois = [
    "Use a espada com cuidado!",
    "Pressione SPACE para atacar os inimigos."
];

// Define qual diálogo usar
if (!global.tem_espada) {
    dialogo_texto = dialogo_antes;
    escolha_callback = "receber_espada";
} else {
    dialogo_texto = dialogo_depois;
    escolha_callback = "";
}
