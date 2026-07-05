extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var can_open : bool = false

func _on_body_entered(body: Node2D) -> void:
	#can_open = true
	print(body)
	
func _on_body_exited(body: Node2D) -> void:
	can_open = false

func _unhandled_input(event: InputEvent) -> void:
	if can_open and event.is_action_pressed("interact"):
		animated_sprite.play("open")
