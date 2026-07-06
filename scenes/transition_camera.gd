extends Camera2D

func move_camera(new_camera : Camera2D) -> void:
	print(self.global_position)
	var tween = create_tween()
	tween.tween_property(self, "global_position", new_camera.position, 1.5)

func change_view(current_camera: Camera2D, new_view: Vector2) -> void:
	self.position = current_camera.get_screen_center_position() #Vector2(642.0, 400)
	self.make_current()
	var tween = create_tween()
	tween.tween_property(self, "global_position", new_view, 1.5)
	
func change_back(player_camera: Camera2D) -> void:
	pass
