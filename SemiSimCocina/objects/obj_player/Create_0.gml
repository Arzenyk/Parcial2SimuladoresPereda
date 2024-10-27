/// @description My first code

//  Variables
walk_speed = 16;
vx = 0;
vy = 0;
dir = 3;
move_right = 0;
move_left = 0;
move_up = 0;
move_down = 0;
nearby_npc = noone;
look_range = 100;
npc_prompt = noone;
has_item = noone;
has_item_x = x;
has_item_y = y;
nearby_item = noone;
item_prompt = noone;
carry_limit = 0;
my_state = player_state.idle;

// Player sprite array [my_state] [dir]
// Idle
player_spr[player_state.idle][0] = spr_player_right_idle;
player_spr[player_state.idle][1] = spr_player_up_idle;
player_spr[player_state.idle][2] = spr_player_left_idle;
player_spr[player_state.idle][3] = spr_player_down_idle;

// Walking
player_spr[player_state.walking][0] = spr_player_right;
player_spr[player_state.walking][1] = spr_player_up;
player_spr[player_state.walking][2] = spr_player_left;
player_spr[player_state.walking][3] = spr_player_down;

// Picking up
player_spr[player_state.picking_up][0] = spr_player_right_pickingup;
player_spr[player_state.picking_up][1] = spr_player_up_pickingup;
player_spr[player_state.picking_up][2] = spr_player_left_pickingup;
player_spr[player_state.picking_up][3] = spr_player_down_pickingup;

// Carrying
player_spr[player_state.carrying][0] = spr_player_right_carrying;
player_spr[player_state.carrying][1] = spr_player_up_carrying;
player_spr[player_state.carrying][2] = spr_player_left_carrying;
player_spr[player_state.carrying][3] = spr_player_down_carrying;

// Idle while carrying
player_spr[player_state.carry_idle][0] = spr_player_right_idle_carrying;
player_spr[player_state.carry_idle][1] = spr_player_up_idle_carrying;
player_spr[player_state.carry_idle][2] = spr_player_left_idle_carrying;
player_spr[player_state.carry_idle][3] = spr_player_down_idle_carrying;

// Putting down
player_spr[player_state.putting_down][0] = spr_player_right_puttingdown;
player_spr[player_state.putting_down][1] = spr_player_up_puttingdown;
player_spr[player_state.putting_down][2] = spr_player_left_puttingdown;
player_spr[player_state.putting_down][3] = spr_player_down_puttingdown;



