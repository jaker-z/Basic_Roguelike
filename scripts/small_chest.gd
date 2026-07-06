extends Area2D

@onready var interaction_label: Sprite2D = $Sprite2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var can_open : bool = false
var is_closed : bool = false

func _ready() -> void:
	interaction_label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_closed:
		can_open = true
		interaction_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player and not is_closed:
		can_open = false
		interaction_label.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if can_open and inventory.keys > 0 and event.is_action_pressed("interact"):
		is_closed = true
		inventory.keys -= 1
		can_open = false
		animated_sprite.play("open")
		interaction_label.visible = false
		
		
	
