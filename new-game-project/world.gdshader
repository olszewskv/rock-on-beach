shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_burley, specular_schlick_ggx;

// Wave parameters
uniform float wave_height : hint_range(0.0, 2.0) = 0.3;
uniform float wave_speed : hint_range(0.0, 5.0) = 1.2;
uniform float wave_frequency : hint_range(0.0, 10.0) = 2.0;
uniform vec4 water_color : source_color = vec4(0.0, 0.3, 0.5, 0.9);
uniform vec4 foam_color : source_color = vec4(0.8, 0.9, 1.0, 1.0);

void vertex() {
	float wave1 = sin(VERTEX.x * wave_frequency + TIME * wave_speed) * wave_height;
	float wave2 = sin(VERTEX.z * wave_frequency * 0.8 + TIME * wave_speed * 1.3) * wave_height * 0.6;
	VERTEX.y += wave1 + wave2;
}

void fragment() {
	float foam = clamp(VERTEX.y * 2.0, 0.0, 1.0);
	ALBEDO = mix(water_color.rgb, foam_color.rgb, foam * 0.3);
	ROUGHNESS = 0.05;
	METALLIC = 0.1;
	ALPHA = water_color.a;
}