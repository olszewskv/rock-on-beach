extends Node3D

@export var bird_count: int = 6
@export var tree_count: int = 5
@export var ship_count: int = 4

var bird_scene = preload("res://bird.tscn")
var tree_scene = preload("res://tree.tscn")
var ship_scene = preload("res://ship.tscn")

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
	
	for i in ship_count:
		var ship = ship_scene.instantiate()
		
		ship.position.z = randf_range(-60.0, -90.0)
		ship.position.y = -0.2
		ship.position.x = randf_range(-80.0, 80.0)
		
		ship.direction = 1.0 if i % 2 == 0 else -1.0
		ship.z_offset = ship.position.z
		ship.speed = randf_range(1.5, 4.0)
		
		var scale = randf_range(0.8, 1.4)
		ship.scale = Vector3(scale, scale, scale)
		add_child(ship)
