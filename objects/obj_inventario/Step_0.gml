// Evento Step de obj_inventario

// Fechar inventário ao apertar I novamente ou ESC
if (keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_escape)) {
    global.inventario_aberto = false;
    instance_destroy();
    exit;
}

// Navegação entre itens
if (keyboard_check_pressed(vk_up)) {
    item_selecionado--;
    if (item_selecionado < 0) item_selecionado = array_length(itens) - 1;
}

if (keyboard_check_pressed(vk_down)) {
    item_selecionado++;
    if (item_selecionado >= array_length(itens)) item_selecionado = 0;
}

// Usar item com ESPAÇO
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
    if (array_length(itens) > 0) {
        var _item = itens[item_selecionado];
        show_debug_message("Usando item: " + _item.nome);
    }
}