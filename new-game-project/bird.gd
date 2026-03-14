extends Node3D

# flight parameters
@export var radius: float = 8.0
@export var height: float = 5.0
@export var speed: float = 0.5

@export var angle: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angle = randf() * TAU
	# Tau = 2*PI = full circle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle += speed * delta
	position.x = cos(angle) * radius
	position.z = sin(angle) * radius
	position.y = height
