// Evento Step de obj_dialogo

// Se está mostrando escolhas
if (tem_escolha) {
    // Navegar entre as opções com setas
    if (keyboard_check_pressed(vk_up)) {
        escolha_selecionada--;
        if (escolha_selecionada < 0) escolha_selecionada = array_length(escolhas) - 1;
    }
    if (keyboard_check_pressed(vk_down)) {
        escolha_selecionada++;
        if (escolha_selecionada >= array_length(escolhas)) escolha_selecionada = 0;
    }
    
    // Confirmar escolha com ESPAÇO
    if (keyboard_check_pressed(vk_space)) {
        // Executa a ação baseada na escolha e no callback ID
        
        if (escolha_callback == "npc_cidade") {
            // Ação do NPC da cidade
            if (escolha_selecionada == 0) {
                // Escolheu "Ir com ele" - Vai direto para a Praia
                show_debug_message("JOGADOR ACEITOU IR PARA A PRAIA!");
                
                // Destrói o diálogo primeiro
                instance_destroy();
                
                // Vai para a Praia (ajuste as coordenadas para onde o player deve aparecer)
                room_goto(Praia);
                obj_player.x = 100; // Ajuste a posição X onde o player aparece
                obj_player.y = 200; // Ajuste a posição Y onde o player aparece
                
                exit;
            } else {
                // Escolheu "Não ir"
                show_debug_message("JOGADOR RECUSOU");
            }
        }
        
        if (escolha_callback == "nelson_missao") {
            // Ação da missão do Nelson
            if (escolha_selecionada == 0) {
                // Aceitou a missão
                show_debug_message("MISSÃO DE LIXO ELETRÔNICO ACEITA!");
                
                // Inicializa contador global
                global.lixo_coletado = 0;
                
                // Marca missão como iniciada no Nelson
                if (instance_exists(obj_npc_nelson)) {
                    obj_npc_nelson.missao_iniciada = true;
                }
                
                // Adiciona missão ao painel
                if (instance_exists(obj_missoes)) {
                    obj_missoes.adicionar_missao("Coletar lixo eletrônico", "Colete lixo eletrônico: 0/5");
                }
            } else {
                // Recusou a missão
                show_debug_message("MISSÃO RECUSADA");
            }
        }
        
        if (escolha_callback == "receber_espada") {
            // Recebe a espada da secretária
            show_debug_message("PLAYER RECEBEU A ESPADA!");
            global.tem_espada = true;
        }
        
        instance_destroy();
    }
    
} else {
    // Diálogo normal sem escolhas
    
    // Se o jogador apertar 'ESPAÇO' (barra de espaço)
    if (keyboard_check_pressed(vk_space)) {
        // Se ainda há frases para mostrar
        if (texto_atual_index < array_length(dialogo_texto_array) - 1) {
            // Avança para a próxima frase
            texto_atual_index++;
        } else {
            // Se todas as frases acabaram
            
            // Processa callbacks antes de fechar o diálogo
            if (escolha_callback == "receber_espada") {
                // Recebe a espada da secretária
                show_debug_message("PLAYER RECEBEU A ESPADA!");
                global.tem_espada = true;
            }
            
            // Verifica se deve abrir a lousa
            if (speaker_mostrar_lousa) {
                instance_create_depth(0, 0, -10001, obj_lousa_jundu);
            }
            
            // Destrói o sistema de diálogo
            instance_destroy();
        }
    }
}