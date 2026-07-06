extends CharacterBody2D

class_name Player

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var platform: AnimatableBody2D = $"../platforms/platform"
@onready var platform_9: AnimatableBody2D = $"../platforms/platform9"

var is_jumping = true

#grab the animated sprite code reference by click and drag and holding control
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if Input.is_action_pressed("ui_down"):
			platform.set_collision_layer_value(1, false)
		else:
			platform.set_collision_layer_value(1, true)
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if Input.is_action_pressed("ui_down"):
			position.y += 2
		else:
			velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	var jump_direction := Input.get_axis("ui_up", "ui_down")
	
	# Flip the animated sprite per direction
	if direction > 0:
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
	
	# Play animation in relation to characters movement
	#if is_on_floor():
	#	is_jumping = false
	#	if direction == 0:
	#		animated_sprite.play("idle")
	#	else:
	#		animated_sprite.play("run")
	#elif velocity.y < 0:
	#	animated_sprite.play("jump")
	#elif velocity.y > 0:
	#	animated_sprite.play("fall") 
	
	# Give the player movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
