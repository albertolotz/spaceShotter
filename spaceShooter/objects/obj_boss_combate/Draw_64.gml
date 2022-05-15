/// @description Barra de vida
// You can write your code in this editor

pc = (vida_curr_boss / vida_max_boss) * 100;

draw_text(10,697,"Boss Life")
draw_healthbar(100, 715, 200, 700, pc, c_black, c_red, c_lime, 0, true, true)
