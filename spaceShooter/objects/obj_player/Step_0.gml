/// @description Insert description here
// You can write your code in this editor

var up, down, left, right, cria_escudo;

//up=keyboard_check(ord("W"));
//down=keyboard_check(ord("S"));
//left=keyboard_check(ord("A"));
//right=keyboard_check(ord("D"));

up=keyboard_check(vk_up);
down=keyboard_check(vk_down);
left=keyboard_check(vk_left);
right=keyboard_check(vk_right);
cria_escudo=keyboard_check_pressed(ord("E"));

y += (down - up) * velocidade;
x += (right - left) * velocidade;

x=clamp(x,64, 1856);
y=clamp(y,64, 1024);

//tmp debug
//level_tiro_up=keyboard_check_pressed(ord("W"));
//level_tiro_down=keyboard_check_pressed(ord("S"));
//espera_tiro_up=keyboard_check_pressed(ord("A"));
//espera_tiro_down=keyboard_check_pressed(ord("D"));

//if(level_tiro_up && level_tiro < 5){level_tiro ++};
//if(level_tiro_down && level_tiro > 1){level_tiro --};
//if(espera_tiro_up){delay_tiro *= 1.1};
//if(espera_tiro_down && delay_tiro >= 20){delay_tiro *= 0.9};
// fim degug


if(cria_escudo)ativa_escudo();

player_atira();






