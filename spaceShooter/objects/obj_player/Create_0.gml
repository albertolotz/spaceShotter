/// @description Inicio Variaveis
// You can write your code in this editor

// regras power up
// velocidade = + 0.5 Limite = 10 45%
// delay tiro = + 10% Limite = 20 45%
// level tiro = 1     Limite = 5  10%

vida = 3;

escudo_disponivel = 3;

velocidade = 5;

delay_tiro = room_speed;

level_tiro = 1;


function player_atira(){
		
	var fire=keyboard_check(vk_space) ;
	
	y_tiro = y-sprite_height/3;
	
	tiro_1 = obj_tiro_player;
	tiro_2 = obj_tiro_2_player;
	
	function cria_tiro_1(potencia){
		if(potencia="Normal"){instance_create_layer(x, y_tiro,"Tiros",tiro_1)};
		
		if(potencia="Turbo"){
			instance_create_layer(x, y_tiro,"Tiros",tiro_1);
			var rotacao = 75;
			repeat(3){
				tiro_turbo = instance_create_layer(x, y_tiro,"Tiros",tiro_1);
				tiro_turbo.direction = rotacao;
				tiro_turbo.image_angle = tiro_turbo.direction - 90;
				rotacao += 15;
			}
		}
	};
	
	///@function cria_tiro_2(posicao)
	///@param {string} val D=Direita/E=Esquerda
	///@description  Cria o tiro de um dos lados da nave
	function cria_tiro_2(posicao){
		var speed_tiro = 5;
		var x_tiro = x + 60;
		if(posicao="D"){x_tiro = x-60};
		if(posicao="E"){x_tiro = x_tiro};
		tiro = instance_create_layer(x_tiro, y_tiro,"Tiros",tiro_2);
		if(posicao="E"){tiro.hspeed = speed_tiro *-1};
		if(posicao="D"){tiro.hspeed = speed_tiro};
	}
		
	if(fire  && alarm[0] == -1){
		alarm[0] = delay_tiro;
		
		audio_play_sound(sfx_laser2, 1, false);
		
		if(level_tiro = 1){
			cria_tiro_1("Normal");
		};
		
		if(level_tiro = 2){
			cria_tiro_2("E");
			cria_tiro_2("D");
		}
		
		if(level_tiro = 3){
			cria_tiro_2("E");
			cria_tiro_2("D");
			cria_tiro_1("Normal")
		}
		
		if(level_tiro = 4){
			cria_tiro_1("Turbo")
		}
		
		if(level_tiro >= 5){
			cria_tiro_2("E");
			cria_tiro_2("D");
			cria_tiro_1("Turbo")
		}
	}
}; // fim function player atira

///@method level_up(chance)
function level_up(_corrente_level_up){
	if (_corrente_level_up="velocidade" && (velocidade < 10)){
		velocidade *= 1.05;
	}else{
		obj_control.ganha_pontos("power_up_over_velocidade")
	};
	
	if(_corrente_level_up = "delay_tiro" && (delay_tiro >= 15)){
		delay_tiro *= 0.9;
	}else{
		obj_control.ganha_pontos("power_up_over_delay_tiro")
	};
	
	if(_corrente_level_up = "level_tiro" && (level_tiro <= 5)){
		level_tiro ++ ;
	}else{
		obj_control.ganha_pontos("power_up_over_tiro")
	};
}

function ativa_escudo(){
	if(escudo_disponivel>0 && !instance_exists(obj_escudo)){
	 escudo_disponivel --;
	 var escudo = instance_create_layer(x,y,"Escudo",obj_escudo);
	 escudo.alvo = id;
	}
}
