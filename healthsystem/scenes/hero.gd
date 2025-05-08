extends CharacterBody2D

const SPEED = 300

func _physics_process(delta):
	var my_movement = Vector2()
	if Input.is_action_pressed("ui_left"):
		my_movement.x = -1
	elif Input.is_action_pressed("ui_right"):
		my_movement.x = 1
	else:
		my_movement.x = 0
	
	if Input.is_action_pressed("ui_up"):
		my_movement.y = -1
	elif Input.is_action_pressed("ui_down"):
		my_movement.y = 1
	else:
		my_movement.y = 0
	
	my_movement = my_movement.normalized()
	velocity = my_movement * SPEED

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bullet"):
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
