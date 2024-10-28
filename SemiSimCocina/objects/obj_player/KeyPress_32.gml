/// @description Textbox test

var _text;

// If player has control
if (global.player_control == true) {
	// If near an NPC
	if (nearby_npc) {
		// If player does not hav an item
		if (has_item == noone || has_item == undefined) {
			_text = nearby_npc.my_text;
			if (!instance_exists(obj_textbox)) {
				var iii = instance_create_depth(nearby_npc.x, nearby_npc.y-350, -10000, obj_textbox);
				iii.text_to_show = _text;
			}
		}
	}
	// If near an item
	if (nearby_item && !nearby_npc) {
		// If player does not have an item
		if (has_item == noone || has_item == undefined) {
			global.player_control = false;
			my_state = player_state.picking_up;
			image_index = 0;
			has_item = nearby_item;
			// Take into account weight of the item picking up
			carry_limit = has_item.item_weight * 0.1;
			// Change state of item we are picking up
			with (has_item) {
				my_state = item_state.taken;
			}
		}
	// If not near an NPC or another item
	if (!nearby_item && !nearby_npc) {
		// Put down an item
		if (has_item != noone) {
			my_state = player_state.putting_down;
			image_index = 0;
			global.player_control = false;
			// Change state of item being carry
			with (has_item) {
				put_down_y = obj_player.y+5;
				my_state = item_state.putting_back;
			}
			// Reset item
			has_item = noone;
			}
		}
	}
}