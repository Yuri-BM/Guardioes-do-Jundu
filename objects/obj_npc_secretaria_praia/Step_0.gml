// Evento Step de obj_npc_secretaria_praia

event_inherited();

// Incrementa o timer
timer_dialogo++;

// Inicia o diálogo automaticamente após 10 frames (para dar tempo do player spawnar)
if (!dialogo_mostrado && timer_dialogo >= 10 && instance_exists(obj_player) && !instance_exists(obj_dialogo)) {
    dialogo_mostrado = true;
    
    // Cria o diálogo automaticamente
    var _dialogo = instance_create_depth(0, 0, -9999, obj_dialogo);
    _dialogo.dialogo_texto_array = dialogo_texto;
    _dialogo.speaker_nome = nome;
    _dialogo.speaker_sprite = sprite_npc;
    _dialogo.escolha_callback = escolha_callback;
    
    show_debug_message("DIÁLOGO DA SECRETÁRIA INICIADO AUTOMATICAMENTE!");
}
