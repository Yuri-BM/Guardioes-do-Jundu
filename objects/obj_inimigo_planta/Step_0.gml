// Evento Step de obj_inimigo_planta

// Atualiza cooldown de ataque
ultimo_ataque++;

// Atualiza timer de dano
if (levou_dano) {
    dano_timer++;
    if (dano_timer >= tempo_animacao_dano) {
        levou_dano = false;
        dano_timer = 0;
    }
}

// Se está morrendo, espera terminar a animação
if (morte_em_progresso) {
    if (ultimo_ataque >= tempo_animacao_morte) {
        instance_destroy();
    }
    depth = -y;
    exit;
}

// Verifica se morreu
if (vida_atual <= 0) {
    estado = "dying";
    morte_em_progresso = true;
    ultimo_ataque = 0;
    show_debug_message("Inimigo planta morreu!");
    depth = -y;
    exit;
}

// Se está atacando, não faz nada até terminar a animação
if (ataque_em_progresso) {
    if (ultimo_ataque >= tempo_animacao_ataque) {
        ataque_em_progresso = false;
        estado = "idle";
    }
    depth = -y;
    exit;
}

// Persegue o player se existir
if (instance_exists(obj_player)) {
    var _dist_player = point_distance(x, y, obj_player.x, obj_player.y);
    
    // Se estiver no alcance de ataque
    if (_dist_player <= alcance_ataque && ultimo_ataque >= cooldown_ataque) {
        // ATACA!
        estado = "attacking";
        ataque_em_progresso = true;
        
        // Causa dano se o player não estiver invencível
        if (!obj_player.invencivel) {
            obj_player.vida_atual -= dano;
            obj_player.invencivel = true;
            obj_player.invencivel_tempo = obj_player.invencivel_duracao;
            obj_player.levou_dano = true;
            obj_player.dano_timer = 0;
            
            // Empurra o player para trás
            with (obj_player) {
                var _empurrao_x = sign(x - other.x) * 80;
                var _empurrao_y = sign(y - other.y) * 80;
                
                if (!place_meeting(x + _empurrao_x, y, obj_coliser)) {
                    x += _empurrao_x;
                }
                if (!place_meeting(x, y + _empurrao_y, obj_coliser)) {
                    y += _empurrao_y;
                }
            }
            
            show_debug_message("Player levou dano! Vida: " + string(obj_player.vida_atual));
        }
        
        ultimo_ataque = 0;
        
    } 
    // Se estiver perto o suficiente mas longe do alcance, persegue
    else if (_dist_player < 300) {
        // Calcula direção
        var _dir_x = sign(obj_player.x - x);
        var _dir_y = sign(obj_player.y - y);
        
        // Move em direção ao player
        var _hspd = _dir_x * spd;
        var _vspd = _dir_y * spd;
        
        // Verifica colisão e move
        if (!place_meeting(x + _hspd, y, obj_coliser)) {
            x += _hspd;
        }
        if (!place_meeting(x, y + _vspd, obj_coliser)) {
            y += _vspd;
        }
        
        // Atualiza direção para animação
        if (abs(_dir_x) > abs(_dir_y)) {
            if (_dir_x > 0) direcao = "right";
            else direcao = "left";
        } else {
            if (_dir_y > 0) direcao = "down";
            else direcao = "up";
        }
        
        estado = "walking";
        
    } else {
        estado = "idle";
    }
}

// Animação baseada no estado e direção
if (levou_dano) {
    // Sprites de dano
    switch (direcao) {
        case "down": sprite_index = plantSpriteHurtBottom; break;
        case "up": sprite_index = plantSpriteHurtTop; break;
        case "left": sprite_index = plantSpriteHurtLeft; break;
        case "right": sprite_index = plantSpriteHurtRight; break;
    }
} else if (estado == "dying") {
    // Sprites de morte
    switch (direcao) {
        case "down": sprite_index = plantSpriteDeathBottom; break;
        case "up": sprite_index = plantSpriteDeathTop; break;
        case "left": sprite_index = plantSproteDeathLeft; break;
        case "right": sprite_index = plantSpriteDeathRight; break;
    }
} else if (estado == "attacking") {
    // Sprites de ataque (usando sprites de walk por enquanto)
    switch (direcao) {
        case "down": sprite_index = plantWalkSpriteBottom; break;
        case "up": sprite_index = plantWalkSpriteTop; break;
        case "left": sprite_index = plantSpriteWalkLeft; break;
        case "right": sprite_index = plantSpriteWalkRight; break;
    }
} else if (estado == "walking") {
    // Sprites de andar
    switch (direcao) {
        case "down": sprite_index = plantWalkSpriteBottom; break;
        case "up": sprite_index = plantWalkSpriteTop; break;
        case "left": sprite_index = plantSpriteWalkLeft; break;
        case "right": sprite_index = plantSpriteWalkRight; break;
    }
} else {
    // Idle (usa sprite de andar parada no primeiro frame)
    switch (direcao) {
        case "down": sprite_index = plantWalkSpriteBottom; image_index = 0; break;
        case "up": sprite_index = plantWalkSpriteTop; image_index = 0; break;
        case "left": sprite_index = plantSpriteWalkLeft; image_index = 0; break;
        case "right": sprite_index = plantSpriteWalkRight; image_index = 0; break;
    }
}

depth = -y;
