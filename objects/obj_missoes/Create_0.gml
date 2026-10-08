// Evento Create de obj_missoes

// Depth para aparecer na frente
depth = -5000;

// Lista de missões ativas
missoes_ativas = [];

// Adiciona missão inicial
missoes_ativas[0] = {
    titulo: "Bem-vindo ao IFSP!",
    descricao: "Explore o campus e converse com os NPCs",
    completa: false
};

missoes_ativas[1] = {
    titulo: "Descubra sobre o Jundu",
    descricao: "Fale com a Juliana no IFSP",
    completa: false
};

// Configurações visuais
largura_janela = 320;
altura_janela = 150;
margem = 20;
x_janela = room_width - largura_janela - margem;
y_janela = margem;

// Funções de gerenciamento
adicionar_missao = function(_titulo, _descricao) {
    var _nova_missao = {
        titulo: _titulo,
        descricao: _descricao,
        completa: false
    };
    array_push(missoes_ativas, _nova_missao);
}

completar_missao = function(_index) {
    if (_index >= 0 && _index < array_length(missoes_ativas)) {
        missoes_ativas[_index].completa = true;
    }
}

remover_missao = function(_index) {
    if (_index >= 0 && _index < array_length(missoes_ativas)) {
        array_delete(missoes_ativas, _index, 1);
    }
}
