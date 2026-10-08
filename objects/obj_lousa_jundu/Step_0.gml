// Evento Step de obj_lousa_jundu

// Fechar ao apertar ESPAÇO ou ESC
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_escape)) {
    global.lousa_aberta = false;
    instance_destroy();
}
