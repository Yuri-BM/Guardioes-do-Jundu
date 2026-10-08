// Evento Step de obj_npc_nelson

// Verifica se a missão foi completada
if (missao_iniciada && !missao_completa && global.lixo_coletado >= 5) {
    // Atualiza os diálogos do NPC
    dialogo_texto = dialogo_final;
    missao_completa = true;
    tem_escolha = false; // Remove as escolhas
    
    // Completa a missão no painel
    if (instance_exists(obj_missoes)) {
        for (var i = 0; i < array_length(obj_missoes.missoes_ativas); i++) {
            if (obj_missoes.missoes_ativas[i].titulo == "Coletar lixo eletrônico") {
                obj_missoes.completar_missao(i);
                break;
            }
        }
    }
}

// Se a missão já foi iniciada mas não completada, mostra diálogo de progresso
if (missao_iniciada && !missao_completa && global.lixo_coletado < 5) {
    dialogo_texto = dialogo_em_progresso;
    tem_escolha = false;
}
