extends Area2D




func _on_body_entered(body: Node2D) -> void:
	inventory.keys += 1
	print("Key has been added to inventory")
	queue_free()
