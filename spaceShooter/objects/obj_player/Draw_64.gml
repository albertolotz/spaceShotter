/// @description Insert description here
// You can write your code in this editor
//draw_text(20,60,"Level Tiro: " + string(level_tiro));
//draw_text(20,80,"Velocidade: " + string(velocidade));
//draw_text(20,100,"Delay Tiro: " + string(delay_tiro));
//draw_text(20,120,"Escudos: " + string(escudo_disponivel));

var x_vidas = 30;
repeat(vida){
	draw_sprite_ext(spr_player,0,x_vidas,30,image_xscale * 0.3, image_yscale*0.3,image_angle-45,image_blend,0.5);
	x_vidas += 40;
}

var x_escudos = 30;
repeat(escudo_disponivel){
	draw_sprite_ext(spr_escudo,2,x_escudos,80,image_xscale * 0.2, image_yscale*0.2,image_angle,image_blend,0.5);
	x_escudos += 40;
}
