// Evento Step de obj_menu

// Navegação com setas (caso queira adicionar mais opções no futuro)
if (keyboard_check_pressed(vk_down)) {
    opcao_selecionada++;
    if (opcao_selecionada >= total_opcoes) {
        opcao_selecionada = 0;
    }
}

if (keyboard_check_pressed(vk_up)) {
    opcao_selecionada--;
    if (opcao_selecionada < 0) {
        opcao_selecionada = total_opcoes - 1;
    }
}

// Confirmar com SPACE ou ENTER
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
    switch (opcao_selecionada) {
        case 0: // INICIAR JOGO
            room_goto(IFSP); // Muda para a primeira sala do jogo
            break;
    }
}
