/// @description Insert description here
// You can write your code in this editor

chance = random(100);
alarm[0] = room_speed ;

function set_level_up(_chance){
	if ((_chance >= 0) && (_chance < 45)){
		return "velocidade";
	};
	
	if( (_chance >= 45) && (_chance < 90)){
		return "delay_tiro";
	};
	
	if((_chance >= 90)){
		return "level_tiro"
	};
}

correte_level_up = set_level_up(chance);

function set_cor_level_up(_correte_level_up){
 switch _correte_level_up{
	case "velocidade":
		return c_lime;
	break;

	case "delay_tiro":
		return c_red;
	break;
	
	case "level_tiro":
		return c_fuchsia;
	break;
	
	default:
		return c_white;
 }
}

speed = 2;
direction = irandom(359);



