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
	// If not picking up or putting down an item
	if (my_state != player_state.picking_up && my_state != player_state.putting_down){
		// If does not has item
		if (has_item == noone) {
			my_state = player_state.idle;
		}
		// If holding an item
		else {
			my_state = player_state.carry_idle;
		}
	}
}

// If moving
if (vx != 0 || vy != 0) {
	// Collision with items or walls
	if (collision_point(x + vx, y, obj_par_item, true, true) || collision_point(x + vx, y, obj_par_enviroment, true, true) || collision_point(x + vx, y, obj_cliente, true, true)) {
			x -= vx;
		}
		
	if (collision_point(x, y + vy, obj_par_item, true, true) || collision_point(x, y + vy, obj_par_enviroment, true, true) || collision_point(x, y + vy, obj_cliente, true, true)) {
			y -= vy;
		}
		
	if (!collision_point(x + vx, y, obj_par_item, true, true) || !collision_point(x + vx, y, obj_par_enviroment, true, true) || !collision_point(x + vx, y, obj_cliente, true, true)) {
			x += vx;
		}
		
	if (!collision_point(x, y + vy, obj_par_item, true, true) || !collision_point(x, y + vy, obj_par_enviroment, true, true) || !collision_point(x, y + vy, obj_cliente, true, true)) {
			y += vy;
		}
	
	// Change direction based on movement
	// right
	if (vx > 0) {
		dir = 0;
	}
	// left
	if (vx < 0) {
		dir = 2;
	}
	// down
	if (vy > 0) {
		dir = 3;
	}
	// up
	if (vy < 0) {
		dir = 1;
	}
	
	// Set state
	// If does not have an item
	if (has_item == noone) {
		my_state = player_state.walking;
	}
	else {
		my_state = player_state.carrying
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

// Check for collision with Items
nearby_item = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_par_item, false, true);
if (nearby_item && !nearby_npc) {
	// Pop up prompt
	if (item_prompt == noone || item_prompt == undefined) {
		show_debug_message("obj_player has found an item!");
		item_prompt = scr_show_prompt(nearby_item, nearby_item.x, nearby_item.y-250);
	}
}
if (!nearby_item || nearby_npc) {
	// Get rid of prompt
	scr_dismiss_prompt(item_prompt, 1);
}

// If picking up an item
if (my_state == player_state.picking_up) {
	if (image_index >= image_number-1) {
		my_state = player_state.carrying;
		global.player_control = true;
	}
}

// Depyh sorting
depth =- y;

// Auto-choose Sprite based on state and direction
sprite_index = player_spr[my_state][dir];
