extends Node3D

@export var speed: float = 3.0
@export var direction: float = 1.0
@export var z_offset: float = 0.0

var boundary: float = 120.0

func _process(delta):
	position.x += speed * direction * delta
	
	if position.x > boundary:
		position.x = -boundary
	elif position.x < -boundary:
		position.x = boundary
