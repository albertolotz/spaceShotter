/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_orange);
draw_set_font(fnt_pontos);

var _pontos = round(pontos);

draw_text(room_width/3,100,"Maior Pontuação Conquistada : " + string(_pontos));
draw_text(room_width/3,300,"Total Mortes do Player : " + string(global.total_mortes_player));
draw_text(room_width/3,500,"Total Inimigos Abatidos : " + string(global.total_inimigos_abatidos));


draw_set_font(-1);
draw_set_color(-1);

if(pontos < global.total_pontos ){
	var _incrementa_pontos = global.total_pontos * 0.005;
	pontos += _incrementa_pontos;
};
	
	
