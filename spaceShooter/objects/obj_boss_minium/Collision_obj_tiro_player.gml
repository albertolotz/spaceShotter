/// @description Insert description here
// You can write your code in this editor
if(vidas_minium > 0){
	vidas_minium --;
	image_alpha -= 0.08;
	instance_destroy(other);
	instance_create_layer(other.x, other.y,"Tiros",obj_impacto_tiro);
	screen_shake(10)
	frequencia_tiro_minimum_x_room_speed *= 1.1;
}else{
	instance_destroy();
	global.total_inimigos_abatidos ++;
	obj_control.ganha_pontos("minium_boss");
	instance_create_layer(other.x, other.y,"Tiros",obj_explosao);
	screen_shake(50);
}
