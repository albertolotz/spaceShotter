/// @description Insert description here
// You can write your code in this editor

obj_boss_combate.vida_curr_boss -= 50;
instance_create_layer(x,y,"Tiros",obj_impacto_tiro);
instance_destroy();
