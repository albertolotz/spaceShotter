/// @description Insert description here
// You can write your code in this editor



if(trocou_de_room == false){
	alpha += 0.02;
}else{
	alpha -= 0.02;
};


if(alpha>=1 && !trocou_de_room){
	room_goto(destino);
};

if(alpha <= 0) instance_destroy();
