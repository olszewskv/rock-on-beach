extends DirectionalLight3D

@export var day_speed: float = 1.0

@export var max_brightness: float = 1.2
@export var min_brightness: float = 0.0

var time_of_day: float = 0.2

func _process(delta):
	time_of_day += delta * day_speed * 0.005

	if time_of_day >= 1.0:
		time_of_day = 0.0
	
	var sun_angle = time_of_day * TAU
	
	rotation.x = sin(sun_angle) * -1.5
	rotation.y = 0.3

	var sun_height = sin(sun_angle)
	light_energy = clamp(sun_height * max_brightness, min_brightness, max_brightness)
	
	var warmth = 1.0 - abs(sun_height)
	light_color = Color(
		1.0,
		1.0 - warmth * 0.3,
		1.0 - warmth * 0.6
	)
