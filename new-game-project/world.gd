extends Node3D

@export var bird_count: int = 6
@export var tree_count: int = 5

var bird_scene = preload("res://bird.tscn")
var tree_scene = preload("res://tree.tscn")

func _ready() -> void:
	for i in bird_count:
		var bird = bird_scene.instantiate() 
		
		bird.radius = randf_range(6.0, 12.0)
		bird.height = randf_range(4.0, 8.0)
		bird.speed = randf_range(0.3, 0.7)
		
		add_child(bird)
		
	for i in tree_count:
		var tree = tree_scene.instantiate()
		var angle = randf() * TAU
		var dist = randf_range(8.0, 20.0)
		tree.position.x = cos(angle) * dist
		tree.position.z = sin(angle) * dist
		tree.position.y = 0.0
		
		var scale = randf_range(0.7, 1.3)
		tree.scale = Vector3(scale, scale, scale)
		add_child(tree)
