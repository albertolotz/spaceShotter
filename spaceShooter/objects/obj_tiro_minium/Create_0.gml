/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
function tiro_teleguiado(){
	if(instance_exists(obj_boss_combate)){
		direction = point_direction(x,y,obj_boss_combate.x,obj_boss_combate.y);
		image_angle = direction + 90;
	}
}

tiro_teleguiado();



