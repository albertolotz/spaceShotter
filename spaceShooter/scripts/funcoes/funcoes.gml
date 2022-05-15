// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screen_shake(intencidade){
	var screen_shake = instance_create_layer(0, 0,layer, obj_screenshake);
	screen_shake.shake = intencidade;
}


function destroi_animacao_boss_chegando(){
	var elementos = layer_get_all_elements("Sequencia_chegada_boss");
	layer_sequence_destroy(elementos[0]);
	
	instance_create_layer(960,288,"Boss",obj_boss_combate);
};

function player_win(){
	if(instance_exists(obj_player)){
		layer_sequence_create("Boss_morte",obj_player.x, obj_player.y,sq_player_win);
		instance_destroy(obj_player);
	};
};

function cria_transicao(){
	var _transisao = instance_create_layer(0, 0, "Transicao", obj_transicao);
	_transisao.destino = rm_Inicio;
}
