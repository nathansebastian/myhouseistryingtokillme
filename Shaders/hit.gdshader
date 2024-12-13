shader_type canvas_item;

uniform vec3 color: source_color = vec3(1);
uniform float _alpha: hint_range(0.0, 1.0,0.1) = 0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float currentA = texture(TEXTURE,UV).a;
	vec4 targetColour = mix(texture(TEXTURE,UV),vec4(color,currentA),_alpha);
	COLOR = targetColour;
	}