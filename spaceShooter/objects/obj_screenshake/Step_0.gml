/// @description Insert description here
// You can write your code in this editor

view_xport[0] = random_range(-shake, shake);
view_yport[0] = random_range(-shake, shake);

shake *= 0.90;
if(shake < 0.5) instance_destroy(); 

