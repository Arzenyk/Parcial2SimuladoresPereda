/// @description Animation and more

// Random loop timing
if (image_speed > 0) {
	if (image_index == image_number) {
		image_speed = 0;
		alarm[0] = irandom_range(loop_range01, loop_range02)
	}
}

// Depth sorting
depth =- y;