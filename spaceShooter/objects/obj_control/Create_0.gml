/// @description Insert description here
// You can write your code in this editor
randomize();
alarm[0] = room_speed;

incremento_level = 100; 
pontos = 0;
level = 1;
level_maximos = 10;
proximo_level = incremento_level;
chegou_boss = false;
player_morreu = false;



function ganha_pontos(nome_inimigo){
	switch(nome_inimigo){
		case "obj_inimigo_polvo_roxo":
		recompensa = 10;
		break;
		
		case "obj_inimigo_um_olho":
		recompensa = 20;
		break;
		
		case "power_up_over_tiro":
		recompensa = 100;
		break;
		
		case "power_up_over_delay_tiro":
		recompensa = 30;
		break;
		
		case "power_up_over_velocidade":
		recompensa = 30;
		break;
		
		case "minium_boss":
		recompensa = 30;
		break;
		
		case "boss":
		recompensa = 200;
		break;
		
		default:
		recompensa = 0;
	}
	
	pontos +=recompensa * level;
	
	if(pontos > global.total_pontos) global.total_pontos = pontos;
	
	if(pontos > proximo_level){
		level ++
		proximo_level *= 2; // dobra
	}
}

function cria_inimigos(qtd_inimigos){
	if(level<=level_maximos){
		repeat(qtd_inimigos){
			var x_aleatorio = irandom_range(64,1856);
			var y_aloatorio = irandom_range(-64, -1504 - (level * 500)); 

			var inimigo_corrente = obj_inimigo_polvo_roxo;

			var chance = random_range(0, level); //mecanica para mesclar inimigos 

			if(chance > 2){inimigo_corrente = obj_inimigo_um_olho};

			instance_create_layer(x_aleatorio,y_aloatorio,"Inimigos",inimigo_corrente);	
		};
	};
	
	if(level>level_maximos && chegou_boss = false){
		audio_stop_all();
		layer_sequence_create("Sequencia_chegada_boss",960,576,sq_boss_chegando);	
		chegou_boss = true;
	};
};

destroe_inimigo = function(inimigo, e_tiro){
	var nome_inimigo_abatido = object_get_name(inimigo.object_index);
	instance_destroy(inimigo);
	if(e_tiro) instance_destroy(e_tiro);
	if(e_tiro) instance_create_layer(inimigo.x, inimigo.y,"Tiros", obj_impacto_tiro);
	instance_create_layer(inimigo.x, inimigo.y,"Inimigos", obj_explosao);
	screen_shake(10);
	ganha_pontos(nome_inimigo_abatido);
	inimigo.drop_item(inimigo.chance_drop_item);
	global.total_inimigos_abatidos ++;  
}

function perde_vida(player){
	player.vida --;
	global.total_mortes_player ++; 
	return player.vida;
}

destroe_player = function(player, e_objeto){
	if(!instance_exists(obj_escudo)){
		if (perde_vida(player) < 0){
			audio_play_sound(sfx_lose, 1, false);
			screen_shake(300);
			instance_create_layer(e_objeto.x, e_objeto.y,"Player", obj_explosao);
			layer_sequence_create("Game_over",room_width/2,room_height/2,sq_gameover);
			player_morreu = true;
			instance_destroy(player);
		};
		audio_play_sound(sfx_explosion, 1, false);
		instance_destroy(e_objeto);
		screen_shake(30);
		instance_create_layer(e_objeto.x, e_objeto.y,"Player", obj_impacto_tiro);
	}
 }
 

