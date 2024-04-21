extends CharacterBody2D

# 50 is a bit fast
@export var speed = 50


func _physics_process(delta):
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	var mouvment = speed * speed * direction * delta
	move_and_collide(mouvment)
