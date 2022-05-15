/// @description Insert description here
// You can write your code in this editor

audio_stop_all();
audio_play_sound(snd_BossFight, 0, true);

function random_estado_atual(){
	if(vida_curr_boss < vida_max_boss/2){
		estado_atual = choose("estado_1", "estado_2", "estado_3","estado_4");
		}else{
		estado_atual = choose("estado_1", "estado_2", "estado_3");
	}

	return estado_atual;
}

vida_max_boss = 2000;
vida_curr_boss = vida_max_boss;
dano_boss = 70;
recupera_vida = 5;

estado_atual = random_estado_atual();
delay_tiro_boss_estado_1 = room_speed / 2;
delay_tiro_boss_estado_2 = room_speed / 1.2;
delay_tiro_boss_estado_3 = room_speed / 1.5;

espera_tiro_boss = 0;
velocidade_horizontal_boss = 3;

delay_troca_estado_boss = room_speed * 10;
espera_troca_estado_boss = delay_troca_estado_boss;

alterna_tiros_estado_3 = true;


function posicao_boss_centro_tela(){
	x += sign(room_width / 2 - x);
}


function alterna_visual_boss_entre_combate_escuro(){
	switch(estado_atual){
		case "estado_4":
			sprite_index = spr_boss_escuro;
		break;
			
		default:
			sprite_index = spr_boss_combate;
	}
}

function boss_estado_1(){
	posicao_boss_centro_tela();
	alterna_visual_boss_entre_combate_escuro();
	espera_tiro_boss--;
	if(espera_tiro_boss<=0){
		audio_play_sound(sfx_laser1, 1, false);
		instance_create_layer(x,y+80,"Tiros",obj_tiro_inimigo_um_olho);
		espera_tiro_boss = delay_tiro_boss_estado_1;
	}
}

function boss_estado_2(){
	alterna_visual_boss_entre_combate_escuro();
	espera_tiro_boss--;
	if(espera_tiro_boss<=0){
		audio_play_sound(sfx_laser1, 1, false);
		instance_create_layer(x-160,y+10,"Tiros",obj_tiro_inimigo_polvo_roxo);
		instance_create_layer(x+160,y+10,"Tiros",obj_tiro_inimigo_polvo_roxo);
		espera_tiro_boss = delay_tiro_boss_estado_2;
	}
		
	x+=velocidade_horizontal_boss;
	if(x>=1632 || x<=288) velocidade_horizontal_boss *= -1;
}

function boss_estado_3(){
	posicao_boss_centro_tela();
	alterna_visual_boss_entre_combate_escuro();
	espera_tiro_boss--;
	if(espera_tiro_boss<=0){
		if(alterna_tiros_estado_3){
			audio_play_sound(sfx_laser1, 1, false);
			instance_create_layer(x,y+80,"Tiros",obj_tiro_inimigo_um_olho);
			alterna_tiros_estado_3 = false;
		}else{
			audio_play_sound(sfx_laser1, 1, false);
			instance_create_layer(x-160,y+10,"Tiros",obj_tiro_inimigo_polvo_roxo);
			instance_create_layer(x+160,y+10,"Tiros",obj_tiro_inimigo_polvo_roxo);
			alterna_tiros_estado_3 = true;
		}
		espera_tiro_boss = delay_tiro_boss_estado_3;
	}
}

function boss_estado_4(){
	posicao_boss_centro_tela();
	alterna_visual_boss_entre_combate_escuro();
	
	if(!instance_exists(obj_boss_minium)){
		var minium_direira = instance_create_layer(1760,544,"Boss",obj_boss_minium);
		minium_direira.image_angle = 90;
	
		var minium_esquerda = instance_create_layer(160,544,"Boss",obj_boss_minium);
		minium_esquerda.image_angle = 270;
	}
}


function troca_estado_boss(){
	espera_troca_estado_boss --;
	if(espera_troca_estado_boss <=0){
		estado_atual = random_estado_atual();
		espera_troca_estado_boss = delay_troca_estado_boss;
	}
}



