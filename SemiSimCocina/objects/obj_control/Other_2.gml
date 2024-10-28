/// @description Game variables

// Game variables
global.player_control = true;

// Player States
enum player_state {
	idle,
	walking,
	picking_up,
	carrying,
	carry_idle,
	putting_down,
}

// Item States
enum item_state {
	idle,
	taken,
	used,
	putting_back,
}