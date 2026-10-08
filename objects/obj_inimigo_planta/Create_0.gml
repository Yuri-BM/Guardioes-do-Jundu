// Evento Create de obj_inimigo_planta

// Velocidade de perseguição
spd = 2;

// Direção inicial
direcao = "down";

// Estado
estado = "idle"; // idle, walking, attacking ou dying

// Vida do inimigo
vida_maxima = 3;
vida_atual = 3;

// Dano que causa ao player
dano = 1;

// Alcance de ataque
alcance_ataque = 60; // Pixels de distância para atacar

// Tempo entre ataques
ultimo_ataque = 0;
cooldown_ataque = 60; // 1 segundo (60 frames)
tempo_animacao_ataque = 30; // Duração da animação de ataque (0.5 segundo)
ataque_em_progresso = false;

// Animação de morte
tempo_animacao_morte = 40; // Duração da animação de morte (0.67 segundo)
morte_em_progresso = false;

// Animação de dano
levou_dano = false;
tempo_animacao_dano = 15; // Duração da animação de dano (0.25 segundo)
dano_timer = 0;
