extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
@onready var animated_sprite = $bat/AnimatedSprite2D
var is_chasing = false

func _physics_process(delta: float) -> void:
	
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	
	# Handle chasing and movement 
	if distance < 130: # Chasing distance 
		if not is_chasing:
			is_chasing = true
			print("Player detected!")
			animated_sprite.play("walk_angry")
		velocity = direction * 40
	else: 
		if is_chasing: 
			is_chasing = false
			print("Player out the range")
			animated_sprite.play("idle")
		velocity = Vector2.ZERO
	
	if velocity.x > 0: 
		if animated_sprite.flip_h:
			animated_sprite.flip_h = false
	elif velocity.x < 0: 
		if not animated_sprite.flip_h:
			animated_sprite.flip_h = true
	
	move_and_slide()
