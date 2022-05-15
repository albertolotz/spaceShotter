/// @description Insert description here
// You can write your code in this editor

if(vida_curr_boss>0){
	if(estado_atual != "estado_4") vida_curr_boss -= dano_boss;
	instance_create_layer(other.x, other.y,"Tiros",obj_impacto_tiro);
	screen_shake(30);
	instance_destroy(other);
}else{
	layer_sequence_create("Boss_morte",other.x,other.y,sq_boss_morendo);
	global.total_inimigos_abatidos ++;
	obj_control.ganha_pontos("boss");
	instance_destroy();
};
