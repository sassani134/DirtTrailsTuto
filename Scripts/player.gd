extends CharacterBody2D

# 50 is a bit fast
@export var speed = 50
@onready var animation_sprite = $AnimatedSprite2D

#direction and animation to be updated throughout game state
var new_direction = Vector2(0,1) #only move one spaces
var animation

func _physics_process(delta):
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	var mouvment = speed * speed * direction * delta
	move_and_collide(mouvment)
	player_animations(direction)

func player_animations(direction : Vector2):
	if direction != Vector2.ZERO:
		new_direction = direction
		animation = "walk_" + returned_direction(new_direction)
		animation_sprite.play(animation)
	else:
		animation = "walk_" + returned_direction(new_direction)
		animation_sprite.play(animation)

func returned_direction(direction : Vector2):
	var normalized_direction = direction.normalized()
	var default_return = "side"

	if normalized_direction.y > 0:
		return "down"
	elif normalized_direction.y < 0:
		return "up"
	elif normalized_direction.x > 0:
		$AnimatedSprite2D.flip_h = false
		return "side"
	elif normalized_direction.x < 0:
		$AnimatedSprite2D.flip_h = true
		return "side"
	return default_return