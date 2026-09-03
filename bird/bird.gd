class_name Bird
extends CharacterBody2D


const JUMP_VELOCITY = -400.0


@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Ajouter la gravité
	velocity += get_gravity() * delta
	
	# Sauter
	if Input.is_action_just_pressed(&"jump") and not Global.dead:
		velocity.y = JUMP_VELOCITY
	
	if Global.dead:
		if velocity.y < 0:
			velocity.y = 0
		animated_sprite_2d.rotation_degrees = 45
	else:
		# Tourner le sprite
		animated_sprite_2d.rotation_degrees = remap(velocity.y, -400, 500, -45, 45)
	
	move_and_slide()
