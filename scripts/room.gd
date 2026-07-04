extends Node2D

@onready var coin_label: Label = $CanvasLayer/Control/coin_label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Replace with function body.
	#coin_label.text = "Coins: " + str("%03d" % game_controller.inventory.coins)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_coins_child_exiting_tree(node: Node) -> void:
	print("coin has been collected.")
	coin_label.text = "Coins: " + str("%03d" % inventory.coins)
