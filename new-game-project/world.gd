extends Node3D

@export var bird_count: int = 6

var bird_scene = preload("res://bird.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in bird_count:
		var bird = bird_scene.instantiate() 
		
		bird.radius = randf_range(6.0, 12.0)
		bird.height = randf_range(4.0, 8.0)
		bird.speed = randf_range(0.3, 0.7)
		
		add_child(bird)
