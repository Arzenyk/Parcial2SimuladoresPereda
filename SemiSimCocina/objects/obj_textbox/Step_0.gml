/// @description Animation and effects

// Fade effects
switch fade_textbox {
	// Fade in
	case 0: {
		if (image_alpha < 1) {
			image_alpha += fade_speed;
			}
		if (image_alpha == 1) {
			fade_textbox = 1;
			}
		}; break;
	// Fade out
	case 2: {
		if (image_alpha > 0) {
			image_alpha -= fade_speed;
			}
		if (image_alpha == 0) {
			fade_textbox = 3;
			// Queue up destroy
			alarm[0] = 2;
			}
		}; break;
	}