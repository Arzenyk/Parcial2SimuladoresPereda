/// @description Textbox test

var _text;


// Create a textbox if NPC is nearby
if (nearby_npc) {
	_text = nearby_npc.my_text;
	if (!instance_exists(obj_textbox)) {
		iii = instance_create_depth(x, y, -10000, obj_textbox);
		iii.text_to_show = _text;
	}
}