// Evento Step de obj_player (FINAL CORRIGIDO)

// Atualiza cooldown de ataque
ultimo_ataque_player++;

// Atualiza timer de dano
if (levou_dano) {
    dano_timer++;
    if (dano_timer >= tempo_animacao_dano) {
        levou_dano = false;
        dano_timer = 0;
    }
}

// Atualiza timer de ataque
if (atacando) {
    ataque_timer++;
    if (ataque_timer >= tempo_animacao_ataque) {
        atacando = false;
        ataque_timer = 0;
        estado = "idle"; // Volta para idle após ataque
    }
}

// Abrir inventário ao apertar I
if (keyboard_check_pressed(ord("I")) && !global.inventario_aberto) {
    global.inventario_aberto = true;
    instance_create_depth(0, 0, -10000, obj_inventario);
}

// Atacar com ESPAÇO
if (keyboard_check_pressed(vk_space) && !instance_exists(obj_dialogo) && ultimo_ataque_player >= cooldown_ataque_player && !levou_dano && !atacando && global.tem_espada) {
    // Inicia animação de ataque (mesmo sem inimigo próximo)
    atacando = true;
    ataque_timer = 0;
    estado = "attacking";
    
    // Sprites de ataque com espada (usando walk temporariamente)
    switch (direcao) {
        case "down": sprite_index = playerSpriteWalkSwordBottom; break;
        case "up": sprite_index = playerSpriteWalkSwordTop; break;
        case "left": sprite_index = playerSpriteWalkSwordLeft; break;
        case "right": sprite_index = playerSpriteWalkSwordRight; break;
    }
    image_index = 0; // Começa do primeiro frame
    
    show_debug_message("ATACANDO! Direcao: " + direcao);
    
    // Verifica se há inimigo próximo para causar dano
    var _inimigo = instance_nearest(x, y, obj_inimigo_planta);
    if (_inimigo != noone) {
        var _dist = point_distance(x, y, _inimigo.x, _inimigo.y);
        if (_dist < 80) {
            // Ataca o inimigo
            _inimigo.vida_atual -= 1;
            _inimigo.levou_dano = true;
            _inimigo.dano_timer = 0;
            show_debug_message("Atacou inimigo! Vida dele: " + string(_inimigo.vida_atual));
        }
    }
    
    ultimo_ataque_player = 0;
}

// Se o diálogo OU inventário estiverem abertos, não permite movimento
if (instance_exists(obj_dialogo) || global.inventario_aberto || levou_dano || atacando) {
    // Força o estado idle e ajusta o sprite para a direção atual
    if (!atacando) {
        estado = "idle";
    }
    
    // Se está atacando, mantém a sprite de ataque
    if (atacando) {
        // A sprite já foi definida quando iniciou o ataque
        // Não precisa fazer nada aqui
    }
    // Se levou dano, mostra sprite de dano
    else if (levou_dano) {
        if (global.tem_espada) {
            // Com espada - usa sprites de hurt sword (só Left e Right existem)
            switch (direcao) {
                case "down": 
                    sprite_index = playerSpriteWalkSwordBottom;
                    image_index = 0;
                    break;
                case "up": 
                    sprite_index = playerSpriteWalkSwordTop;
                    image_index = 0;
                    break;
                case "left": 
                    sprite_index = playerSpriteHurtSwordLeft;
                    break;
                case "right": 
                    sprite_index = playerSpriteHurtSwordRight;
                    break;
            }
        } else {
            // Sem espada - usa sprites normais de hurt ou walk
            switch (direcao) {
                case "down": 
                    sprite_index = Sprite3;
                    image_index = 0;
                    break;
                case "up": 
                    sprite_index = Sprite10;
                    image_index = 0;
                    break;
                case "left": 
                    sprite_index = Sprite8;
                    image_index = 0;
                    break;
                case "right": 
                    sprite_index = Sprite9;
                    image_index = 0;
                    break;
            }
        }
    } else {
        // Usa sprites com ou sem espada dependendo se tem a espada
        if (global.tem_espada) {
            switch (direcao) {
                case "down": 
                    sprite_index = playerSpriteWalkSwordBottom;
                    image_index = 0;
                    break;
                case "up": 
                    sprite_index = playerSpriteWalkSwordTop;
                    image_index = 0;
                    break;
                case "left": 
                    sprite_index = playerSpriteWalkSwordLeft;
                    image_index = 0;
                    break;
                case "right": 
                    sprite_index = playerSpriteWalkSwordRight;
                    image_index = 0;
                    break;
            }
        } else {
            switch (direcao) {
                case "down": sprite_index = Sprite3; break;
                case "up": sprite_index = Sprite10; break;
                case "left": sprite_index = Sprite8; break;
                case "right": sprite_index = Sprite9; break;
            }
        }
    }
    
    exit; // Sai do Step event, impedindo todo o código abaixo
}

// --- 1. DETECTAR INPUTS ---
var _move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _move_y = keyboard_check(vk_down) - keyboard_check(vk_up);


// --- 2. LÓGICA DE ESTADO E DIREÇÃO ---
if (_move_x != 0 || _move_y != 0) {
	estado = "walking";
	if (_move_x > 0) direcao = "right";
	else if (_move_x < 0) direcao = "left";
	else if (_move_y > 0) direcao = "down";
	else if (_move_y < 0) direcao = "up";
} else {
	estado = "idle";
}


// --- 3. LÓGICA DE ANIMAÇÃO ---
// Não muda sprite se estiver atacando
if (atacando) {
    // Mantém a sprite de ataque que foi definida
    // Não faz nada aqui
}
// Usa sprites diferentes dependendo se tem espada ou não
else if (estado == "idle") {
	if (global.tem_espada) {
		// Sprites com espada (idle) - usa sprite de walk travada no primeiro frame
		switch (direcao) {
			case "down": 
				if (sprite_index != playerSpriteWalkSwordBottom) { sprite_index = playerSpriteWalkSwordBottom; }
				image_index = 0;
				break;
			case "up": 
				if (sprite_index != playerSpriteWalkSwordTop) { sprite_index = playerSpriteWalkSwordTop; }
				image_index = 0;
				break;
			case "left": 
				if (sprite_index != playerSpriteWalkSwordLeft) { sprite_index = playerSpriteWalkSwordLeft; }
				image_index = 0;
				break;
			case "right": 
				if (sprite_index != playerSpriteWalkSwordRight) { sprite_index = playerSpriteWalkSwordRight; }
				image_index = 0;
				break;
		}
	} else {
		// Sprites sem espada (idle)
		switch (direcao) {
			case "down": if (sprite_index != Sprite3) { sprite_index = Sprite3; } break; 
			case "up": if (sprite_index != Sprite10) { sprite_index = Sprite10; } break;
			case "left": if (sprite_index != Sprite8) { sprite_index = Sprite8; } break;
			case "right": if (sprite_index != Sprite9) { sprite_index = Sprite9; } break;
		}
	}
} 
else if (estado == "walking") {
	if (global.tem_espada) {
		// Sprites com espada (andando)
		switch (direcao) {
			case "down": if (sprite_index != playerSpriteWalkSwordBottom) { sprite_index = playerSpriteWalkSwordBottom; } break;
			case "up": if (sprite_index != playerSpriteWalkSwordTop) { sprite_index = playerSpriteWalkSwordTop; } break;
			case "left": if (sprite_index != playerSpriteWalkSwordLeft) { sprite_index = playerSpriteWalkSwordLeft; } break;
			case "right": if (sprite_index != playerSpriteWalkSwordRight) { sprite_index = playerSpriteWalkSwordRight; } break;
		}
	} else {
		// Sprites sem espada (andando)
		switch (direcao) {
			case "down": if (sprite_index != Sprite6) { sprite_index = Sprite6; } break;
			case "up": if (sprite_index != Sprite7) { sprite_index = Sprite7; } break;
			case "left": if (sprite_index != Sprite5) { sprite_index = Sprite5; } break;
			case "right": if (sprite_index != Sprite4) { sprite_index = Sprite4; } break;
		}
	}
}


// --- 4. CÁLCULO DE MOVIMENTO E COLISÃO (com obj_coliser) ---
// (Esta seção foi substituída)

// A. Calcular velocidade horizontal
var _hspd = _move_x * spd;

// B. Verificar Colisão Horizontal com 'obj_coliser'
if (!place_meeting(x + _hspd, y, obj_coliser)) {
    x = x + _hspd; // Pode se mover
} else {
    // "Gruda" na parede para movimento suave
    while (!place_meeting(x + sign(_hspd), y, obj_coliser)) {
        x = x + sign(_hspd);
    }
}

// C. Calcular velocidade vertical
var _vspd = _move_y * spd;

// D. Verificar Colisão Vertical com 'obj_coliser'
if (!place_meeting(x, y + _vspd, obj_coliser)) {
    y = y + _vspd; // Pode se mover
} else {
    // "Gruda" na parede
    while (!place_meeting(x, y + sign(_vspd), obj_coliser)) {
        y = y + sign(_vspd);
    }
}


// --- 5. LÓGICA DE INTERAÇÃO (FINAL CORRIGIDO E ATUALIZADO) ---
if (keyboard_check_pressed(ord("E"))) {
    
    show_debug_message("==== TECLA E PRESSIONADA ====");
    
    // 0. VERIFICAÇÃO PORTA (PRIMEIRA PRIORIDADE!)
    var _door_id = instance_nearest(x, y, obj_door);
    if (_door_id != noone) {
        var _dist_door = point_distance(x, y, _door_id.x, _door_id.y);
        show_debug_message("PORTA encontrada! Distância: " + string(_dist_door) + " pixels");
        
        if (_dist_door < 100 && variable_instance_exists(_door_id, "target_room")) {
            show_debug_message("ENTRANDO NA PORTA! Destino: " + room_get_name(_door_id.target_room));
            
            var _new_room = _door_id.target_room;
            var _new_x = _door_id.target_x;
            var _new_y = _door_id.target_y;

            room_goto(_new_room);
            x = _new_x;
            y = _new_y;
            exit;
        }
    }
    
    // 1. VERIFICAÇÃO LIXO ELETRÔNICO (SEGUNDA PRIORIDADE)
    var _lixo_id = instance_nearest(x, y, obj_lixo_eletronico);
    
    if (_lixo_id != noone) {
        var _dist_lixo = point_distance(x, y, _lixo_id.x, _lixo_id.y);
        
        if (_dist_lixo < 200) {
            show_debug_message("LIXO COLETADO!");
            
            global.lixo_coletado++;
            
            // Atualiza missão se existir
            if (instance_exists(obj_missoes)) {
                for (var i = 0; i < array_length(obj_missoes.missoes_ativas); i++) {
                    if (obj_missoes.missoes_ativas[i].titulo == "Coletar lixo eletrônico") {
                        obj_missoes.missoes_ativas[i].descricao = "Colete lixo eletrônico: " + string(global.lixo_coletado) + "/5";
                        
                        if (global.lixo_coletado >= 3) {
                            obj_missoes.missoes_ativas[i].descricao = "Volte e fale com Nelson!";
                        }
                        break;
                    }
                }
            }
            
            instance_destroy(_lixo_id);
            exit;
        }
    }
	
	
    // 2. VERIFICAÇÃO NPC (TERCEIRA PRIORIDADE)
    var _npc_id = noone;
    var _dist_min = 250; // AUMENTADO MUITO! De 120 para 250 pixels!
    
    // Verifica obj_npc_padrao (Juliana no IFSP)
    var _npc_temp = instance_nearest(x, y, obj_npc_padrao);
    if (_npc_temp != noone) {
        var _dist_temp = point_distance(x, y, _npc_temp.x, _npc_temp.y);
        if (_dist_temp < _dist_min) {
            _npc_id = _npc_temp;
            _dist_min = _dist_temp;
        }
    }
    
    // Verifica obj_npc_cidade (Secretário na Cidade)
    _npc_temp = instance_nearest(x, y, obj_npc_cidade);
    if (_npc_temp != noone) {
        var _dist_temp = point_distance(x, y, _npc_temp.x, _npc_temp.y);
        if (_dist_temp < _dist_min) {
            _npc_id = _npc_temp;
            _dist_min = _dist_temp;
        }
    }
    
    // Verifica obj_npc_secretaria (Secretária)
    _npc_temp = instance_nearest(x, y, obj_npc_secretaria);
    if (_npc_temp != noone) {
        var _dist_temp = point_distance(x, y, _npc_temp.x, _npc_temp.y);
        if (_dist_temp < _dist_min) {
            _npc_id = _npc_temp;
            _dist_min = _dist_temp;
        }
    }
    
    // Verifica obj_npc_nelson (Nelson)
    _npc_temp = instance_nearest(x, y, obj_npc_nelson);
    if (_npc_temp != noone) {
        var _dist_temp = point_distance(x, y, _npc_temp.x, _npc_temp.y);
        if (_dist_temp < _dist_min) {
            _npc_id = _npc_temp;
            _dist_min = _dist_temp;
        }
    }

    // DEBUG: Mostra informações no console
    if (_npc_id != noone) {
        show_debug_message("NPC encontrado! Distância: " + string(_dist_min));
        show_debug_message("Dialogo existe? " + string(instance_exists(obj_dialogo)));
    } else {
        show_debug_message("Nenhum NPC encontrado!");
    }

    // Se encontramos um NPC, ele está perto o suficiente E NÃO há diálogo ativo
    if (_npc_id != noone && !instance_exists(obj_dialogo)) {
        
        show_debug_message("CRIANDO DIALOGO!");
        
        // Crie o objeto de diálogo com depth muito negativo para aparecer na frente
        var _dialogo_instance = instance_create_depth(0, 0, -9999, obj_dialogo);
        
        // Configure o Diálogo
        _dialogo_instance.speaker_sprite = variable_instance_exists(_npc_id, "npc_dialogo_sprite") ? _npc_id.npc_dialogo_sprite : _npc_id.sprite_index;
        _dialogo_instance.speaker_nome = variable_instance_exists(_npc_id, "npc_nome") ? _npc_id.npc_nome : "NPC";
        _dialogo_instance.dialogo_texto_array = variable_instance_exists(_npc_id, "dialogo_texto") ? _npc_id.dialogo_texto : ["Olá!"]; 
        
        // Verifica se deve mostrar a lousa
        if (variable_instance_exists(_npc_id, "mostrar_lousa")) {
            _dialogo_instance.speaker_mostrar_lousa = _npc_id.mostrar_lousa;
        }
        
        // Verifica se o NPC tem sistema de escolhas
        if (variable_instance_exists(_npc_id, "tem_escolha") && _npc_id.tem_escolha) {
            _dialogo_instance.tem_escolha = true;
            _dialogo_instance.escolhas = _npc_id.escolhas;
            _dialogo_instance.escolha_callback = _npc_id.escolha_callback;
        }
        
        show_debug_message("Dialogo criado!");
    }
}

// --- 6. SISTEMA DE INVENCIBILIDADE ---
if (invencivel) {
    invencivel_tempo--;
    if (invencivel_tempo <= 0) {
        invencivel = false;
    }
    
    // Efeito de piscar quando invencível
    if (invencivel_tempo % 10 < 5) {
        image_alpha = 0.5;
    } else {
        image_alpha = 1;
    }
} else {
    image_alpha = 1;
}

// --- 7. VERIFICAR GAME OVER ---
if (vida_atual <= 0) {
    // Game Over
    game_restart();
}

depth = -y;