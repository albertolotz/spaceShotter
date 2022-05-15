/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
pontos = 20;
chance_drop_item = 50;
posso_mover_para_lado = true;

inimigo_atira = function(){
	if (y>=0){
		instance_create_layer(x - 3, y + sprite_height/3, "Tiros", obj_tiro_inimigo_um_olho);
		audio_play_sound(sfx_laser1, 1, false);
	}
}
