/// @description Insert description here
// You can write your code in this editor
pontos = 10;
chance_drop_item = 30;

vspeed = 3;

alarm[0] = random_range(1,3) * room_speed;

//verifica se esta sendo criano no lugar de outro e controle distância de criaçao 
//var x_distancia_entre_inimigos = x + (40 * obj_control.level);
//var y_distancia_entre_inimigos = y-40 * obj_control.level;

if(place_meeting(x, y, obj_inimigo_polvo_roxo)){instance_destroy(id, false)};

inimigo_atira = function(){
	if (y>=0){
		instance_create_layer(x - 3, y + sprite_height/3, "Tiros", obj_tiro_inimigo_polvo_roxo);
		audio_play_sound(sfx_laser1, 1, false);
	}
}

function drop_item(_chance){
var valor = random(100);
if (valor < _chance && y > 96){
	instance_create_layer(x,y,"Tiros", obj_power_up);
}
}

