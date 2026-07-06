extends Node2D

@onready var player: Player = $player
@onready var coin_label: Label = $CanvasLayer/Control/coin_label
@onready var transition_camera: Camera2D = $transition_camera
@onready var transition_camera1: Camera2D = $player/transition_camera
@onready var friend_camera: Camera2D = $friend_camera
@onready var player_camera: Camera2D = $player/player_camera
@onready var dingus_camera: Camera2D = $dingus_camera

var friend_view: Vector2 = Vector2(1214, 401)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Replace with function body.
	#coin_label.text = "Coins: " + str("%03d" % game_controller.inventory.coins)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass #print(player_camera.position)

func _on_coins_child_exiting_tree(node: Node) -> void:
	print("coin has been collected.")
	coin_label.text = "Coins: " + str("%03d" % inventory.coins)

func _on_switch_area_camera_body_entered(body: Node2D) -> void:
	transition_camera.change_view(player_camera, friend_view)
	
	"""
	transition_camera.position = player_camera.get_screen_center_position() #Vector2(642.0, 400)
	transition_camera.make_current()
	transition_camera.move_camera(friend_camera)
	"""
func _on_switch_area_camera_body_exited(body: Node2D) -> void:
	#transition_camera.position = player_camera.get_screen_center_position() #Vector2(642.0, 400)
	#player_camera.make_current()
	transition_camera.change_back(player_camera)
	
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pee"):
		print(player_camera.global_position)
