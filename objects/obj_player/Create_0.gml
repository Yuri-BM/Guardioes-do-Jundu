// Evento Create de obj_player

// Inicializar variáveis globais
global.inventario_aberto = false;
global.lixo_coletado = 0; // Contador de lixo eletrônico
global.tem_espada = false; // Player não tem espada no início
global.todos_inimigos_mortos = false; // Controla se pode plantar Jundu
global.jundus_plantados = 0; // Contador de Jundus plantados

// Sistema de vida
vida_maxima = 3; // 3 corações
vida_atual = 3;
invencivel = false; // Invencibilidade temporária após dano
invencivel_tempo = 0;
invencivel_duracao = 60; // 1 segundo (60 frames a 60 FPS)

// Animação de dano
levou_dano = false;
tempo_animacao_dano = 20; // Duração da animação de dano (0.33 segundo)
dano_timer = 0;

// Sistema de ataque
pode_atacar = true;
cooldown_ataque_player = 30; // 0.5 segundo entre ataques
ultimo_ataque_player = 0;
atacando = false; // Flag para controlar animação de ataque
tempo_animacao_ataque = 20; // Duração da animação de ataque (0.33 segundo)
ataque_timer = 0;

// Criar janela de missões (apenas uma vez no jogo)
if (!instance_exists(obj_missoes)) {
    instance_create_depth(0, 0, -5000, obj_missoes);
}

image_speed = 1; // Toca a animação na velocidade "Fps" definido no Sprite

// 2. Variáveis de Estado (AQUI ESTÁ A CORREÇÃO)
estado = "idle"; 	// Começamos "parado" (idle)
direcao = "down"; 	// <<<<< ESSA LINHA CORRIGE O ERRO
					// Damos a 'direcao' um valor inicial "down"

spd = 4; // Ajuste para a sua velocidade