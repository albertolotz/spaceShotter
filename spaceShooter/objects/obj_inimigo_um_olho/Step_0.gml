/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


function qual_lado(){
	if( x < (room_width/2)){
		return "Esquerda";
	}
	return "Direita";
};


if(y > room_height/3 && posso_mover_para_lado){
	posso_mover_para_lado = false;
	if(qual_lado() = "Esquerda") {hspeed = 4};
	if(qual_lado() = "Direita") {hspeed = -4};	
}




