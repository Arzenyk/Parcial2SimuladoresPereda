/// @description Player movement

// Check keys for movement
if (global.player_control == true) {
	move_right = keyboard_check(vk_right);
	move_left = keyboard_check(vk_left);
	move_up = keyboard_check(vk_up);
	move_down = keyboard_check(vk_down);
}

if (global.player_control == false) {
	move_right = 0;
	move_left = 0;
	move_up = 0;
	move_down = 0;
}

// Calculate movement
vx = ((move_right - move_left) * walk_speed);
vy = ((move_down - move_up) * walk_speed);

// If idle
if (vx == 0 && vy == 0) {
	// Change idle Sprite based on last direction
	switch dir {
		case 0 : sprite_index = spr_player_right; break;
		case 1 : sprite_index = spr_player_up; break;
		case 2 : sprite_index = spr_player_left; break;
		case 3 : sprite_index = spr_player_down; break;
	}
}

// If moving
if (vx != 0 || vy != 0) {
	if !collision_point(x + vx, y, obj_par_enviroment, true, true) {
		x += vx;
	}
	if !collision_point(x, y + vy, obj_par_enviroment, true, true) {
		y += vy;
	}
	
	// Change walking Sprite based on direction
	// right
	if (vx > 0) {
		sprite_index = spr_player_right;
		dir = 0;
	}
	// left
	if (vx < 0) {
		sprite_index = spr_player_left;
		dir = 2;
	}
	// down
	if (vy > 0) {
		sprite_index = spr_player_down;
		dir = 3;
	}
	// up
	if (vy < 0) {
		sprite_index = spr_player_up;
		dir = 1;
	}
}

// Check for collision with NPCs
nearby_npc = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_par_npc, false, true);
if (nearby_npc) {
	// Pop up prompt
	if (npc_prompt == noone || npc_prompt == undefined) {
		npc_prompt = scr_show_prompt(nearby_npc, nearby_npc.x, nearby_npc.y -350);	
	}
}
if (!nearby_npc) {
	// Get rid of prompt
	scr_dismiss_prompt(npc_prompt, 0);
}

// Depyh sorting
depth =- y;
