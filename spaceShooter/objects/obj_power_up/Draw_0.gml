/// @description Insert description here
// You can write your code in this editor

var cor_level_up = set_cor_level_up(correte_level_up);

draw_self();

gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale + 0.2, image_yscale + 0.2 ,image_angle,cor_level_up, image_alpha - 0.3);
gpu_set_blendmode(bm_normal);
