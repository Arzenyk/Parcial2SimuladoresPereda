/// @description Effects and animation

// Bob up and down
y += shift;

switch fade_prompt {
	// Fade in
	case "fadeIn": {
		if (image_alpha < 1) {
			image_alpha += fade_speed;
			}
		if (image_alpha >= 1) {
			fade_prompt = "fadeVisible";
			}
		}; break;
	// Fade out
	case "fadeOut": {
		if (image_alpha > 0) {
			image_alpha -= fade_speed;
			}
		if (image_alpha <= 0) {
			fade_prompt = "fadeDone";
			// Queue up destroy
			alarm[0] = 2;
			}
		}; break;
	}