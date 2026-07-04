extends Node

@onready var main_view: Node2D = $main_view

var room = preload("res://scenes/room.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var first_room = room.instantiate()
	change_view(first_room)
	
func change_view(next_view: Node2D) -> void:
	print(main_view) 
	if (main_view != null):
		main_view.add_child(next_view)
